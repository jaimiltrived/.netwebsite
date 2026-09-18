<%@ Page Title="Security Policies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="security.aspx.cs" Inherits="main.site.Security" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-dark text-white text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold display-4 mb-3" style="color: #ffffff;">Security without complexity.</h1>
            <p class="text-white-50 fs-5 mx-auto" style="max-width: 600px;">Learn how we secure databases, verify identities, check blacklists and restrict access logs.</p>
        </div>
    </header>

    <!-- Security Principles Grid -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row g-4 justify-content-center text-start">
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="50">
                    <div class="feature-card h-100">
                        <h5 class="text-bold text-color-primary mb-3"><i class="bi bi-shield-lock text-primary me-2"></i> Secure Visitor Records</h5>
                        <p class="text-color-secondary fs-7 mb-0">We encrypt visitor identity details, reference tokens and document uploads to block unauthorized data leaking.</p>
                    </div>
                </div>
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="feature-card h-100">
                        <h5 class="text-bold text-color-primary mb-3"><i class="bi bi-person-badge text-primary me-2"></i> Role-Based Staff Access</h5>
                        <p class="text-color-secondary fs-7 mb-0">Control interface features according to credentials. Administrators manage configurations, receptionist registers check-ins, and security scans barcodes.</p>
                    </div>
                </div>
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="150">
                    <div class="feature-card h-100">
                        <h5 class="text-bold text-color-primary mb-3"><i class="bi bi-qr-code text-primary me-2"></i> QR Code Verification</h5>
                        <p class="text-color-secondary fs-7 mb-0">Every generated visitor pass utilizes a dynamic security token. Codes can be scanned only during designated timeframes by verified guard terminals.</p>
                    </div>
                </div>
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="feature-card h-100">
                        <h5 class="text-bold text-color-primary mb-3"><i class="bi bi-stop-circle text-primary me-2"></i> Blacklist Management</h5>
                        <p class="text-color-secondary fs-7 mb-0">Blacklist threat warning registers prevent access of disallowed identity cards automatically during scan sequences.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
