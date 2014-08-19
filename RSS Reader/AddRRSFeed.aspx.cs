using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RSS_Reader.Classes;
using RSS_Reader.DataAccess.Linq;

namespace RSS_Reader
{
    public partial class AddRRSFeed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void click_Create(Object sender, EventArgs e)
        {
            var data = new FeedsRepository();

            data.WriteNewFeedToFeedsDataBase(txtTitle.Value, txtUrl.Value);

            Response.Redirect("Home.aspx");
        }

        protected void click_Cancel(Object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}