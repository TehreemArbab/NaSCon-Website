using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class editStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection conn = new SqlConnection(Application["constr"].ToString());
            conn.Open();
            SqlCommand cm;

            string command = "select * from Student_Executives where execID = '" + Application["EditStudentID"].ToString() + "'";

            cm = new SqlCommand(command, conn);

            SqlDataReader reader = cm.ExecuteReader();

            reader.Read();

            RollNo.Text = reader["execID"].ToString();

            Fname.Text = reader["fname"].ToString();

            Lname.Text = reader["lname"].ToString();

            BatchSelect.Text = reader["batch"].ToString();

            RoleSelect.Text = reader["roleID"].ToString();


            reader.Close();
        }

    }

    protected void SaveEdit(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "UPDATE Student_Executives SET fname = '" + Fname.Text + "', lname = '" + Lname.Text + "', roleID = " + RoleSelect.SelectedValue + " where execID = " + Application["EditStudentID"].ToString() + "";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

        Response.Redirect("student.aspx");
    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("student.aspx");
    }
}