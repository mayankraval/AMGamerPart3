﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGameScore.aspx.cs" Inherits="AMGamerPart3.Gamer.AddGameScore" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 
    Author: Akhil Thakkar and Mayank Raval 
    Stud #: 200300312 & 200300508
    Date: June 9th, 2016
    Description: This will be the page/form to create a scores and team
    -->
    <div class="container">
        <div class="col-md-offset-3 col-md-6 transbox">
            <h1>Add Game Scores</h1>
            <h5>All fields are Required</h5>
            <br />
            <div class="form-group">
                <label class="" for="GameName">Game Name</label>
                <asp:TextBox runat="server" ID="GameNameTextBox" CssClass="form-control" placeholder="Game Name" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="Description">Description</label>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="DescriptionTextBox" CssClass="form-control" placeholder="Desscribe The Game" required="true"></asp:TextBox>
            </div>
            <label class="" for="TeamA">Team A</label>
            <asp:TextBox runat="server" ID="TeamATextBox" CssClass="form-control" placeholder="Team A Name" required="true"></asp:TextBox>

             <div class="form-group">
                <label class="" for="TeamAScore">Team A Score</label>
                <asp:TextBox runat="server" TextMode="Number" ID="TeamAScoreTextBox" CssClass="form-control" placeholder="Team A Score" required="true"></asp:TextBox>
            </div>
              <label class="" for="TeamB">Team B</label>
            <asp:TextBox runat="server" ID="TeamBTextBox" />
            <div class="form-group">
                <label class="" for="TeamBScore">Team B Score</label>
                <asp:TextBox runat="server" TextMode="Number" ID="TeamBScoreTextBox" CssClass="form-control" placeholder="Team B Score" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="Spectators">Spectators</label>
                <asp:TextBox runat="server" TextMode="Number" ID="SpectatorTextBox" CssClass="form-control" placeholder="Spectators" required="true"></asp:TextBox>
            </div>
            <%--<div class="form-group">
                <!--<label class="" for="LastUpdated"> Date </label> -->
<%--                <asp:TextBox runat="server" TextMode="Date" ID="dateTextBox" CssClass="form-control" placeholder="Game Date Format: mm/dd/yyyy" required="true"></asp:TextBox>--
               <%-- <asp:RangeValidator ID="RangeValidator" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                    ControlToValidate="dateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999"
                    Type="Date" Display="Dynamic" BackColor="Red" ForeColor="White" Font-Size="Large"></asp:RangeValidator>
            </div>--%>

            <div class="text-right">
                <asp:Button runat="server" Text="Cancel" ID="CancelButton1" CssClass="btn btn-warning btn-lg" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton1_Click" />
                <asp:Button runat="server" Text="Add GameScore" ID="AddScoreButton" CssClass="btn btn-primary btn-lg" OnClick="AddScoreButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>
