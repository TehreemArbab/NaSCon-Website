using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class eventDetailsIndividual : System.Web.UI.Page
{
    public string eventID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Application["EventIDInd"]==null)
            Response.Redirect("eventsList.aspx");

        eventID = Application["EventIDInd"].ToString();

        if (string.IsNullOrEmpty(eventID))
            Response.Redirect("eventsList.aspx");

        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string query = "SELECT * from Events where eventID= " + eventID;

        cm = new SqlCommand(query, conn);

        SqlDataReader sdr = cm.ExecuteReader();
        sdr.Read();

        EventName.Text = sdr["name"].ToString();

    }

    public void goBack(object sender, EventArgs e)
    {
        Response.Redirect("eventsList.aspx");
    }

    public void RegisterTeam(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "INSERT INTO Participants VALUES ('" + Name.Text + "' ,'" + Email.Text + "', " + CNIC.Text + ", " + Contact.Text + ", " + food.Text + ")";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "INSERT INTO RegisteredTeams VALUES ('" + Name.Text + "' ," + eventID + ", 1, 0)";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();

        command = "Select * from Participants where CNIC = "+ CNIC.Text +"";

        cm = new SqlCommand(command, conn);
        SqlDataReader rdr = cm.ExecuteReader();
        rdr.Read();
        var P_ID = rdr["P_ID"].ToString();

        rdr.Close();

        command = "Select * from RegisteredTeams where name = '" + Name.Text + "' AND eventID = " + eventID + " ";

        cm = new SqlCommand(command, conn);
        rdr = cm.ExecuteReader();
        rdr.Read();
        var teamID = rdr["teamid"].ToString();

        rdr.Close();

        command = "INSERT INTO RegisteredParticipants VALUES ("+ P_ID +", " + teamID + ", 0)";

        cm = new SqlCommand(command, conn);
        cm.ExecuteNonQuery();

        cm.Dispose();
        conn.Close();

        Application["IndTeamName"] = Name.Text;
        Application["indTeamEvent_ID"] = eventID;
        Application["indTeamID"] = teamID;


        Response.Redirect("ticket.aspx");
    }
}