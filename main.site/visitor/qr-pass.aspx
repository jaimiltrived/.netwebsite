<%@ Page Title="Digital QR Pass" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="qr-pass.aspx.cs" Inherits="main.site.VisitorQrPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content QR pass -->
    <main class="flex-grow-1 py-5" style="background-color: var(--bg-primary);">
        <div class="container px-4" data-aos="zoom-in">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">

                    <!-- Digital QR Pass Card -->
                    <div class="qr-pass-card">
                        <div class="qr-pass-header">
                            <h5 class="text-bold mb-0">VISITOR ENTRY PASS</h5>
                            <small class="text-white text-opacity-75">Present at Gate Scanner Checkpoint</small>
                        </div>
                        <div class="qr-pass-body text-center">
                            <img id="pass-visitor-photo" src="" alt="Visitor Photo"
                                class="avatar avatar-lg shadow border mb-3"
                                style="border-radius: var(--radius-card) !important;">

                            <h4 class="text-bold text-color-primary mb-1" id="pass-visitor-name">Siddharth Malhotra</h4>
                            <p class="text-color-secondary fs-7 mb-3" id="pass-visitor-company">Infosys Ltd.</p>

                            <div class="qr-image-wrapper mx-auto">
                                <img id="pass-qr-code" src="" alt="QR Code" class="img-fluid"
                                    style="width: 160px; height: 160px;">
                            </div>

                            <h5 class="text-bold text-primary mt-2" id="pass-visitor-id">VP-PUB9021</h5>

                            <div class="qr-pass-divider"></div>

                            <div class="row g-2 text-start fs-7 text-color-primary">
                                <div class="col-6">
                                    <small class="text-color-muted d-block">Host Employee</small>
                                    <span class="text-semibold" id="pass-visitor-host">Dr. Priya Sharma</span>
                                </div>
                                <div class="col-6">
                                    <small class="text-color-muted d-block">Scheduled Date</small>
                                    <span class="text-semibold" id="pass-visitor-date">2026-08-27</span>
                                </div>
                                <div class="col-6">
                                    <small class="text-color-muted d-block">Meeting Slot</small>
                                    <span class="text-semibold" id="pass-visitor-time">10:00 AM</span>
                                </div>
                                <div class="col-6">
                                    <small class="text-color-muted d-block">Valid Status</small>
                                    <span class="status-chip approved" id="pass-visitor-status">Approved</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pass Action Buttons -->
                    <div class="d-grid gap-2 mt-4 px-3">
                        <button onclick="window.print()" class="btn btn-premium btn-premium-primary py-3"><i
                                class="bi bi-printer-fill"></i> Print Pass Badge</button>
                        <button onclick="downloadPassMock()" class="btn btn-premium btn-premium-outline py-2"><i
                                class="bi bi-file-earmark-pdf-fill text-danger"></i> Save PDF File</button>
                    </div>

                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
            const visitorId = urlParams.get('visitorId');

            if (!visitorId) {
                window.location.href = 'status.aspx';
                return;
            }

            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const v = visitors.find(item => item.id === visitorId);

            if (!v) {
                window.location.href = 'status.aspx';
                return;
            }

            // Bind values
            document.getElementById('pass-visitor-photo').src = v.photo;
            document.getElementById('pass-visitor-name').textContent = v.name;
            document.getElementById('pass-visitor-company').textContent = v.company;
            document.getElementById('pass-visitor-id').textContent = v.id;
            document.getElementById('pass-visitor-host').textContent = v.host;
            document.getElementById('pass-visitor-date').textContent = v.date;
            document.getElementById('pass-visitor-time').textContent = v.time;

            const statusEl = document.getElementById('pass-visitor-status');
            statusEl.className = `status-chip ${v.status.toLowerCase()}`;
            statusEl.textContent = v.status;

            document.getElementById('pass-qr-code').src = `https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${v.id}`;
        });

        function downloadPassMock() {
            showSuccessToast('Pass layout printed into PDF file.');
        }
    </script>
</asp:Content>
