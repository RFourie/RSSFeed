using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RSS_Reader.Classes;

namespace RSS_Reader.DataAccess.Linq
{
    public class FeedsRepository
    {
        public void WriteNewFeedToFeedsDataBase(string title, string url)
        {
            using (var db = new FeedContext())
            {
                var feed = new Feed { Title = title, URL = url };
                db.Feeds.Add(feed);
                db.SaveChanges();
            }
        }
    }
}