using System;
using System.Security.Cryptography;
using System.Text;
using CommonLib;

namespace DayCareLib.Common
{
    public sealed class BruteForceResistantHash
    {
        public static byte[] ComputeBruteForceResistantHash(string clearText, string staticSaltAppSettingKey, string numIterationsAppSettingKey)
        {
            int numIterations = -1;
            try { numIterations = int.Parse(Util.GetAppSetting(numIterationsAppSettingKey)); }
            catch { throw new Exception("Number of iterations provided in the configuration file is incorrect."); }

            byte[] staticSalt = new byte[0];
            try { staticSalt = Convert.FromBase64String(Util.GetAppSetting(staticSaltAppSettingKey)); }
            catch { throw new Exception("Unable to load static salt from the configuration file."); }

            return ComputeBruteForceResistantHash(UnicodeEncoding.UTF8.GetBytes(clearText), staticSalt, numIterations);
        }

        public static byte[] ComputeBruteForceResistantHash(byte[] clearTextBytes, byte[] staticSalt, int numIterations)
        {
            SHA256Managed sha256 = new SHA256Managed();
            byte[] specificSalt = sha256.ComputeHash(clearTextBytes);

            byte[] buffer = new byte[specificSalt.Length + clearTextBytes.Length + staticSalt.Length];

            System.Buffer.BlockCopy(specificSalt, 0, buffer, 0, specificSalt.Length);
            System.Buffer.BlockCopy(clearTextBytes, 0, buffer, specificSalt.Length, clearTextBytes.Length);
            System.Buffer.BlockCopy(staticSalt, 0, buffer, clearTextBytes.Length, staticSalt.Length);

            byte[] hash = sha256.ComputeHash(buffer);
            byte[] combinedBytes = new byte[hash.Length + staticSalt.Length];

            for (int i = 0; i < numIterations; i++)
            {
                System.Buffer.BlockCopy(hash, 0, combinedBytes, 0, hash.Length);
                System.Buffer.BlockCopy(staticSalt, 0, combinedBytes, hash.Length, staticSalt.Length);
                hash = sha256.ComputeHash(combinedBytes);
            }

            return hash;
        }
    }
}
