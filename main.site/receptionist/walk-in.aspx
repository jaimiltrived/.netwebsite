<%@ Page Title="Walk-In Visitor Registration" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="walk-in.aspx.cs" Inherits="main.site.ReceptionistWalkIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium mb-4" style="max-width: 800px; margin: 0 auto;" data-aos="fade-up">
                    <div class="mb-4">
                        <h5 class="text-bold mb-1 text-color-primary">Immediate Walk-In Check-In</h5>
                        <p class="text-color-secondary fs-7 mb-0">Register a visitor who arrived at the reception desk without a pre-booking.</p>
                    </div>

                    <form id="receptionist-walkin-form" class="needs-validation" novalidate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="walkName">Full Name<span class="required-indicator">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="walkName" placeholder="Devendra Patel" required minlength="2">
                                <div class="invalid-feedback">Please enter visitor's full name (at least 2 letters).</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="walkPhone">Phone Number<span class="required-indicator">*</span></label>
                                <input type="tel" class="form-control form-control-premium" id="walkPhone" placeholder="+91 98765 01220" required>
                                <div class="invalid-feedback">Please enter a valid phone number (at least 10 digits).</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="walkCompany">Visitor Company<span class="required-indicator">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="walkCompany" placeholder="Tech Mahindra Ltd." required>
                                <div class="invalid-feedback">Company name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="walkHost">Host Employee<span class="required-indicator">*</span></label>
                                <select class="form-select form-control-premium text-color-primary" id="walkHost" required>
                                    <option value="">Select Host...</option>
                                    <option>Dr. Priya Sharma</option>
                                    <option>Arjun Mehta</option>
                                    <option>Prof. Anand Kulkarni</option>
                                    <option>Capt. Devendra Rathore</option>
                                </select>
                                <div class="invalid-feedback">Please select an employee host.</div>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label-premium" for="walkPurpose">Purpose of Visit<span class="required-indicator">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="walkPurpose" placeholder="VIP Event Interaction" required minlength="3">
                                <div class="invalid-feedback">Purpose of visit is required.</div>
                            </div>

                            <!-- Upload grids -->
                            <div class="col-md-6">
                                <label class="form-label-premium">Visitor Photo</label>
                                <div class="upload-dropzone p-3" data-preview="walk-avatar-preview-container">
                                    <i class="bi bi-camera-fill upload-icon fs-2"></i>
                                    <div class="fs-8 text-bold">Drop Face Photograph</div>
                                    <input type="file" class="upload-file-input" accept="image/*">
                                </div>
                                <div class="upload-preview-container text-center p-3" id="walk-avatar-preview-container" style="display: none;">
                                    <img id="walk-avatar-preview-img" class="upload-preview-image rounded-circle shadow border" style="width: 100px; height: 100px; object-fit: cover;">
                                    <button type="button" class="remove-upload-btn"><i class="bi bi-trash"></i></button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium">ID Document Proof</label>
                                <div class="upload-dropzone p-3" data-preview="walk-id-preview-container">
                                    <i class="bi bi-file-earmark-medical-fill upload-icon fs-2"></i>
                                    <div class="fs-8 text-bold">Drop Scanned ID proof</div>
                                    <input type="file" class="upload-file-input" accept="image/*,application/pdf">
                                </div>
                                <div class="upload-preview-container text-center p-2" id="walk-id-preview-container" style="display: none;">
                                    <img id="walk-id-preview-img" class="upload-preview-image rounded border shadow" style="max-height: 100px;">
                                    <button type="button" class="remove-upload-btn"><i class="bi bi-trash"></i></button>
                                </div>
                            </div>
                        </div>

                        <div class="text-end border-top pt-4 mt-4">
                            <button type="button" onclick="location.href='dashboard.aspx'" class="btn btn-premium btn-premium-outline me-2">Cancel</button>
                            <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-check-circle-fill"></i> Register & Approve Entry</button>
                        </div>
                    </form>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script src="../assets/js/forms.js"></script>
</asp:Content>
