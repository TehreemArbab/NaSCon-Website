using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class newexecutive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void createAdmin(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());

        conn.Open();
        SqlCommand cm;


        string command = "INSERT INTO User_ VALUES ('" + Username.Text + "' ,'" + Password.Text + "', 3)";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "INSERT INTO Student_Executives VALUES (" + RollNo.Text + " ,'" + Fname.Text + "' ,'" + Lname.Text + "' ," + BatchSelect.SelectedValue + " ," + RoleSelect.SelectedValue + ",'" + Username.Text + "')";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Response.Redirect("Executives.aspx");
    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("Executives.aspx");
    }
}