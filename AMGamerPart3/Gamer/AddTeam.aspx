<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTeam.aspx.cs" Inherits="AMGamerPart3.Gamer.AddTeam" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 
    Author: Akhil Thakkar and Mayank Raval 
    Stud #: 200300312 & 200300508
    Date: June 18th, 2016
    Description: This will be the page/form to create a Team
    -->
     <div class="container">
        <div class="col-md-offset-3 col-md-6 transbox">
            <h1>Team Details</h1>
            <h5>All fields are Required</h5>
            <br />
            <div class="form-group">
                <label class="" for="TeamName">Team Name</label>
                <asp:TextBox runat="server" id="TeamNameTextBox" CssClass="form-control" placeholder="Team Name" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="Description">Description</label>
                <asp:TextBox runat="server" TextMode="MultiLine" id="DescriptionTextBox" CssClass="form-control" placeholder="Describe The Game" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="TotalScore">Total Score</label>
                <asp:TextBox runat="server" TextMode="Number" id="TotalScoresTextBox" CssClass="form-control" placeholder="Total Score" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="" for="MaxScoreAllow">MaxScoreAllow</label>
                <asp:TextBox runat="server" TextMode="Number"  id="MaxScoreAllowTextBox" CssClass="form-control" placeholder="Maximum Score Allowed" required="true"></asp:TextBox>
            </div>
       <%--     <div class="form-group">
                <!--<label class="" for="LastUpdated"> Date </label> -->
                <asp:TextBox runat="server" TextMode="Date" ID="dateTextBox" CssClass="form-control" placeholder="Game Date Format: mm/dd/yyyy" required="true"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                        ControlToValidate="dateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999"
                        Type="Date" Display="Dynamic" BackColor="Red" ForeColor="White" Font-Size="Large"></asp:RangeValidator>
            </div>--%>

            <div class="text-right">
                <asp:Button runat="server" Text="Cancel" ID="CancelButton1" CssClass="btn btn-warning btn-lg" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton1_Click"/>
                <asp:Button runat="server" Text="Add Game" ID="AddTeamButton" CssClass="btn btn-primary btn-lg" OnClick="AddTeamButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>