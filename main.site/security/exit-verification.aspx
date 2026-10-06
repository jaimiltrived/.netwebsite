<%@ Page Title="Gate Exit Verification" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="exit-verification.aspx.cs" Inherits="main.site.SecurityExitVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1" id="exit-verification-container">
                <div class="row g-4 justify-content-center" data-aos="fade-up">
                    <div class="col-lg-8">
                        <div class="card-premium">
                            <div class="d-flex align-items-center justify-content-between mb-4 flex-wrap gap-2">
                                <h5 class="text-bold mb-0">Scanned Exit Gate Verification</h5>
                                <span class="badge bg-secondary text-white rounded-pill px-3 py-2 fs-8"><i class="bi bi-box-arrow-left"></i> ACTIVE VISITOR RECORD</span>
                            </div>

                            <hr class="my-3">

                            <div class="row g-4">
                                <!-- Photo -->
                                <div class="col-md-4 text-center border-end">
                                    <img id="exit-visitor-photo" src="" alt="Visitor Photo" class="avatar avatar-xl shadow border mb-3" style="width: 140px; height: 140px; border-radius: var(--radius-card) !important;">
                                    <h5 class="text-bold text-color-primary mb-1" id="exit-visitor-name">Loading...</h5>
                                    <p class="text-color-secondary fs-7" id="exit-visitor-company">Loading...</p>
                                </div>

                                <!-- Text -->
                                <div class="col-md-8">
                                    <div class="row g-3 fs-7">
                                        <div class="col-6">
                                            <small class="text-color-muted d-block">Mappable Pass ID</small>
                                            <span class="text-bold text-color-primary" id="exit-visitor-id">VP-ID</span>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-color-muted d-block">Host Employee</small>
                                            <span class="text-semibold text-color-primary" id="exit-visitor-host">Host Name</span>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-color-muted d-block">Gate Entry Time</small>
                                            <span class="text-bold text-primary" id="exit-visitor-entry-time">09:12 AM</span>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-color-muted d-block">Calculated Stay Duration</small>
                                            <span class="text-bold text-color-secondary" id="exit-visitor-duration">1h 33m</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Buttons controls -->
                            <div class="d-flex gap-2 mt-4 pt-4 border-top">
                                <button id="btn-confirm-exit" class="btn btn-premium btn-premium-primary flex-grow-1"><i class="bi bi-check-circle"></i> Confirm Exit Check-Out</button>
                                <a href="incident-report.aspx" class="btn btn-premium btn-premium-outline text-warning flex-grow-1"><i class="bi bi-exclamation-triangle-fill"></i> Report Incident</a>
                            </div>

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
            const visitorId = urlParams.get('visitorId');
            
            if (visitorId) {
                // Calculate stay duration mockup
                const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
                const visitor = visitors.find(v => v.id === visitorId);
                
                if (visitor && visitor.entryTime) {
                    // Entry time is "HH:MM AM" - calculate stay duration dummy
                    const durationEl = document.getElementById('exit-visitor-duration');
                    if (durationEl) {
                        durationEl.textContent = '1h 33m'; // Mock duration
                    }
                }
            }
        });
    </script>
</asp:Content>
