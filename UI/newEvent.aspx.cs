using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class newEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("events.aspx");
    }
    protected void createEvent(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "INSERT INTO Events VALUES ('" + eventName.Text + "' ,'" + Venue.Text + "', " + catID.Text + ", " + membersCount.Text + ", 1, '" + startTime.Text + "', '" + endTime.Text + "', '" + desc.Text + "', " + Price.Text + ", 1, " + mentorID.Text + ", '" + Date.Text + "')";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();
        Response.Redirect("events.aspx");
    }
}