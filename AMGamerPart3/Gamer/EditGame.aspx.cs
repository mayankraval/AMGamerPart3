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

//Author: Akhil Thakkar and Mayank Raval
//    Stud #: 200300312 & 200300508
//    Date: June 18th, 2016
//    Description: Edit Page lists the added games by the users and also can
//                 edit/delete the game if they want.Clicking edit will redirect to GameDetails.aspx.

namespace AMGamerPart3
{
    public partial class EditGame : System.Web.UI.Page
    {
        String GameType;
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time, populate the Game grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "GameID";
                Session["SortDirection"] = "ASC";
                GameType = "cricket";
                // Get the student data
                this.GetGame();
            }

        }
        protected void GetGame()
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // query the Students Table using EF and LINQ
                var g1 = (from allGames in db.Games
                          where allGames.GameType == GameType
                          select allGames);

                // bind the result to the GridView
                GameGridView.DataSource = g1.AsQueryable().OrderBy(sortString).ToList();
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

        protected void GameGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int selectedRow = e.RowIndex;

            //int GameID = Convert.ToInt32(GameGridView.DataKeys[selectedRow].Values["GameID"]);

            //using (GameDefaultConnection db = new GameDefaultConnection())
            //{
            //    Game deletedGame = (from GameRecords in db.Games
            //                                  where GameRecords.GameID == GameID
            //                                  select GameRecords).FirstOrDefault();

            //    db..Remove(deletedGame);

            //    db.SaveChanges();

            //    this.GetGame();

            //}
            // store which row was clicked
            int selectedRow = e.RowIndex;

            // get the selected StudentID using the Grid's DataKey collection
            int GameID = Convert.ToInt32(GameGridView.DataKeys[selectedRow].Values["GameID"]);

            // use EF to find the selected student in the DB and remove it
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // create object of the Student class and store the query string inside of it
                Game deletedGame = (from GameRecords in db.Games
                                    where GameRecords.GameID == GameID
                                    select GameRecords).FirstOrDefault();

                // remove the selected student from the db
                db.Games.Remove(deletedGame);

                // save my changes back to the database
                db.SaveChanges();

                // refresh the grid
                this.GetGame();

            }

        }

        protected void GameGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            // Set the new page number
            GameGridView.PageIndex = e.NewPageIndex;

            // refresh the grid
            this.GetGame();

        }
        protected void GameTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GameType = GameTypeDropDownList.SelectedItem.ToString();
            // refresh the grid
            this.GetGame();
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




        protected void GameGridView_Sorting(object sender, GridViewSortEventArgs e)
        {

            // get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // refresh the grid
            this.GetGame();

            // toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }
    }
}