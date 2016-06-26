<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AMGamerPart3.Default" %>
<%-- 
    File : Default.aspx
    Author : Mayank Raval(200300508) Akhil Thakkar(200300312)
    Web Site : http://amgamer.azurewebsites.net/Default.aspx
    Description : Shows the Score card with the List of games and scores with top player and high score. 
                 Also it shoes game stage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class="container">
        <div class="row">
            <div class="table-responsive col-md-offset-2 col-md-8 transbox">
                <h1>Game Scorecard</h1>
                <% if (!HttpContext.Current.User.Identity.IsAuthenticated)
                    { %>
                <a href="Login.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Login to Edit</a>
                <%} %>
                <label for="PageSizeDropDownList">Records per page: </label>
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true" 
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="All" Value="10000" />
                </asp:DropDownList>
                <label for="GameTypeDropDownList">Game Type: </label>
                <asp:DropDownList ID="GameTypeDropDownList" runat="server" AutoPostBack="true" 
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="GameTypeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="Football" Value="football">Football</asp:ListItem>
                    <asp:ListItem Text="Cricket" Value="cricket">Cricket</asp:ListItem>
                    <asp:ListItem Text="Volleyball" Value="volleyball">Volleyball</asp:ListItem>
                    <asp:ListItem Text="Basketball" Value="basketball">Basketball</asp:ListItem>
                </asp:DropDownList>
                <label for="GameTypeDropDownList">Select Week: </label>
                <asp:TextBox runat="server" ID="demo" ClientIDMode="Static" name="demo" OnTextChanged="demo_TextChanged" ></asp:TextBox>
                 <script type="text/javascript">
        $('input[ID="demo"]').daterangepicker({
            "dateLimit": {
                "days": 7
            },
            "startDate": "06/19/2016",
            "endDate": "06/25/2016"
        });
    </script>
                <%--<span>First Date:</span><asp:label id="FirstDate" runat="server"></asp:label>
<span>Second Date:</span><asp:label id="SecondDate" runat="server"></asp:label>
                <asp:Label ID="date" runat="server"></asp:Label>--%>
                <asp:Label runat="server" ID="GameDesc" />
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover" 
                    ID="GameGridView" AutoGenerateColumns="false" DataKeyNames="GameID"
                    AllowPaging="true" PageSize="3" OnPageIndexChanging="GameGridView_PageIndexChanging"
                    AllowSorting="true" OnSorting="GameGridView_Sorting" OnRowDataBound="GameGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID" />
                        <asp:BoundField DataField="GameType" HeaderText="Game Type" Visible="true" SortExpression="GameType" />
                        <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" SortExpression="Description" />
                        <%--<asp:TemplateField HeaderText="Description (short)">
                <ItemTemplate>
                    <div style="width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                        <%# Eval("Description") %>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>--%>
<asp:BoundField DataField="WinningTeam" HeaderText="Winning Team" Visible="true" SortExpression="WinningTeam"/>
                        <asp:BoundField DataField="WinningTeamScore" HeaderText="WinningTeamScore" Visible="true" SortExpression="WinningTeamScore" />
                        <asp:BoundField DataField="LosingTeamScore" HeaderText="Losing Team Score" Visible="true" SortExpression="LosingTeamScore"/>
                        <asp:BoundField DataField="LosingTeam" HeaderText="Losing Team" Visible="true" SortExpression="LosingTeam" />
                        <asp:BoundField DataField="Spectators" HeaderText="Spectators" Visible="true" SortExpression="Spectators"/>
                        <asp:BoundField DataField="GameDate" HeaderText="Game Date" Visible="true" SortExpression="GameDate" DataFormatString="{0:MMM dd, yyyy}"/>
                     </Columns>
                </asp:GridView>
            </div>
        </div>
        </div>
</asp:Content>
