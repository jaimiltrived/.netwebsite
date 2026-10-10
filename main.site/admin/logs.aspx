<%@ Page Title="Access Logs" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="logs.aspx.cs" Inherits="main.site.AdminLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium" data-aos="fade-up">
                    <!-- Tabs Navigation -->
                    <ul class="nav nav-tabs border-bottom mb-4" id="logsTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active text-semibold text-color-secondary py-3 px-4 border-0 border-bottom border-primary-hover" id="entry-tab" data-bs-toggle="tab" data-bs-target="#entry-logs" type="button" role="tab" aria-controls="entry-logs" aria-selected="true">
                                <i class="bi bi-journal-arrow-down me-2 text-primary"></i> Entry Gate Logs
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-semibold text-color-secondary py-3 px-4 border-0" id="exit-tab" data-bs-toggle="tab" data-bs-target="#exit-logs" type="button" role="tab" aria-controls="exit-logs" aria-selected="false">
                                <i class="bi bi-journal-arrow-up me-2 text-secondary"></i> Exit Gate Logs
                            </button>
                        </li>
                    </ul>

                    <!-- Tabs Content -->
                    <div class="tab-content" id="logsTabContent">
                        <!-- Entry Logs Tab -->
                        <div class="tab-pane fade show active" id="entry-logs" role="tabpanel" aria-labelledby="entry-tab">
                            <div class="table-responsive border-0">
                                <table class="table table-premium text-nowrap align-middle" id="entry-logs-table" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Visitor Details</th>
                                            <th>Gate checkpoint</th>
                                            <th>Access Date</th>
                                            <th>Log Time</th>
                                            <th>Verifying Security Officer</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody id="entry-logs-tbody">
                                        <!-- Loaded dynamically -->
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Exit Logs Tab -->
                        <div class="tab-pane fade" id="exit-logs" role="tabpanel" aria-labelledby="exit-tab">
                            <div class="table-responsive border-0">
                                <table class="table table-premium text-nowrap align-middle" id="exit-logs-table" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Visitor Details</th>
                                            <th>Gate checkpoint</th>
                                            <th>Access Date</th>
                                            <th>Log Time</th>
                                            <th>Verifying Security Officer</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody id="exit-logs-tbody">
                                        <!-- Loaded dynamically -->
                                    </tbody>
                                </table>
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
            initMockLogs();
            loadEntryLogs();
            loadExitLogs();
        });

        function initMockLogs() {
            if (!localStorage.getItem('svpms_entry_logs')) {
                const defaultEntry = [
                    {
                        id: 'VP-264027',
                        name: 'Rohan Verma',
                        photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                        gate: 'Main Entrance Gate A',
                        date: new Date().toLocaleDateString(),
                        time: '09:12 AM',
                        officer: 'Officer Vikram Singh'
                    },
                    {
                        id: 'VP-264028',
                        name: 'Sneha Kulkarni',
                        photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                        gate: 'VIP Gate C',
                        date: new Date().toLocaleDateString(),
                        time: '08:28 AM',
                        officer: 'Officer Vikram Singh'
                    }
                ];
                localStorage.setItem('svpms_entry_logs', JSON.stringify(defaultEntry));
            }

            if (!localStorage.getItem('svpms_exit_logs')) {
                const defaultExit = [
                    {
                        id: 'VP-264028',
                        name: 'Sneha Kulkarni',
                        photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                        gate: 'VIP Gate C',
                        date: new Date().toLocaleDateString(),
                        time: '10:45 AM',
                        officer: 'Officer Vikram Singh'
                    }
                ];
                localStorage.setItem('svpms_exit_logs', JSON.stringify(defaultExit));
            }
        }

        function loadEntryLogs() {
            const logs = JSON.parse(localStorage.getItem('svpms_entry_logs') || '[]');
            const tbody = document.getElementById('entry-logs-tbody');
            tbody.innerHTML = '';
            
            logs.forEach(l => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <img src="${l.photo}" alt="${l.name}" class="avatar avatar-sm">
                            <div>
                                <div class="text-bold text-color-primary">${l.name}</div>
                                <small class="text-color-muted fs-8">${l.id}</small>
                            </div>
                        </div>
                    </td>
                    <td class="text-semibold">${l.gate}</td>
                    <td>${l.date}</td>
                    <td class="text-semibold text-primary">${l.time}</td>
                    <td>${l.officer}</td>
                    <td><span class="status-chip inside">Inside</span></td>
                `;
                tbody.appendChild(tr);
            });

            initPremiumDataTable('#entry-logs-table');
        }

        function loadExitLogs() {
            const logs = JSON.parse(localStorage.getItem('svpms_exit_logs') || '[]');
            const tbody = document.getElementById('exit-logs-tbody');
            tbody.innerHTML = '';
            
            logs.forEach(l => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <img src="${l.photo}" alt="${l.name}" class="avatar avatar-sm">
                            <div>
                                <div class="text-bold text-color-primary">${l.name}</div>
                                <small class="text-color-muted fs-8">${l.id}</small>
                            </div>
                        </div>
                    </td>
                    <td class="text-semibold">${l.gate}</td>
                    <td>${l.date}</td>
                    <td class="text-semibold text-color-secondary">${l.time}</td>
                    <td>${l.officer}</td>
                    <td><span class="status-chip exited">Exited</span></td>
                `;
                tbody.appendChild(tr);
            });

            initPremiumDataTable('#exit-logs-table');
        }
    </script>
</asp:Content>
