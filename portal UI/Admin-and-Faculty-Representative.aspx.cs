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
    public partial class Admin_and_Faculty_Representative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowEmp(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("AdminViewEmps", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            showEmpG.DataSource = tbl;
            showEmpG.DataBind();
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int emp_id = Int32.Parse(employer_ID.Text);
            int admin_id = Int32.Parse(Request.QueryString["uID"]);
            string proStatus = profile_status.Text;
            string reason = reasonn.Text;



            SqlCommand EmpEditProfileProc = new SqlCommand("AdminReviewEmp", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;


            EmpEditProfileProc.Parameters.Add(new SqlParameter("@admin_id", admin_id));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("emp_id", emp_id));
            

            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            conn.Close();

        }

      

        protected void view_jobs_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("AdminViewJobs", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            showEmpG.DataSource = tbl;
            showEmpG.DataBind();
        }

        protected void representer_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("AdminViewFRs", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            showEmpG.DataSource = tbl;
            showEmpG.DataBind();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            
        }

    }
}