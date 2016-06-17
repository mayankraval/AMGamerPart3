<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AMGamerPart3.Login" %>
<%--
 * @authors: Mayank Raval and  Akhil Thakkar
 * @date: June 8, 2016
 * @version : 0.0.1 
 * @Description : Login page allows registered user to edit the game tracker and if a new user, then it will redirect to register page
 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">       
        <div class="row">
            <div class="col-md-offset-4 col-md-8">
                <h1>Login Page</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                </div>
            <!-- All the content for log in is down below -->
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label" for="form-group-input">User Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextbox" placeholder="User Name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="PasswordTextBox">Password</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true"></asp:TextBox>
                </div>
                <div class="text-right">
                    <asp:Button ForeColor="black" CssClass="btn btn-success bt-lg" Text="Login" runat="server" ID="LoginButton" />
                    <asp:Button ForeColor="black" CssClass="btn btn-danger bt-lg" Text="Cancel" runat="server" ID="CancelButton" />
                </div>
            </div>
      
        </div>
        
    </div>
</asp:Content>