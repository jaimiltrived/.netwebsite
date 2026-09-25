<%@ Page Title="Print Visitor Badge" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="print-badge.aspx.cs" Inherits="main.site.ReceptionistPrintBadge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
        .badge-preview-container {
            width: 320px;
            height: 480px;
            background-color: #FFFFFF;
            border: 2px solid var(--dark);
            border-radius: 12px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: var(--spacing-lg);
            position: relative;
            box-shadow: var(--shadow-lg);
            color: #0F172A; /* Forces dark text in print */
        }
        
        .badge-preview-container::after {
            content: 'GUEST / VISITOR';
            position: absolute;
            background-color: var(--primary);
            color: #FFFFFF;
            font-weight: 700;
            font-size: 0.9rem;
            letter-spacing: 0.1em;
            text-align: center;
            padding: 8px 0;
            bottom: 0;
            left: 0;
            right: 0;
            border-radius: 0 0 10px 10px;
        }

        /* Print Media Styles */
        @media print {
            body {
                background-color: #FFFFFF !important;
                background: none !important;
            }
            #app-layout, .app-sidebar, .app-header, .main-content, .btn-premium, footer, nav, h5 {
                display: none !important;
            }
            .badge-print-wrapper {
                margin: 0 !important;
                padding: 0 !important;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: block !important;
            }
            .badge-preview-container {
                box-shadow: none !important;
                border: 1px solid #000 !important;
                page-break-inside: avoid;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="text-center mb-4" data-aos="fade-up">
                    <h5 class="text-bold text-color-primary">Visitor Badge Printing Preview</h5>
                    <p class="text-color-secondary fs-7">Confirm details and click print to output the visitor badge to your local card/label printer.</p>
                </div>

                <div class="badge-print-wrapper" data-aos="zoom-in" data-aos-delay="100">
                    <!-- Printable Badge Container -->
                    <div class="badge-preview-container">
                        <!-- Top Logo Header -->
                        <div class="d-flex align-items-center justify-content-between border-bottom pb-2">
                            <div class="d-flex align-items-center gap-1">
                                <i class="bi bi-shield-check text-primary fs-4"></i>
                                <span class="fw-bold tracking-wider fs-6">SVPMS</span>
                            </div>
                            <span class="badge bg-secondary text-white rounded-pill px-2 py-1 fs-8" id="badge-visitor-id">VP-264025</span>
                        </div>

                        <!-- Badge Body -->
                        <div class="text-center my-3">
                            <img id="badge-visitor-photo" src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="Visitor Face" class="rounded border shadow-sm mb-3" style="width: 100px; height: 100px; object-fit: cover;">
                            <h5 class="fw-bold text-dark mb-0" id="badge-visitor-name">Aarav Patel</h5>
                            <span class="text-color-secondary fs-7 text-uppercase" id="badge-visitor-company">Tata Consultancy Services</span>
                        </div>

                        <!-- Meeting Info -->
                        <div class="row g-2 text-start fs-8 border-top border-bottom py-2 my-2 text-dark">
                            <div class="col-6">
                                <span class="text-muted d-block">Host Employee</span>
                                <span class="fw-semibold" id="badge-visitor-host">Dr. Priya Sharma</span>
                            </div>
                            <div class="col-6">
                                <span class="text-muted d-block">Department</span>
                                <span class="fw-semibold" id="badge-visitor-dept">Information Tech</span>
                            </div>
                            <div class="col-6">
                                <span class="text-muted d-block">Valid Date</span>
                                <span class="fw-semibold" id="badge-visitor-date">2026-08-27</span>
                            </div>
                            <div class="col-6 text-end">
                                <!-- Mini QR Code -->
                                <img id="badge-qr-code" src="https://api.qrserver.com/v1/create-qr-code/?size=60x60&data=VP-264025" alt="QR Mini" style="width: 50px; height: 50px;">
                            </div>
                        </div>

                        <!-- Blank footer space for guest banner -->
                        <div style="height: 30px;"></div>
                    </div>
                </div>

                <!-- Print Control buttons -->
                <div class="text-center mt-4">
                    <button id="print-badge-trigger-btn" class="btn btn-premium btn-premium-primary px-4 py-3"><i class="bi bi-printer"></i> Print Physical Badge</button>
                    <button onclick="history.back()" class="btn btn-premium btn-premium-outline ms-2">Back</button>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
            const visitorId = urlParams.get('visitorId') || 'VP-264025';
            document.getElementById('badge-qr-code').src = `https://api.qrserver.com/v1/create-qr-code/?size=60x60&data=${visitorId}`;
        });
    </script>
</asp:Content>
