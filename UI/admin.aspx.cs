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


public partial class admin : System.Web.UI.Page
{    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Admin";
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
        Application["EditAdminUsername"] = str;

        Response.Redirect("editAdmin.aspx");
    }
    public void deleteRow(Object sender, EventArgs e)
    {
        string str = DropDownList1.SelectedValue;


        SqlConnection con = new SqlConnection(Application["constr"].ToString());

        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Admin WHERE Username = '" + str + "'", con);
        cmd.ExecuteNonQuery();

 
        cmd = new SqlCommand("DELETE FROM User_ WHERE Username = '" + str + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("admin.aspx");
    }

    protected void createNewAdminBtn(object sender, EventArgs e)
    {
        Response.Redirect("newAdmin.aspx");
    }

    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Admin"))
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