using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;
using log4net.Config;

namespace DayCareLib.Common.Logging
{
    public class Log4NetAdapter : ILogger
    {
        private readonly log4net.ILog _log;

        public Log4NetAdapter()
        {
            XmlConfigurator.Configure();

            string loggerName = "daycare"; // can change this to derive from appSettings

            _log = LogManager.GetLogger(loggerName);
        }

        public void LogError(string message, Exception exception)
        {
            if (exception != null)
                _log.Error(message, exception);
            else
                _log.Error(message);
        }

        public void LogInfo(string message, Exception exception)
        {
            if (exception != null)
                _log.Info(message, exception);
            else
                _log.Info(message);
        }
    }
}
