using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class editFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection conn = new SqlConnection(Application["constr"].ToString());
            conn.Open();
            SqlCommand cm;

            string command = "select * from Faculty where username = '" + Application["EditFacultyUsername"].ToString() + "'";

            cm = new SqlCommand(command, conn);

            SqlDataReader reader = cm.ExecuteReader();

            reader.Read();

            Username.Text = reader["username"].ToString();

            Name.Text = reader["name"].ToString();

            empID.Text = reader["empID"].ToString();

            //catID.Text = reader["eventCategory"].ToString();

            reader.Close();
        }

    }

    protected void SaveEdit(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "UPDATE USER_ SET password = '" + Password.Text + "' where username = '" + Application["EditFacultyUsername"].ToString() + "'";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "UPDATE Faculty SET name = '" + Name.Text + "' where username = '" + Application["EditFacultyUsername"].ToString() + "'";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Response.Redirect("faculty.aspx");
    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("faculty.aspx");
    }
}