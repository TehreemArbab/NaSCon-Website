using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class eventsList : System.Web.UI.Page
{
    public List<EventData> events = new List<EventData>();
    protected void Page_Load(object sender, EventArgs e)
    {       
        var eventCatID = Request.QueryString["eventCatID"];
        if(eventCatID != null)
        {
            events = getEvents("SELECT eventID, name from Events where categoryID = " + eventCatID.ToString());
        }
        else
            events = getEvents("SELECT eventID, name from Events");

    }

    public List<EventData> getEvents(string str)
    {
        var connection = new SqlConnection(Application["constr"].ToString());
        List<EventData> events = new List<EventData>();

        var command = new SqlCommand(str, connection);
        {
            connection.Open();

            using (var reader = command.ExecuteReader())
            {
                while (reader.Read()) // Don't assume we have any rows.
                {
                    EventData data = new EventData();

                    int ord = reader.GetOrdinal("eventID");
                    data.id = reader.GetInt32(ord);

                    int ord2 = reader.GetOrdinal("name");
                    data.name = reader.GetString(ord2);
                    
                    events.Add(data);

                }


            }
        }
        connection.Close();

        return events;
    }

    public void openEvent(Object sender, EventArgs e)
    {
        var projectIDObj = Request.QueryString["projectID"];
    }

    public class EventData
    {
        public int id;
        public String name;
    }
}