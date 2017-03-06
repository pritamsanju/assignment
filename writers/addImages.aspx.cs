using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace spotnews.writers
{
    public partial class addImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                Response.Redirect("~/writers/writer-login.aspx");
            }
        }

        protected void btnImageUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/UploadImages/" + FileUpload1.FileName));
            }
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int last_news_id;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string loc="~/UploadImages/"+ FileUpload1.FileName;
                SqlCommand cmd = new SqlCommand();
                
                cmd.CommandText = "SELECT IDENT_CURRENT('tblNews')";
                cmd.Connection = con;
                con.Open();
                last_news_id = Convert.ToInt32(cmd.ExecuteScalar());
                
                cmd.CommandText = "insert into tblImages values('"+ last_news_id+"','" + loc + "')";
                cmd.Connection = con;
                
                cmd.ExecuteNonQuery();
            }
            btnDone.Visible = true;
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/writers/add-new-news.aspx");
        }
    }
}