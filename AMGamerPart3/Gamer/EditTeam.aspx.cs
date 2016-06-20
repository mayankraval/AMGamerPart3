using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using AMGamerPart3.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;


namespace AMTeamrPart3.Teamr
{
    public partial class EditTeam : System.Web.UI.Page
    {
            protected void Page_Load(object sender, EventArgs e)
            {
                // if loading the page for the first time, populate the Team grid
                if (!IsPostBack)
                {
                    Session["SortColumn"] = "TeamID";
                    Session["SortDirection"] = "ASC";
                    // Get the student data
                    this.GetTeam();
                }

            }
            protected void GetTeam()
            {
                string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

                // connect to EF
                using (GameDefaultConnection db = new GameDefaultConnection())
                {
                    // query the Students Table using EF and LINQ
                    var g1 = (from allTeams in db.Teams
                              select allTeams);

                    // bind the result to the GridView
                    TeamGridView.DataSource = g1.AsQueryable().OrderBy(sortString).ToList();
                    TeamGridView.DataBind();
                }
            }

            protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
            {
                // set new page size
                TeamGridView.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

                // refresh the grid
                this.GetTeam();
            }

            protected void TeamGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {


            }

            protected void TeamGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {

                // Set the new page number
                TeamGridView.PageIndex = e.NewPageIndex;

                // refresh the grid
                this.GetTeam();

            }

            protected void TeamGridView_RowDataBound(object sender, GridViewRowEventArgs e)
            {

                if (IsPostBack)
                {
                    if (e.Row.RowType == DataControlRowType.Header) // check to see if the click is on the header row
                    {
                        LinkButton linkbutton = new LinkButton();

                        for (int index = 0; index < TeamGridView.Columns.Count; index++)
                        {
                            if (TeamGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
                            {
                                if (Session["SortDirection"].ToString() == "ASC")
                                {
                                    linkbutton.Text = " <i class='fa fa-caret-up fa-lg'></i>";
                                }
                                else
                                {
                                    linkbutton.Text = " <i class='fa fa-caret-down fa-lg'></i>";
                                }

                                e.Row.Cells[index].Controls.Add(linkbutton);
                            }
                        }
                    }
                }
            }




            protected void TeamGridView_Sorting(object sender, GridViewSortEventArgs e)
            {

                // get the column to sort by
                Session["SortColumn"] = e.SortExpression;

                // refresh the grid
                this.GetTeam();

                // toggle the direction
                Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
            }
        }
    }