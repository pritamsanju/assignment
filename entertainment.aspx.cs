using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace spotnews
{
    public partial class entertainment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                loadNews();
            }
        }
        private void loadNews()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("select newsId,newsTitle,imageLocation,catagory from tblNews join tblImages on tblNews.newsId=tblImages.newsIdRef where tblNews.catagory='Entertainment'", con);
                DataSet ds = new DataSet();
                con.Open();
                da.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
        }
    }
     
}