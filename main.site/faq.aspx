<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="main.site.Faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">Frequently Asked Questions</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">Find detailed explanations about booking, approvals, gate checkpoints, and pricing policies.</p>
        </div>
    </header>

    <!-- FAQ Accordion List -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row justify-content-center" data-aos="fade-up">
                <div class="col-lg-8">
                    <div class="accordion" id="faqDetailed">
                        <!-- Q1 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h1">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c1">
                                    What is SVPMS?
                                </button>
                            </h2>
                            <div id="c1" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    SVPMS stands for Smart Visitor Pass Management System. It is an enterprise ready digital solution designed to replace paper based registration logbooks at entrance gates with digital workflows, visitor photos, and scanned passes.
                                </div>
                            </div>
                        </div>

                        <!-- Q2 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h2">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c2">
                                    Does the visitor need an account?
                                </button>
                            </h2>
                            <div id="c2" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    No, visitors do not need to register accounts. The public website offers a direct self-service visitor portal to pre-register visit requests and check statuses without storing username/passwords.
                                </div>
                            </div>
                        </div>

                        <!-- Q3 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h3">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c3">
                                    How does QR verification work?
                                </button>
                            </h2>
                            <div id="c3" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Once approved by the host employee, a digital pass with a unique QR code is generated. Visitors show this pass at the gate security kiosk. The officer scans it to verify legitimacy and instantly log their entry check-in.
                                </div>
                            </div>
                        </div>

                        <!-- Q4 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h4">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c4">
                                    Can visitors register themselves?
                                </button>
                            </h2>
                            <div id="c4" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Yes! Visitors can open the public website on their smartphones or desktops, navigate to "Register Visit", complete the booking steps, and receive pass codes seamlessly.
                                </div>
                            </div>
                        </div>

                        <!-- Q5 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h5">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c5">
                                    Can I manage multiple gates?
                                </button>
                            </h2>
                            <div id="c5" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Yes, SVPMS scales from a single gate setup to multiple entrance and exit checkpoints. Each checkpoint links back to the centralized administrator dashboard to audit total registers.
                                </div>
                            </div>
                        </div>

                        <!-- Q6 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h6">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c6">
                                    Is visitor data secure?
                                </button>
                            </h2>
                            <div id="c6" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Absolutely. We employ TLS encryption for transit records and secure encryption protocols for static files to protect identity details and government document uploads.
                                </div>
                            </div>
                        </div>

                        <!-- Q7 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h7">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c7">
                                    Can I use SVPMS for multiple buildings?
                                </button>
                            </h2>
                            <div id="c7" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Yes. Under our Enterprise subscription plan, you can map multiple buildings, department nodes, and hosts directories databases within the same administrative account dashboard.
                                </div>
                            </div>
                        </div>

                        <!-- Q8 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="h8">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#c8">
                                    Can I export visitor reports?
                                </button>
                            </h2>
                            <div id="c8" class="accordion-collapse collapse" data-bs-parent="#faqDetailed">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Yes. Receptionists and Administrators can search visitor logs by date, status, or reference, and export files as standard CSV sheets or print reports directly.
                                </div>
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
