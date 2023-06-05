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


public partial class events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Events";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "EventID";
            DropDownList1.DataBind();

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
            FillTable.Controls.Add(new Literal { Text = html.ToString() });
        }
    }

    public void editRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;
        Application["EditEventID"] = str;

        Response.Redirect("editEvent.aspx");
    }
    public void deleteRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;


        SqlConnection con = new SqlConnection(Application["constr"].ToString());

        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Events WHERE EventID = '" + str + "'", con);
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Redirect("events.aspx");
    }

    protected void createNewEventBtn(object sender, EventArgs e)
    {
        Response.Redirect("newEvent.aspx");
    }

    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT name, venue, convert(varchar, eventDate, 1) , max_members, convert(varchar(5), start_time, 108), price, (select top(1) fname from Student_Executives where execID IN ( Select userID from StudentHeads where StudentHeads.event_ID = Events.EventID)), FacultyID FROM Events"))
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

}