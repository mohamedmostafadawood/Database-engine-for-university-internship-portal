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
    public partial class Academic_Advisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PRButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int aaid = Convert.ToInt32(Request.QueryString["uID"]); ;
            int sid = Int32.Parse(PRSID.Text);
            DateTime prDate = DateTime.Parse(PRdate.Text);
            int NumericState = Int32.Parse(PRnumericState.Text);
            string eval = PRevaluation.Text;

            SqlCommand EvalProgressReportProc = new SqlCommand("EvalProgressReport", conn);
            EvalProgressReportProc.CommandType = System.Data.CommandType.StoredProcedure;

            EvalProgressReportProc.Parameters.Add(new SqlParameter("@aa_id", aaid));
            EvalProgressReportProc.Parameters.Add(new SqlParameter("@sid", sid));
            EvalProgressReportProc.Parameters.Add(new SqlParameter("@date", prDate));
            EvalProgressReportProc.Parameters.Add(new SqlParameter("@numeric_state", NumericState));
            EvalProgressReportProc.Parameters.Add(new SqlParameter("@evaluation", eval));

            conn.Open();
            EvalProgressReportProc.ExecuteNonQuery();
            conn.Close();
        }

        protected void ViewProgressReport_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int ID = Convert.ToInt32(Request.QueryString["uID"]); ;
            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("ViewProgressReports", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@advisor_id", ID));
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            ViewProgressReportGrid.DataSource = tbl;
            ViewProgressReportGrid.DataBind();
        }

        protected void ViewProfileButton(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empId = Convert.ToInt32(Request.QueryString["uID"]);

            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("ViewProfile", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@user_id", empId));

            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            GridView1.DataSource = tbl;
            GridView1.DataBind();
        }

        protected void delete_profile(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empId = Convert.ToInt32(Request.QueryString["uID"]);

            SqlCommand deleteproc = new SqlCommand("DeleteProfile", conn);
            deleteproc.CommandType = System.Data.CommandType.StoredProcedure;

            deleteproc.Parameters.Add(new SqlParameter("@user_id", empId));

            conn.Open();
            deleteproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}