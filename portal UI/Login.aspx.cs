using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void login(Object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string Email = email.Text;
            string pass = password.Text;

            SqlCommand loginproc = new SqlCommand("UserLogin", conn);
            loginproc.CommandType = System.Data.CommandType.StoredProcedure;

            loginproc.Parameters.Add(new SqlParameter("@email", Email));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter succ = loginproc.Parameters.Add("@success", System.Data.SqlDbType.Bit);
            SqlParameter userid = loginproc.Parameters.Add("@user_id", System.Data.SqlDbType.Int);

            succ.Direction = System.Data.ParameterDirection.Output;
            userid.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();

            if ((bool)succ.Value)
            {
                Response.Write( userid);
            }
        }
    }
}