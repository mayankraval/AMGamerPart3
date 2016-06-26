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

namespace AMGamerPart3
{
    public partial class Default : System.Web.UI.Page
    {
        String GameType;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate the Game grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "GameID";
                Session["SortDirection"] = "ASC";
                GameType = "cricket";
                //Get the Game data
                this.GetGame();
            }
        }
        protected void GetGame()
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // query the Game Table using EF and LINQ
                var g1 = (from AddGame in db.Games
                          where AddGame.GameType == GameType
                          select AddGame);

                // bind the result to the GridView
                GameGridView.DataSource = g1.AsQueryable().OrderBy(sortString).ToList();
                //GameGridView.DataSource = g1.AsQueryable().ToList();
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

        protected void GameTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GameType = GameTypeDropDownList.SelectedItem.ToString().ToLower();
            String GDesc;
            switch (GameType)
            {
                case "football":
                    GDesc = "<br /><h3>Football</h3><br /><h4>Football is a family of team sports that involve, to varying degrees, kicking a ball to score <br />a goal. Unqualified, the word football is understood to refer to whichever form of football is the most popular in the regional context in which the word appears. Sports commonly called 'football' in certain places include: association football (known as soccer <br />in some countries); gridiron football (specifically American football or Canadian football); Australian rules football; rugby football (either rugby league or rugby union); and Gaelic football.<br />These different variations of football are known as football codes.</h4>";
                    break;
                case "cricket":
                    GDesc = "<br /><h3>Cricket</h3><br /><h4>Cricket is a bat-and-ball game played between two teams of eleven players on a cricket field, at the centre <br />of which is a rectangular 22-yard-long pitch with a wicket, a set of three wooden stumps sited at each end. <br />One team, designated the batting team, attempts to score as many runs as possible, whilst their opponents field. Each phase of play is called an innings. After either <br />ten batsmen have been dismissed or a set number of overs have been completed, the innings ends and the two teams then swap roles. <br />The winning team is the one that scores the most runs, including any extras gained, during their period batting.</h4>";
                    break;
                case "volleyball":
                    GDesc = "<br /><h3>Volleyball</h3><br /><h4>Volleyball is a team sport in which two teams of six players are separated by a net. Each team tries to score points by grounding a ball on the other team's court under organized rules. <br />It has been a part of the official program of the Summer Olympic Games since 1964.<br />The complete rules are extensive.But simply, play proceeds as follows: a player on one of the teams begins a 'rally' by serving the ball (tossing or releasing <br />it and then hitting it with a hand or arm,behind the back boundary line of the court, over the net, and into the receiving teams court. The receiving <br />team must not let the ball be grounded within their court.</h4>";
                    break;
                case "basketball":
                    GDesc = "<br /><h3>Basketball</h3><br /><h4>Basketball is a sport, generally played by two teams of five players on a rectangular court. The objective is to shoot a ball through a hoop 18 inches (46 cm) in diameter and 10 feet (3.048 m) high<br /> mounted to a backboard at each end.A team can score a field goal by shooting the ball through the basket during regular play.A field goal scores three points for <br />the shooting team if the player shoots from behind the three - point line, and two points if shot from in front of the line. A team can also score via free <br />throws, which are worth one point, after the other team is assessed with certain fouls.The team with the most points at the end <br />of the game wins, but additional time(overtime) is issued when the score is tied at the end of regulation.The ball can be advanced on the court by throwing <br />it to a teammate, or by bouncing it while walking or running (dribbling).It is a violation to lift, or <br />drag, one's pivot foot without dribbling the ball, to carry it, or to hold the ball with both hands then resume dribbling.</ h4>";
                    break;
                default:
                    GDesc = "Game Rules and Description about them";
                    break;
            }
            GameDesc.Text = GDesc;
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

        protected void demo_TextChanged(object sender, EventArgs e)
        {
            //Still figuring out how to convert text to start date and end date from textbox
            //if (demo.Text.Trim().Length == 0)
            //{
            //    return;
            //}
            //string selectedDate = demo.Text;
            //date.Text = selectedDate;
            //if (selectedDate.Contains("-"))
            //{
            //    DateTime startDate;
            //    DateTime endDate;
            //    string[] splittedDates = selectedDate.Split("-".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            //    if (splittedDates.Count() == 2 && DateTime.TryParse(splittedDates[0], out startDate) && DateTime.TryParse(splittedDates[1], out endDate))
            //    {
            //        FirstDate.Text = startDate.ToShortDateString();
            //        SecondDate.Text = endDate.ToShortDateString();
            //    }
            //    else
            //    {
            //        //maybe the client has modified/altered the input i.e. hacking tools
            //    }
            //}
            //else
            //{
            //    DateTime selectedDateObj;
            //    if (DateTime.TryParse(selectedDate, out selectedDateObj))
            //    {
            //        FirstDate.Text = selectedDateObj.ToShortDateString();
            //        SecondDate.Text = string.Empty;
            //    }
            //    else
            //    {
            //        //maybe the client has modified/altered the input i.e. hacking tools
            //    }
            //}

        }
    }
}