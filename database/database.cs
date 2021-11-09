using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace main.database
{
    public class Database
    {
        private static Database instant = null;

        private static Database Instant
        {
            get
            {
                if(instant == null)
                {
                    instant = new Database();
                }
                return instant;
            }
        }
    }
}