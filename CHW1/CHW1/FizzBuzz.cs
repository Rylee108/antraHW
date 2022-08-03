using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CHW1
{
    internal class FizzBuzz
    {
        public static void Main(string[] args)
        {
            for (int i = 1; i <= 100; i++)
            {
                if (i % 15 == 0)
                    Console.Write("FizzBuzz");
                else if (i % 3 == 0)
                    Console.Write("Fizz");
                else if (i % 5 == 0)
                    Console.Write("Buzz");
                else
                    Console.Write(i);

                if (i < 100)
                    Console.Write(",");
                if (i % 15 == 0)
                    Console.WriteLine();
            }
            Console.WriteLine();
        }
    }
}
