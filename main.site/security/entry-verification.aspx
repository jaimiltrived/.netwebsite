<%@ Page Title="Gate Entry Verification" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="entry-verification.aspx.cs" Inherits="main.site.SecurityEntryVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1" id="entry-verification-container">
                <div class="row g-4 justify-content-center" data-aos="fade-up">
                    <div class="col-lg-8">
                        <div class="card-premium">
                            <div class="d-flex align-items-center justify-content-between mb-4 flex-wrap gap-2">
                                <h5 class="text-bold mb-0">Scanned Visitor Verification</h5>
                                <span class="badge bg-success rounded-pill px-3 py-2 fs-8"><i class="bi bi-patch-check"></i> AUTHENTIC PASS</span>
                            </div>

                            <hr class="my-3">

                            <div class="row g-4">
                                <!-- Photo -->
                                <div class="col-md-4 text-center border-end">
                                    <img id="entry-visitor-photo" src="" alt="Visitor Photo" class="avatar avatar-xl shadow border mb-3" style="width: 140px; height: 140px; border-radius: var(--radius-card) !important;">
                                    <h5 class="text-bold text-color-primary mb-1" id="entry-visitor-name">Loading...</h5>
                                    <p class="text-color-secondary fs-7" id="entry-visitor-company">Loading...</p>
                                </div>

                                <!-- Text -->
                                <div class="col-md-8">
                                    <div class="row g-3 fs-7">
                                        <div class="col-6">
                                            <small class="text-color-muted d-block">Mappable Pass ID</small>
                                            <span class="text-bold text-color-primary" id="entry-visitor-id">VP-ID</span>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-color-muted d-block">Host Employee</small>
                                            <span class="text-semibold text-color-primary" id="entry-visitor-host">Host Name</span>
                                        </div>
                                        <div class="col-12">
                                            <small class="text-color-muted d-block">Purpose of Visit</small>
                                            <span class="text-semibold text-color-secondary" id="entry-visitor-purpose">Purpose</span>
                                        </div>
                                        <div class="col-12">
                                            <small class="text-color-muted d-block">Scheduled Slot</small>
                                            <span class="text-semibold text-color-primary" id="entry-visitor-schedule">Date / Time</span>
                                        </div>
                                        <div class="col-12 mt-4">
                                            <div class="p-3 border rounded-card bg-success bg-opacity-10 d-flex align-items-center gap-2">
                                                <i class="bi bi-shield-check text-success fs-4"></i>
                                                <div>
                                                    <span class="text-bold text-success fs-7 d-block">Identity Verification Checked</span>
                                                    <small class="text-color-secondary fs-8">Receptionist verified document proof on registration step.</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Buttons controls -->
                            <div class="d-flex gap-2 mt-4 pt-4 border-top">
                                <button id="btn-allow-entry" class="btn btn-premium btn-premium-primary flex-grow-1"><i class="bi bi-box-arrow-in-right"></i> Allow Gate Entry</button>
                                <button id="btn-reject-entry" class="btn btn-premium btn-premium-outline text-danger flex-grow-1"><i class="bi bi-x-circle"></i> Deny Entry</button>
                                <a href="incident-report.aspx" class="btn btn-premium btn-premium-outline text-warning"><i class="bi bi-exclamation-triangle"></i></a>
                            </div>

                        </div>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
