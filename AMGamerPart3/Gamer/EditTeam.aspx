<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditTeam.aspx.cs" Inherits="AMTeamrPart3.Teamr.EditTeam" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8 transbox">
                <h1>Team List</h1>
                <a href="AddTeam.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Add a Team</a>

                <label for="PageSizeDropDownList">Records per page: </label>
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true"
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="10" Value="10" />
                    <asp:ListItem Text="All" Value="10000" />
                </asp:DropDownList>

                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="TeamGridView" AutoGenerateColumns="false" DataKeyNames="TeamID" OnRowDeleting="TeamGridView_RowDeleting"
                    AllowPaging="true" PageSize="3" OnPageIndexChanging="TeamGridView_PageIndexChanging"
                    AllowSorting="true" OnSorting="TeamGridView_Sorting" OnRowDataBound="TeamGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="Team ID" Visible="true" SortExpression="TeamID" />
                        <asp:BoundField DataField="Name" HeaderText="Team Name" Visible="true" SortExpression="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" SortExpression="Description" />
                        <asp:BoundField DataField="TotalScore" HeaderText="Total Score" Visible="true" SortExpression="TotalScore" />
                        <asp:BoundField DataField="MaxScoreAllow" HeaderText="Max Score Allow" Visible="true" SortExpression="MaxScoreAllow" />
                        <%--<asp:BoundField DataField="LastUpdated" HeaderText="Last Updated" Visible="true" SortExpression="LastUpdated" />--%>
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/|AddTeam.aspx.cs"
                            DataNavigateUrlFields="TeamID" DataNavigateUrlFormatString="AddTeam.aspx?TeamID={0}"
                            ControlStyle-CssClass="btn btn-primary btn-sm" />
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true"
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>




</asp:Content>
