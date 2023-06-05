using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class newFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void createAdmin(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "INSERT INTO User_ VALUES ('" + Username.Text + "' ,'" + Password.Text + "', 2)";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "INSERT INTO Faculty VALUES (" + empID.Text + " ,'" + Name.Text + "' ,'" + Username.Text + "')"; //'" + catID.Text + "','

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