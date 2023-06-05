using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

public partial class showReportStudent : System.Web.UI.Page
{
    public string reportName = "";
    public string reportQuery = "";
    public string reportNo = "";
    public bool specificQuery = false;
    protected void Page_Load(object sender, EventArgs args)
    {
        if (Request.QueryString["reportNo"] == null)
            Response.Redirect("adminReports.aspx");

        reportNo = Request.QueryString["reportNo"].ToString();
        fetchReportName(reportNo);

        if (!this.IsPostBack)
            if (specificQuery == false || reportNo == "4")
                LoadReport(sender, args);
    }

    public void fetchReportName(string str)
    {
        switch (str)
        {
            case "1":
                reportName = "List of all the registered participants and their information";
                reportQuery = "Select P_ID as ID, name as Name, email as Email, CNIC, contact as Contact from Participants";
                if(Application["roleID"] != "1" && Application["roleID"] != "2" && Application["roleID"] != "5")
                {
                    Response.Redirect("StudentReports.aspx");
                }
                break;
            case "2":
                reportName = "Total amount collected by sponsors for each category";
                reportQuery = "select sum(SponsorPackage.amount) as 'Amount', (select categoryName from eventCategory where eventCategory.CategoryID = Events.categoryID) as 'Event Category' from SponsorPackage  inner join Sponsor on Sponsor.PackageID = SponsorPackage.PackageID inner join Events on Events.EventID = Sponsor.EventID group by Events.categoryID";
                break;
            case "3":
                reportName = "List of the events and their information in specific category";
                reportQuery = "select name as 'Event Name', Venue, max_members as Members, convert(varchar, eventDate, 1) as 'Event Date', convert(varchar(5), start_time, 108) as 'Start Time', description as Description from Events where categoryID= @var";

                if (!this.IsPostBack)
                {
                    SqlConnection con = new SqlConnection(Application["constr"].ToString());
                    string com = "Select * from eventCategory";
                    SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "categoryName";
                    DropDownList1.DataValueField = "CategoryID";
                    DropDownList1.DataBind();
                }

                if (Application["roleID"] != "1" && Application["roleID"] != "2" && Application["roleID"] != "5")
                {
                    Response.Redirect("StudentReports.aspx");
                }

                specificQuery = true;
                break;
            case "4":
                reportName = "List of all the Faculty Mentors or of specific category";
                reportQuery = "select Name as Mentor_name from faculty where empID= (select EmpID from mentors where CategoryAssigned = (select categoryID from eventCategory where CategoryID IN (@var)))";


                if (!this.IsPostBack)
                {
                    SqlConnection con = new SqlConnection(Application["constr"].ToString());
                    string com = "Select * from eventCategory";
                    SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "categoryName";
                    DropDownList1.DataValueField = "CategoryID";
                    DropDownList1.DataBind();
                }

                if (Application["roleID"] != "1" && Application["roleID"] != "2" && Application["roleID"] != "5")
                {
                    Response.Redirect("StudentReports.aspx");
                }

                specificQuery = true;
                break;
            case "5":
                reportName = "List of all Student Executives (by event, bycategory, by management department)";
                reportQuery = "-";

                //if (Application["roleID"] != "1" || Application["roleID"] != "2" || Application["roleID"] != "5")
                {
                    Response.Redirect("StudentReports.aspx");
                }

                break;
            case "6":
                reportName = "List of sponsors and their information";
                reportQuery = "select* from Sponsor";
                break;
            case "7":
                reportName = "Search specific participant by name or unique ID";
                reportQuery = "select * from Participants where P_ID= @var OR Name= @var1";

                if (!this.IsPostBack)
                {
                    SqlConnection con = new SqlConnection(Application["constr"].ToString());
                    string com = "Select * from Participants";
                    SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "P_ID";
                    DropDownList1.DataValueField = "P_ID";
                    DropDownList1.DataBind();
                }

                specificQuery = true;
                break;
            case "8":
                reportName = "List of those participants who have registered for food deal";
                reportQuery = "Select P_ID as ID, name as Name, email as Email, CNIC, contact as Contact from Participants where FtypeID is not null";

                if (Application["roleID"] != "1" && Application["roleID"] != "5")
                {
                    Response.Redirect("StudentReports.aspx");
                }
                break;
            case "9":
                reportName = "List of events to be held on specific date";
                reportQuery = "select events.name as 'Event Name', convert(varchar, events.eventDate, 1) as 'Event Date', events.price as Price, convert(varchar(5), events.start_time, 108) as 'Start Time',events.Venue from events where eventDate= @var";

                if (!this.IsPostBack)
                {
                    SqlConnection con = new SqlConnection(Application["constr"].ToString());
                    string com = "Select distinct convert(varchar, eventDate, 1) as eventDate from events";
                    SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "eventDate";
                    DropDownList1.DataValueField = "eventDate";
                    DropDownList1.DataBind();
                }

                specificQuery = true;
                break;
            case "10":
                reportName = "Total number of registrations in a specific event";
                reportQuery = "Select sum(totalmembers) as 'Total Participants' from RegisteredTeams where EventID= @var";

                if (!this.IsPostBack)
                {
                    SqlConnection con = new SqlConnection(Application["constr"].ToString());
                    string com = "Select * from events";
                    SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "EventID";
                    DropDownList1.DataBind();
                }

                if (Application["roleID"] != "1" && Application["roleID"] != "5")
                {
                    Response.Redirect("StudentReports.aspx");
                }

                specificQuery = true;
                break;
            case "11":
                reportName = "Name of faculty mentor, event head, and details of a specific event";
                reportQuery = "select events.name as 'Event Name', convert(varchar, events.eventDate, 1) as 'Event Date', events.price as Price, convert(varchar(5), events.start_time, 108) as 'Start Time',events.Venue, Student_Executives.fname as 'Head Name', Faculty.name as 'Mentor Name' from Events inner join StudentHeads on Events.EventID = StudentHeads.event_ID inner join Student_Executives on Student_Executives.execID = StudentHeads.userID inner join Faculty on Faculty.empID = Events.FacultyID;";
                break;
        }
    }

    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand(reportQuery))
            {
                cmd.Parameters.AddWithValue("@var", DropDownList1.SelectedValue);
                if (reportNo == "7")
                {
                    cmd.Parameters.AddWithValue("@var1", Name.Text);
                }

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
    public void LoadReport(object sender, EventArgs e)
    {
        {
            DataTable dt = this.GetData();
            StringBuilder html = new StringBuilder();

            html.Append("<table>");

            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

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
            html.Append("</table>");

            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}