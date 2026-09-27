<%@ Page Title="Visitor Search" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="visitor-search.aspx.cs" Inherits="main.site.SecurityVisitorSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium" data-aos="fade-up">
                    <div class="mb-4">
                        <h5 class="text-bold mb-1">Gate Visitor Directory</h5>
                        <p class="text-color-secondary fs-7 mb-0">Lookup pre-approved visitors by Pass ID, name, phone, or host employee.</p>
                    </div>

                    <div class="table-responsive border-0">
                        <table class="table table-premium text-nowrap align-middle" id="security-search-table">
                            <thead>
                                <tr>
                                    <th>Visitor Details</th>
                                    <th>Company</th>
                                    <th>Host Employee</th>
                                    <th>Scheduled Date</th>
                                    <th>Status</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="security-search-tbody">
                                <!-- Dynamic loading -->
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
            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const tbody = document.getElementById('security-search-tbody');
            tbody.innerHTML = '';

            visitors.forEach(v => {
                let actionsHtml = `<div class="text-end">`;
                
                if (v.status === 'Approved') {
                    actionsHtml += `<a href="entry-verification.aspx?visitorId=${v.id}" class="btn btn-sm btn-premium btn-premium-primary me-1"><i class="bi bi-box-arrow-in-right"></i> Verify Entry</a>`;
                } else if (v.status === 'Inside') {
                    actionsHtml += `<a href="exit-verification.aspx?visitorId=${v.id}" class="btn btn-sm btn-premium btn-premium-secondary me-1"><i class="bi bi-box-arrow-left"></i> Verify Exit</a>`;
                } else {
                    actionsHtml += `<button class="btn btn-sm btn-outline-light text-dark btn-premium-outline me-1" disabled><i class="bi bi-lock-fill"></i> Locked</button>`;
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
                    <td><span class="status-chip ${v.status.toLowerCase()}">${v.status}</span></td>
                    <td>${actionsHtml}</td>
                `;
                tbody.appendChild(tr);
            });

            initPremiumDataTable('#security-search-table');
        });
    </script>
</asp:Content>
