using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class newAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void createAdmin(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "INSERT INTO User_ VALUES ('" + Username.Text + "' ,'" + Password.Text + "', 1)";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "INSERT INTO Admin VALUES ('" + Name.Text + "' ,'" + Username.Text + "')";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Response.Redirect("admin.aspx");
    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }
}