<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AMGamerPart3.Register" %>
<%--
 * @authors: Mayank Raval and  Akhil Thakkar
 * @date: June 8, 2016
 * @version : 0.0.1 
 * @Web Site : http://amgamer.azurewebsites.net/
 * @Description : All the content for registering new user is down below with the submit button and cancel.
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">       
        <div class="row">
            <div class="col-md-offset-4 col-md-8">
                <h1>Register Page</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                 </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label" for="form-group-input">First Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="FirstNameTextbox" placeholder="First Name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="LastNameTextBox">Last Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="LastNameTextBox" placeholder="Last Name" required="true"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label class="control-label" for="UserNameTextBox">User Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="User Name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="EmailTextBox">Email</label>
                    <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="EmailTextBox" placeholder="E-mail" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="EnterPasswordTextBox">Choose the Password</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Enter Password" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="ReEnterPasswordTextBox">Re-Enter Password</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="ReEnterPasswordTextBox" placeholder="Re-Enter Password" required="true"></asp:TextBox>
                </div>
                <div class="text-right">
                    <asp:Button ForeColor="black" Font-Bold="true" CssClass="btn btn-info bt-lg" Text="Register" runat="server" ID="RegisterButton" />
                    <asp:Button ForeColor="black" Font-Bold="true" CssClass="btn btn-danger bt-lg" Text="Cancel" runat="server" ID="CancelButton" />
                </div>
            </div>
      
        </div>
        
    </div>
</asp:Content>
