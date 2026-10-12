<%@ Page Title="Register Visit" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="main.site.VisitorRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content Form -->
    <main class="flex-grow-1 py-5">
        <div class="container px-4" data-aos="fade-up">
            <div class="bg-card-theme mx-auto p-4 p-md-5 rounded-4 shadow-sm" style="max-width: 800px;">
                
                <!-- Stepper Progress -->
                <div class="wizard-steps-container mb-5">
                    <ul class="wizard-steps">
                        <li class="wizard-step active" id="step-badge-1">
                            <div class="wizard-step-badge">1</div>
                            <span class="wizard-step-title d-none d-md-block">Your Info</span>
                        </li>
                        <li class="wizard-step" id="step-badge-2">
                            <div class="wizard-step-badge">2</div>
                            <span class="wizard-step-title d-none d-md-block">Visit Info</span>
                        </li>
                        <li class="wizard-step" id="step-badge-3">
                            <div class="wizard-step-badge">3</div>
                            <span class="wizard-step-title d-none d-md-block">Identity ID</span>
                        </li>
                        <li class="wizard-step" id="step-badge-4">
                            <div class="wizard-step-badge">4</div>
                            <span class="wizard-step-title d-none d-md-block">Photo</span>
                        </li>
                        <li class="wizard-step" id="step-badge-5">
                            <div class="wizard-step-badge">5</div>
                            <span class="wizard-step-title d-none d-md-block">Review</span>
                        </li>
                    </ul>
                </div>

                <!-- Wizard Multi-Step Form -->
                <form id="multi-step-form" class="needs-validation" novalidate>
                    
                    <!-- STEP 1: Your Information -->
                    <div class="step-section" id="step-1">
                        <h4 class="text-bold text-color-primary mb-3">Your Information</h4>
                        <p class="text-color-secondary fs-7 mb-4">Please input your contact credentials and organization names.</p>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wName">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="wName" placeholder="Siddharth Malhotra" required minlength="2">
                                <div class="invalid-feedback">Please enter your full name (at least 2 letters).</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wEmail">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control form-control-premium" id="wEmail" placeholder="siddharth.m@infosys.com" required>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wPhone">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control form-control-premium" id="wPhone" placeholder="+91 98765 01440" required>
                                <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wCompany">Company / Organization <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="wCompany" placeholder="Infosys Ltd." required>
                                <div class="invalid-feedback">Please enter your company name.</div>
                            </div>
                        </div>
                    </div>

                    <!-- STEP 2: Visit Information -->
                    <div class="step-section d-none" id="step-2">
                        <h4 class="text-bold text-color-primary mb-3">Visit Information</h4>
                        <p class="text-color-secondary fs-7 mb-4">Select the host employee and scheduled time slot.</p>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wHost">Host Employee Name <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium text-color-primary" id="wHost" required>
                                    <option value="">Choose Employee Host...</option>
                                    <option>Dr. Priya Sharma</option>
                                    <option>Arjun Mehta</option>
                                    <option>Prof. Anand Kulkarni</option>
                                    <option>Capt. Devendra Rathore</option>
                                </select>
                                <div class="invalid-feedback">Please select a host employee.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wDept">Department <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium text-color-primary" id="wDept" required>
                                    <option value="">Select Department...</option>
                                    <option>Information Technology</option>
                                    <option>Human Resources</option>
                                    <option>Administration</option>
                                    <option>Academics & Research</option>
                                </select>
                                <div class="invalid-feedback">Please select a department.</div>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label-premium" for="wPurpose">Purpose of Visit <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="wPurpose" placeholder="Official briefing / Collaboration meeting" required>
                                <div class="invalid-feedback">Please enter the purpose of your visit.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wDate">Visit Date <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="wDate" placeholder="Select Date" required>
                                <div class="invalid-feedback">Please select a visit date.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="wTime">Visit Time <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="wTime" placeholder="Select Time" required>
                                <div class="invalid-feedback">Please select a visit time.</div>
                            </div>
                        </div>
                    </div>

                    <!-- STEP 3: Identity Upload -->
                    <div class="step-section d-none" id="step-3">
                        <h4 class="text-bold text-color-primary mb-3">Identity Verification</h4>
                        <p class="text-color-secondary fs-7 mb-4">Please upload a copy of your driver's license or government ID card.</p>
                        
                        <div class="drag-drop-zone p-5 mb-3" id="id-drop-zone">
                            <i class="bi bi-cloud-upload fs-1 text-primary mb-3"></i>
                            <h6 class="text-bold text-color-primary">Drag & Drop your Government ID here</h6>
                            <p class="text-color-muted fs-8">Supports PNG, JPG, or PDF (Max 5MB)</p>
                            <input type="file" id="id-file-input" class="d-none" accept="image/*,application/pdf">
                            <button type="button" class="btn btn-outline-primary btn-sm mt-2" onclick="document.getElementById('id-file-input').click()">Browse Files</button>
                        </div>
                        
                        <div id="id-preview-container" class="text-center d-none">
                            <h6 class="text-bold text-color-primary fs-7 mb-2"><i class="bi bi-file-image text-success"></i> ID Proof Attachment Preview</h6>
                            <img src="" id="id-preview-img" class="preview-thumbnail img-fluid border" alt="Identity Card Preview">
                        </div>
                    </div>

                    <!-- STEP 4: Photo Capture -->
                    <div class="step-section d-none" id="step-4">
                        <h4 class="text-bold text-color-primary mb-3">Selfie Photo</h4>
                        <p class="text-color-secondary fs-7 mb-4">Provide a headshot for security badge printing.</p>
                        
                        <div class="row g-4 align-items-center">
                            <div class="col-md-6">
                                <div class="drag-drop-zone p-4 text-center" id="photo-drop-zone">
                                    <i class="bi bi-camera fs-2 text-primary mb-2"></i>
                                    <h6 class="text-bold text-color-primary fs-7">Upload Photo Headshot</h6>
                                    <input type="file" id="photo-file-input" class="d-none" accept="image/*">
                                    <button type="button" class="btn btn-outline-primary btn-sm mt-2" onclick="document.getElementById('photo-file-input').click()">Choose File</button>
                                </div>
                                <div class="text-center my-3">
                                    <span class="text-color-muted fs-8">OR</span>
                                </div>
                                <button type="button" class="btn btn-outline-secondary w-100 py-2 fs-7" id="btn-webcam-capture"><i class="bi bi-webcam"></i> Capture from Camera</button>
                            </div>
                            
                            <div class="col-md-6 text-center">
                                <div id="photo-preview-container" class="d-flex flex-column align-items-center">
                                    <h6 class="text-bold text-color-primary fs-7 mb-2">Selfie Preview</h6>
                                    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" id="photo-preview-img" class="rounded-circle border shadow-sm" style="width: 120px; height: 120px; object-fit: cover;" alt="Selfie Preview">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- STEP 5: Review -->
                    <div class="step-section d-none" id="step-5">
                        <h4 class="text-bold text-color-primary mb-3">Review Registration Request</h4>
                        <p class="text-color-secondary fs-7 mb-4">Please verify all input values before submitting the gate-pass file.</p>
                        
                        <div class="bg-light bg-opacity-25 p-4 rounded-3 border mb-4">
                            <div class="row g-3 fs-7">
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Visitor Name</span>
                                    <p class="text-bold text-color-primary mb-0" id="revName">-</p>
                                </div>
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Email Address</span>
                                    <p class="text-bold text-color-primary mb-0" id="revEmail">-</p>
                                </div>
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Phone Number</span>
                                    <p class="text-bold text-color-primary mb-0" id="revPhone">-</p>
                                </div>
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Organization</span>
                                    <p class="text-bold text-color-primary mb-0" id="revCompany">-</p>
                                </div>
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Host Employee</span>
                                    <p class="text-bold text-color-primary mb-0" id="revHost">-</p>
                                </div>
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Department</span>
                                    <p class="text-bold text-color-primary mb-0" id="revDept">-</p>
                                </div>
                                <div class="col-md-12">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Purpose</span>
                                    <p class="text-bold text-color-primary mb-0" id="revPurpose">-</p>
                                </div>
                                <div class="col-md-6">
                                    <span class="text-color-muted text-uppercase fs-8 text-bold">Schedule</span>
                                    <p class="text-bold text-color-primary mb-0" id="revSchedule">-</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-check text-start mb-4">
                            <input class="form-check-input" type="checkbox" id="revConfirm" required>
                            <label class="form-check-label text-bold text-color-secondary fs-7" for="revConfirm">
                                I confirm that the information provided is correct.
                            </label>
                            <div class="invalid-feedback">You must confirm your details before submitting.</div>
                        </div>
                    </div>

                    <!-- Button Control Bar -->
                    <div class="d-flex justify-content-between border-top pt-4 mt-5">
                        <button type="button" class="btn btn-outline-secondary px-4 py-2 d-none" id="btn-wizard-prev">Previous</button>
                        <button type="button" class="btn btn-primary px-4 py-2 ms-auto" id="btn-wizard-next">Next Step</button>
                        <button type="submit" class="btn btn-success px-4 py-2 d-none ms-auto" id="btn-wizard-submit">Submit Visit Request</button>
                    </div>

                </form>
            </div>
        </div>
    </main>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="../assets/js/forms.js"></script>
