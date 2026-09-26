<%@ Page Title="Access Denied - 403" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="403.aspx.cs" Inherits="main.site.Page403" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container text-center" style="max-width: 500px;" data-aos="zoom-in">
        <div class="mb-4">
            <div class="d-inline-flex align-items-center justify-content-center bg-danger bg-opacity-10 p-3 rounded-circle text-danger mb-4" style="width: 80px; height: 80px;">
                <i class="bi bi-slash-circle-fill" style="font-size: 3rem;"></i>
            </div>
            <h1 class="text-extrabold text-danger" style="font-size: 4rem; line-height: 1;">403</h1>
            <h3 class="text-bold text-color-primary mt-3">Access Forbidden</h3>
            <p class="text-color-secondary mt-2">You do not have the required role authorizations to view this administrative area. This incident has been logged.</p>
        </div>
        
        <div class="mt-4">
            <button onclick="returnToDashboard()" class="btn btn-premium btn-premium-danger px-4 py-3">
                <i class="bi bi-shield-lock-fill"></i> Return to Dashboard
            </button>
        </div>
    </div>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        function returnToDashboard() {
            const role = localStorage.getItem('svpms_role');
            if (role === 'admin') {
                window.location.href = 'admin/dashboard.aspx';
            } else if (role === 'receptionist') {
                window.location.href = 'receptionist/dashboard.aspx';
            } else if (role === 'security') {
                window.location.href = 'security/dashboard.aspx';
            } else {
                window.location.href = 'login.aspx';
            }
        }
    </script>
</asp:Content>
