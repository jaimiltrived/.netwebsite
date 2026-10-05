<%@ Page Title="QR Scanner Simulator" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="scanner.aspx.cs" Inherits="main.site.SecurityScanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
        /* Camera Scanner Mockup Frame */
        .scanner-frame-wrapper {
            position: relative;
            width: 100%;
            max-width: 420px;
            height: 300px;
            background-color: #0b0f19;
            border-radius: var(--radius-card);
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid var(--border-color);
            margin: 0 auto;
        }

        /* Moving Scanline Animation */
        .scanner-scanline {
            position: absolute;
            width: 100%;
            height: 4px;
            background: linear-gradient(to bottom, rgba(34, 197, 94, 0), rgba(34, 197, 94, 0.8) 50%, rgba(34, 197, 94, 0));
            box-shadow: 0 0 12px var(--success);
            animation: scanAnimation 3s infinite linear;
            z-index: 10;
        }

        /* Targets Corner Brackets */
        .scanner-target-corners {
            position: absolute;
            width: 220px;
            height: 220px;
            border: 2px dashed rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            z-index: 5;
        }

        .scanner-target-corners::before,
        .scanner-target-corners::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border-color: var(--success);
            border-style: solid;
        }

        .scanner-target-corners::before {
            top: -2px; left: -2px;
            border-width: 4px 0 0 4px;
        }

        .scanner-target-corners::after {
            bottom: -2px; right: -2px;
            border-width: 0 4px 4px 0;
        }

        /* Secondary corners to complete target visual */
        .scanner-corners-helper::before,
        .scanner-corners-helper::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border-color: var(--success);
            border-style: solid;
        }

        .scanner-corners-helper::before {
            top: -2px; right: -2px;
            border-width: 4px 4px 0 0;
        }

        .scanner-corners-helper::after {
            bottom: -2px; left: -2px;
            border-width: 0 0 4px 4px;
        }

        @keyframes scanAnimation {
            0% { top: 0%; }
            50% { top: 100%; }
            100% { top: 0%; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="row g-4 justify-content-center">
                    <!-- Scanner Simulator Column -->
                    <div class="col-lg-6" data-aos="fade-right">
                        <div class="card-premium text-center">
                            <h5 class="text-bold mb-3">Live Access Terminal Camera</h5>
                            
                            <!-- Scanner Device Frame -->
                            <div class="scanner-frame-wrapper mb-4">
                                <div class="scanner-scanline"></div>
                                <div class="scanner-target-corners">
                                    <div class="scanner-corners-helper"></div>
                                </div>
                                <div class="text-white text-opacity-50 fs-8 position-absolute" style="bottom: 12px; z-index: 12;">
                                    <i class="bi bi-circle-fill text-success animate-pulse me-1"></i> CAMERA FEED ACTIVE (GATE A)
                                </div>
                                <div class="text-white text-opacity-25 fs-5"><i class="bi bi-qr-code fs-1 d-block mb-2"></i> Align QR Pass Inside Bracket</div>
                            </div>

                            <!-- Mock Actions Grid -->
                            <div class="d-flex gap-2 mb-4 justify-content-center">
                                <button onclick="simulateScan('VP-264025')" class="btn btn-premium btn-premium-primary fs-7"><i class="bi bi-qr-code"></i> Scan Approved Pass</button>
                                <button onclick="simulateScan('VP-264027')" class="btn btn-premium btn-premium-secondary fs-7"><i class="bi bi-box-arrow-left"></i> Scan Exit Pass</button>
                                <button onclick="simulateScan('VP-264029')" class="btn btn-premium btn-premium-danger fs-7"><i class="bi bi-slash-circle"></i> Scan Banned Pass</button>
                            </div>

                            <!-- Manual Verification Input -->
                            <div class="border-top pt-4 text-start">
                                <h6 class="text-bold text-color-primary mb-3">Manual Pass Code Override</h6>
                                <form id="scanner-mock-form" class="needs-validation" novalidate>
                                    <div class="input-group has-validation">
                                        <input type="text" class="form-control form-control-premium" id="scanner-code-input" placeholder="Enter Pass ID (e.g. VP-264025)..." required minlength="3">
                                        <button class="btn btn-premium btn-premium-primary" type="submit"><i class="bi bi-arrow-right-short fs-4"></i> Verify ID</button>
                                        <div class="invalid-feedback text-start">Please enter a valid Pass ID.</div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>

                    <!-- Scan History Logs Sidebar -->
                    <div class="col-lg-4" data-aos="fade-left" data-aos-delay="100">
                        <div class="card-premium h-100">
                            <h5 class="text-bold mb-4">Gate Scan history</h5>
                            <ul class="activity-feed">
                                <li class="activity-feed-item entered">
                                    <div class="activity-icon-wrapper text-success"><i class="bi bi-check-circle-fill"></i></div>
                                    <div class="activity-details">
                                        <p class="text-bold text-color-primary">VP-264027 Approved</p>
                                        <small class="text-color-muted">Rohan Verma entered &bull; 09:12 AM</small>
                                    </div>
                                </li>
                                <li class="activity-feed-item exited">
                                    <div class="activity-icon-wrapper text-success"><i class="bi bi-check-circle-fill"></i></div>
                                    <div class="activity-details">
                                        <p class="text-bold text-color-primary">VP-264028 Approved</p>
                                        <small class="text-color-muted">Sneha Kulkarni exited &bull; 10:45 AM</small>
                                    </div>
                                </li>
                                <li class="activity-feed-item blacklisted">
                                    <div class="activity-icon-wrapper text-danger"><i class="bi bi-slash-circle-fill"></i></div>
                                    <div class="activity-details">
                                        <p class="text-bold text-danger">VP-264029 DENIED</p>
                                        <small class="text-color-muted">Deepak Malhotra (Blacklisted) &bull; 2 hours ago</small>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('mode') === 'manual') {
                const inp = document.getElementById('scanner-code-input');
                if (inp) inp.focus();
            }
        });

        // Trigger simulation
        function simulateScan(code) {
            document.getElementById('scanner-code-input').value = code;
            
            Swal.fire({
                title: 'Scanning QR Pass...',
                text: 'Reading cryptography salts from pass data...',
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading();
                    setTimeout(() => {
                        Swal.close();
                        // Submit form to trigger routing
                        $('#scanner-mock-form').submit();
                    }, 1200);
                }
            });
        }
    </script>
</asp:Content>
