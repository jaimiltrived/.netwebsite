<%@ Page Title="Gate Exit Logs" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="exit-logs.aspx.cs" Inherits="main.site.SecurityExitLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium" data-aos="fade-up">
                    <div class="mb-4">
                        <h5 class="text-bold mb-1">Check-Out Scans List</h5>
                        <p class="text-color-secondary fs-7 mb-0">Audit history of visitor exits registered at security gates today.</p>
                    </div>

                    <div class="table-responsive border-0">
                        <table class="table table-premium text-nowrap align-middle" id="security-exit-logs-table" style="width: 100%;">
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
                            <tbody id="security-exit-logs-tbody">
                                <!-- Loaded dynamically -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
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

            const logs = JSON.parse(localStorage.getItem('svpms_exit_logs') || '[]');
            const tbody = document.getElementById('security-exit-logs-tbody');
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

            initPremiumDataTable('#security-exit-logs-table');
        });
    </script>
</asp:Content>
