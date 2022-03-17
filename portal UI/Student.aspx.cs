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
    public partial class Student : System.Web.UI.Page
    {
        

        protected void update_submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int giu_id = Int32.Parse(giu_Id.Text);
            //int idd = Int32.Parse(id.Text);
            int ID = Convert.ToInt32(Request.QueryString["uID"]);
            string addresstext = address.Text;
            string first_name = firstname.Text;
            string  middle_name = middlename.Text;
            string last_name = lastname.Text;
            string birth_date = birthdate.Text;
            string faculty_name = faculty.Text;
            string semesterr = semester.Text;
            string student_address = address.Text;
            string studert_major = major.Text;
            string student_gpa = gpa.Text;
            string student_email = email.Text;

            SqlCommand EmpEditProfileProc = new SqlCommand("StudentEditProfile", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@sid", ID));

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@GIU_id", giu_id));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@email", student_email));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@first_name", first_name));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@middle_name", middle_name));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@last_name",last_name));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@birth_date", birth_date));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@semester", semesterr));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@faculty", faculty_name));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@major", studert_major));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@gpa", student_gpa));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@adress", student_address));

            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            conn.Close();


        }

        

        protected void submit_phone(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
           // int id = Int32.Parse(student_id.Text);
            int ID = Convert.ToInt32(Request.QueryString["uID"]);
            string number = phone_number.Text;
            SqlCommand EmpEditProfileProc = new SqlCommand("AddMobile", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@sid", ID));

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@mobileNumber", number));
            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            conn.Close();

        }

      

        protected void apply(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int ID = Convert.ToInt32(Request.QueryString["uID"]);
            //int id = Int32.Parse(idd.Text);
            string number = job_id.Text;
            SqlCommand EmpEditProfileProc = new SqlCommand("ApplyForJob", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@sid", ID));

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@job_id", number));
            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            conn.Close();

        }

        
        protected void submit_report(object sender, EventArgs e)
        {
         
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
          //  int id = Int32.Parse(iddd.Text);
            int ID = Convert.ToInt32(Request.QueryString["uID"]);

            string progress_date = date.Text;
            string progress_descrption = description.Text;
            SqlCommand EmpEditProfileProc = new SqlCommand("AddProgressReport", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@sid", ID ));

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@date", progress_date));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@description", progress_descrption));

            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            conn.Close();

        }

        protected void show_job_status(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //test with job id = 9
            int job_id = Int32.Parse(job_idddd.Text);
            int ID = Convert.ToInt32(Request.QueryString["uID"]);

            conn.Open();
            SqlCommand vpstatus = new SqlCommand("ViewMyStatus", conn);
            vpstatus.CommandType = System.Data.CommandType.StoredProcedure;
            vpstatus.Parameters.Add(new SqlParameter("@sid", ID));
            vpstatus.Parameters.Add(new SqlParameter("@job_id", job_id));
          
            SqlParameter status = vpstatus.Parameters.Add("@application_status", System.Data.SqlDbType.VarChar,20);
            SqlParameter job_name = vpstatus.Parameters.Add("@job_name", System.Data.SqlDbType.VarChar, 30);
            SqlParameter employer_name = vpstatus.Parameters.Add("@employer_name", System.Data.SqlDbType.VarChar, 30);

            status.Direction = System.Data.ParameterDirection.Output;
            job_name.Direction= System.Data.ParameterDirection.Output;
            employer_name.Direction = System.Data.ParameterDirection.Output;

            vpstatus.ExecuteNonQuery();

            //string contractID = Convert.ToString(vpstatus.Parameters["@application_status"].Value);
            Response.Write(status.Value);
            Response.Write("Job name=");
            Response.Write(job_name.Value);
            Response.Write(",,,,,");
            Response.Write("employer name=");

            Response.Write(employer_name.Value);

            //SqlDataAdapter sqlda = new SqlDataAdapter();

            //
            //sqlda.SelectCommand = new SqlCommand("ViewMyStatus", conn);
            //sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            //sqlda.SelectCommand.Parameters.Add(new SqlParameter("@sid", id));
            //sqlda.SelectCommand.Parameters.Add(new SqlParameter("@job_id", job_id));
            //SqlParameter status = sqlda.SelectCommand.Parameters.Add("@application_status", System.Data.SqlDbType.VarChar);
            //status.Direction = System.Data.ParameterDirection.Output;
            //DataTable tbl = new DataTable();
            //sqlda.SelectCommand.ExecuteNonQuery();
            //sqlda.Fill(tbl);
            //statusGrid.DataSource = tbl;
            //statusGrid.DataBind();

            conn.Close();

            



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
            Response.Redirect("General.aspx");
            conn.Close();
        }
    }
}