using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RSS_Reader.Classes
{
    public class Article
    {
        public string Title { get; set; }
        public string Summary { get; set; }
        public DateTime PublishDate { get; set; }
        public string Link { get; set; }
        public string ImageUrl { get; set; }
    }
}