using System;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace DayCareLib.Common
{
    public class Encryptor
    {
        private byte[] _keyBytes;
        private byte[] _initVectorBytes;
        private RijndaelManaged _symmetricKey;

        public Encryptor()
        {
            // Create uninitialized Rijndael encryption object
            _symmetricKey = new RijndaelManaged();

            // Set encryption mode to Cipher Block Chaining (CBC)
            _symmetricKey.Mode = CipherMode.CBC;
        }

        #region Properties
        public byte[] KeyBytes
        {
            get { return _keyBytes; }
            set
            {
                if (value.Length != 32)
                    throw (new Exception("KeyBytes must be exactly 32 bytes."));

                _keyBytes = value;
            }
        }

        public byte[] InitVectorBytes
        {
            get { return _initVectorBytes; }
            set
            {
                if (value.Length != 16)
                    throw (new Exception("InitVectorBytes must be exactly 16 bytes."));

                _initVectorBytes = value;
            }
        }
        #endregion

        #region Generate Key and IV Functions
        public void GenerateRandomIV()
        {
            _symmetricKey.GenerateIV();
            _initVectorBytes = _symmetricKey.IV;
        }

        public void GenerateKey(string password, string salt, int passwordIterations)
        {
            _keyBytes = GetPasswordDerivedBytes(password, salt, passwordIterations);
        }

        public static byte[] GetPasswordDerivedBytes(string password, string salt, int passwordIterations)
        {
            // Append password and saltValue
            string passwordAndSalt = password + salt;

            // Convert string into byte array
            byte[] passwordAndSaltBytes = Encoding.UTF8.GetBytes(passwordAndSalt);

            // Use SHA256 to get a 256 bit output
            SHA256Managed sha256 = new SHA256Managed();
            byte[] passwordDerivedBytes = sha256.ComputeHash(passwordAndSaltBytes);

            for (int i = 1; i <= passwordIterations - 1; i++)
            {
                passwordDerivedBytes = sha256.ComputeHash(passwordDerivedBytes);
            }

            return passwordDerivedBytes;
        }

        public static string GetRandomHexString(int lengthInBytes)
        {
            byte[] buffer = new byte[lengthInBytes];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(buffer);
            StringBuilder sb = new StringBuilder(lengthInBytes * 2);
            for (int i = 0; i < buffer.Length; i++)
            {
                sb.Append(string.Format("{0:X2}", buffer[i]));
            }
            return sb.ToString();
        }

        public static string GetRandomString(string availableCharacters, int length)
        {
            byte[] buffer = new byte[length];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(buffer);
            StringBuilder sb = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                sb.Append(availableCharacters[buffer[i] % availableCharacters.Length]);
            }
            return sb.ToString();
        }
        #endregion

        #region Encrypt/Decrypt with prepend IV
        public string EncryptStringAndPrependIV(string clearText, bool randomIV)
        {
            if (InitVectorBytes == null || randomIV)
                GenerateRandomIV();

            string cipherText = Convert.ToBase64String(InitVectorBytes) + "_";

            cipherText += EncryptString(clearText);

            return cipherText;
        }

        public string DecryptStringWithPrependedIV(string ivAndCipherText)
        {
            string clearText = "";

            try
            {
                string[] parts = ivAndCipherText.Split(new char[] { '_' });
                if (parts.Length != 2)
                    return "";

                InitVectorBytes = Convert.FromBase64String(parts[0]);
                clearText = DecryptString(parts[1]);
            }
            catch
            { }

            return clearText;
        }
        #endregion

        #region Encryption
        public string EncryptString(string plainText)
        {
            // Make sure key and initVector are available
            if (_keyBytes == null)
            {
                throw (new Exception("AES: KeyBytes not initialized."));
            }
            else if (_initVectorBytes == null)
            {
                throw (new Exception("AES: InitVectorBytes not initialize."));
            }

            // Convert strings into byte arrays
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            // Encrypt the byte array
            byte[] cipherTextBytes = EncryptBytes(plainTextBytes);

            // Convert encrypted data into a base64-encoded string.
            string cipherText = Convert.ToBase64String(cipherTextBytes);

            // Return encrypted string.
            return cipherText;
        }

        public byte[] EncryptBytes(byte[] plainTextBytes)
        {
            // Make sure key and initVector are available
            if (_keyBytes == null)
            {
                throw (new Exception("AES: KeyBytes not initialized."));
            }
            else if (_initVectorBytes == null)
            {
                throw (new Exception("AES: InitVectorBytes not initialize."));
            }

            // Generate encryptor from the existing key bytes and initialization vector.
            // Key size will be defined based on the number of the key bytes.
            ICryptoTransform encryptor = _symmetricKey.CreateEncryptor(_keyBytes, _initVectorBytes);

            // Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream = new MemoryStream(plainTextBytes.Length * 2);

            // Define cryptographic stream (always use Write mode for encryption).
            CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);

            // Start encrypting
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

            // Finish encrypting.
            cryptoStream.FlushFinalBlock();

            // Convert encrypted data from a memory stream to a byte array.
            byte[] cipherTextBytes = memoryStream.ToArray();

            // Close both streams
            memoryStream.Close();
            cryptoStream.Close();

            // Return encrypted bytes.
            return cipherTextBytes;
        }
        #endregion

        #region Decryption
        public string DecryptString(string cipherText)
        {
            // Make sure key and initVector are available
            if (_keyBytes == null)
            {
                throw (new Exception("AES: KeyBytes not initialized."));
            }
            else if (_initVectorBytes == null)
            {
                throw (new Exception("AES: InitVectorBytes not initialized."));
            }

            try
            {
                // Convert ciphertext into byte arrays
                byte[] cipherTextBytes = Convert.FromBase64String(cipherText);

                // Decrypt cipher text bytes
                byte[] plainTextBytes = DecryptBytes(cipherTextBytes);

                // Convert decrypted data into a string (UTF8 encoded)
                string plainText = Encoding.UTF8.GetString(plainTextBytes);

                // Return decrypted string.
                return plainText;
            }
            catch
            {
                return "";
            }
        }

        public byte[] DecryptBytes(byte[] cipherTextBytes)
        {
            // Make sure key and initVector are available
            if (_keyBytes == null)
            {
                throw (new Exception("AES: KeyBytes not initialized."));
            }
            else if (_initVectorBytes == null)
            {
                throw (new Exception("AES: InitVectorBytes not initialized."));
            }

            // Generate encryptor from the existing key bytes and initialization vector.
            // Key size will be defined based on the number of the key bytes.
            ICryptoTransform decryptor = _symmetricKey.CreateDecryptor(_keyBytes, _initVectorBytes);

            // Define memory stream which will be used to hold decrypted data.
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);

            // Define cryptographic stream (always use Read mode for decryption).
            CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);

            // Since at this point we don't know the size of decrypted data
            // allocated the buffer long enough to hold ciphertext.
            // Plain text is never longer then cipher text.
            byte[] decryptedBytes = new byte[cipherTextBytes.Length];

            // Start decrypting
            int decryptedByteCount = cryptoStream.Read(decryptedBytes, 0, decryptedBytes.Length);

            // Close both streams
            memoryStream.Close();
            cryptoStream.Close();

            // Allocate the byte array to hold the original plain text
            byte[] plainTextBytes = new Byte[decryptedByteCount];
            Array.Copy(decryptedBytes, 0, plainTextBytes, 0, decryptedByteCount);

            // Return original plain text value
            return plainTextBytes;
        }
        #endregion

        #region Hashing
        public static string GetSha256Base64(string saltBase64, string clearText)
        {
            string hashBase64 = "";

            byte[] saltBytes = new byte[0];
            try { saltBytes = Convert.FromBase64String(saltBase64); }
            catch { }

            byte[] clearTextBytes = UnicodeEncoding.UTF8.GetBytes(clearText);

            byte[] buffer = new byte[saltBytes.Length + clearTextBytes.Length];

            // buffer = clearText + salt
            Buffer.BlockCopy(clearTextBytes, 0, buffer, 0, clearTextBytes.Length);
            Buffer.BlockCopy(saltBytes, 0, buffer, clearTextBytes.Length, saltBytes.Length);

            SHA256Managed sha256 = new SHA256Managed();
            byte[] hash = sha256.ComputeHash(buffer);

            hashBase64 = Convert.ToBase64String(hash);

            return hashBase64;
        }

        public static string GetRandomBytesBase64(int length)
        {
            byte[] randomBytes = new byte[length];

            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(randomBytes);

            return Convert.ToBase64String(randomBytes);
        }
        #endregion
    }
}


