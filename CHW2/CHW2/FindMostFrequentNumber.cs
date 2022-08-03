using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CHW2
{
    internal class FindMostFrequentNumber
    {
        static int mostFrequent(int[] arr, int n)
        {

            Array.Sort(arr);

            int max_count = 1, res = arr[0];
            int curr_count = 1;

            for (int i = 1; i < n; i++)
            {
                if (arr[i] == arr[i - 1])
                    curr_count++;
                else
                    curr_count = 1;

                if (curr_count > max_count)
                {
                    max_count = curr_count;
                    res = arr[i - 1];
                }
            }

            return res;
        }

        public static void Main()
        {

            int[] arr = { 40, 50, 30, 40, 50, 30, 30 };
            int n = arr.Length;

            Console.WriteLine(mostFrequent(arr, n));
        }
    }
}
