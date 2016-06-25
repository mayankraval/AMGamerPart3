using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// required for Identity and OWIN Security
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace AMGamerPart3.User_Controls
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // check if a user is logged in
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    // show the Contoso Content area
                    GamerPlaceHolder.Visible = true;
                    PublicPlaceHolder.Visible = false;

                    if (HttpContext.Current.User.Identity.GetUserName() == "admin")
                    {
                        UserPlaceHolder.Visible = true;
                    }
                    username.InnerHtml= "<i class='fa fa-lg'>Welcome, " + HttpContext.Current.User.Identity.GetUserName() + "</i>";
                    //username.InnerText = "Welcome " + HttpContext.Current.User.Identity.GetUserName();
                }
                else
                {
                    // only show login and register
                    GamerPlaceHolder.Visible = false;
                    PublicPlaceHolder.Visible = true;
                    UserPlaceHolder.Visible = false;
                }
                SetActivePage();
            }

        }

        /**
         * This method below will make the pages/link 'active' 
         * with the css class
         * @version: 0.0.1 - added SetActivePage method
         * @private method SetActivePage
         * @return {void}
         */
        private void SetActivePage()
        {
            switch (Page.Title)
            {
                case "Home Page":
                    home.Attributes.Add("class", "active");
                    break;
                case "Login":
                    login.Attributes.Add("class", "active");
                    break;
                case "Register":
                    register.Attributes.Add("class", "active");
                    break;
                case "Game Details":
                    editgame.Attributes.Add("class", "active");
                    break;
                case "Contact":
                    contact.Attributes.Add("class", "active");
                    break;
            }
        }
    }
}