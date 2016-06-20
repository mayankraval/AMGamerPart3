<%@ Page Title="editgamescore" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditGameScore.aspx.cs" Inherits="AMGamerPart3.Gamer.EditGameScore" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8 transbox">
                <h1>Game List</h1>
                <a href="AddGameScore.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Add a GameScore</a>

                <label for="PageSizeDropDownList">Records per page: </label>
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true"
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="10" Value="10" />
                    <asp:ListItem Text="All" Value="10000" />
                </asp:DropDownList>

                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="GameScoreGridView" AutoGenerateColumns="false" DataKeyNames="ScoreID" OnRowDeleting="GameScoreGridView_RowDeleting"
                    AllowPaging="true" PageSize="3" OnPageIndexChanging="GameScoreGridView_PageIndexChanging"
                    AllowSorting="true" OnSorting="GameScoreGridView_Sorting" OnRowDataBound="GameScoreGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ScoreID" HeaderText="Score ID" Visible="true" SortExpression="ScoreID" />
                        <asp:BoundField DataField="GameName" HeaderText="Game Name" Visible="true" SortExpression="GameName" />
                        <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" SortExpression="Description" />
                        <asp:BoundField DataField="TeamA" HeaderText="TeamA" Visible="true" SortExpression="Description" />
                        <asp:BoundField DataField="TeamAScore" HeaderText="Team A Score" Visible="true" SortExpression="TeamAScore" />
                        <asp:BoundField DataField="TeamB" HeaderText="TeamB" Visible="true" SortExpression="TeamB" />
                        <asp:BoundField DataField="TeamBScore" HeaderText="Team B Score" Visible="true" SortExpression="TeamBScore" />
                        <asp:BoundField DataField="Spectators" HeaderText="Spectators" Visible="true" SortExpression="Spectators" />
                        <%--<asp:BoundField DataField="LastUpdated" HeaderText="Last Updated" Visible="true" SortExpression="LastUpdated" />--%>
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/|AddGameScore.aspx.cs"
                            DataNavigateUrlFields="ScoreID" DataNavigateUrlFormatString="AddGameScore.aspx?GameID={0}"
                            ControlStyle-CssClass="btn btn-primary btn-sm" />
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true"
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>




</asp:Content>

