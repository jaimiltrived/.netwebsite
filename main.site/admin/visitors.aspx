<%@ Page Title="Visitor Directory" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="visitors.aspx.cs" Inherits="main.site.AdminVisitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">All Registered Visitors</h5>
                    <p class="text-color-secondary fs-7 mb-0">Search and manage all pre-registered and walk-in system visitor requests.</p>
                </div>
                <div class="d-flex gap-2 w-100 w-md-auto">
                    <!-- Filter Select -->
                    <select class="form-select form-control-premium text-color-secondary fs-7" id="status-filter" style="width: 160px;">
                        <option value="">All Statuses</option>
                        <option value="Approved">Approved</option>
                        <option value="Pending">Pending</option>
                        <option value="Rejected">Rejected</option>
                        <option value="Inside">Inside</option>
                        <option value="Exited">Exited</option>
                    </select>
                    <button type="button" class="btn btn-premium btn-premium-primary fs-7 text-nowrap" data-bs-toggle="modal" data-bs-target="#addVisitorModal">
                        <i class="bi bi-plus-lg me-1"></i> Register Visitor Pass
                    </button>
                </div>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="visitors-directory-table">
                    <thead>
                        <tr>
                            <th>Visitor Details</th>
                            <th>Company</th>
                            <th>Host Employee</th>
                            <th>Schedule Date</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="visitors-directory-tbody">
                        <!-- Dynamic injection from localStorage via admin.js -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Visitor Modal -->
    <div class="modal fade" id="addVisitorModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-person-plus-fill text-primary me-2"></i>Register New Visitor Pass</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-visitor-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisName">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisName" placeholder="e.g. Rahul Sharma" required minlength="2">
                                <div class="invalid-feedback">Please enter visitor's full name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisEmail">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control form-control-premium" id="addVisEmail" placeholder="e.g. rahul@example.com" required>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisPhone">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control form-control-premium" id="addVisPhone" placeholder="+91 98765 01880" required>
                                <div class="invalid-feedback">Please enter a valid phone number.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisCompany">Company / Organization <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisCompany" placeholder="e.g. Infosys Ltd." required>
                                <div class="invalid-feedback">Company name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisHost">Host Employee <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="addVisHost" required>
                                    <option value="Dr. Priya Sharma">Dr. Priya Sharma (IT)</option>
                                    <option value="Arjun Mehta">Arjun Mehta (HR)</option>
                                    <option value="Prof. Anand Kulkarni">Prof. Anand Kulkarni (Academics)</option>
                                    <option value="Capt. Devendra Rathore">Capt. Devendra Rathore (Admin)</option>
                                    <option value="Siddharth Malhotra">Siddharth Malhotra (Engineering)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisDept">Department <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="addVisDept" required>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Human Resources">Human Resources</option>
                                    <option value="Administration">Administration</option>
                                    <option value="Academics">Academics</option>
                                    <option value="Engineering">Engineering</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-premium" for="addVisDate">Schedule Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control form-control-premium" id="addVisDate" required>
                                <div class="invalid-feedback">Please choose schedule date.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-premium" for="addVisTime">Schedule Time <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisTime" placeholder="10:00 AM" required>
                                <div class="invalid-feedback">Please specify schedule time.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-premium" for="addVisStatus">Pass Status <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="addVisStatus" required>
                                    <option value="Approved" selected>Approved</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Inside">Inside</option>
                                    <option value="Exited">Exited</option>
                                    <option value="Rejected">Rejected</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <label class="form-label-premium" for="addVisPurpose">Purpose of Visit <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisPurpose" placeholder="e.g. Official Meeting" required>
                                <div class="invalid-feedback">Please specify purpose of visit.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-plus-circle me-1"></i>Register Visitor</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Visitor Modal -->
    <div class="modal fade" id="editVisitorModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Visitor Record</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-visitor-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisId">Pass ID</label>
                                <input type="text" class="form-control form-control-premium bg-light" id="editVisId" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisStatus">Pass Status <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="editVisStatus" required>
                                    <option value="Approved">Approved</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Rejected">Rejected</option>
                                    <option value="Inside">Inside</option>
                                    <option value="Exited">Exited</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisName">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="editVisName" required minlength="2">
                                <div class="invalid-feedback">Please enter visitor's full name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisEmail">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control form-control-premium" id="editVisEmail" required>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisPhone">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control form-control-premium" id="editVisPhone" required>
                                <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisCompany">Company / Organization <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="editVisCompany" required>
                                <div class="invalid-feedback">Please enter company or organization name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisHost">Host Employee <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="editVisHost" required>
                                    <option>Dr. Priya Sharma</option>
                                    <option>Arjun Mehta</option>
                                    <option>Prof. Anand Kulkarni</option>
                                    <option>Capt. Devendra Rathore</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisDept">Department <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="editVisDept" required>
                                    <option>Information Technology</option>
                                    <option>Human Resources</option>
                                    <option>Administration</option>
                                    <option>Academics & Research</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisDate">Schedule Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control form-control-premium" id="editVisDate" required>
                                <div class="invalid-feedback">Please choose schedule date.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisTime">Schedule Time <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="editVisTime" placeholder="e.g. 10:30 AM" required>
                                <div class="invalid-feedback">Please specify schedule time.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-save me-1"></i>Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
