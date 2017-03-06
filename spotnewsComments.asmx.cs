using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Configuration;

namespace spotnews
{
    /// <summary>
    /// Summary description for spotnewsComments
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class spotnewsComments : System.Web.Services.WebService
    {

        [WebMethod]
        public void UserCommnets(int pageNumber,int pageSize)
        {
            List<comments> listComments = new List<comments>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spUserComment", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PageNumber",
                    Value = pageNumber
                });

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@PageSize",
                    Value = pageSize
                });
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    comments cmn = new comments();
                    cmn.newsId=Convert.ToInt32(rdr["newsId"].ToString());
                    cmn.name =rdr["name"].ToString();
                    cmn.userComments=rdr["comment"].ToString();
                    listComments.Add(cmn);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listComments));
        }

    }
}
