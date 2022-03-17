using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal
{
    public partial class FacultyRep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void status_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int jobId = Int32.Parse(jobid.Text);
            int AdminId = Int32.Parse(adminid.Text);
            int FacultyRepreId = Int32.Parse(Request.QueryString["uID"]);

            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("AddFacultyRepToII", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@job_id", jobId));
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@admin_id", AdminId));
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@facultyRep_id", FacultyRepreId));


            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            fac.DataSource = tbl;
            fac.DataBind();


        }

        protected void DeleteProfile_Click(object sender, EventArgs e)
        {

        }

        protected void ViewProfileButton(object sender, EventArgs e)
        {

        }

        protected void fac_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}