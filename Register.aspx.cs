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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = tbname.Text;
            string email = tbemail.Text;
            string password = tbpassword.Text;
            string repassword = tbpasswordconfirm.Text;

            if (password == repassword)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblUser values('" + name + "','" + email + "','" + password + "');", con);
                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Label1.Visible = true;
                        Label1.Text = "register succesfull..";
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("~/home.aspx");
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.Text = "registration failed..";
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}