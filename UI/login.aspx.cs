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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void goBack(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    protected void loginUser(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string query = "SELECT username, password, userType FROM USER_ WHERE username= '" + Username.Text + "' AND password='" + Password.Text + "'";

        cm = new SqlCommand(query, conn);

        SqlDataReader sdr = cm.ExecuteReader();
        sdr.Read();

        if (!sdr.HasRows)
        {
            StringBuilder html = new StringBuilder();
            html.Append("<p class='failure'>Login Failed<p/>");

            FillTable.Controls.Add(new Literal { Text = html.ToString() });
        }
        else
        {
            if (Username.Text == sdr["username"].ToString() && Password.Text == sdr["password"].ToString())
            {
                //login successful
                if (sdr["userType"].ToString() == "1")
                {
                    Application["username"] = sdr["username"].ToString();

                    Response.Redirect("adminIndex.aspx");
                }
                else if (sdr["userType"].ToString() == "2")
                {
                    Application["FacultyUsername"] = sdr["username"].ToString();

                    sdr.Close();

                    query = "select * from eventCategory where faculty_mentor = (select empID from Faculty where username = '" + Application["FacultyUsername"].ToString() + "')";

                    cm = new SqlCommand(query, conn);

                    sdr = cm.ExecuteReader();
                    sdr.Read();

                    Application["facultyCategoryID"] = sdr["CategoryID"];
                    
                    Response.Redirect("Home.aspx");
                }
                else if(sdr["userType"].ToString() == "3")
                {
                    Application["StudentUsername"] = sdr["username"].ToString();

                    sdr.Close();

                    query = "select * from Student_Executives where username = '" + Application["StudentUsername"].ToString() + "'";

                    cm = new SqlCommand(query, conn);

                    sdr = cm.ExecuteReader();
                    sdr.Read();

                    Application["roleID"] = sdr["roleID"];

                    Response.Redirect("StudentReports.aspx");
                }
            }
        }
        sdr.Close();

        conn.Close();
    }
}