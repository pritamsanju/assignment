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
    public partial class writes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string loggedInUserEmail = Session["userEmail"].ToString();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select id,name from tblWriter where email='" +loggedInUserEmail+ "'", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                lblUserName.Text = "Welcome, "+rdr["name"].ToString();
                Session["writerId"]=rdr["id"].ToString();
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["userEmail"] = null;
            Session["writerId"] = null;
            Response.Redirect("~/writers/writer-login.aspx");
        }
    }
}