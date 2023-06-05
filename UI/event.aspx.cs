using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;

public partial class @event : System.Web.UI.Page
{

    string s="";
    void Page_Load(object sender, EventArgs e)
    {


        //  if (!this.IsPostBack)
        if (Application["EventID"] == null)
            s = "1";
        else
            s = Application["EventID"].ToString();
                
        {

            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Events";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);

            if (!this.IsPostBack)
            {
                DropDownList1.DataSource = dt;
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "EventID";
                DropDownList1.DataBind();
            }



            dt = this.GetData();

            StringBuilder html = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }

                html.Append("</tr>");
            }
            FillTablee.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
    
    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select Events.Venue,Participants.P_ID,Participants.name,Participants.CNIC from Participants inner join RegisteredParticipants on (Participants.P_ID = RegisteredParticipants.ParticipantID) inner join RegisteredTeams on (RegisteredParticipants.TeamId = RegisteredTeams.TeamId) inner join Events on (RegisteredTeams.EventID = Events.EventID) Where Events.EventID = '" + s + "'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

    protected void updatecoloumn(object sender, EventArgs e)
    {
        s= DropDownList1.SelectedValue;
        Application["EventID"] = s.ToString();
    }
}
