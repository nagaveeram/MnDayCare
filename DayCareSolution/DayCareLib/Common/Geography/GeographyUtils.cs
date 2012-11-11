using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Common.Geography
{
    public sealed class GeographyUtils
    {
        public class Point
        {
            public double Latitude { get; set; }
            public double Longitude { get; set; }

            public Point() : this(0, 0) { }

            public Point(double latitude, double longitude)
            {
                Latitude = latitude;
                Longitude = longitude;
            }
        }

        public static double HaversineDistance(double lat1, double lon1, double lat2, double lon2)
        {
            double R = 6371;
            double dLat = (lat2 - lat1) * (Math.PI / 180);
            double dLon = (lon2 - lon1) * (Math.PI / 180);
            double a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) + Math.Cos(lat1 * Math.PI / 180) * Math.Cos(lat2 * Math.PI / 180) * Math.Sin(dLon / 2) * Math.Sin(dLon / 2);
            double c = 2 * Math.Asin(Math.Min(1, Math.Sqrt(a)));
            double d = R * c;
            return d;
        }

        public static Point GetMidPoint(Point p1, Point p2)
        {
            double arcLength = HaversineDistance(p1.Latitude, p1.Longitude, p2.Latitude, p2.Longitude);
            double brng = CalculateBearing(p1, p2);
            return CalculateCoord(p1, brng, arcLength / 2);
        }

        public static double DegreeToRadian(double deg)
        {
            return deg * Math.PI / 180;
        }

        public static double RadianToDegree(double rad)
        {
            return rad * 180 / Math.PI;
        }

        public static double CalculateBearing(Point p1, Point p2)
        {
            double lat1 = DegreeToRadian(p1.Latitude);
            double lon1 = p1.Longitude;
            double lat2 = DegreeToRadian(p2.Latitude);
            double lon2 = p2.Longitude;
            var dLon = DegreeToRadian(lon2 - lon1);
            double y = Math.Sin(dLon) * Math.Cos(lat2);
            double x = Math.Cos(lat1) * Math.Sin(lat2) - Math.Sin(lat1) * Math.Cos(lat2) * Math.Cos(dLon);

            double brng = (RadianToDegree(Math.Atan2(y, x)) + 360) % 360;
            return brng;
        }

        private static Point CalculateCoord(Point origin, double brng, double arcLength)
        {
            double R = 6371;
            double lat1 = DegreeToRadian(origin.Latitude);
            double lon1 = DegreeToRadian(origin.Longitude);
            double centralAngle = arcLength / R;

            double lat2 = Math.Asin(Math.Sin(lat1) * Math.Cos(centralAngle) + Math.Cos(lat1) * Math.Sin(centralAngle) * Math.Cos(DegreeToRadian(brng)));
            double lon2 = lon1 + Math.Atan2(Math.Sin(DegreeToRadian(brng)) * Math.Sin(centralAngle) * Math.Cos(lat1), Math.Cos(centralAngle) - Math.Sin(lat1) * Math.Sin(lat2));
            var loc = new Point();
            loc.Latitude = RadianToDegree(lat2);
            loc.Longitude = RadianToDegree(lon2);
            return loc;
        }

    }
}
