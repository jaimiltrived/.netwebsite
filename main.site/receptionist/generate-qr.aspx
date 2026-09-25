<%@ Page Title="Generate QR Pass" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="generate-qr.aspx.cs" Inherits="main.site.ReceptionistGenerateQr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="row g-4 justify-content-center" data-aos="zoom-in">
                    <div class="col-md-6 col-lg-5">
                        
                        <!-- Dynamic QR Pass Card Component -->
                        <div class="qr-pass-card">
                            <div class="qr-pass-header">
                                <h5 class="text-bold mb-0">VISITOR ACCESS PASS</h5>
                                <small class="text-white text-opacity-75">SVPMS Gate Authorizations</small>
                            </div>
                            <div class="qr-pass-body">
                                <!-- Photo -->
                                <img id="qr-visitor-photo" src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="Visitor Photo" class="avatar avatar-lg shadow border mb-3">
                                
                                <h4 class="text-bold text-color-primary mb-1" id="qr-visitor-name">Aarav Patel</h4>
                                <p class="text-color-secondary fs-7 mb-3" id="qr-visitor-company">Tata Consultancy Services</p>
                                
                                <div class="qr-image-wrapper">
                                    <img id="qr-code-img" src="https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=VP-264025" alt="QR Code" class="img-fluid" style="width: 160px; height: 160px;">
                                </div>
                                
                                <h5 class="text-bold text-primary mt-2" id="qr-visitor-id">VP-264025</h5>
                                
                                <div class="qr-pass-divider"></div>
                                
                                <div class="row g-2 text-start fs-7">
                                    <div class="col-6">
                                        <small class="text-color-muted d-block">Host Employee</small>
                                        <span class="text-semibold text-color-primary" id="qr-visitor-host">Dr. Priya Sharma</span>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-color-muted d-block">Scheduled Date</small>
                                        <span class="text-semibold text-color-primary" id="qr-visitor-date">2026-08-27</span>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-color-muted d-block">Meeting Slot</small>
                                        <span class="text-semibold text-color-primary" id="qr-visitor-time">10:00 AM</span>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-color-muted d-block">Verification Status</small>
                                        <span class="status-chip approved" id="qr-visitor-status">Approved</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Card Action buttons -->
                        <div class="d-flex gap-2 mt-4 px-3">
                            <button onclick="downloadPassMock()" class="btn btn-premium btn-premium-primary flex-grow-1"><i class="bi bi-download"></i> Download</button>
                            <a id="qr-print-link" href="print-badge.aspx" class="btn btn-premium btn-premium-outline flex-grow-1"><i class="bi bi-printer-fill"></i> Print Badge</a>
                            <button onclick="emailPassMock()" class="btn btn-premium btn-premium-outline"><i class="bi bi-envelope"></i></button>
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
            const visitorId = urlParams.get('visitorId') || 'VP-264025';
            document.getElementById('qr-code-img').src = `https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${visitorId}`;
        });

        function downloadPassMock() {
            showSuccessToast('Pass image download triggered.');
        }

        function emailPassMock() {
            Swal.fire({
                title: 'Email QR Pass',
                text: 'Enter the recipient email address:',
                input: 'email',
                inputPlaceholder: 'visitor@company.com',
                showCancelButton: true,
                confirmButtonColor: '#2563EB',
                confirmButtonText: 'Send Pass'
            }).then((result) => {
                if (result.isConfirmed) {
                    showSuccessToast(`QR digital pass emailed to ${result.value}.`);
                }
            });
        }
    </script>
</asp:Content>
