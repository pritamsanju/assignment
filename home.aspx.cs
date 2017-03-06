using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace spotnews
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select count(email) from tblSubscription where email='" + tbEmailSubscribe.Text + "'", con);
                con.Open();
                if ((int)cmd.ExecuteScalar() == 1)
                {
                    lblSubsription.Visible = true;
                    lblSubsription.Text = "you have already Subscribed with us ..";
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("insert into tblSubscription values('" + tbEmailSubscribe.Text + "','1')", con);
                    if (cmd1.ExecuteNonQuery() > 0)
                    {
                        lblSubsription.Visible = true;
                        lblSubsription.Text = "you are Subscribed succesfully..";
                        lblSubsription.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblSubsription.Visible = true;
                        lblSubsription.Text = "something went wrong please try again later..";
                        lblSubsription.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

    }
}