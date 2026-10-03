<%@ Page Title="Enterprise Buildings" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="buildings.aspx.cs" Inherits="main.site.AdminBuildings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">Campus Buildings Directory</h5>
                    <p class="text-color-secondary fs-7 mb-0">Track and manage physical campus building infrastructures.</p>
                </div>
                <button type="button" class="btn btn-premium btn-premium-primary fs-7" data-bs-toggle="modal" data-bs-target="#addBuildingModal">
                    <i class="bi bi-plus-lg"></i> Register Building
                </button>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="buildings-table">
                    <thead>
                        <tr>
                            <th>Building Code</th>
                            <th>Building Name</th>
                            <th>Departments In-Block</th>
                            <th>Total Access Gates</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="buildings-tbody">
                        <!-- Loaded dynamically via admin.js from localStorage -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Building Modal -->
    <div class="modal fade" id="addBuildingModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold">Register Campus Building</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-building-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="bldCode">Building Code <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="bldCode" placeholder="e.g. BLDG-04" required>
                            <div class="invalid-feedback">Building code is required (e.g. BLDG-04).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="bldName">Building Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="bldName" placeholder="e.g. Innovation Center D" required minlength="2">
                            <div class="invalid-feedback">Please enter building name (at least 2 letters).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="bldDepts">Departments In-Block <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="bldDepts" placeholder="e.g. AI Labs, Robotics" required>
                            <div class="invalid-feedback">Please specify departments located in this building.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="bldGates">Access Gates Count <span class="text-danger">*</span></label>
                            <input type="number" class="form-control form-control-premium" id="bldGates" value="2" min="1" max="20" required>
                            <div class="invalid-feedback">Please enter valid gates count (1-20).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="bldStatus">Building Status</label>
                            <select class="form-select form-control-premium" id="bldStatus">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary">Register Building</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Building Modal -->
    <div class="modal fade" id="editBuildingModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Campus Building</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-building-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBldCode">Building Code</label>
                            <input type="text" class="form-control form-control-premium bg-light" id="editBldCode" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBldName">Building Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editBldName" required minlength="2">
                            <div class="invalid-feedback">Please enter building name.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBldDepts">Departments In-Block <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editBldDepts" required>
                            <div class="invalid-feedback">Please specify departments in this building.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBldGates">Access Gates Count <span class="text-danger">*</span></label>
                            <input type="number" class="form-control form-control-premium" id="editBldGates" min="1" max="20" required>
                            <div class="invalid-feedback">Gates count must be between 1 and 20.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBldStatus">Status</label>
                            <select class="form-select form-control-premium" id="editBldStatus">
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
