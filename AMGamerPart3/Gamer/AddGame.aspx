<%@ Page Title="Add Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGame.aspx.cs" Inherits="AMGamerPart3.AddGame" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 
        @Author: Akhil Thakkar and Mayank Raval 
        @Stud #: 200300312 & 200300508
        @Web Site : http://amgamer3.azurewebsites.net/AddGame.aspx
        @Date: June 9th, 2016
        @version: 0.0.1
        @Description: This page allows a logged in user to add a game by 
                 entering details of the game with all the validation. 
    -->
    <div class="container">
        <div class="col-md-offset-3 col-md-6 transbox">
            <h1>Game Details</h1>
            <h5>All fields are Required</h5>
            <br />
            <div class="form-group">
                <label class="" for="GameType">Game Type</label>
                <asp:DropDownList runat="server" ID="GameTypeDropDown" CssClass="form-control" placeholder="Game Type" required="true">
                    <asp:ListItem Text="Football" Value="football">Football</asp:ListItem>
                    <asp:ListItem Text="Cricket" Value="football">Cricket</asp:ListItem>
                    <asp:ListItem Text="Volleyball" Value="football">Volleyball</asp:ListItem>
                    <asp:ListItem Text="Basketball" Value="football">Basketball</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="" for="GameName">Game Name</label>
                <asp:TextBox runat="server" ID="GameNameTextBox" CssClass="form-control" placeholder="Game Name" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="Description">Description</label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="DescriptionTextBox" CssClass="form-control" placeholder="Desscribe The Game" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="WinningTeam">Winning Team</label>
                <asp:TextBox runat="server" ID="WinningTeamTextBox" CssClass="form-control" placeholder="Winning team" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="WinningTeamScore">Winning Team Score</label>
                <asp:TextBox runat="server" ID="WinningTeamScoreTextBox" CssClass="form-control" placeholder="Winning Team Score" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="LosingTeam">Losing Team</label>
                <asp:TextBox runat="server" ID="LosingTeamTextBox" CssClass="form-control" placeholder="Losing Team" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="LosingTeamScore">Losing Team Score</label>
                <asp:TextBox runat="server" ID="LosingTeamScoreTextBox" CssClass="form-control" placeholder="Losing Team Score" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="Spectators">Spectators</label>
                <asp:TextBox runat="server" ID="SpectatorTextBox" CssClass="form-control" placeholder="Spectators" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="AllowedTotalScore">Allowed Total Score</label>
                <asp:TextBox runat="server" ID="AllowedTotalScore" CssClass="form-control" placeholder="Allowed Total Score" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="GameDate">Game Date</label>
                <asp:TextBox runat="server" TextMode="Date" ID="GameDateTextBox" CssClass="form-control" placeholder="Game Date Format: mm/dd/yyyy" required="true"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                    ControlToValidate="GameDateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999"
                    Type="Date" Display="Dynamic" BackColor="Red" ForeColor="White" Font-Size="Large"></asp:RangeValidator>
            </div>

            <div class="text-right">
                <asp:Button runat="server" Text="Cancel" ID="CancelButton1" CssClass="btn btn-warning btn-lg" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton1_Click" />
                <asp:Button runat="server" Text="Add Game" ID="AddGameButton" CssClass="btn btn-primary btn-lg" OnClick="AddGameButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>

