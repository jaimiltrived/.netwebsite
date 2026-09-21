<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="main.site.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container text-center" style="max-width: 450px;" data-aos="zoom-in">
        <div class="card-premium p-4 text-start">
            <div class="mb-4">
                <a href="login.aspx" class="text-color-secondary fs-7"><i class="bi bi-arrow-left"></i> Back to
                    Login</a>
            </div>

            <div class="mb-4 text-center">
                <div class="kpi-icon primary mx-auto mb-3" style="width: 50px; height: 50px; font-size: 1.5rem;">
                    <i class="bi bi-key-fill"></i>
                </div>
                <h4 class="text-bold text-color-primary">Forgot Password?</h4>
                <p class="text-color-secondary fs-7">Enter your registered email below, and we will send you a password
                    reset link.</p>
            </div>

            <div id="forgot-form-wrapper">
                <asp:ValidationSummary ID="vsForgot" runat="server" CssClass="alert alert-danger py-2 px-3 fs-8 mb-3" DisplayMode="BulletList" HeaderText="Please correct the following errors:" ValidationGroup="ForgotGroup" />

                <div class="mb-4 text-start">
                    <label class="form-label-premium" for="<%= txtForgotEmail.ClientID %>">Registered Email Address</label>
                    <asp:TextBox ID="txtForgotEmail" runat="server" CssClass="form-control form-control-premium" TextMode="Email" placeholder="name@svpms.demo" ValidationGroup="ForgotGroup" />
                    <asp:RequiredFieldValidator ID="rfvForgotEmail" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="Email address is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ForgotGroup" />
                    <asp:RegularExpressionValidator ID="revForgotEmail" runat="server" ControlToValidate="txtForgotEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Please enter a valid email address (e.g. name@svpms.demo)." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ForgotGroup" />
                </div>

                <asp:Button ID="btnSendReset" runat="server" Text="Send Reset Link" CssClass="btn btn-premium btn-premium-primary w-100 py-3 text-semibold" ValidationGroup="ForgotGroup" OnClick="btnSendReset_Click" />
            </div>
        </div>
    </div>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
