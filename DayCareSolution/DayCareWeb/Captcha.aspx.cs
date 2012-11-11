using System;
using System.Drawing;
using System.Drawing.Imaging;

public partial class Captcha : BasePage
{
    public override PageSslProtection SslProtected
    {
        get
        {
            return PageSslProtection.DoesNotMatter;
        }
    }

    Random rng = new Random();

    /// <summary>List of fonts that can be used for rendering text.</summary>
    /// <remarks>This list can be changed to include any families available on the current system.</remarks>
    private static FontFamily[] _families = { new FontFamily("Arial") };

    protected void Page_Load(object sender, EventArgs e)
    {
        string text = "";
        int width = 80;
        int height = 30;

        int.TryParse(Request.QueryString["w"], out width);
        if (width <= 0)
            width = 80;
        int.TryParse(Request.QueryString["h"], out height);
        if (height <= 0)
            height = 30;

        text = rng.Next(10000, 99999).ToString();
        Session["Captcha"] = text;

        ShowImage(text, width, height);
    }

    private void ShowImage(string text, int width, int height)
    {
        // Graphical
        Response.Clear();
        Response.ContentType = "image/jpeg";
        using (Bitmap bmp = GenerateImage(text, width, height, Color.Black, Color.FromArgb(211, 229, 251)))
        {
            bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
        }
    }

    public Bitmap GenerateImage(string text, int width, int height, Color backColor, Color foreColor)
    {
        Size size = new Size(width, height);

        // Create the new Bitmap of the specified size and render to it
        Bitmap bmp = new Bitmap(size.Width, size.Height);
        using (Graphics g = Graphics.FromImage(bmp))
        {
            // Draw the background as a solid color
            using (Brush b = new SolidBrush(backColor))
            {
                g.FillRectangle(b, 0, 0, bmp.Width, bmp.Height);
            }

            // Draw random lines
            for (int i = 1; i < width / 10; i++)
                g.DrawLine(new Pen(Color.FromArgb(rng.Next(0, 255), rng.Next(0, 255), rng.Next(0, 255))), rng.Next(0, 10 * i), rng.Next(0, height), rng.Next(0, width), rng.Next(0, height));

            // Select a font family and create the default sized font.  We then need to shrink
            // the font size until the text fits.
            FontFamily ff = _families[rng.Next(_families.Length)];
            int emSize = (int)(size.Width * 2 / text.Length);
            Font f = new Font(ff, emSize);
            try
            {
                // Make sure that the font size we have will fit with the selected text.
                SizeF measured = new SizeF(0, 0);
                SizeF workingSize = new SizeF(size.Width, size.Height);
                while (emSize > 2 && (measured = g.MeasureString(text, f)).Width > workingSize.Width || measured.Height > workingSize.Height)
                {
                    f.Dispose();
                    f = new Font(ff, emSize -= 2);
                }

                // Select a color and draw the string into the center of the image
                using (StringFormat fmt = new StringFormat())
                {
                    fmt.Alignment = fmt.LineAlignment = StringAlignment.Center;

                    using (Brush b = new SolidBrush(foreColor))
                    {
                        g.DrawString(text, f, b, new Rectangle(0, 0, bmp.Width, bmp.Height), fmt);
                    }
                }
            }
            finally
            {
                // Clean up
                f.Dispose();
            }
        }

        // Distort the final image and return it.  This distortion amount is fairly arbitrary.
        DistortImage(bmp, rng.Next(1, 4) * (rng.Next(2) == 1 ? 1 : -1));


        // Draw pixels
        for (int i = 0; i < width; i++)
        {
            bmp.SetPixel(rng.Next(0, width), rng.Next(0, height), Color.FromArgb(rng.Next(0, 255), rng.Next(0, 255), rng.Next(0, 255)));
            bmp.SetPixel(rng.Next(0, width), rng.Next(0, height), Color.FromArgb(rng.Next(0, 255), rng.Next(0, 255), rng.Next(0, 255)));
            if (i % 3 == 0)
                bmp.SetPixel(rng.Next(0, width), rng.Next(0, height), foreColor);
        }

        return bmp;
    }

    /// <summary>Distorts the image.</summary>
    /// <param name="b">The image to be transformed.</param>
    /// <param name="distortion">An amount of distortion.</param>
    private static void DistortImage(Bitmap b, double distortion)
    {
        int width = b.Width, height = b.Height;

        // Copy the image so that we're always using the original for source color
        using (Bitmap copy = (Bitmap)b.Clone())
        {
            // Iterate over every pixel
            for (int y = 0; y < height; y++)
            {
                for (int x = 0; x < width; x++)
                {
                    // Adds a simple wave
                    int newX = (int)(x + (distortion * Math.Sin(Math.PI * y / 64.0)));
                    int newY = (int)(y + (distortion * Math.Cos(Math.PI * x / 64.0)));
                    if (newX < 0 || newX >= width) newX = 0;
                    if (newY < 0 || newY >= height) newY = 0;
                    b.SetPixel(x, y, copy.GetPixel(newX, newY));
                }
            }
        }
    }
}