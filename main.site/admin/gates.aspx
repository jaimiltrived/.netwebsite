<%@ Page Title="Gate Checkpoints" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="gates.aspx.cs" Inherits="main.site.AdminGates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">Gate Checkpoints Directory</h5>
                    <p class="text-color-secondary fs-7 mb-0">Monitor active physical entry/exit gate endpoints across campus borders.</p>
                </div>
                <button type="button" class="btn btn-premium btn-premium-primary fs-7" data-bs-toggle="modal" data-bs-target="#addGateModal">
                    <i class="bi bi-plus-lg"></i> Register Gate
                </button>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="gates-table">
                    <thead>
                        <tr>
                            <th>Gate Code</th>
                            <th>Gate Name</th>
                            <th>Assigned Building</th>
                            <th>Authorized Roles</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="gates-tbody">
                        <!-- Loaded dynamically via admin.js from localStorage -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Gate Modal -->
    <div class="modal fade" id="addGateModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold" id="addGateModalLabel">Register Gate Access Point</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-gate-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="gateCode">Gate Identifier Code <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="gateCode" placeholder="e.g. GATE-104" required>
                            <div class="invalid-feedback">Please enter gate code (e.g. GATE-104).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="gateName">Gate Identifier / Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="gateName" placeholder="e.g. East Entrance Gate 4" required minlength="2">
                            <div class="invalid-feedback">Please enter a gate identifier or name.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="gateBuilding">Location Area / Building <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="gateBuilding" placeholder="e.g. Sports Complex Boundary" required>
                            <div class="invalid-feedback">Please specify location area or building.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="gateRoles">Authorized Roles</label>
                            <select class="form-select form-control-premium" id="gateRoles">
                                <option value="All Roles">All Roles</option>
                                <option value="Staff & Visitors">Staff & Visitors</option>
                                <option value="VIP & Dignitaries">VIP & Dignitaries</option>
                                <option value="Staff Only">Staff Only</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="gateStatus">Gate Status</label>
                            <select class="form-select form-control-premium" id="gateStatus">
                                <option value="Online">Online</option>
                                <option value="Offline">Offline</option>
                                <option value="Maintenance">Maintenance</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary">Register Gate</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Gate Modal -->
    <div class="modal fade" id="editGateModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Gate Access Point</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-gate-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="editGateCode">Gate Code</label>
                            <input type="text" class="form-control form-control-premium bg-light" id="editGateCode" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editGateName">Gate Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editGateName" required minlength="2">
                            <div class="invalid-feedback">Please enter gate name.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editGateBuilding">Location Area / Building <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-premium" id="editGateBuilding" required>
                            <div class="invalid-feedback">Please specify location area or building.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editGateRoles">Authorized Roles</label>
                            <select class="form-select form-control-premium" id="editGateRoles">
                                <option value="All Roles">All Roles</option>
                                <option value="Staff & Visitors">Staff & Visitors</option>
                                <option value="VIP & Dignitaries">VIP & Dignitaries</option>
                                <option value="Staff Only">Staff Only</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editGateStatus">Status</label>
                            <select class="form-select form-control-premium" id="editGateStatus">
                                <option value="Online">Online</option>
                                <option value="Offline">Offline</option>
                                <option value="Maintenance">Maintenance</option>
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
