using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class newSponsor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("sponsors.aspx");
    }
    protected void createSponsor(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "INSERT INTO Sponsor VALUES ('" + sponsorName.Text + "' ," + repID.Text + ", " + repCNIC.Text + ", " + Package.SelectedValue + ", " + eventID.Text + ")";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();
        Response.Redirect("sponsors.aspx");
    }
}