<%@ Page Title="Super Admin Dashboard" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="main.site.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <!-- Welcome Banner -->
                <div class="welcome-banner" data-aos="fade-up">
                    <div class="welcome-text">
                        <h1>Good Morning, <span id="welcome-username">Rajesh Sharma</span></h1>
                        <p>Here is your enterprise security and gate visitor summary for today.</p>
                    </div>
                    <div class="text-md-end text-color-secondary bg-card-theme p-3 rounded-card shadow-sm d-flex align-items-center gap-2">
                        <i class="bi bi-calendar-check text-primary fs-4"></i>
                        <div>
                            <div class="text-bold fs-7" id="dashboard-date">August 26, 2026</div>
                            <div class="fs-8 text-color-muted">System Status: <span class="text-success text-bold">Healthy</span></div>
                        </div>
                    </div>
                </div>

                <!-- KPI Cards Row -->
                <div class="row g-4 mb-4" data-aos="fade-up" data-aos-delay="50">
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Total Visitors (Month)</span>
                                    <div class="kpi-value">1,482</div>
                                </div>
                                <div class="kpi-icon primary"><i class="bi bi-people-fill"></i></div>
                            </div>
                            <div class="kpi-trend up mt-2">
                                <i class="bi bi-arrow-up-short fs-5"></i> +12% <span class="text-color-muted font-normal ms-1">from last month</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Today's Visits</span>
                                    <div class="kpi-value" id="kpi-today-visitors">5</div>
                                </div>
                                <div class="kpi-icon info"><i class="bi bi-calendar2-event-fill"></i></div>
                            </div>
                            <div class="kpi-trend up mt-2">
                                <i class="bi bi-arrow-up-short fs-5"></i> +5.2% <span class="text-color-muted font-normal ms-1">daily average</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Pending Approvals</span>
                                    <div class="kpi-value text-warning" id="kpi-pending-approvals">2</div>
                                </div>
                                <div class="kpi-icon warning"><i class="bi bi-clock-fill"></i></div>
                            </div>
                            <div class="kpi-trend down mt-2">
                                <i class="bi bi-arrow-down-short fs-5"></i> -3% <span class="text-color-muted font-normal ms-1">waiting queue</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Visitors Inside</span>
                                    <div class="kpi-value text-success" id="kpi-visitors-inside">1</div>
                                </div>
                                <div class="kpi-icon success"><i class="bi bi-building-fill-up"></i></div>
                            </div>
                            <div class="kpi-trend up mt-2">
                                <i class="bi bi-dot fs-4"></i> Active <span class="text-color-muted font-normal ms-1">in facility right now</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Layout Grid (Charts & Actions) -->
                <div class="row g-4 mb-4">
                    <!-- Quick Actions & Timeline -->
                    <div class="col-lg-4 d-flex flex-column gap-4" data-aos="fade-up" data-aos-delay="100">
                        <!-- Quick Actions -->
                        <div class="card-premium">
                            <h5 class="text-bold mb-3">Quick Actions</h5>
                            <div class="quick-actions-grid">
                                <div class="quick-action-btn" onclick="location.href='../receptionist/register-visitor.aspx'">
                                    <i class="bi bi-person-plus-fill"></i>
                                    <span>Add Visitor</span>
                                </div>
                                <div class="quick-action-btn" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                                    <i class="bi bi-person-badge-fill"></i>
                                    <span>Add Employee</span>
                                </div>
                                <div class="quick-action-btn" data-bs-toggle="modal" data-bs-target="#addDeptModal">
                                    <i class="bi bi-building-fill"></i>
                                    <span>Add Dept</span>
                                </div>
                                <div class="quick-action-btn" data-bs-toggle="modal" data-bs-target="#addGateModal">
                                    <i class="bi bi-door-closed-fill"></i>
                                    <span>Add Gate</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='reports.aspx'">
                                    <i class="bi bi-graph-up-arrow"></i>
                                    <span>View Reports</span>
                                </div>
                                <div class="quick-action-btn" onclick="location.href='blacklist.aspx'">
                                    <i class="bi bi-slash-circle-fill text-danger"></i>
                                    <span>Blacklist</span>
                                </div>
                            </div>
                        </div>

                        <!-- System Status -->
                        <div class="card-premium">
                            <h5 class="text-bold mb-3">System Services Health</h5>
                            <div class="d-flex flex-column gap-3">
                                <div class="status-panel-card">
                                    <span class="text-bold fs-7">Core SQL Database</span>
                                    <div class="status-indicator"><div class="status-dot online"></div>Online</div>
                                </div>
                                <div class="status-panel-card">
                                    <span class="text-bold fs-7">IIS Host Application</span>
                                    <div class="status-indicator"><div class="status-dot online"></div>Online</div>
                                </div>
                                <div class="status-panel-card">
                                    <span class="text-bold fs-7">QR Cryptography Service</span>
                                    <div class="status-indicator"><div class="status-dot online"></div>Online</div>
                                </div>
                                <div class="status-panel-card">
                                    <span class="text-bold fs-7">S3 Database Backup</span>
                                    <div class="status-indicator"><div class="status-dot warning"></div>Warning</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Charts Grid -->
                    <div class="col-lg-8" data-aos="fade-up" data-aos-delay="150">
                        <div class="row g-4">
                            <!-- Visitor Trend Chart -->
                            <div class="col-md-6">
                                <div class="card-premium h-100">
                                    <h5 class="text-bold mb-3">Weekly Traffic Trend</h5>
                                    <div style="height: 220px;">
                                        <canvas id="visitorTrendChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- Department Chart -->
                            <div class="col-md-6">
                                <div class="card-premium h-100">
                                    <h5 class="text-bold mb-3">Visitors per Department</h5>
                                    <div style="height: 220px;">
                                        <canvas id="deptVisitorsChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- Status Chart -->
                            <div class="col-md-6">
                                <div class="card-premium h-100">
                                    <h5 class="text-bold mb-3">Requests Status Ratio</h5>
                                    <div style="height: 220px;">
                                        <canvas id="visitorStatusChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- Gate traffic Chart -->
                            <div class="col-md-6">
                                <div class="card-premium h-100">
                                    <h5 class="text-bold mb-3">Active Gate Entries</h5>
                                    <div style="height: 220px;">
                                        <canvas id="gateTrafficChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity & Visitor Table Row -->
                <div class="row g-4">
                    <!-- Recent Activity Feed -->
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="card-premium h-100">
                            <h5 class="text-bold mb-4">Security Activity Logs</h5>
                            <ul class="activity-feed" id="activity-feed-target">
                                <li class="activity-feed-item entered">
                                    <div class="activity-icon-wrapper"><i class="bi bi-box-arrow-in-right"></i></div>
                                    <div class="activity-details">
                                        <p><strong>Rohan Verma</strong> entered Main Gate A</p>
                                        <small class="activity-time">09:12 AM &bull; Verified by Officer Vikram Singh</small>
                                    </div>
                                </li>
                                <li class="activity-feed-item exited">
                                    <div class="activity-icon-wrapper"><i class="bi bi-box-arrow-left"></i></div>
                                    <div class="activity-details">
                                        <p><strong>Sneha Kulkarni</strong> checked out of VIP Gate</p>
                                        <small class="activity-time">10:45 AM &bull; Stay: 2h 17m</small>
                                    </div>
                                </li>
                                <li class="activity-feed-item approved">
                                    <div class="activity-icon-wrapper"><i class="bi bi-check-circle-fill"></i></div>
                                    <div class="activity-details">
                                        <p><strong>Aarav Patel</strong> visit approved</p>
                                        <small class="activity-time">Yesterday &bull; Host: Dr. Priya Sharma</small>
                                    </div>
                                </li>
                                <li class="activity-feed-item registered">
                                    <div class="activity-icon-wrapper"><i class="bi bi-file-earmark-plus"></i></div>
                                    <div class="activity-details">
                                        <p>Public request submitted: <strong>Ananya Iyer</strong></p>
                                        <small class="activity-time">10 mins ago &bull; Target Dept: HR</small>
                                    </div>
                                </li>
                                <li class="activity-feed-item blacklisted">
                                    <div class="activity-icon-wrapper"><i class="bi bi-slash-circle-fill"></i></div>
                                    <div class="activity-details">
                                        <p>Security Alert: <strong>Deepak Malhotra</strong> flagged</p>
                                        <small class="activity-time">2 hours ago &bull; Blacklist Match Detected</small>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- DataTable list -->
                    <div class="col-lg-8" data-aos="fade-up">
                        <div class="card-premium h-100">
                            <div class="card-premium-header">
                                <h5 class="text-bold mb-0">Recent Visitors</h5>
                                <a href="visitors.aspx" class="fs-8 text-primary text-semibold">View all directory <i class="bi bi-arrow-right"></i></a>
                            </div>
                            <div class="table-responsive border-0">
                                <table class="table table-premium text-nowrap align-middle" id="dashboard-visitors-table">
                                    <thead>
                                        <tr>
                                            <th>Visitor</th>
                                            <th>Company</th>
                                            <th>Host Employee</th>
                                            <th>Date & Time</th>
                                            <th>Status</th>
                                            <th class="text-end">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dashboard-visitors-tbody">
                                        <!-- Loaded dynamically from localStorage -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        // Load recent visitors dynamically from localStorage
        document.addEventListener('DOMContentLoaded', () => {
            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const tbody = document.getElementById('dashboard-visitors-tbody');
            
            // Limit to 4 recent records
            const recent = visitors.slice(0, 4);
            
            tbody.innerHTML = '';
            
            if (recent.length === 0) {
                tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4 text-color-muted">No visitors registered in the database.</td></tr>';
            } else {
                recent.forEach(v => {
                    let actionsHtml = `
                        <div class="text-end">
                            <a href="visitor-details.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-light text-dark btn-premium-outline me-1" data-bs-toggle="tooltip" title="View Details"><i class="bi bi-eye"></i></a>
                    `;
                    
                    if (v.status === 'Pending') {
                        actionsHtml += `
                            <button onclick="approveVisitor('${v.id}')" class="btn btn-sm btn-success me-1 btn-premium-success" data-bs-toggle="tooltip" title="Approve"><i class="bi bi-check-lg"></i></button>
                            <button onclick="rejectVisitor('${v.id}')" class="btn btn-sm btn-danger me-1" data-bs-toggle="tooltip" title="Reject"><i class="bi bi-x-lg"></i></button>
                        `;
                    } else if (v.status === 'Approved') {
                        actionsHtml += `
                            <a href="../receptionist/generate-qr.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-primary btn-premium-outline" data-bs-toggle="tooltip" title="Generate Pass"><i class="bi bi-qr-code"></i></a>
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
                        <td>${v.company}</td>
                        <td>
                            <div class="text-semibold text-color-primary">${v.host}</div>
                            <small class="text-color-secondary fs-8">${v.department}</small>
                        </td>
                        <td>
                            <div class="text-color-primary">${v.date}</div>
                            <small class="text-color-muted fs-8">${v.time}</small>
                        </td>
                        <td>
                            <span class="status-chip ${v.status.toLowerCase()}">${v.status}</span>
                        </td>
                        <td>${actionsHtml}</td>
                    `;
                    tbody.appendChild(tr);
                });
            }

            // Set dynamic KPI statistics counts based on database content
            document.getElementById('kpi-today-visitors').textContent = visitors.length;
            document.getElementById('kpi-pending-approvals').textContent = visitors.filter(v => v.status === 'Pending').length;
            document.getElementById('kpi-visitors-inside').textContent = visitors.filter(v => v.status === 'Inside').length;

            // Set current human date
            const dateOptions = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            document.getElementById('dashboard-date').textContent = new Date().toLocaleDateString('en-US', dateOptions);
            document.getElementById('welcome-username').textContent = localStorage.getItem('svpms_name') || 'Admin';
        });
    </script>
</asp:Content>
