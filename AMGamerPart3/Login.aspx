<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AMGamerPart3.Login" %>
<%--
 * @authors: Mayank Raval and  Akhil Thakkar
 * @date: June 8, 2016
 * @Web Site : http://amgamer3.azurewebsites.net/Login.aspx
 * @version : 0.0.1 
 * @Description : Login page allows registered user to edit the game 
                  tracker and if a new user, then it will redirect to register page
 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">    

        <div class="row">

            <div class="col-md-offset-4 col-md-4"> 

                <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">

                    <asp:Label runat="server" ID="StatusLabel" />

                </div>

                <h1>Login Page</h1>

                <div class="panel panel-primary">

                    <div class="panel-heading">

                        <h1 class="panel-title"><i class="fa fa-sign-in fa-lg"></i> Login</h1>

                    </div> 

                    <br />

                    <div class="panel-body">

                        <div class="form-group">

                            <label class="control-label" for="UserNameTextBox">Username:</label>

                            <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label class="control-label" for="PasswordTextBox">Password:</label>

                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>

                        </div>

                        <div class="text-right">

                            <asp:Button Text="Login" ID="LoginButton" runat="server" CssClass="btn btn-primary" OnClick="LoginButton_Click" TabIndex="0" />

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


</asp:Content>