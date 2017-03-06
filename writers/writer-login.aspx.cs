using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace spotnews.writers
{
    public partial class writers_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                login_msg.ForeColor = System.Drawing.Color.Red;
                login_msg.Text = "please fill all fields..";
            }
            else
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select email from tblWriter where email='" + tbwriteremail.Text + "'and password='" + tbwriterpassword.Text + "'", con);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        Session["userEmail"] = tbwriteremail.Text;
                        Response.Redirect("~/writers/add-new-news.aspx");
                    }
                    else
                    {
                        login_msg.Text = "invalid username or password";
                    }


                }
            }
            
        }
    }
}