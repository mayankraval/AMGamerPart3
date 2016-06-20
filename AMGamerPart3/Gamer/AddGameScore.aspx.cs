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
    public partial class AddGameScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && (Request.QueryString.Count > 0))
            {
                this.GetGameScore();
            }
        }
        
        private void GetGameScore()
        {
            int ScoreID = Convert.ToInt32(Request.QueryString["ScoreID"]);

            //connect to DB
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                GameScore updatedGameScore = (from GameScore in db.GameScores where GameScore.ScoreID == ScoreID select GameScore).FirstOrDefault();

                if (updatedGameScore != null)
                {
                    GameNameTextBox.Text = updatedGameScore.GameName;
                    DescriptionTextBox.Text = updatedGameScore.Description;
                    TeamATextBox.Text = updatedGameScore.TeamA;
                    TeamAScoreTextBox.Text = updatedGameScore.TeamAScore.ToString();
                    TeamBTextBox.Text = updatedGameScore.TeamB;
                    TeamBScoreTextBox.Text = updatedGameScore.TeamBScore.ToString();
                    SpectatorTextBox.Text = updatedGameScore.Spectators.ToString();
                    //dateTextBox.Text = updatedGameScore.LastUpdated.ToString("yyyy-MM-dd");
                }
            }
        }


        protected void AddScoreButton_Click(object sender, EventArgs e)
        {
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // use the syudent model to save a new record
                GameScore newGameScore = new GameScore();

                int ScoreID = 0;

                if (Request.QueryString.Count > 0)
                {
                    // get game id from url
                    ScoreID = Convert.ToInt32(Request.QueryString["ScoreID"]);
                    // get the current Game from the DB
                    newGameScore = (from GameScore in db.GameScores where GameScore.ScoreID == ScoreID select GameScore).FirstOrDefault();
                }
                // add for data to new Game record
                newGameScore.GameName = GameNameTextBox.Text;
                newGameScore.Description = DescriptionTextBox.Text;
                newGameScore.TeamA = TeamATextBox.Text;
                newGameScore.TeamAScore = Convert.ToInt32(TeamAScoreTextBox.Text);
                newGameScore.TeamB = TeamBTextBox.Text;
                newGameScore.TeamBScore = Convert.ToInt32(TeamBScoreTextBox.Text);
                newGameScore.Spectators = Convert.ToInt32(SpectatorTextBox.Text);
                //newGameScore.LastUpdated = Convert.ToDateTime(dateTextBox.Text);

                // add a new game to Games Table Collection
                if (ScoreID == 0)
                {
                    db.GameScores.Add(newGameScore);
                }

                // run insert commands to database
                db.SaveChanges();

                Response.Redirect("~/Default.aspx");
            }

        }

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");

        }
    }
}