<%@ Page Title="Security Blacklist WATCH LIST" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="blacklist.aspx.cs" Inherits="main.site.SecurityBlacklist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium animate-shake" data-aos="fade-up">
                    <div class="mb-4">
                        <h5 class="text-bold text-danger mb-1"><i class="bi bi-slash-circle-fill"></i> Gate Blacklist (Banned Watch List)</h5>
                        <p class="text-color-secondary fs-7 mb-0">The following profiles have active access bans. Bar campus entry and alert administration immediately on match detection.</p>
                    </div>

                    <div class="table-responsive border-0">
                        <table class="table table-premium text-nowrap align-middle" id="security-blacklist-table">
                            <thead>
                                <tr>
                                    <th>Visitor Details</th>
                                    <th>Company</th>
                                    <th>Banned Reason</th>
                                    <th>Risk level</th>
                                    <th>Alert Level</th>
                                </tr>
                            </thead>
                            <tbody id="security-blacklist-tbody">
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
            const blacklistIds = JSON.parse(localStorage.getItem('svpms_blacklisted_ids') || '[]');
            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const tbody = document.getElementById('security-blacklist-tbody');
            tbody.innerHTML = '';

            blacklistIds.forEach(id => {
                let v = visitors.find(item => item.id === id);
                if (!v) {
                    v = {
                        id: id,
                        name: 'Deepak Malhotra',
                        photo: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                        company: 'Independent Freelance',
                        reason: 'Intrusion threat / suspicious inquiries',
                        risk: 'High'
                    };
                }

                const reason = v.reason || 'Security Policy Violation - unauthorized access attempts';
                const risk = v.risk || 'High';
                const riskClass = risk === 'High' ? 'bg-danger text-white' : risk === 'Medium' ? 'bg-warning text-dark' : 'bg-secondary text-white';

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
                    <td>${reason}</td>
                    <td><span class="badge ${riskClass} rounded-pill px-3 py-1 fs-8">${risk}</span></td>
                    <td><span class="status-chip blacklisted">Banned</span></td>
                `;
                tbody.appendChild(tr);
            });

            initPremiumDataTable('#security-blacklist-table');
        });
    </script>
</asp:Content>
