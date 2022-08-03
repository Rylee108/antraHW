using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace CHW2
{
    internal class URL
    {
        public static void Main(string[] args)
        {
            string str = "https://www.apple.com/iphone";
            string[] split = Regex.Split(str, @"\[\\^\]+\]");
            String protocol = split[0];
            String server = split[1];
            String resource = split[2];

            Console.WriteLine("[protocol] = " + protocol);
            Console.WriteLine("[server] = " + server);
            Console.WriteLine("[resource] = " + resource);
        }
        
    }
}
