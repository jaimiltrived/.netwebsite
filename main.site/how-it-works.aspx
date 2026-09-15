<%@ Page Title="How It Works" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="how-it-works.aspx.cs" Inherits="main.site.HowItWorks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">How It Works</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">A modern, frictionless, and secure entry sequence mapping visitors and facility security.</p>
        </div>
    </header>

    <!-- Detailed Workflow Timeline -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <!-- Step 1 -->
                    <div class="row g-4 align-items-center mb-5" data-aos="fade-up">
                        <div class="col-md-3 text-center">
                            <div class="icon-circle bg-primary bg-opacity-10 text-primary mx-auto mb-2" style="width: 70px; height: 70px; font-size: 1.8rem;">
                                01
                            </div>
                            <span class="badge bg-primary text-semibold">STEP 1</span>
                        </div>
                        <div class="col-md-9 text-start">
                            <h4 class="text-bold text-color-primary mb-2">Register Visitor Passes</h4>
                            <p class="text-color-secondary">Visitors access our public portal on their mobile or desktop devices. They input their full name, phone number, choose their host employee from a list, select their departments, and drop in photo attachments.</p>
                        </div>
                    </div>

                    <!-- Step 2 -->
                    <div class="row g-4 align-items-center mb-5" data-aos="fade-up">
                        <div class="col-md-3 text-center">
                            <div class="icon-circle bg-primary bg-opacity-10 text-primary mx-auto mb-2" style="width: 70px; height: 70px; font-size: 1.8rem;">
                                02
                            </div>
                            <span class="badge bg-primary text-semibold">STEP 2</span>
                        </div>
                        <div class="col-md-9 text-start">
                            <h4 class="text-bold text-color-primary mb-2">Reception Verification Check</h4>
                            <p class="text-color-secondary">The reception desk receives the registration file. They verify that credentials look valid, confirm identity document uploads are clear, and submit the pass to the host employee for final approval.</p>
                        </div>
                    </div>

                    <!-- Step 3 -->
                    <div class="row g-4 align-items-center mb-5" data-aos="fade-up">
                        <div class="col-md-3 text-center">
                            <div class="icon-circle bg-primary bg-opacity-10 text-primary mx-auto mb-2" style="width: 70px; height: 70px; font-size: 1.8rem;">
                                03
                            </div>
                            <span class="badge bg-primary text-semibold">STEP 3</span>
                        </div>
                        <div class="col-md-9 text-start">
                            <h4 class="text-bold text-color-primary mb-2">Host Employee Approval</h4>
                            <p class="text-color-secondary">The host employee receives a real-time notification alert. With one click on their panel, they approve or deny the visitor pass request depending on their calendar availability.</p>
                        </div>
                    </div>

                    <!-- Step 4 -->
                    <div class="row g-4 align-items-center mb-5" data-aos="fade-up">
                        <div class="col-md-3 text-center">
                            <div class="icon-circle bg-primary bg-opacity-10 text-primary mx-auto mb-2" style="width: 70px; height: 70px; font-size: 1.8rem;">
                                04
                            </div>
                            <span class="badge bg-primary text-semibold">STEP 4</span>
                        </div>
                        <div class="col-md-9 text-start">
                            <h4 class="text-bold text-color-primary mb-2">Issue Digital QR Pass</h4>
                            <p class="text-color-secondary">The visitor receives a unique reference tracking link. Once approved, the page generates an active digital pass featuring a high-contrast barcode/QR pass ready for scan.</p>
                        </div>
                    </div>

                    <!-- Step 5 -->
                    <div class="row g-4 align-items-center" data-aos="fade-up">
                        <div class="col-md-3 text-center">
                            <div class="icon-circle bg-success bg-opacity-10 text-success mx-auto mb-2" style="width: 70px; height: 70px; font-size: 1.8rem;">
                                05
                            </div>
                            <span class="badge bg-success text-semibold">STEP 5</span>
                        </div>
                        <div class="col-md-9 text-start">
                            <h4 class="text-bold text-color-primary mb-2">Scan Code at Entrance Gate</h4>
                            <p class="text-color-secondary">Upon arrival, gate security officers use the camera scanner tool on their mobile tablet or desktop terminal to read the visitor's QR code, logging check-in times automatically.</p>
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
