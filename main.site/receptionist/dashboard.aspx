<%@ Page Title="Receptionist Dashboard" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="main.site.ReceptionistDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <!-- Welcome Banner -->
                <div class="welcome-banner" data-aos="fade-up">
                    <div class="welcome-text">
                        <h1>Good Morning, <span id="welcome-username">Pooja Patel</span></h1>
                        <p>Welcome to SVPMS. Manage registrations, walk-ins, and print digital visitor badges.</p>
                    </div>
                </div>

                <!-- KPI Grid -->
                <div class="row g-4 mb-4" data-aos="fade-up" data-aos-delay="50">
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Today's Total Visitors</span>
                                    <div class="kpi-value" id="kpi-total-today">5</div>
                                </div>
                                <div class="kpi-icon primary"><i class="bi bi-calendar-event"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Waiting Approvals</span>
                                    <div class="kpi-value text-warning" id="kpi-waiting">2</div>
                                </div>
                                <div class="kpi-icon warning"><i class="bi bi-hourglass-split"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Visitors Inside</span>
                                    <div class="kpi-value text-success" id="kpi-inside">1</div>
                                </div>
                                <div class="kpi-icon success"><i class="bi bi-box-arrow-in-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Upcoming Today</span>
                                    <div class="kpi-value text-info" id="kpi-upcoming">1</div>
                                </div>
                                <div class="kpi-icon info"><i class="bi bi-people"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main dashboard layout grid -->
                <div class="row g-4 mb-4">
                    <!-- Quick Actions -->
                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card-premium mb-4">
                            <h5 class="text-bold mb-3">Quick Actions</h5>
                            <div class="quick-actions-grid">
                                <div class="quick-action-btn" onclick="location.href='register-visitor.aspx'">
                                    <i class="bi bi-person-plus-fill"></i>
                                    <span>Pre-Register</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='walk-in.aspx'">
                                    <i class="bi bi-lightning-fill"></i>
                                    <span>Walk-In Visitor</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='generate-qr.aspx'">
                                    <i class="bi bi-qr-code"></i>
                                    <span>Generate QR</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='print-badge.aspx'">
                                    <i class="bi bi-printer-fill"></i>
                                    <span>Print Badge</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='visitors.aspx'">
                                    <i class="bi bi-search"></i>
                                    <span>Search Directory</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='today-visitors.aspx'">
                                    <i class="bi bi-calendar-check"></i>
                                    <span>Today's List</span>
                                </div>
                            </div>
                        </div>

                        <!-- Mini Charts Status -->
                        <div class="card-premium">
                            <h5 class="text-bold mb-3">Today's Access Ratios</h5>
                            <div style="height: 220px;">
                                <canvas id="receptionStatusChart"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Today's Visitors Table & Approvals -->
                    <div class="col-lg-8" data-aos="fade-up" data-aos-delay="150">
                        <!-- Visitor Table -->
                        <div class="card-premium h-100">
                            <h5 class="text-bold mb-4">Today's visitor records</h5>
                            <div class="table-responsive border-0">
                                <table class="table table-premium text-nowrap align-middle" id="reception-today-table">
                                    <thead>
                                        <tr>
                                            <th>Visitor</th>
                                            <th>Host Employee</th>
                                            <th>Purpose of Visit</th>
                                            <th>Time Slot</th>
                                            <th>Status</th>
                                            <th class="text-end">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="reception-today-tbody">
                                        <!-- Loaded dynamically -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending approvals queue row -->
                <div class="row g-4" data-aos="fade-up">
                    <div class="col-12">
                        <div class="card-premium">
                            <div class="card-premium-header mb-4">
                                <h5 class="text-bold mb-0">Pending Host Approvals Queue</h5>
                                <a href="approvals.aspx" class="fs-8 text-primary text-semibold">Open Approvals Console <i class="bi bi-arrow-right"></i></a>
                            </div>
                            <div class="row g-3" id="reception-approvals-target">
                                <!-- Approvals cards here -->
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
            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            
            // Welcome username
            document.getElementById('welcome-username').textContent = localStorage.getItem('svpms_name') || 'Receptionist';

            // Filter today's visitors (all dummy ones belong to today by default)
            const today = visitors;
            const tbody = document.getElementById('reception-today-tbody');
            tbody.innerHTML = '';

            today.forEach(v => {
                let actionsHtml = `
                    <div class="text-end">
                        <a href="visitor-details.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-light text-dark btn-premium-outline me-1" data-bs-toggle="tooltip" title="View Detail"><i class="bi bi-eye"></i></a>
                `;

                if (v.status === 'Approved') {
                    actionsHtml += `
                        <a href="generate-qr.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-primary btn-premium-outline me-1" data-bs-toggle="tooltip" title="QR Pass"><i class="bi bi-qr-code"></i></a>
                        <a href="print-badge.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-secondary btn-premium-outline" data-bs-toggle="tooltip" title="Print Badge"><i class="bi bi-printer-fill"></i></a>
                    `;
                }

                actionsHtml += `</div>`;

                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <img src="${v.photo}" alt="${v.name}" class="avatar avatar-sm">
                            <div>
                                <div class="text-bold text-color-primary">${v.name}</div>
                                <small class="text-color-muted fs-8">${v.id}</small>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="text-semibold text-color-primary">${v.host}</div>
                        <small class="text-color-secondary fs-8">${v.department}</small>
                    </td>
                    <td>${v.purpose}</td>
                    <td class="text-semibold">${v.time}</td>
                    <td><span class="status-chip ${v.status.toLowerCase()}">${v.status}</span></td>
                    <td>${actionsHtml}</td>
                `;
                tbody.appendChild(tr);
            });

            initPremiumDataTable('#reception-today-table');

            // Render mini pending approvals queue
            const pending = visitors.filter(v => v.status === 'Pending').slice(0, 3);
            const approvalsTarget = document.getElementById('reception-approvals-target');
            approvalsTarget.innerHTML = '';

            if (pending.length === 0) {
                approvalsTarget.innerHTML = `
                    <div class="col-12 text-center py-4">
                        <span class="text-color-muted fs-7"><i class="bi bi-check2-circle text-success me-2"></i> All visitor requests are verified and approved.</span>
                    </div>
                `;
            } else {
                pending.forEach(v => {
                    const col = document.createElement('div');
                    col.className = 'col-md-4';
                    col.id = `reception-approval-card-${v.id}`;
                    col.innerHTML = `
                        <div class="card-premium h-100 p-3 border">
                            <div class="d-flex align-items-center gap-2 mb-3">
                                <img src="${v.photo}" class="avatar avatar-sm">
                                <div>
                                    <h6 class="text-bold text-color-primary mb-0 fs-7">${v.name}</h6>
                                    <small class="text-color-muted fs-8">${v.company}</small>
                                </div>
                            </div>
                            <div class="fs-8 text-color-secondary mb-3">
                                <p class="mb-1"><strong>Host:</strong> ${v.host}</p>
                                <p class="mb-1"><strong>Schedule:</strong> ${v.time}</p>
                            </div>
                            <div class="d-flex gap-2">
                                <button onclick="receptionApprove('${v.id}')" class="btn btn-sm btn-premium btn-premium-primary py-1 flex-grow-1"><i class="bi bi-check"></i> Approve</button>
                                <button onclick="receptionReject('${v.id}')" class="btn btn-sm btn-premium btn-premium-outline text-danger py-1 flex-grow-1"><i class="bi bi-x"></i> Reject</button>
                            </div>
                        </div>
                    `;
                    approvalsTarget.appendChild(col);
                });
            }

            // Statistics update
            document.getElementById('kpi-total-today').textContent = visitors.length;
            document.getElementById('kpi-waiting').textContent = visitors.filter(v => v.status === 'Pending').length;
            document.getElementById('kpi-inside').textContent = visitors.filter(v => v.status === 'Inside').length;
            document.getElementById('kpi-upcoming').textContent = visitors.filter(v => v.status === 'Approved').length;
        });

        // Local approval wrappers
        function receptionApprove(id) {
            approveVisitor(id, false);
            $(`#reception-approval-card-${id}`).fadeOut('slow', function() {
                $(this).remove();
                location.reload();
            });
        }

        function receptionReject(id) {
            rejectVisitor(id, false);
            // Dynamic check state update
            setTimeout(() => {
                const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
                const state = visitors.find(v => v.id === id);
                if (state && state.status === 'Rejected') {
                    $(`#reception-approval-card-${id}`).fadeOut('slow', function() {
                        $(this).remove();
                        location.reload();
                    });
                }
            }, 4000);
        }
    </script>
</asp:Content>
