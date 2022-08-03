using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CHW2
{
    internal class CalculateAllPrime
    {
        public static void Main(string[] args)
        {

            
            int a, b, i, j, flag;
            Console.WriteLine("Enter lower bound of " +
                              "the interval: ");
           
            a = int.Parse(Console.ReadLine());
          
            Console.WriteLine("\nEnter upper bound " +
                              "of the interval: ");
            
            b = int.Parse(Console.ReadLine());
           
            Console.WriteLine("\nPrime numbers between " +
                              "{0} and {1} are: ", a, b);
            
            for (i = a; i <= b; i++)
            {            
                if (i == 1 || i == 0)
                    continue;
   
                flag = 1;

                for (j = 2; j <= i / 2; ++j)
                {
                    if (i % j == 0)
                    {
                        flag = 0;
                        break;
                    }
                }
                if (flag == 1)
                    Console.WriteLine(i);
            }
        }
    }
}
