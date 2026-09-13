<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="main.site.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">About SVPMS</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">Our story, mission, and the organizations we protect.</p>
        </div>
    </header>

    <!-- Detailed content -->
    <section class="py-5">
        <div class="container py-5 text-start">
            <div class="row g-5">
                <div class="col-lg-8" data-aos="fade-right">
                    <h3 class="text-bold text-color-primary mb-3">Our Mission</h3>
                    <p class="text-color-secondary mb-4">We are dedicated to building simple, secure, and modern front-gate protection systems. Paper visitor log books are slow, prone to data leakages, and offer zero security checks. SVPMS was engineered to bring college campuses, hospitals, and corporate office parks into the digital verification age.</p>
                    
                    <h3 class="text-bold text-color-primary mb-3">Core Values</h3>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="feature-card h-100">
                                <h6 class="text-bold text-primary mb-2">Simplicity First</h6>
                                <p class="text-color-secondary fs-8 mb-0"> Fulfilling a booking or scanning a pass should take under two seconds. We prioritize friction-free UI layouts.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="feature-card h-100">
                                <h6 class="text-bold text-primary mb-2">Absolute Security</h6>
                                <p class="text-color-secondary fs-8 mb-0">Protecting identity documents and check-in logs with strict access control configurations.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4" data-aos="fade-left">
                    <div class="bg-card-theme p-4 shadow rounded-4 text-center">
                        <i class="bi bi-building fs-1 text-primary mb-3"></i>
                        <h5 class="text-bold text-color-primary">The SVPMS Network</h5>
                        <p class="text-color-secondary fs-8 mb-4">Protecting facilities since 2026.</p>
                        <hr>
                        <div class="row g-3 mt-2 text-start">
                            <div class="col-6">
                                <div class="stat-value" style="font-size: 1.5rem;">50+</div>
                                <span class="stat-label" style="font-size: 0.65rem;">Campuses Secured</span>
                            </div>
                            <div class="col-6">
                                <div class="stat-value" style="font-size: 1.5rem;">1M+</div>
                                <span class="stat-label" style="font-size: 0.65rem;">Passes Checked</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
