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
    public partial class EditGameScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time, populate the Game grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "ScoreID";
                Session["SortDirection"] = "ASC";
                // Get the student data
                this.GetGameScore();
            }
        }

        protected void GetGameScore()
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // query the Students Table using EF and LINQ
                var g1 = (from allGamesScore in db.GameScores
                          select allGamesScore);

                // bind the result to the GridView
                GameScoreGridView.DataSource = g1.AsQueryable().OrderBy(sortString).ToList();
                GameScoreGridView.DataBind();
            }
        }

        protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // set new page size
            GameScoreGridView.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

            // refresh the grid
            this.GetGameScore();
        }
        protected void GameScoreGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GameScoreGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            // Set the new page number
            GameScoreGridView.PageIndex = e.NewPageIndex;

            // refresh the grid
            this.GetGameScore();


        }

        protected void GameScoreGridView_Sorting(object sender, GridViewSortEventArgs e)
        {

            // get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // refresh the grid
            this.GetGameScore();

            // toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";

        }

        protected void GameScoreGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header) // check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < GameScoreGridView.Columns.Count; index++)
                    {
                        if (GameScoreGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
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