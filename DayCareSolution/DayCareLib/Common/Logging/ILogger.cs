using System;

namespace DayCareLib.Common.Logging
{
    public interface ILogger
    {
        void LogError(string message, Exception exception);
        void LogInfo(string message, Exception exception);
    }
}
