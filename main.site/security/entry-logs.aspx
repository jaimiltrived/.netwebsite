<%@ Page Title="Gate Entry Logs" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="entry-logs.aspx.cs" Inherits="main.site.SecurityEntryLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium" data-aos="fade-up">
                    <div class="mb-4">
                        <h5 class="text-bold mb-1">Check-In Scans List</h5>
                        <p class="text-color-secondary fs-7 mb-0">Audit history of visitor entries registered at security gates today.</p>
                    </div>

                    <div class="table-responsive border-0">
                        <table class="table table-premium text-nowrap align-middle" id="security-entry-logs-table" style="width: 100%;">
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
                            <tbody id="security-entry-logs-tbody">
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
            // Guarantee dummy entries exist
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

            const logs = JSON.parse(localStorage.getItem('svpms_entry_logs') || '[]');
            const tbody = document.getElementById('security-entry-logs-tbody');
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

            initPremiumDataTable('#security-entry-logs-table');
        });
    </script>
</asp:Content>
