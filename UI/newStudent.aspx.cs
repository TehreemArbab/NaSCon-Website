using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class newStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void createAdmin(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "INSERT INTO User_ VALUES ('" + username.Text + "' ,'" + Password.Text + "', 4)";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "INSERT INTO Student_Executives VALUES (" + RollNo.Text + " ,'" + Fname.Text + "' ,'" + Lname.Text + "' ," + BatchSelect.SelectedValue + " ," + RoleSelect.SelectedValue + ",'" + username.Text + "')";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        if(RoleSelect.SelectedValue.ToString() == "3")
        {
            command = "INSERT INTO StudentHeads VALUES (" + RollNo.Text + ", " + eventID.Text + ")";

            cm = new SqlCommand(command, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
        }

        conn.Close();

        Response.Redirect("student.aspx");
    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("student.aspx");
    }
}