<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="AMGamerPart3.Admin.Users" %>
<%--
 * @authors: Mayank Raval and  Akhil Thakkar 
 * @Stud #: 200300508 & 200300312
   @Web Site : http://amgamer3.azurewebsites.net/Users.aspx
 * @date: June 22, 2016
 * @version : 0.0.1 
 * @Description : Users Page Displays the list of users registered and also 
                  lets the admin to edit or delete the particular user. Also, This page is only viewed by an admin logged in.
 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="row">

            <div class="col-md-offset-2 col-md-8 transbox">

                <h1>Users</h1>

                <a href="/Admin/UserDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Register New User</a>

                <asp:GridView runat="server" ID="UsersGridView" AutoGenerateColumns="false"

                    CssClass="table table-bordered table-striped table-hover" OnRowDeleting="UsersGridView_RowDeleting" DataKeyNames="Id">

                    <Columns>

                        <asp:BoundField DataField="UserName" HeaderText="User Name" Visible="true" />

                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" Visible="true" />

                        <asp:BoundField DataField="Email" HeaderText="Email" Visible="true" />

                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/Admin/UserDetails.aspx" 

                            DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UserDetails.aspx?Id={0}" 

                            ControlStyle-CssClass="btn btn-primary btn-sm" />

                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" 

                            ShowDeleteButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>
</asp:Content>
