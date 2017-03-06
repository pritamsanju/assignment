using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace spotnews
{
    public partial class newsInfo : System.Web.UI.Page
    {
        string loggedInUserEmail;
        int newsid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                if (Request.QueryString["id"] == null)
                {
                    Panel1.Visible = false;
                }
                else
                {
                    Panel1.Visible = true;
                    showNewsContent();
                }
            }
            
        }

        private void showNewsContent()
        {
            string id= Request.QueryString["id"];
            newsid = Convert.ToInt32(id.Replace(@"'", ""));
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select newsId,newsTitle,newsDescription,name,date from tblNews join tblWriter on tblNews.writerId=tblWriter.id where newsId='" + newsid + "'";
                cmd.Connection = con;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                int NewsId = Convert.ToInt32(rdr["newsId"].ToString());
                Label1.Text = rdr["newsTitle"].ToString();
                Label2.Text = rdr["newsDescription"].ToString();
                Label3.Text = rdr["name"].ToString() + "," + rdr["date"].ToString();
                rdr.Close();
                cmd.CommandText = "select imageLocation from tblImages where newsIdRef='" + newsid + "'";
                SqlDataReader rdr1 = cmd.ExecuteReader();
                rdr1.Read();
                Image1.ImageUrl = rdr1["imageLocation"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                loggedInUserEmail = Session["userEmail"].ToString();
            }

            if (loggedInUserEmail!=null)
            {
                    
                string comment = tbaddcomments.Text;
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select userId from tblUser where email='"+loggedInUserEmail+"';";
                cmd.Connection = con;
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                int loggedInuserId =Convert.ToInt32(rdr["userId"].ToString());
                rdr.Close();

                cmd.CommandText = "insert into tblUserComments values('"+newsid+"','"+loggedInuserId+"','"+comment+"');";
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Label4.Visible = true;
                    Label4.Text = "comment added succesfully";
                    Label4.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label4.Visible = true;
                    Label4.Text = "comment adding failed...please try again after some time";
                    Label4.ForeColor = System.Drawing.Color.Red;
                }
            }
            }
            else
            {
                Label4.Visible = true;
                Label4.Text = "please log in first to make any comments!";
                Label4.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}