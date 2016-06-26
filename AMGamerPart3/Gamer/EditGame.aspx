<%@ Page Title="Game Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditGame.aspx.cs" Inherits="AMGamerPart3.EditGame" %>

<%-- @Author: Akhil Thakkar and Mayank Raval 
     @Stud #: 200300312 & 200300508
     @Web Site : http://amgamer3.azurewebsites.net/EditGame.aspx
     @Date: June 18th, 2016
     @version: 0.0.1
     @Description: Edit Page lists the added games by the users and also can 
                 edit/delete the game if they want. Clicking edit will redirect to GameDetails.aspx.  
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-10 transbox">
                <h1>Game List</h1>
                <a href="/Gamer/AddGame.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Add a Game</a>

                <label for="PageSizeDropDownList">Records per page: </label>
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true"
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="10" Value="10" />
                    <asp:ListItem Text="All" Value="10000" />
                </asp:DropDownList>
                <label for="GameTypeDropDownList">Game Name: </label>
                <asp:DropDownList ID="GameTypeDropDownList" runat="server" AutoPostBack="true" 
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="GameTypeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="Football" Value="football">Football</asp:ListItem>
                    <asp:ListItem Text="Cricket" Value="cricket">Cricket</asp:ListItem>
                    <asp:ListItem Text="Volleyball" Value="volleyball">Volleyball</asp:ListItem>
                    <asp:ListItem Text="Basketball" Value="basketball">Basketball</asp:ListItem>
                     <asp:ListItem Text="Hockey" Value="hockey">Hockey</asp:ListItem>

                                   </asp:DropDownList>

                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="GameGridView" AutoGenerateColumns="false" DataKeyNames="GameID" OnRowDeleting="GameGridView_RowDeleting"
                    AllowPaging="true" PageSize="3" OnPageIndexChanging="GameGridView_PageIndexChanging"
                    AllowSorting="true" OnSorting="GameGridView_Sorting" OnRowDataBound="GameGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID" />
                        <asp:BoundField DataField="GameName" HeaderText="Game Name" Visible="true" SortExpression="GameName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" SortExpression="Description" />
                        <asp:BoundField DataField="WinningTeam" HeaderText="Winning Team" Visible="true" SortExpression="WinningTeam" />
                        <asp:BoundField DataField="WinningTeamScore" HeaderText="Winning Team Score" Visible="true" SortExpression="WinningTeamScore" />
                        <asp:BoundField DataField="LosingTeam" HeaderText="Losing Team" Visible="true" SortExpression="LosingTeam" />
                        <asp:BoundField DataField="LosingTeamScore" HeaderText="Losing Team Score" Visible="true" SortExpression="LosingTeamScore" />
                        <asp:BoundField DataField="AllowedTotalScore" HeaderText="Allowed Total Score" Visible="true" SortExpression="AllowedTotalScore" />
                        <asp:BoundField DataField="Spectators" HeaderText="Spectators" Visible="true" SortExpression="Spectators" />
                        <asp:BoundField DataField="GameDate" HeaderText="Game Date" Visible="true" SortExpression="GameDate" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/Gamer/AddGame.aspx.cs"
                            DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="/Gamer/AddGame.aspx?GameID={0}"
                            ControlStyle-CssClass="btn btn-primary btn-sm" />
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true"
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>




</asp:Content>
