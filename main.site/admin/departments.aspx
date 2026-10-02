<%@ Page Title="Enterprise Departments" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="departments.aspx.cs" Inherits="main.site.AdminDepartments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">Company / Campus Departments</h5>
                    <p class="text-color-secondary fs-7 mb-0">List and organize structural departments inside the enterprise.</p>
                </div>
                <button type="button" class="btn btn-premium btn-premium-primary fs-7" data-bs-toggle="modal" data-bs-target="#addDeptModal">
                    <i class="bi bi-plus-lg"></i> Add Department
                </button>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="departments-table">
                    <thead>
                        <tr>
                            <th>Department Code</th>
                            <th>Department Name</th>
                            <th>Active Hosts Count</th>
                            <th>Building Location</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="departments-tbody">
                        <!-- Loaded dynamically via admin.js from localStorage -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Dept Modal -->
    <div class="modal fade" id="addDeptModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold">Add Department</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-dept-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="deptName">Department Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="deptName" placeholder="e.g. Department of Biotechnology" required minlength="2">
                            <div class="invalid-feedback">Please enter department name (at least 2 letters).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="deptBld">Assigned Building <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="deptBld" placeholder="e.g. Science Block C" required>
                            <div class="invalid-feedback">Please specify assigned building.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="deptHosts">Expected Host Employees</label>
                            <input type="number" class="form-control form-control-premium" id="deptHosts" value="0" min="0" max="500">
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="deptStatus">Department Status</label>
                            <select class="form-select form-control-premium" id="deptStatus">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary">Add Department</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Dept Modal -->
    <div class="modal fade" id="editDeptModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Department</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-dept-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="editDeptCode">Department Code</label>
                            <input type="text" class="form-control form-control-premium bg-light" id="editDeptCode" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editDeptName">Department Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editDeptName" required minlength="2">
                            <div class="invalid-feedback">Please enter department name.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editDeptBld">Assigned Building <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editDeptBld" required>
                            <div class="invalid-feedback">Please enter assigned building.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editDeptHosts">Active Host Employees Count</label>
                            <input type="number" class="form-control form-control-premium" id="editDeptHosts" min="0" max="500">
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editDeptStatus">Status</label>
                            <select class="form-select form-control-premium" id="editDeptStatus">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
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
