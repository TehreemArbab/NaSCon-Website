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


public partial class student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Student_Executives";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
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

    public void editRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;
        Application["EditStudentID"] = str;

        Response.Redirect("editStudent.aspx");
    }
    public void deleteRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;

        SqlConnection con = new SqlConnection(Application["constr"].ToString());

        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Student_Executives WHERE execID = '" + str + "'", con);
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Redirect("student.aspx");
    }

    protected void createNewEventBtn(object sender, EventArgs e)
    {
        Response.Redirect("newStudent.aspx");
    }

    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT execID, fname, lname, batch, (select Roles.title from Roles where Student_Executives.roleID=Roles.roleID) as title from Student_Executives"))
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