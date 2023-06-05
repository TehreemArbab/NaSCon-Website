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


public partial class faculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Faculty";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "username";
            DropDownList1.DataValueField = "username";
            DropDownList1.DataBind();
            
            dt = this.GetData();

            StringBuilder html = new StringBuilder();


            //string username11 = "";

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
        Application["EditFacultyUsername"] = str;

        Response.Redirect("editFaculty.aspx");
    }
    public void deleteRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;


        SqlConnection con = new SqlConnection(Application["constr"].ToString());

        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Faculty WHERE Username = '" + str + "'", con);
        cmd.ExecuteNonQuery();


        cmd = new SqlCommand("DELETE FROM User_ WHERE Username = '" + str + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("faculty.aspx");
    }

    protected void createNewFacultyBtn(object sender, EventArgs e)
    {
        Response.Redirect("newFaculty.aspx");
    }

    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("select empID, Faculty.name, Faculty.username from Faculty"))
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