<%@ Page Title="Page Not Found - 404" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="main.site.Page404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container text-center" style="max-width: 500px;" data-aos="zoom-in">
        <div class="mb-4">
            <h1 class="text-extrabold text-primary" style="font-size: 6rem; line-height: 1;">404</h1>
            <h3 class="text-bold text-color-primary mt-3">Oops! Page Not Found</h3>
            <p class="text-color-secondary mt-2">The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
        </div>
        
        <div class="mt-4">
            <a href="index.aspx" class="btn btn-premium btn-premium-primary px-4 py-3">
                <i class="bi bi-house-door-fill"></i> Back to Safety (Home)
            </a>
        </div>
    </div>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
