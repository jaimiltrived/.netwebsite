<%@ Page Title="Pre-Register Visitor" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="register-visitor.aspx.cs" Inherits="main.site.ReceptionistRegisterVisitor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium wizard-form-container" style="max-width: 800px; margin: 0 auto;" data-aos="fade-up">
                    <!-- Progress Steps Header -->
                    <ul class="wizard-steps mb-5">
                        <li class="wizard-step active">
                            <div class="step-number">1</div>
                            <span class="step-label">Visitor Info</span>
                        </li>
                        <li class="wizard-step">
                            <div class="step-number">2</div>
                            <span class="step-label">Visit Details</span>
                        </li>
                        <li class="wizard-step">
                            <div class="step-number">3</div>
                            <span class="step-label">Face Photo</span>
                        </li>
                        <li class="wizard-step">
                            <div class="step-number">4</div>
                            <span class="step-label">ID Proof</span>
                        </li>
                        <li class="wizard-step">
                            <div class="step-number">5</div>
                            <span class="step-label">Review</span>
                        </li>
                    </ul>

                    <!-- Wizard Form -->
                    <form id="receptionist-wizard-form" class="needs-validation" novalidate>
                        
                        <!-- Step 1: Visitor Information -->
                        <div class="wizard-step-content">
                            <h5 class="text-bold text-color-primary mb-4">Step 1: Visitor Contact Information</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vName">Full Name<span class="required-indicator">*</span></label>
                                    <input type="text" class="form-control form-control-premium" id="vName" placeholder="Rahul Sharma" required minlength="2">
                                    <div class="invalid-feedback">Please enter visitor's full name (at least 2 letters).</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vEmail">Email Address<span class="required-indicator">*</span></label>
                                    <input type="email" class="form-control form-control-premium" id="vEmail" placeholder="rahul.sharma@tcs.com" required>
                                    <div class="invalid-feedback">Please enter a valid email address.</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vPhone">Mobile Phone<span class="required-indicator">*</span></label>
                                    <input type="tel" class="form-control form-control-premium" id="vPhone" placeholder="+91 98765 01880" required>
                                    <div class="invalid-feedback">Please enter a valid phone number (at least 10 digits).</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vCompany">Company Name<span class="required-indicator">*</span></label>
                                    <input type="text" class="form-control form-control-premium" id="vCompany" placeholder="Tata Consultancy Services" required>
                                    <div class="invalid-feedback">Company name is required.</div>
                                </div>
                            </div>
                            <div class="text-end mt-4 pt-4 border-top">
                                <button type="button" class="btn btn-premium btn-premium-primary btn-next-step">Next Step <i class="bi bi-arrow-right"></i></button>
                            </div>
                        </div>

                        <!-- Step 2: Visit Details -->
                        <div class="wizard-step-content" style="display: none;">
                            <h5 class="text-bold text-color-primary mb-4">Step 2: Meeting & Schedule Details</h5>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vHost">Host Employee<span class="required-indicator">*</span></label>
                                    <select class="form-select form-control-premium text-color-primary" id="vHost" required>
                                        <option value="">Choose Employee Host...</option>
                                        <option>Dr. Priya Sharma</option>
                                        <option>Arjun Mehta</option>
                                        <option>Prof. Anand Kulkarni</option>
                                        <option>Capt. Devendra Rathore</option>
                                    </select>
                                    <div class="invalid-feedback">Please select an employee host.</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vDept">Department<span class="required-indicator">*</span></label>
                                    <select class="form-select form-control-premium text-color-primary" id="vDept" required>
                                        <option value="">Select Department...</option>
                                        <option>Information Technology</option>
                                        <option>Human Resources</option>
                                        <option>Administration</option>
                                        <option>Academics & Research</option>
                                    </select>
                                    <div class="invalid-feedback">Please select a department.</div>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label-premium" for="vPurpose">Purpose of Visit<span class="required-indicator">*</span></label>
                                    <input type="text" class="form-control form-control-premium" id="vPurpose" placeholder="Technical review / Client meeting" required minlength="3">
                                    <div class="invalid-feedback">Please enter purpose of visit.</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vDate">Scheduled Date<span class="required-indicator">*</span></label>
                                    <input type="text" class="form-control form-control-premium datepicker-premium" id="vDate" placeholder="YYYY-MM-DD" required>
                                    <div class="invalid-feedback">Please select a visit date.</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label-premium" for="vTime">Expected Time Slot<span class="required-indicator">*</span></label>
                                    <input type="text" class="form-control form-control-premium timepicker-premium" id="vTime" placeholder="HH:MM" required>
                                    <div class="invalid-feedback">Please select a visit time.</div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between mt-4 pt-4 border-top">
                                <button type="button" class="btn btn-premium btn-premium-outline btn-prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                                <button type="button" class="btn btn-premium btn-premium-primary btn-next-step">Next Step <i class="bi bi-arrow-right"></i></button>
                            </div>
                        </div>

                        <!-- Step 3: Photo Capture -->
                        <div class="wizard-step-content" style="display: none;">
                            <h5 class="text-bold text-color-primary mb-4">Step 3: Capture Visitor Face Photo</h5>
                            <p class="text-color-secondary fs-7">Drag & drop or upload a face photograph of the visitor for identity verification at gates.</p>
                            
                            <div class="upload-dropzone my-4" data-preview="avatar-preview-container">
                                <i class="bi bi-camera-fill upload-icon"></i>
                                <h6 class="text-bold">Drag and drop face photograph here</h6>
                                <p class="text-color-muted fs-8 mb-0">Supports JPG, PNG formats up to 2MB</p>
                                <input type="file" class="upload-file-input" id="vPhotoFile" accept="image/*">
                            </div>

                            <!-- Preview Panel -->
                            <div class="upload-preview-container text-center p-3" id="avatar-preview-container" style="display: none;">
                                <img id="avatar-preview-img" src="" class="upload-preview-image rounded-circle shadow border border-3 border-white" style="width: 150px; height: 150px; object-fit: cover;">
                                <button type="button" class="remove-upload-btn"><i class="bi bi-trash"></i></button>
                            </div>

                            <div class="d-flex justify-content-between mt-4 pt-4 border-top">
                                <button type="button" class="btn btn-premium btn-premium-outline btn-prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                                <button type="button" class="btn btn-premium btn-premium-primary btn-next-step">Next Step <i class="bi bi-arrow-right"></i></button>
                            </div>
                        </div>

                        <!-- Step 4: ID Proof -->
                        <div class="wizard-step-content" style="display: none;">
                            <h5 class="text-bold text-color-primary mb-4">Step 4: Upload Government ID Proof</h5>
                            <p class="text-color-secondary fs-7">Provide scanned copy of driver license, passport, or company badge.</p>
                            
                            <div class="upload-dropzone my-4" data-preview="id-preview-container">
                                <i class="bi bi-file-earmark-pdf-fill upload-icon"></i>
                                <h6 class="text-bold">Drag and drop scanned ID document here</h6>
                                <p class="text-color-muted fs-8 mb-0">Supports PDF, PNG, JPG up to 5MB</p>
                                <input type="file" class="upload-file-input" id="vIdFile" accept="image/*,application/pdf">
                            </div>

                            <!-- Preview Panel -->
                            <div class="upload-preview-container p-2 text-center" id="id-preview-container" style="display: none;">
                                <img id="id-preview-img" src="" class="upload-preview-image rounded border shadow" style="max-height: 180px;">
                                <button type="button" class="remove-upload-btn"><i class="bi bi-trash"></i></button>
                            </div>

                            <div class="d-flex justify-content-between mt-4 pt-4 border-top">
                                <button type="button" class="btn btn-premium btn-premium-outline btn-prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                                <button type="button" class="btn btn-premium btn-premium-primary btn-next-step">Next Step <i class="bi bi-arrow-right"></i></button>
                            </div>
                        </div>

                        <!-- Step 5: Review & Submit -->
                        <div class="wizard-step-content" style="display: none;">
                            <h5 class="text-bold text-color-primary mb-4">Step 5: Review Visit Registration File</h5>
                            
                            <div class="p-4 border rounded-card bg-light bg-opacity-10 mb-4" id="wizard-summary-target">
                                <!-- Filled by JS -->
                            </div>

                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="consentCheck" required>
                                <label class="form-check-label fs-7 text-color-secondary" for="consentCheck">
                                    I certify that the visitor identity proof has been physically verified.
                                </label>
                            </div>

                            <div class="d-flex justify-content-between mt-4 pt-4 border-top">
                                <button type="button" class="btn btn-premium btn-premium-outline btn-prev-step"><i class="bi bi-arrow-left"></i> Previous</button>
                                <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-check-circle-fill"></i> Submit Registration</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="../assets/js/forms.js"></script>
</asp:Content>
