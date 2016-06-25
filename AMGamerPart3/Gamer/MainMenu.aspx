<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="AMGamerPart3.Gamer.MainMenu" %>
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
            <div class="col-md-offset-2 col-md-8 transbox">
                <h1>Game Scorecard</h1>
                <a href="Login.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Login to Edit</a>

                <label for="PageSizeDropDownList">Records per page: </label>
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true" 
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="All" Value="10000" />
                </asp:DropDownList>

                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover" 
                    ID="GameGridView" AutoGenerateColumns="false" DataKeyNames="GameID"
                    AllowPaging="true" PageSize="3" OnPageIndexChanging="GameGridView_PageIndexChanging"
                    AllowSorting="true" OnSorting="GameGridView_Sorting" OnRowDataBound="GameGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID" />
                        <asp:BoundField DataField="GameType" HeaderText="Game Type" Visible="true" SortExpression="GameType" />
                        <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" SortExpression="Description" />
                        <asp:BoundField DataField="WinningTeam" HeaderText="Winning Team" Visible="true" SortExpression="WinningTeam"/>
                        <asp:BoundField DataField="WinningTeamScore" HeaderText="WinningTeamScore" Visible="true" SortExpression="WinningTeamScore" />
                        <asp:BoundField DataField="LosingTeamScore" HeaderText="Losing Team Score" Visible="true" SortExpression="LosingTeamScore"/>
                        <asp:BoundField DataField="LosingTeam" HeaderText="Losing Team" Visible="true" SortExpression="LosingTeam" />
                        <asp:BoundField DataField="Spectators" HeaderText="Spectators" Visible="true" SortExpression="Spectators"/>
                        <asp:BoundField DataField="GameDate" HeaderText="Game Date" Visible="true" SortExpression="GameDate"/>
                     </Columns>
                </asp:GridView>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <p><img src="../Chart.cshtml?key=2" id="chart" /></p>
            </div>
        </div>
    </div>
</asp:Content>
