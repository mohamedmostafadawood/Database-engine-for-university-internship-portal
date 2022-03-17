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
    public partial class Employer : System.Web.UI.Page
    {
        
        //string connectionString = "server=(localdb)\\MSSQLLocalDB;Initial Catalog=Internship_portal;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            //string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            //SqlConnection conn = new SqlConnection(connStr);
            //SqlCommand jobs = new SqlCommand("EmpViewJobs",conn);
            //jobs.CommandType = CommandType.StoredProcedure;
            //string ID = ShowJobId.Text;
            //jobs.Parameters.Add(new SqlParameter("@emp_id", ID));
            //conn.Open();
            //SqlDataReader reader = jobs.ExecuteReader(CommandBehavior.CloseConnection);
            //while (reader.Read())
            //{
            //    string job = reader.GetString(reader.GetOrdinal("department"));
            //    Label jobid = new Label();
            //    jobid.Text = job;
            //    form1.Controls.Add(jobid);
            //}
        }

        protected void editProfile(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int ID = Convert.ToInt32( Request.QueryString["uID"]);
            string pass = passwordIn.Text;
            string addresstext = addressIn.Text;
            string c_name = companynameIn.Text;
            string c_phone = companyPhoneIn.Text;
            string faxtext = faxIn.Text;
            string websitetext = companywebsiteIn.Text;
            string bussinesstext = type_of_businessIn.Text;
            string establishmenttext = establishment_yearIn.Text;
            string countrytext = origin_countryIn.Text;
            string industrytext = industryIn.Text;
            string noOfEmployees = n_current_employeesIn.Text;
            string products_services = products_servicesIn.Text;

            SqlCommand EmpEditProfileProc = new SqlCommand("EmpEditProfile", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@id", ID));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@password", pass));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@adress", addresstext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@company_name", c_name));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@company_phone", c_phone));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@fax", faxtext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@company_website", websitetext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@type_of_business", bussinesstext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@establishment_year", establishmenttext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@origin_country", countrytext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@industry", industrytext));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@n_current_employees", noOfEmployees));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@products_services", products_services));

            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            conn.Close();
        }

        protected void ViewStatus(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            int ID = Convert.ToInt32(Request.QueryString["uID"]);

            SqlCommand vpstatus = new SqlCommand("ViewProfileStatus", conn);
            vpstatus.CommandType = System.Data.CommandType.StoredProcedure;

            vpstatus.Parameters.Add(new SqlParameter("@emp_id", ID));
            

            SqlParameter status = vpstatus.Parameters.Add("@status", System.Data.SqlDbType.Bit);
            SqlParameter reason = vpstatus.Parameters.Add("@reason", System.Data.SqlDbType.VarChar,100);

            status.Direction = System.Data.ParameterDirection.Output;
            reason.Direction = System.Data.ParameterDirection.Output;

            
            vpstatus.ExecuteNonQuery();

            if (status.Value.ToString() == "")
                Response.Write("Pending");
            else
            {
                Response.Write("status is " + status.Value.ToString());
                Response.Write("reason is " + reason.Value.ToString());
            }
            conn.Close();
        }

        protected void ShowJobs(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int ID = Convert.ToInt32(Request.QueryString["uID"]);
            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("EmpViewJobs", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@emp_id", ID));
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            employersGrid.DataSource = tbl;
            employersGrid.DataBind();

        }

        protected void Post_Job(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int ID = Convert.ToInt32(Request.QueryString["uID"]);
            string jobTitle= title.Text;
            string jobdescription = description.Text;
            string jobdepartment= department.Text;
            DateTime jobStartdate =DateTime.Parse( start_date.Text);
            DateTime jobEnddate= DateTime.Parse(end_date.Text);
            DateTime jobappDeadline = DateTime.Parse(application_deadline.Text);
            int jobAvailabeintern =Int16.Parse( n_available_internships.Text);
            string jobSalaryrange= salary_range.Text;
            string jobQualifications = qualifications.Text;
            string jobLocation= location.Text;
            string AppLink= application_link.Text;
            string appEmail = application_email.Text;
            string jobType = job_type.Text;
            int jobWorkdays =Int16.Parse( workdays.Text);

            SqlCommand PostJobProc = new SqlCommand("PostJob", conn);
            PostJobProc.CommandType = System.Data.CommandType.StoredProcedure;

            PostJobProc.Parameters.Add(new SqlParameter("@emp_id", ID));
            PostJobProc.Parameters.Add(new SqlParameter("@title", jobTitle));
            PostJobProc.Parameters.Add(new SqlParameter("@description", jobdescription));
            PostJobProc.Parameters.Add(new SqlParameter("@department", jobdepartment));
            PostJobProc.Parameters.Add(new SqlParameter("@start_date", jobStartdate));
            PostJobProc.Parameters.Add(new SqlParameter("@end_date", jobEnddate));
            PostJobProc.Parameters.Add(new SqlParameter("@application_deadline", jobappDeadline));
            PostJobProc.Parameters.Add(new SqlParameter("@n_available_internships", jobAvailabeintern));
            PostJobProc.Parameters.Add(new SqlParameter("@salary_range", jobSalaryrange));
            PostJobProc.Parameters.Add(new SqlParameter("@qualifications", jobQualifications));
            PostJobProc.Parameters.Add(new SqlParameter("@location", jobLocation));
            PostJobProc.Parameters.Add(new SqlParameter("@application_link", AppLink));
            PostJobProc.Parameters.Add(new SqlParameter("@application_email", appEmail));
            PostJobProc.Parameters.Add(new SqlParameter("@job_type", jobType));
            PostJobProc.Parameters.Add(new SqlParameter("@workdays", jobWorkdays));

            SqlParameter JobID = PostJobProc.Parameters.Add("@job_id", System.Data.SqlDbType.Int);
            JobID.Direction = System.Data.ParameterDirection.Output;


            conn.Open();
            PostJobProc.ExecuteNonQuery();
            conn.Close();

            Response.Write(JobID.Value);
        }

        protected void ViewApplicants(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int empId = Convert.ToInt32(Request.QueryString["uID"]);
            int jobId = Int32.Parse(viewAppJobId.Text);

            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("EmpViewApplicants", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@emp_id", empId));
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@job_id",jobId));

            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            ApplicantsGrid.DataSource = tbl;
            ApplicantsGrid.DataBind();
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
            profile_grid.DataSource = tbl;
            profile_grid.DataBind();
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
            Response.Redirect("General.aspx");
            conn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("General.aspx");
        }
    }
}