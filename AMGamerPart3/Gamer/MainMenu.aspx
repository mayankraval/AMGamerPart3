<%@ Page Title="Main Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="AMGamerPart3.Gamer.MainMenu" %>

<%-- 
    @Authors: Mayank Raval and Akhil Thakkar
    @Stud #: 200300508 | 200300312
    @Web Site : http://amgamer3.azurewebsites.net/MainMenu.aspx
    @Date: June 22, 2016
    @version: 0.0.1
    @Description: This page Displays the Game Menu(with all the games added)
                  and team menu(With all the teams) in a gridview menu.
     
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="row">

            <div class="col-md-offset-3 col-md-6">

                <h1>Main Menu</h1>

                <div class="transbox">

                    <h3><i class="fa fa-gamepad fa-lg"></i>Games</h3>

                    <div class="list-group transbox">

                        <a class="list-group-item" href="/Gamer/EditGame.aspx"><i class="fa fa-th-list"></i>Game List</a>

                    </div>

                </div>


            </div>


        </div>

    </div>
</asp:Content>
