using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class editAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection conn = new SqlConnection(Application["constr"].ToString());
            conn.Open();
            SqlCommand cm;

            string command = "select * from Admin where username = '" + Application["EditAdminUsername"].ToString() + "'";

            cm = new SqlCommand(command, conn);

            SqlDataReader reader = cm.ExecuteReader();

            reader.Read();

            Username.Text = reader["username"].ToString();

            Name.Text = reader["name"].ToString();

            reader.Close();
        }

    }

    protected void SaveAdmin(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "UPDATE USER_ SET password = '" + Password.Text + "' where username = '" + Application["EditAdminUsername"].ToString() + "'";

        //string command = "UPDATE USER_ SET Username = '" + Username.Text + "', password = '" + Password.Text + "' where username = '" + Application["EditAdminUsername"].ToString() + "'";


        //Name.Text = command;

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "UPDATE Admin SET name = '" + Name.Text + "' where username = '"+ Application["EditAdminUsername"].ToString() + "'";

        //Name.Text = command;

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