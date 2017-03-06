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
    public partial class add_new_news : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                Response.Redirect("~/writers/writer-login.aspx");
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string loggedinWriterId = Session["writerId"].ToString();

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using(SqlConnection con=new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into tblNews values('" + tbnewstitle.Text + "','" + tbnewsdescription.Text
                    + "','" + DateTime.Now + "','" + DropDownList1.SelectedItem.Text+ "','"+Convert.ToInt32(loggedinWriterId)+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("~/writers/addImages.aspx");
        }
    }
}