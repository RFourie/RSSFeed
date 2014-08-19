using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel.Syndication;
using System.Xml;
using System.IO;
using System.Data.Entity;
using RSS_Reader.Classes;


namespace RSS_Reader
{
    public partial class Home : System.Web.UI.Page
    {

        public List<Article> FeedList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateFeedsDropDown();
            }
        }

        protected void OnClick_DisplayAddRrsFeedPage(object sender, EventArgs e)
        {
            Response.Redirect("AddRRSFeed.aspx");
        }

        protected void SelectedIndexChanged_FeedsDropDown(object sender, EventArgs e)
        {
            if (dropdownFeeds.SelectedItem.Value != "0")
            {
                string url = dropdownFeeds.SelectedItem.Value;
                ReadXmlFromUrlAndCreateListOfArticles(url);
            }
            else
            {
                ClearHomePage();
            }
        }

        private void PopulateFeedsDropDown()
        {
            //Should add to DataAccess but having problems with the return of a List<anonymous> tipe.
            using (var db = new FeedContext())
            {
                var q = (from b in db.Feeds
                         orderby b.Title
                         select new { Title = b.Title, Url = b.URL }).ToList();

                if (q != null)
                {
                    dropdownFeeds.DataSource = q;
                    dropdownFeeds.DataTextField = "Title";
                    dropdownFeeds.DataValueField = "Url";
                    dropdownFeeds.DataBind();
                    dropdownFeeds.Items.Insert(0, new ListItem("None", "0"));
                }
            }
        }

        private void ReadXmlFromUrlAndCreateListOfArticles(string url)
        {
            var reader = XmlReader.Create(url);
            var feed = SyndicationFeed.Load(reader);
            reader.Close();

            labelTitle.Visible = true;
            labelTitle.Text = feed.Title.Text;

            FeedList = new List<Article>();

            foreach (SyndicationItem item in feed.Items)
            {
                var article = new Article();

                article.Title = item.Title.Text;

                article.Summary = item.Summary.Text;

                article.PublishDate = item.PublishDate.DateTime;

                article.Link = (from i in item.Links
                                where i.MediaType == null
                                select i.Uri.OriginalString).FirstOrDefault();

                article.ImageUrl = (from i in item.Links
                                    where i.RelationshipType == "enclosure" || i.MediaType == "image/png" || i.MediaType == "jpeg"
                                    select i.Uri.OriginalString).FirstOrDefault();

                FeedList.Add(article);
            }

            FeedRepeater.DataSource = FeedList;
            FeedRepeater.DataBind();
        }

        private void ClearHomePage()
        {
            FeedRepeater.DataSource = null;
            FeedRepeater.DataBind();
            labelTitle.Visible = false;
        }
    }
}