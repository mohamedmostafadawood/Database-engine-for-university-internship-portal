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
    public partial class General : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Show_employers(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("ShowEmployers", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            EmployersGrid.DataSource = tbl;
            EmployersGrid.DataBind();
        }

        protected void Show_jobs(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("ShowJobs", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            JobsGrid.DataSource = tbl;
            JobsGrid.DataBind();
        }

        protected void JobSearch(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int semester = Int32.Parse(job_search_semester.Text);
            string faculty = job_search_faculty.Text;
            

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("JobsSearch", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlParameter sqp = new SqlParameter("@allowed_faculty", faculty);
            
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@semester", semester));
            sqlda.SelectCommand.Parameters.Add(sqp);
            conn.Open();
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            job_search_grid.DataSource = tbl;
            job_search_grid.DataBind();
        }

        protected void LoginButton(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string Email = UserEmail.Text;
            string pass = UserPassword.Text;
            int userId = Convert.ToInt32(Request.QueryString["uID"]);
            

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
            int user_id_int = Convert.ToInt32(loginproc.Parameters["@user_id"].Value);

            if ((bool)succ.Value)
            {
                string connStr2 = WebConfigurationManager.ConnectionStrings["portal"].ToString();
                SqlConnection conn2 = new SqlConnection(connStr2);
                conn2.Open();
                SqlCommand user_type_proc = new SqlCommand("GetUserType", conn2);
                user_type_proc.CommandType = System.Data.CommandType.StoredProcedure;
                user_type_proc.Parameters.Add(new SqlParameter("@user_id", user_id_int));

                SqlParameter user_type = user_type_proc.Parameters.Add("@type", System.Data.SqlDbType.VarChar,50);

                user_type.Direction = System.Data.ParameterDirection.Output;
                user_type_proc.ExecuteNonQuery();

                Response.Write(user_type.Value);
                Response.Write(user_id_int);
                Response.Redirect(user_type.Value + "?uID=" + user_id_int.ToString());
            }
            else
            {
                Response.Write("No account with this credintials :( it may be deleted or incorrect password");
            }
        }

        protected void submitt(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string type = user_type.Text;
            string GIU_id = giu_id.Text;
            string semester = semesterr.Text;
            string birthDate = (birthdate.Text);
            string email = emaill.Text;
            string firstName = first_name.Text;
            string middleName = middle_name.Text;
            string lastName = last_name.Text;
            string faculty = facultyy.Text;
            string major = majorr.Text;
            string GPA = (gpa.Text);
            if (GPA == "")
                GPA = "1.1";
            string Adress = adress.Text;
            string CompanyName = company_name.Text;
            string CompanyPhone = company_phone.Text;
            string CompanyWebsite = company_website.Text;
            string fax = faxx.Text;
            string typeBusiness = typeofbusiness.Text;
            string Establishment = (establishment.Text);
            string Origin = origincountry.Text;
            string industry = industryy.Text;
            string Numberofemployes = (numberofemployes.Text);
            string ProductService = productservice.Text;
            SqlCommand EmpEditProfileProc = new SqlCommand("UserRegister", conn);
            EmpEditProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@usertype", type));

            EmpEditProfileProc.Parameters.Add(new SqlParameter("@GIU_id", GIU_id));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@semester", semester));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@birth_date ", birthDate));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@email", email));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@first_name", firstName));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@middle_name", middleName));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@last_name", lastName));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@faculty", faculty));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@major", major));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@gpa", GPA));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@adress", Adress));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@company_name", CompanyName));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@company_phone", CompanyPhone));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@fax", fax));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@company_website", CompanyWebsite));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@type_of_business", typeBusiness));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@establishment_year", Establishment));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@origin_country", Origin));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@industry", industry));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@n_current_employees", Numberofemployes));
            EmpEditProfileProc.Parameters.Add(new SqlParameter("@products_services", ProductService));
            SqlParameter pass = EmpEditProfileProc.Parameters.Add("@password", System.Data.SqlDbType.VarChar,8);
            pass.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            EmpEditProfileProc.ExecuteNonQuery();
            Response.Write("your password is : " + pass.Value.ToString());
            if(type == "Employer")
            {
                SqlCommand useridfetch = new SqlCommand("getUserId", conn);
                useridfetch.CommandType = System.Data.CommandType.StoredProcedure;
                useridfetch.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter uid = useridfetch.Parameters.Add("@id", System.Data.SqlDbType.Int);
                uid.Direction = System.Data.ParameterDirection.Output;

                useridfetch.ExecuteNonQuery();

                Response.Redirect("Employer.aspx" + "?uID=" + uid.Value.ToString());
            }
            else if (type == "Student")
            {
                SqlCommand useridfetch = new SqlCommand("getUserId", conn);
                useridfetch.CommandType = System.Data.CommandType.StoredProcedure;
                useridfetch.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter uid = useridfetch.Parameters.Add("@id", System.Data.SqlDbType.Int);
                uid.Direction = System.Data.ParameterDirection.Output;

                useridfetch.ExecuteNonQuery();

                Response.Redirect("Student.aspx" + "?uID=" + uid.Value.ToString());
            }
            else if (type == "Admin")
            {
                SqlCommand useridfetch = new SqlCommand("getUserId", conn);
                useridfetch.CommandType = System.Data.CommandType.StoredProcedure;
                useridfetch.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter uid = useridfetch.Parameters.Add("@id", System.Data.SqlDbType.Int);
                uid.Direction = System.Data.ParameterDirection.Output;

                useridfetch.ExecuteNonQuery();

                Response.Redirect("Admin-and-Faculty-Representative.aspx" + "?uID=" + uid.Value.ToString());
            }
            else if (type == "Career office coordinator")
            {
                SqlCommand useridfetch = new SqlCommand("getUserId", conn);
                useridfetch.CommandType = System.Data.CommandType.StoredProcedure;
                useridfetch.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter uid = useridfetch.Parameters.Add("@id", System.Data.SqlDbType.Int);
                uid.Direction = System.Data.ParameterDirection.Output;

                useridfetch.ExecuteNonQuery();

                Response.Redirect("Career office coordinator.aspx" + "?uID=" + uid.Value.ToString());
            }
            else if (type == "Faculty representative")
            {
                SqlCommand useridfetch = new SqlCommand("getUserId", conn);
                useridfetch.CommandType = System.Data.CommandType.StoredProcedure;
                useridfetch.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter uid = useridfetch.Parameters.Add("@id", System.Data.SqlDbType.Int);
                uid.Direction = System.Data.ParameterDirection.Output;

                useridfetch.ExecuteNonQuery();

                Response.Redirect("FacultyRep.aspx" + "?uID=" + uid.Value.ToString());
            }
            else if (type == "Academic_Advisor")
            {
                SqlCommand useridfetch = new SqlCommand("getUserId", conn);
                useridfetch.CommandType = System.Data.CommandType.StoredProcedure;
                useridfetch.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter uid = useridfetch.Parameters.Add("@id", System.Data.SqlDbType.Int);
                uid.Direction = System.Data.ParameterDirection.Output;

                useridfetch.ExecuteNonQuery();

                Response.Redirect("Academic Advisor.aspx" + "?uID=" + uid.Value.ToString());
            }
            conn.Close();
        }
    }
}