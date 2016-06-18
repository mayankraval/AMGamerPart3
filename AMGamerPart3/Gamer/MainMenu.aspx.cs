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

namespace AMGamerPart3.Gamer
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate the Game grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "GameID";
                Session["SortDirection"] = "ASC";
                //Get the Game data
                this.GetGame();
            }
        }
        protected void GetGame()
        {
            //string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // query the Students Table using EF and LINQ
                var g1 = (from allGames in db.Games
                          select allGames);

                // bind the result to the GridView
                //GameGridView.DataSource = g1.AsQueryable().OrderBy(sortString).ToList();
                GameGridView.DataSource = g1.AsQueryable().ToList();
                GameGridView.DataBind();
            }
        }
        protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            // set new page size
            GameGridView.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

            // refresh the grid
            this.GetGame();
        }

        protected void GameGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page number
            GameGridView.PageIndex = e.NewPageIndex;

            // refresh the grid
            this.GetGame();
        }

        protected void GameGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            // get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // refresh the grid
            this.GetGame();

            // toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void GameGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header) // check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < GameGridView.Columns.Count; index++)
                    {
                        if (GameGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
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
    }
}