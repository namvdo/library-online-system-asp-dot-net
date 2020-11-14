using System;

namespace library_online_system_asp_dot_net.DAOs
{
    public class Utils
    {
        public static int RandomSaleNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }
    }
}