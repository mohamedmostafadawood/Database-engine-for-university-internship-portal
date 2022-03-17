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
    public partial class Career_office_coordinator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewA_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

        
            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("ViewAdvisors", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
           
            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            GridA.DataSource = tbl;
            GridA.DataBind();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void AAToI_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int aid = Int32.Parse(AAid.Text);
            int hakonamatata = Int32.Parse(IIId.Text);

      
            SqlCommand AAIIProc = new SqlCommand("AAToII", conn);
            AAIIProc.CommandType = System.Data.CommandType.StoredProcedure;

            AAIIProc.Parameters.Add(new SqlParameter("@aa_id",aid));
            AAIIProc.Parameters.Add(new SqlParameter("@ii_id", hakonamatata));

            conn.Open();
            AAIIProc.ExecuteNonQuery();
            conn.Close();
        }

        
       
        protected void viewme_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int internId  = Int32.Parse(indid.Text);

            conn.Open();

            SqlDataAdapter sqlda = new SqlDataAdapter();

            sqlda.SelectCommand = new SqlCommand("CocViewStudents", conn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.Add(new SqlParameter("@ii_id", internId));

            DataTable tbl = new DataTable();
            sqlda.Fill(tbl);
            GridI.DataSource = tbl;
            GridI.DataBind();
            conn.Close();




        }

        protected void CocUpdateEligibilityButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["portal"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int coc = Convert.ToInt32(Request.QueryString["uID"]); ;
            int sid = Int32.Parse(TextBox2.Text);
            int  iiid = Int32.Parse(TextBox3.Text);
            bool eligibity = false;
            if (TextBox4.Text.Equals("1"))
            {
                eligibity = true;
            }

            SqlCommand CocUpdateEligibilitypro = new SqlCommand("CocUpdateEligibility", conn);
            CocUpdateEligibilitypro.CommandType = System.Data.CommandType.StoredProcedure;

            CocUpdateEligibilitypro.Parameters.Add(new SqlParameter("@coc_id",coc));
            CocUpdateEligibilitypro.Parameters.Add(new SqlParameter("@s_id", sid));
            CocUpdateEligibilitypro.Parameters.Add(new SqlParameter("@ii_id", iiid));
            CocUpdateEligibilitypro.Parameters.Add(new SqlParameter("@eligibility", eligibity));

            conn.Open();
            CocUpdateEligibilitypro.ExecuteNonQuery();
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
            conn.Close();
        }
    }
}