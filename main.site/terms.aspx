<%@ Page Title="Terms of Service" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="terms.aspx.cs" Inherits="main.site.Terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">Terms of Service</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">Terms governing access pass issuance and front-gate registrations.</p>
        </div>
    </header>

    <!-- Content -->
    <section class="py-5">
        <div class="container py-5 text-start" data-aos="fade-up">
            <div class="bg-card-theme p-5 rounded-4 shadow-sm">
                <h4 class="text-bold text-color-primary mb-3">1. Visitor pass conditions</h4>
                <p class="text-color-secondary">Issuance of an active visitor pass does not guarantee unconditional entry to the facility. Front-gate security officers hold complete authority to check government IDs manually, verify purpose of visits with hosts, or deny entry depending on local campus regulations.</p>
                
                <h4 class="text-bold text-color-primary mt-4 mb-3">2. Accurate Information Requirement</h4>
                <p class="text-color-secondary">Visitors agree to provide complete, truthful, and accurate contact details, host employee targets, and valid identity document uploads. Inputting falsified names or uploading blocked reference numbers will result in automatic blacklist flags.</p>

                <h4 class="text-bold text-color-primary mt-4 mb-3">3. Access limits and pass lifespans</h4>
                <p class="text-color-secondary">Generated QR access passes are single-use tokens valid solely for the scheduled date and timeframe window. Passes expire automatically upon logging checkout exit timestamps at security kiosks.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
