<%@ Page Title="Pending Approvals" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="approvals.aspx.cs" Inherits="main.site.AdminApprovals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="mb-4" data-aos="fade-up">
                    <h5 class="text-bold mb-1">Host/Admin Approvals Console</h5>
                    <p class="text-color-secondary fs-7 mb-0">Approve or deny visitor access request queue. Approved visitors will get their active QR codes instantly.</p>
                </div>

                <!-- Approvals Cards Grid -->
                <div class="row g-4" id="approvals-cards-container" data-aos="fade-up" data-aos-delay="100">
                    <!-- Cards will load dynamically via JS -->
                </div>
            </main>

            <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
            loadApprovals();
        });

        function loadApprovals() {
            const container = document.getElementById('approvals-cards-container');
            if (!container) return;

            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const pending = visitors.filter(v => v.status === 'Pending');

            container.innerHTML = '';

            if (pending.length === 0) {
                container.innerHTML = `
                    <div class="col-12 text-center py-5">
                        <div class="card-premium py-5">
                            <i class="bi bi-check2-circle text-success empty-state-icon" style="font-size: 4rem;"></i>
                            <h5 class="text-bold mt-3">All Caught Up!</h5>
                            <p class="text-color-secondary">No pending visitor requests waiting for approval.</p>
                            <a href="dashboard.aspx" class="btn btn-premium btn-premium-primary mt-2">Back to Dashboard</a>
                        </div>
                    </div>
                `;
                return;
            }

            pending.forEach(v => {
                const card = document.createElement('div');
                card.className = 'col-xl-4 col-md-6 approvals-card-col';
                card.id = `approval-card-${v.id}`;
                card.innerHTML = `
                    <div class="card-premium h-100 d-flex flex-column justify-content-between">
                        <div>
                            <!-- Header Info -->
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <img src="${v.photo}" alt="${v.name}" class="avatar avatar-md">
                                <div>
                                    <h6 class="text-bold text-color-primary mb-0">${v.name}</h6>
                                    <small class="text-color-muted fs-8">Pass ID: ${v.id}</small>
                                </div>
                            </div>
                            
                            <hr class="my-3">
                            
                            <!-- Body Info -->
                            <div class="fs-7 text-color-secondary">
                                <p class="mb-1"><strong>Company:</strong> ${v.company}</p>
                                <p class="mb-1"><strong>Host Employee:</strong> ${v.host}</p>
                                <p class="mb-1"><strong>Department:</strong> ${v.department}</p>
                                <p class="mb-1"><strong>Purpose:</strong> ${v.purpose}</p>
                                <p class="mb-1"><strong>Schedule:</strong> ${v.date} at ${v.time}</p>
                            </div>
                        </div>

                        <!-- Buttons Footer -->
                        <div class="d-flex gap-2 mt-4 pt-3 border-top">
                            <button onclick="handleApprove('${v.id}')" class="btn btn-sm btn-premium btn-premium-primary flex-grow-1"><i class="bi bi-check-lg"></i> Approve</button>
                            <button onclick="handleReject('${v.id}')" class="btn btn-sm btn-premium btn-premium-outline text-danger flex-grow-1"><i class="bi bi-x-lg"></i> Reject</button>
                            <a href="visitor-details.aspx?visitorId=${v.id}" class="btn btn-sm btn-premium btn-premium-outline"><i class="bi bi-eye"></i></a>
                        </div>
                    </div>
                `;
                container.appendChild(card);
            });
        }

        function handleApprove(visitorId) {
            approveVisitor(visitorId, false);
            // Dynamic card removal animation
            const card = document.getElementById(`approval-card-${visitorId}`);
            if (card) {
                $(card).fadeOut('slow', function() {
                    $(this).remove();
                    // Check if zero left
                    const left = document.querySelectorAll('.approvals-card-col').length;
                    if (left === 0) {
                        loadApprovals();
                    }
                });
            }
        }

        function handleReject(visitorId) {
            rejectVisitor(visitorId, false);
            const card = document.getElementById(`approval-card-${visitorId}`);
            if (card) {
                // Wait briefly for swal action to complete
                setTimeout(() => {
                    const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
                    const state = visitors.find(v => v.id === visitorId);
                    if (state && state.status === 'Rejected') {
                        $(card).fadeOut('slow', function() {
                            $(this).remove();
                            const left = document.querySelectorAll('.approvals-card-col').length;
                            if (left === 0) {
                                loadApprovals();
                            }
                        });
                    }
                }, 4000);
            }
        }
    </script>
</asp:Content>
