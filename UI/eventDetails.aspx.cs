using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class eventDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var eventID = Request.QueryString["eventID"];


        if (string.IsNullOrEmpty(eventID))
         Response.Redirect("eventsList.aspx");

        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string query = "SELECT * from Events where eventID= " + eventID ;

        cm = new SqlCommand(query, conn);

        SqlDataReader sdr = cm.ExecuteReader();
        sdr.Read();

        EventName.Text = sdr["name"].ToString();

        int count = Int32.Parse(sdr["max_members"].ToString());

        if (count == 1)
        {
            Application["EventIDInd"] = eventID;

            Response.Redirect("eventDetailsIndividual.aspx");
        }

    }

    public void goBack(object sender, EventArgs e)
    {
        Response.Redirect("eventsList.aspx");
    }

    public void RegisterTeam(object sender, EventArgs e)
    {
        
    }
}