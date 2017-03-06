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
    public partial class frontEnd : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.facebook.com");//facebook
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.googleplus.com");//googleplus
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.twitter.com");//twitter
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string cs=ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using(SqlConnection con = new SqlConnection(cs))
            {
                string email = textbox_username.Text;
                string password = textbox_password.Text;
                SqlCommand cmd = new SqlCommand("select * from tblUser where email='"+email+"' and password='"+password+"'",con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Session["userEmail"] = email;
                    setUserSession(email,1);
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "Invalid email/password";
                }
            }
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        private void setUserSession(string email,int i)
        {
            string cs=ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into tblSession values('"+email+"','"+i+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

        protected void btntowriter_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/writers/writer-login.aspx");
        }

    }

}