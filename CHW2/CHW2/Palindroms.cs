using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CHW2
{
    internal class Palindroms
    {
        public static bool checkPalin(string word)
        {
            int n = word.Length;
            word = word.ToLower();
            for (int i = 0; i < n; i++, n--)
            {
                if (word[i] != word[n - 1])
                {
                    return false;
                }
            }
            return true;
        }

        public static int countPalin(string str)
        {

            str = str + " ";

            string word = "";
            int count = 0;
            for (int i = 0; i < str.Length; i++)
            {
                char ch = str[i];

                if (ch != ' ')
                {
                    word = word + ch;
                }
                else
                {
                    if (checkPalin(word))
                    {
                        count++;
                    }
                    word = "";
                }
            }

            return count;
        }

        public static void Main(string[] args)
        {
            Console.WriteLine(countPalin("Madam " +
                       "Arora teaches malayalam"));

            Console.WriteLine(countPalin("Nitin " +
                              "speaks malayalam"));
        }
    }
}
