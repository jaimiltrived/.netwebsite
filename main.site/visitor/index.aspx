<%@ Page Title="Visitor Portal" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="main.site.VisitorIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
        /* Premium Hero Visual for Visitor Portal */
        .visitor-hero {
            padding: 80px 0;
            overflow: hidden;
            position: relative;
        }

        /* Hover Lift Grid Cards */
        .portal-card {
            background-color: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-card);
            padding: var(--spacing-xl);
            transition: transform var(--transition-base), box-shadow var(--transition-base), border-color var(--transition-base);
            position: relative;
        }

        .portal-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-md);
            border-color: var(--primary);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Hero Section -->
    <header class="visitor-hero bg-light bg-opacity-20 d-flex align-items-center">
        <div class="container px-4">
            <div class="row justify-content-center text-center">
                <!-- Center Details -->
                <div class="col-lg-8" data-aos="fade-up">
                    <span class="badge bg-primary bg-opacity-10 text-primary text-semibold px-3 py-2 rounded-pill mb-3">
                        Visitor Self-Service
                    </span>
                    <h1 class="text-extrabold text-color-primary display-4 mb-3" style="line-height: 1.15;">
                        Welcome to your visitor portal
                    </h1>
                    <p class="text-color-secondary fs-5 mb-4 mx-auto" style="max-width: 600px;">
                        Register your visit, check your approval status, and retrieve your digital visitor QR pass to traverse security checkpoints instantly.
                    </p>
                    <div class="d-flex gap-3 justify-content-center flex-wrap">
                        <a href="register.aspx" class="btn btn-primary btn-lg px-4 py-3 text-semibold">Register Visit</a>
                        <a href="status.aspx" class="btn btn-outline-secondary btn-lg px-4 py-3 text-semibold">Track Visit</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Services Grid Section -->
    <main class="flex-grow-1 py-5">
        <div class="container px-4">
            <div class="row g-4 justify-content-center">
                <!-- Card 1 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="50">
                    <div class="portal-card h-100 d-flex flex-column justify-content-between">
                        <div>
                            <div class="icon-circle bg-primary bg-opacity-10 text-primary mb-3"><i class="bi bi-person-plus-fill fs-4"></i></div>
                            <h4 class="text-bold text-color-primary mb-2">Register Visit</h4>
                            <p class="text-color-secondary fs-7">Pre-register your details, select department host, and upload identity document files before you arrive.</p>
                        </div>
                        <a href="register.aspx" class="btn btn-primary w-100 py-3 mt-3 text-semibold">Register Visit</a>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="portal-card h-100 d-flex flex-column justify-content-between">
                        <div>
                            <div class="icon-circle bg-secondary bg-opacity-10 text-secondary mb-3"><i class="bi bi-search fs-4"></i></div>
                            <h4 class="text-bold text-color-primary mb-2">Track Visit</h4>
                            <p class="text-color-secondary fs-7">Check the progress status of your visit request reference number and view approvals timeline.</p>
                        </div>
                        <a href="status.aspx" class="btn btn-outline-primary w-100 py-3 mt-3 text-semibold">Track Visit</a>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="150">
                    <div class="portal-card h-100 d-flex flex-column justify-content-between">
                        <div>
                            <div class="icon-circle bg-success bg-opacity-10 text-success mb-3"><i class="bi bi-qr-code-scan fs-4"></i></div>
                            <h4 class="text-bold text-color-primary mb-2">Digital Pass</h4>
                            <p class="text-color-secondary fs-7">Access your approved digital QR gate pass credentials to present at security scanners.</p>
                        </div>
                        <a href="status.aspx" class="btn btn-outline-primary w-100 py-3 mt-3 text-semibold">View Pass</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
