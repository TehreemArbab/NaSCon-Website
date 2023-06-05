using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

public partial class index : System.Web.UI.Page
{
      protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(Application["constr"].ToString());
        conn.Open();
        SqlCommand cm;

        string query = "Select count(eventID) from Events";
        cm = new SqlCommand(query, conn);
        Int32 count = (Int32)cm.ExecuteScalar();
        eventsCount.Text = count.ToString();

        query = "select count(username) from Admin";
        cm = new SqlCommand(query, conn);
        count = (Int32)cm.ExecuteScalar();
        adminCount.Text = count.ToString();

        query = "select count(username) from Faculty";
        cm = new SqlCommand(query, conn);
        count = (Int32)cm.ExecuteScalar();
        facultyCount.Text = count.ToString();

        query = "select count(username) from Student_Executives";
        cm = new SqlCommand(query, conn);
        count = (Int32)cm.ExecuteScalar();
        studentsCount.Text = count.ToString();

        cm.Dispose();
        conn.Close();
    }
}