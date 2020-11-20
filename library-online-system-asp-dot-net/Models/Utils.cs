using System.Collections.Generic;

namespace library_online_system_asp_dot_net.Models
{
    public enum GeneralInfo
    {
        PREVIEW_BOOK,
        HALF_VIEW_BOOK,
        FULL_VIEW_BOOK,
        WEEKLY_PAYMENT,
        MONTHLY_PAYMENT,
        PERMENTLY_PAYMENT,
        ONE_TIME_PAYMENT,
        NO_OF_CHARACTERS_PER_PAGE = 1600,
        ONE_DAY = 1,
        THREE_DAYS = 3,
        SEVEN_DAYS = 7
    }

    public class Utils
    {
        public static Dictionary<int, float> GetAmountBasedOnRentingDays()
        {
            Dictionary<int, float> map = new Dictionary<int, float>();
            map.Add((int) GeneralInfo.ONE_DAY, 2);
            map.Add((int) GeneralInfo.THREE_DAYS, 3);
            map.Add((int) GeneralInfo.SEVEN_DAYS, 7);
            return map;
        }
    }
}