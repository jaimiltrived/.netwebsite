<%@ Page Title="Employee Hosts Database" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="main.site.AdminEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">Host Employees Directory</h5>
                    <p class="text-color-secondary fs-7 mb-0">Manage registered hosts who can verify and invite visitors.</p>
                </div>
                <button type="button" class="btn btn-premium btn-premium-primary fs-7" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                    <i class="bi bi-plus-lg"></i> Register Employee
                </button>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="employees-table">
                    <thead>
                        <tr>
                            <th>Employee ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="employees-tbody">
                        <!-- Loaded dynamically via admin.js from localStorage -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Employee Modal -->
    <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold">Add Host Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-employee-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="empName">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="empName" placeholder="Dr. Sunita Rao" required minlength="2">
                            <div class="invalid-feedback">Please enter employee's full name (at least 2 letters).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="empEmail">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control form-control-premium" id="empEmail" placeholder="sunita.rao@college.edu" required>
                            <div class="invalid-feedback">Please enter a valid corporate email.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="empDept">Department <span class="text-danger">*</span></label>
                            <select class="form-select form-control-premium" id="empDept" required>
                                <option value="">Select Department...</option>
                                <option>Information Technology</option>
                                <option>Human Resources</option>
                                <option>Finance & Commerce</option>
                                <option>Academics & Research</option>
                                <option>Administration</option>
                            </select>
                            <div class="invalid-feedback">Please select a department.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="empStatus">Status</label>
                            <select class="form-select form-control-premium" id="empStatus">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary">Register Employee</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Employee Modal -->
    <div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Host Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-employee-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="editEmpId">Employee ID</label>
                            <input type="text" class="form-control form-control-premium bg-light" id="editEmpId" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editEmpName">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editEmpName" required minlength="2">
                            <div class="invalid-feedback">Please enter employee's full name.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editEmpEmail">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control form-control-premium" id="editEmpEmail" required>
                            <div class="invalid-feedback">Please enter a valid email address.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editEmpDept">Department <span class="text-danger">*</span></label>
                            <select class="form-select form-control-premium" id="editEmpDept" required>
                                <option value="">Select Department...</option>
                                <option>Information Technology</option>
                                <option>Human Resources</option>
                                <option>Finance & Commerce</option>
                                <option>Academics & Research</option>
                                <option>Administration</option>
                            </select>
                            <div class="invalid-feedback">Please select a department.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editEmpStatus">Account Status</label>
                            <select class="form-select form-control-premium" id="editEmpStatus">
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
