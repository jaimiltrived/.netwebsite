<%@ Page Title="Reports & Analytics" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="main.site.AdminReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <!-- Filters Card -->
                <div class="card-premium mb-4" data-aos="fade-up">
                    <h5 class="text-bold mb-3">Report Filtering</h5>
                    <form id="report-filter-form" class="row g-3 needs-validation" novalidate>
                        <div class="col-md-3">
                            <label class="form-label-premium" for="repRange">Date Range</label>
                            <select class="form-select form-control-premium text-color-secondary fs-7" id="repRange">
                                <option>Today</option>
                                <option selected>This Week</option>
                                <option>This Month</option>
                                <option>Last 6 Months</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label-premium" for="repDept">Department</label>
                            <select class="form-select form-control-premium text-color-secondary fs-7" id="repDept">
                                <option>All Departments</option>
                                <option>Information Technology</option>
                                <option>Human Resources</option>
                                <option>Administration</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label-premium" for="repGate">Gate Entrance</label>
                            <select class="form-select form-control-premium text-color-secondary fs-7" id="repGate">
                                <option>All Gates</option>
                                <option>Main Gate A</option>
                                <option>North Gate B</option>
                                <option>VIP Gate C</option>
                            </select>
                        </div>
                        <div class="col-md-3 d-flex align-items-end">
                            <button type="submit" class="btn btn-premium btn-premium-primary w-100 py-2"><i class="bi bi-funnel-fill"></i> Filter Reports</button>
                        </div>
                    </form>
                </div>

                <!-- Graphs Grid -->
                <div class="row g-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="col-md-6">
                        <div class="card-premium">
                            <h5 class="text-bold mb-3">Hourly Load Breakdown</h5>
                            <div style="height: 250px;">
                                <canvas id="hourlyVisitorsChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card-premium">
                            <h5 class="text-bold mb-3">Gate Access Flows</h5>
                            <div style="height: 250px;">
                                <canvas id="securityTrafficChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-4" data-aos="fade-up" data-aos-delay="150">
                    <div class="col-md-6">
                        <div class="card-premium">
                            <h5 class="text-bold mb-3 text-color-primary">Monthly Traffic Volume</h5>
                            <div style="height: 250px;">
                                <canvas id="visitorTrendChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card-premium">
                            <h5 class="text-bold mb-3 text-color-primary">Visitor Ratios</h5>
                            <div style="height: 250px;">
                                <canvas id="receptionStatusChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.getElementById('report-filter-form').addEventListener('submit', (e) => {
            e.preventDefault();
            showSuccessToast('Reports filters applied. Graph updated.');
        });
    </script>
</asp:Content>
