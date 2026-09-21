<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="reset-password.aspx.cs" Inherits="main.site.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container text-center" style="max-width: 450px;" data-aos="zoom-in">
        <div class="card-premium p-4 text-start">
            <div class="mb-4 text-center">
                <div class="kpi-icon success mx-auto mb-3" style="width: 50px; height: 50px; font-size: 1.5rem;">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h4 class="text-bold text-color-primary">Reset Password</h4>
                <p class="text-color-secondary fs-7">Choose a strong, secure new password for your account.</p>
            </div>

            <div id="reset-form-wrapper">
                <asp:ValidationSummary ID="vsReset" runat="server" CssClass="alert alert-danger py-2 px-3 fs-8 mb-3" DisplayMode="BulletList" HeaderText="Please correct the following errors:" ValidationGroup="ResetGroup" />

                <!-- New Password -->
                <div class="mb-3 position-relative text-start">
                    <label class="form-label-premium" for="<%= txtNewPassword.ClientID %>">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control form-control-premium" TextMode="Password" placeholder="New Password" ValidationGroup="ResetGroup" />
                    <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New password is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ResetGroup" />
                    <asp:RegularExpressionValidator ID="revNewPassword" runat="server" ControlToValidate="txtNewPassword" ValidationExpression="^.{6,}$" ErrorMessage="Password must be at least 6 characters long." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ResetGroup" />
                </div>

                <!-- Confirm Password -->
                <div class="mb-4 position-relative text-start">
                    <label class="form-label-premium" for="<%= txtConfirmPassword.ClientID %>">Confirm New Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-premium" TextMode="Password" placeholder="Confirm Password" ValidationGroup="ResetGroup" />
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Please confirm your new password." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ResetGroup" />
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" Operator="Equal" Type="String" ErrorMessage="Passwords do not match." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ResetGroup" />
                </div>

                <asp:Button ID="btnResetPassword" runat="server" Text="Save & Update Password" CssClass="btn btn-premium btn-premium-primary w-100 py-3 text-semibold" ValidationGroup="ResetGroup" OnClick="btnResetPassword_Click" />
            </div>
        </div>
    </div>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
