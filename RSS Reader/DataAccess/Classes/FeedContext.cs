using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace RSS_Reader.Classes
{
    public class FeedContext : DbContext
    {
        public DbSet<Feed> Feeds { get; set; }
    }
}