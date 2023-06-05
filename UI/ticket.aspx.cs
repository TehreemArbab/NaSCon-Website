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
public partial class ticket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var name = Application["IndTeamName"].ToString();
        var eventID = Application["indTeamEvent_ID"].ToString();
        var teamID = Application["indTeamID"].ToString();

        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string command = "Select * from events where eventID = "+ eventID +"";
        
        cm = new SqlCommand(command, conn);
        SqlDataReader rdr = cm.ExecuteReader();
        rdr.Read();
        var price = rdr["price"].ToString();

        StringBuilder html = new StringBuilder();

        html.Append("<tr>");

            html.Append("<td>");
            html.Append(rdr["name"].ToString());
            html.Append("</td>");

            html.Append("<td>");
            html.Append(name);
            html.Append("</td>");

            html.Append("<td>");
            html.Append(price);
            html.Append("</td>");

        html.Append("</tr>");

        FillTable.Controls.Add(new Literal { Text = html.ToString() });

        rdr.Close();
    }
}