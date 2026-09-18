<%@ Page Title="Privacy Policy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="privacy.aspx.cs" Inherits="main.site.Privacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">Privacy Policy</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">How we protect visitor identity data and security records.</p>
        </div>
    </header>

    <!-- Content -->
    <section class="py-5">
        <div class="container py-5 text-start" data-aos="fade-up">
            <div class="bg-card-theme p-5 rounded-4 shadow-sm">
                <h4 class="text-bold text-color-primary mb-3">1. Information We Collect</h4>
                <p class="text-color-secondary">We collect information provided directly by visitors during booking registration: full name, email address, phone contact, host employee selection, organization names, uploaded ID card images, and captured selfie photos.</p>
                
                <h4 class="text-bold text-color-primary mt-4 mb-3">2. How We Use Information</h4>
                <p class="text-color-secondary">The collected information is solely used to verify visitor identity at entrance checkpoints, log entry/exit audit files, and alert hosting employees of arrivals. We do not sell or share collected data with third-party advertising companies.</p>

                <h4 class="text-bold text-color-primary mt-4 mb-3">3. Data Security and Encryption</h4>
                <p class="text-color-secondary">Visitor credentials and uploaded identity document files are encrypted in transit using secure socket layer protocols and stored on encrypted databases. Access to logs is strictly restricted to verified receptionist and administrator dashboards.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