<script>
        // Init Pickers
        flatpickr("#wDate", { minDate: "today", dateFormat: "Y-m-d" });
        flatpickr("#wTime", { noCalendar: true, enableTime: true, dateFormat: "H:i" });

        // Drag and drop Identity ID preview
        const dropZone = document.getElementById('id-drop-zone');
        const idInput = document.getElementById('id-file-input');
        const idPreview = document.getElementById('id-preview-img');
        const idPreviewContainer = document.getElementById('id-preview-container');

        dropZone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.classList.add('dragover');
        });
        dropZone.addEventListener('dragleave', () => dropZone.classList.remove('dragover'));
        dropZone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropZone.classList.remove('dragover');
            const file = e.dataTransfer.files[0];
            if (file) handleIdFile(file);
        });
        idInput.addEventListener('change', () => {
            const file = idInput.files[0];
            if (file) handleIdFile(file);
        });

        function handleIdFile(file) {
            const reader = new FileReader();
            reader.onload = (e) => {
                idPreview.src = e.target.result;
                idPreviewContainer.classList.remove('d-none');
            };
            reader.readAsDataURL(file);
        }

        // Photo file upload & Capture simulation
        const photoInput = document.getElementById('photo-file-input');
        const photoPreview = document.getElementById('photo-preview-img');
        const btnWebcam = document.getElementById('btn-webcam-capture');

        photoInput.addEventListener('change', () => {
            const file = photoInput.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    photoPreview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });

        btnWebcam.addEventListener('click', () => {
            Swal.fire({
                title: 'Simulating Camera Capture',
                text: 'Webcam snapshot requested...',
                icon: 'info',
                timer: 1500,
                showConfirmButton: false
            }).then(() => {
                // Set mock headshot
                photoPreview.src = 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80';
                showSuccessToast('Headshot photo captured successfully.');
            });
        });

        // Wizard Stepper Page Control Routing
        let currentStep = 1;
        const totalSteps = 5;
        const btnPrev = document.getElementById('btn-wizard-prev');
        const btnNext = document.getElementById('btn-wizard-next');
        const btnSubmit = document.getElementById('btn-wizard-submit');
        const formEl = document.getElementById('multi-step-form');

        btnNext.addEventListener('click', () => {
            const stepEl = document.getElementById(`step-${currentStep}`);
            const isValid = window.SVPMSForms ? window.SVPMSForms.validateForm(stepEl, true) : validateStep(currentStep);
            
            if (!isValid) {
                return;
            }

            if (currentStep < totalSteps) {
                goToStep(currentStep + 1);
            }
        });

        btnPrev.addEventListener('click', () => {
            if (currentStep > 1) {
                goToStep(currentStep - 1);
            }
        });

        function goToStep(step) {
            // Hide current step content
            document.getElementById(`step-${currentStep}`).classList.add('d-none');
            document.getElementById(`step-badge-${currentStep}`).classList.remove('active');
            if (currentStep < step) {
                document.getElementById(`step-badge-${currentStep}`).classList.add('completed');
            } else {
                document.getElementById(`step-badge-${step}`).classList.remove('completed');
            }

            // Set new step
            currentStep = step;
            document.getElementById(`step-${currentStep}`).classList.remove('d-none');
            document.getElementById(`step-badge-${currentStep}`).classList.add('active');

            // Button controls visibility
            if (currentStep === 1) {
                btnPrev.classList.add('d-none');
            } else {
                btnPrev.classList.remove('d-none');
            }

            if (currentStep === totalSteps) {
                btnNext.classList.add('d-none');
                btnSubmit.classList.remove('d-none');
                compileReviewData();
            } else {
                btnNext.classList.remove('d-none');
                btnSubmit.classList.add('d-none');
            }
        }

        function validateStep(step) {
            const stepEl = document.getElementById(`step-${step}`);
            if (window.SVPMSForms) {
                return window.SVPMSForms.validateForm(stepEl, true);
            }
            if (step === 1) {
                return document.getElementById('wName').checkValidity() &&
                       document.getElementById('wEmail').checkValidity() &&
                       document.getElementById('wPhone').checkValidity() &&
                       document.getElementById('wCompany').checkValidity();
            } else if (step === 2) {
                return document.getElementById('wHost').checkValidity() &&
                       document.getElementById('wDept').checkValidity() &&
                       document.getElementById('wPurpose').checkValidity() &&
                       document.getElementById('wDate').checkValidity() &&
                       document.getElementById('wTime').checkValidity();
            }
            return true;
        }

        function compileReviewData() {
            document.getElementById('revName').textContent = document.getElementById('wName').value;
            document.getElementById('revEmail').textContent = document.getElementById('wEmail').value;
            document.getElementById('revPhone').textContent = document.getElementById('wPhone').value;
            document.getElementById('revCompany').textContent = document.getElementById('wCompany').value;
            document.getElementById('revHost').textContent = document.getElementById('wHost').value;
            document.getElementById('revDept').textContent = document.getElementById('wDept').value;
            document.getElementById('revPurpose').textContent = document.getElementById('wPurpose').value;
            document.getElementById('revSchedule').textContent = 
                `${document.getElementById('wDate').value} at ${document.getElementById('wTime').value}`;
        }

        // Handle final wizard submission
        formEl.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(formEl, true)) {
                return;
            } else if (!formEl.checkValidity()) {
                formEl.classList.add('was-validated');
                return;
            }

            const name = document.getElementById('wName').value;
            const email = document.getElementById('wEmail').value;
            const phone = document.getElementById('wPhone').value;
            const company = document.getElementById('wCompany').value;
            const host = document.getElementById('wHost').value;
            const dept = document.getElementById('wDept').value;
            const purpose = document.getElementById('wPurpose').value;
            const date = document.getElementById('wDate').value;
            const time = document.getElementById('wTime').value;
            const photoSrc = photoPreview.src;
            const idProofSrc = idPreview.src || 'https://placehold.co/400x250/06b6d4/ffffff?text=Uploaded+Identity+Proof';

            const newVisitor = {
                id: 'VP-PUB' + Math.floor(1000 + Math.random() * 9000),
                name,
                email,
                phone,
                company,
                host,
                department: dept,
                purpose,
                date,
                time,
                status: 'Pending',
                photo: photoSrc,
                idProof: idProofSrc,
                entryTime: '',
                exitTime: ''
            };

            // Save to localStorage
            let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            visitors.unshift(newVisitor);
            localStorage.setItem('svpms_visitors', JSON.stringify(visitors));

            Swal.fire({
                title: 'Visit request submitted!',
                text: `Your visit registration reference ID is ${newVisitor.id}. Click proceed to track status.`,
                icon: 'success',
                confirmButtonColor: '#2563EB',
                confirmButtonText: 'Track Visit'
            }).then(() => {
                window.location.href = `status.aspx?visitorId=${newVisitor.id}`;
            });
        });
    </script>
</asp:Content>
