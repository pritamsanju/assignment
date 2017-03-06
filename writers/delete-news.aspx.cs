using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace spotnews.writers
{
    public partial class delete_news : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                Response.Redirect("~/writers/writer-login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    writtenNewsList(Session["userEmail"].ToString());
                }

            }
        }
        private void writtenNewsList(string writerEmail)
        {
            int writerId;
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select id from tblWriter where email ='" + writerEmail + "'";
                cmd.Connection = con;
                con.Open();

                writerId = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.CommandText = "select newsId,newsTitle from tblNews where writerId='" + writerId + "'";
                cmd.Connection = con;
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "newsTitle";
                DropDownList1.DataValueField = "newsId";
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, "please select news title");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                selectionAlert.Text = "please select the news ...";
            }
            else
            {
                panelForDelete.Visible = true;
                int id = Convert.ToInt32(DropDownList1.SelectedValue);
                // id contains the newsId value
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select newsTitle,newsDescription from tblNews where newsId='" + id + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        string title = rdr["newsTitle"].ToString();
                        string description = rdr["newsDescription"].ToString();
                        lblTitle.Text = title;
                        lblDescription.Text = description;
                    }
                }

            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(DropDownList1.SelectedValue);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "delete from tblNews where newsId='"+id+"'";
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                panelForDelete.Visible = false;
                selectionAlert.Text = "news deleted succesfully ";
                selectionAlert.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btncamcle_Click(object sender, EventArgs e)
        {
            panelForDelete.Visible = false;
            selectionAlert.Text = "deletion cancelled..";
            selectionAlert.ForeColor = System.Drawing.Color.Green;
        }
    }
}