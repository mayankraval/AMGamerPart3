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
using System.Data.Entity.Validation;


//Author: Akhil Thakkar and Mayank Raval
//  Stud #: 200300312 & 200300508
//  Date: June 18th, 2016
//  Description: This Page lets the user add the Game with the name, description,
//               total score, Spectators and winning team. Also, lets the user enter date which is
//                 then sorted in the game dash board and displayed weekly. 
namespace AMGamerPart3
{
    public partial class AddGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && (Request.QueryString.Count > 0))
            {
                this.GetGame();
            }
        }

        private void GetGame()
        {
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            //connect to DB
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                Game updatedGame = (from Game in db.Games where Game.GameID == GameID select Game).FirstOrDefault();

                if (updatedGame != null)
                {
                    GameTypeDropDown.Text=updatedGame.GameType;
                    GameNameTextBox.Text = updatedGame.GameName;
                    DescriptionTextBox.Text = updatedGame.Description;
                    WinningTeamTextBox.Text = updatedGame.WinningTeam.ToString();
                    WinningTeamScoreTextBox.Text = updatedGame.WinningTeamScore.ToString();
                    LosingTeamTextBox.Text = updatedGame.LosingTeam.ToString();
                    LosingTeamScoreTextBox.Text = updatedGame.LosingTeamScore.ToString();
                    SpectatorTextBox.Text = updatedGame.Spectators.ToString();
                    GameDateTextBox.Text = updatedGame.GameDate.ToString("yyyy-MM-dd");
                    AllowedTotalScore.Text = updatedGame.AllowedTotalScore.ToString();
                }
            }
        }

        protected void AddGameButton_Click(object sender, EventArgs e)
        {
            try
            {
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // use the syudent model to save a new record
                Game newGame = new Game();

                int GameID = 0;

                if (Request.QueryString.Count > 0)
                {
                    // get game id from url
                    GameID = Convert.ToInt32(Request.QueryString["GameID"]);
                    // get the current Game from the DB
                    newGame = (from game in db.Games where game.GameID == GameID select game).FirstOrDefault();
                }
                // add for data to new Game record
                newGame.GameName = GameNameTextBox.Text;
                    newGame.GameType = GameTypeDropDown.SelectedValue;
                newGame.Description = DescriptionTextBox.Text;
                newGame.WinningTeam = WinningTeamTextBox.Text;
                newGame.WinningTeamScore= Convert.ToInt32(WinningTeamScoreTextBox.Text);
                newGame.LosingTeam = LosingTeamTextBox.Text;
                newGame.LosingTeamScore = Convert.ToInt32(LosingTeamScoreTextBox.Text);
                newGame.Spectators = Convert.ToInt32(SpectatorTextBox.Text);
                newGame.GameDate = Convert.ToDateTime(GameDateTextBox.Text);
                newGame.AllowedTotalScore = Convert.ToInt32(AllowedTotalScore.Text);

                // add a new game to Games Table Collection
                if (GameID == 0)
                {
                    db.Games.Add(newGame);
                }

                // run insert commands to database
                db.SaveChanges();

                Response.Redirect("~/Default.aspx");
            }
            }
            catch (DbEntityValidationException err)
            {
                foreach (var eve in err.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }

        }

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");

        }
    }
}