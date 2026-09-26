<%@ Page Title="Internal Server Error - 500" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="500.aspx.cs" Inherits="main.site.Page500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container text-center" style="max-width: 500px;" data-aos="zoom-in">
        <div class="mb-4">
            <div class="d-inline-flex align-items-center justify-content-center bg-warning bg-opacity-10 p-3 rounded-circle text-warning mb-4" style="width: 80px; height: 80px;">
                <i class="bi bi-exclamation-triangle-fill" style="font-size: 3rem;"></i>
            </div>
            <h1 class="text-extrabold text-warning" style="font-size: 4rem; line-height: 1;">500</h1>
            <h3 class="text-bold text-color-primary mt-3">Internal Server Error</h3>
            <p class="text-color-secondary mt-2">The server encountered an internal error or misconfiguration and was unable to complete your request. Please try again later.</p>
        </div>
        
        <div class="mt-4">
            <a href="index.aspx" class="btn btn-premium btn-premium-primary px-4 py-3">
                <i class="bi bi-arrow-clockwise"></i> Try Reloading Homepage
            </a>
        </div>
    </div>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
