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
public partial class @Executives : System.Web.UI.Page
{
    void Page_Load(object sender, EventArgs e)
    {


        if (!this.IsPostBack)
        {


            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Student_Executives";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);


             adpt = new SqlDataAdapter(com, con);
             dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "fname";
            DropDownList1.DataValueField = "execID";
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


    public void deleteRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;


        SqlConnection con = new SqlConnection(Application["constr"].ToString());

        con.Open();

        SqlCommand cmd = new SqlCommand("DELETE FROM HostTeamMembers  WHERE RollNo = " + str, con);

        cmd.ExecuteNonQuery();



         cmd = new SqlCommand("DELETE FROM HostTeams  WHERE SecretaryID = " + str, con);

        cmd.ExecuteNonQuery();



         cmd = new SqlCommand("DELETE FROM Student_Executives  WHERE execID = " + str  , con);

        cmd.ExecuteNonQuery();
        Response.Redirect("Executives.aspx");
    }



    public void editRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;
        Application["EditExecUsername"] = str;

        Response.Redirect("editExec.aspx");
    }


    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select  Roles.title , Student_Executives.execID, Student_Executives.fname,Student_Executives.lname, Student_Executives.batch from Student_Executives inner join Roles ON Roles.roleID= Student_Executives.roleID"))
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

    protected void addexec(object sender, EventArgs e)
    {
        Response.Redirect("newexecutive.aspx");

    }

    protected void Delete_Click(object sender, EventArgs e)
    {

    }
}