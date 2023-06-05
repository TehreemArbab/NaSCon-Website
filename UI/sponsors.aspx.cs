﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;


public partial class sponsors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            SqlConnection con = new SqlConnection(Application["constr"].ToString());
            string com = "Select * from Sponsor";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "SponsorID";
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
        SqlCommand cmd = new SqlCommand("DELETE FROM Sponsor WHERE SponsorID = '" + str + "'", con);
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Redirect("sponsors.aspx");
    }

    protected void CreateNewSponsor(object sender, EventArgs e)
    {
        Response.Redirect("newSponsor.aspx");
    }

    private DataTable GetData()
    {
        using (SqlConnection con = new SqlConnection(Application["constr"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Sponsor.Name, Events.name, Sponsor.RepID, SponsorPackage.Amount from Sponsor inner join Events on Sponsor.EventID=Events.EventID inner join SponsorPackage on Sponsor.PackageID = SponsorPackage.PackageID"))
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