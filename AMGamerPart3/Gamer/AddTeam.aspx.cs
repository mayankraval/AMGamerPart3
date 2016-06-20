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
    public partial class AddTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && (Request.QueryString.Count > 0))
            {
                this.GetTeam();
            }
        }

        private void GetTeam()
        {
            int TeamID = Convert.ToInt32(Request.QueryString["TeamID"]);

            //connect to DB
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                Team updatedTeam = (from Team in db.Teams where Team.TeamID == TeamID select Team).FirstOrDefault();

                if (updatedTeam != null)
                {
                    TeamNameTextBox.Text = updatedTeam.Name;
                    DescriptionTextBox.Text = updatedTeam.Description;
                    TotalScoresTextBox.Text = updatedTeam.TotalScore.ToString();
                    MaxScoreAllowTextBox.Text = updatedTeam.MaxScoreAllow.ToString();
                    //dateTextBox.Text = updatedTeam.LastUpdated.ToString("yyyy-MM-dd");
                }
            }
        }
        protected void AddTeamButton_Click(object sender, EventArgs e)
        {
            using (GameDefaultConnection db = new GameDefaultConnection())
            {
                // use the team model to save a new record
                Team newTeam = new Team();

                int TeamID = 0;

                if (Request.QueryString.Count > 0)
                {
                    // get team id from url
                    TeamID = Convert.ToInt32(Request.QueryString["TeamID"]);
                    // get the current Team from the DB
                    newTeam = (from Team in db.Teams where Team.TeamID == TeamID select Team).FirstOrDefault();
                }
                // add for data to new Team record
                newTeam.Name = TeamNameTextBox.Text;
                newTeam.Description = DescriptionTextBox.Text;
                newTeam.TotalScore = Convert.ToInt32(TotalScoresTextBox.Text);
                newTeam.MaxScoreAllow = Convert.ToInt32(MaxScoreAllowTextBox.Text);
                // newTeam.LastUpdated = Convert.ToDateTime(dateTextBox.Text);

                // add a new team to teams Table Collection
                if (TeamID == 0)
                {
                    db.Teams.Add(newTeam);
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