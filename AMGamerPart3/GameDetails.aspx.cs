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
    public partial class GameDetails : System.Web.UI.Page
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
                    GameNameTextBox.Text = updatedGame.GameName;
                    DescriptionTextBox.Text = updatedGame.Description;
                    TotalScoresTextBox.Text = updatedGame.TotalScore.ToString();
                    SpectatorTextBox.Text = updatedGame.Spectators.ToString();
                    WinninggTeamTextBox.Text = updatedGame.WinningTeam.ToString();
                    dateTextBox.Text = updatedGame.LastUpdated.ToString("yyyy-MM-dd");
                }
            }
        }

        protected void AddGameButton_Click(object sender, EventArgs e)
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
                newGame.Description = DescriptionTextBox.Text;
                newGame.TotalScore = Convert.ToInt32(TotalScoresTextBox.Text);
                newGame.Spectators = Convert.ToInt32(SpectatorTextBox.Text);
                newGame.WinningTeam = WinninggTeamTextBox.Text;
                newGame.LastUpdated = Convert.ToDateTime(dateTextBox.Text);

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

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");

        }
    }
}