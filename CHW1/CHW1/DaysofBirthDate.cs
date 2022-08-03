using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CHW1
{
    internal class DaysofBirthDate
    {
        public static void Main()
        {
            DateTime QNTime = DateTime.ParseExact(value.QN.Substring(0, 14), "yyyyMMddHHmmss", null);
            DateTime LocalTime = DateTime.Now;
            TimeSpan days = (QNTime - LocalTime);
            double day = days.TotalDays;

            int daysToNextAnniversity = 10000 - (day % 10000);
        }
    }
}
