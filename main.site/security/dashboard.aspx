<%@ Page Title="Security Dashboard" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="main.site.SecurityDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <!-- Welcome & Gate Details Widget -->
                <div class="welcome-banner security-status-widget mb-4" data-aos="fade-up">
                    <div>
                        <h1 class="text-white">Good Morning, <span id="welcome-username" class="text-white">Officer Vikram Singh</span></h1>
                        <p class="text-color-secondary">Gate access monitoring systems online. Maintain high alerts.</p>
                        
                        <div class="d-flex flex-wrap gap-3 mt-4">
                            <div class="shift-info-box">
                                <i class="bi bi-door-open fs-5"></i>
                                <div>
                                    <small class="text-color-secondary d-block fs-8">Gate Checkpoint</small>
                                    <span class="text-bold fs-7">Main Entrance Gate A</span>
                                </div>
                            </div>
                            <div class="shift-info-box">
                                <i class="bi bi-clock-history fs-5"></i>
                                <div>
                                    <small class="text-color-secondary d-block fs-8">Current Shift</small>
                                    <span class="text-bold fs-7">Day Shift (08:00 - 16:00)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-md-end text-color-secondary p-3 border rounded-card bg-white bg-opacity-10 d-none d-md-block">
                        <div class="text-bold fs-5 text-white" id="clock-display">10:45 AM</div>
                        <small class="text-white text-opacity-50">Local Gate Sync Time</small>
                    </div>
                </div>

                <!-- KPI Grid -->
                <div class="row g-4 mb-4" data-aos="fade-up" data-aos-delay="50">
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Today's Entries</span>
                                    <div class="kpi-value text-primary" id="kpi-entries-count">2</div>
                                </div>
                                <div class="kpi-icon primary"><i class="bi bi-box-arrow-in-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Today's Exits</span>
                                    <div class="kpi-value text-secondary" id="kpi-exits-count">1</div>
                                </div>
                                <div class="kpi-icon secondary"><i class="bi bi-box-arrow-left"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Guests Inside Campus</span>
                                    <div class="kpi-value text-success" id="kpi-inside-count">1</div>
                                </div>
                                <div class="kpi-icon success"><i class="bi bi-building-fill-up"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card-premium kpi-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="text-color-secondary fs-7 text-semibold">Security Alerts</span>
                                    <div class="kpi-value text-danger">0</div>
                                </div>
                                <div class="kpi-icon danger"><i class="bi bi-shield-exclamation"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Layout Grid -->
                <div class="row g-4">
                    <!-- Left Quick Actions & Graph -->
                    <div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">
                        <div class="row g-4">
                            <!-- Quick Actions -->
                            <div class="col-12">
                                <div class="card-premium">
                                    <h5 class="text-bold mb-3">Gate Actions Console</h5>
                                    <div class="quick-actions-grid">
                                        <div class="quick-action-btn" onclick="location.href='scanner.aspx'">
                                            <i class="bi bi-qr-code-scan"></i>
                                            <span>Scan QR Pass</span>
                                        </div>
                                        <div class="quick-action-btn" onclick="location.href='scanner.aspx?mode=manual'">
                                            <i class="bi bi-keyboard-fill"></i>
                                            <span>Manual Code Entry</span>
                                        </div>
                                        <div class="quick-action-btn" onclick="location.href='visitor-search.aspx'">
                                            <i class="bi bi-search"></i>
                                            <span>Search Visitor</span>
                                        </div>
                                        <div class="quick-action-btn" onclick="location.href='live-visitors.aspx'">
                                            <i class="bi bi-people-fill"></i>
                                            <span>Live Guests</span>
                                        </div>
                                        <div class="quick-action-btn" onclick="location.href='incident-report.aspx'">
                                            <i class="bi bi-exclamation-triangle-fill text-warning"></i>
                                            <span>Incident Report</span>
                                        </div>
                                        <div class="quick-action-btn" onclick="location.href='blacklist.aspx'">
                                            <i class="bi bi-slash-circle-fill text-danger"></i>
                                            <span>Watch List</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Traffic Flow Graph -->
                            <div class="col-12">
                                <div class="card-premium">
                                    <h5 class="text-bold mb-3">Today's Traffic Flow Comparison (Entries vs Exits)</h5>
                                    <div style="height: 250px;">
                                        <canvas id="securityTrafficChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Recent Logs & Alerts -->
                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="150">
                        <!-- Recent Entry Logs -->
                        <div class="card-premium h-100">
                            <h5 class="text-bold mb-4">Gate Pass Scans Activity</h5>
                            <ul class="activity-feed" id="security-dashboard-logs">
                                <!-- Loaded dynamically -->
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
            const entryLogs = JSON.parse(localStorage.getItem('svpms_entry_logs') || '[]');
            const exitLogs = JSON.parse(localStorage.getItem('svpms_exit_logs') || '[]');
            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');

            // Set username
            document.getElementById('welcome-username').textContent = localStorage.getItem('svpms_name') || 'Officer Vikram Singh';

            // Clock update
            setInterval(() => {
                const now = new Date();
                document.getElementById('clock-display').textContent = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' });
            }, 1000);

            // Populate dashboard feed with logs
            const feed = document.getElementById('security-dashboard-logs');
            feed.innerHTML = '';

            const logsCombined = [];
            entryLogs.forEach(e => logsCombined.push({ ...e, type: 'entry' }));
            exitLogs.forEach(ex => logsCombined.push({ ...ex, type: 'exit' }));
            
            // Sort by time or date
            logsCombined.sort((a,b) => b.time.localeCompare(a.time));

            if (logsCombined.length === 0) {
                feed.innerHTML = '<li class="text-center py-4 text-color-muted fs-7">No scans recorded on this gate checkpoint today.</li>';
            } else {
                logsCombined.slice(0, 5).forEach(l => {
                    const li = document.createElement('li');
                    li.className = `activity-feed-item ${l.type === 'entry' ? 'entered' : 'exited'}`;
                    li.innerHTML = `
                        <div class="activity-icon-wrapper">
                            <i class="bi ${l.type === 'entry' ? 'bi-box-arrow-in-right' : 'bi-box-arrow-left'}"></i>
                        </div>
                        <div class="activity-details">
                            <p><strong>${l.name}</strong> ${l.type === 'entry' ? 'entered Main Gate A' : 'exited VIP Gate'}</p>
                            <small class="activity-time">${l.time} &bull; Mapped ID: ${l.id}</small>
                        </div>
                    `;
                    feed.appendChild(li);
                });
            }

            // Statistics update
            document.getElementById('kpi-entries-count').textContent = entryLogs.length;
            document.getElementById('kpi-exits-count').textContent = exitLogs.length;
            document.getElementById('kpi-inside-count').textContent = visitors.filter(v => v.status === 'Inside').length;
        });
    </script>
</asp:Content>
