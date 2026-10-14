<%@ Page Title="Incident Reporting" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="incident-report.aspx.cs" Inherits="main.site.SecurityIncidentReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="card-premium" style="max-width: 750px; margin: 0 auto;" data-aos="fade-up">
                    <div class="mb-4">
                        <h5 class="text-bold mb-1 text-color-primary">Submit Security Incident Report</h5>
                        <p class="text-color-secondary fs-7 mb-0">Record and report gate violations, identity issues, or general safety alerts inside college borders.</p>
                    </div>

                    <div id="incident-report-form" class="needs-validation">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="incType">Incident Type<span class="required-indicator">*</span></label>
                                <select class="form-select form-control-premium text-color-primary" id="incType" required>
                                    <option value="">Choose Incident Type...</option>
                                    <option>Unauthorized Gate Intrusion</option>
                                    <option>Banned Pass Attempt</option>
                                    <option>Visitor Misbehavior / Altercation</option>
                                    <option>CCTV Device Failure</option>
                                    <option>Other Safety Violations</option>
                                </select>
                                <div class="invalid-feedback">Please select an incident type.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="incGate">Incident Location / Gate<span class="required-indicator">*</span></label>
                                <select class="form-select form-control-premium text-color-primary" id="incGate" required>
                                    <option value="">Select Location...</option>
                                    <option>Main Entrance Gate A</option>
                                    <option>North Service Gate B</option>
                                    <option>VIP Gate C</option>
                                    <option>General Campus Area</option>
                                </select>
                                <div class="invalid-feedback">Please choose the incident location.</div>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label-premium" for="incDate">Incident Date<span class="required-indicator">*</span></label>
                                <input type="text" class="form-control form-control-premium datepicker-premium" id="incDate" placeholder="YYYY-MM-DD" required>
                                <div class="invalid-feedback">Please select the incident date.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="incTime">Incident Time<span class="required-indicator">*</span></label>
                                <input type="text" class="form-control form-control-premium timepicker-premium" id="incTime" placeholder="HH:MM" required>
                                <div class="invalid-feedback">Please select incident time.</div>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label-premium" for="incDesc">Description of Incident<span class="required-indicator">*</span></label>
                                <textarea class="form-control form-control-premium" id="incDesc" rows="4" placeholder="Detail the events that occurred..." required minlength="10"></textarea>
                                <div class="invalid-feedback">Please describe the incident in detail (at least 10 characters).</div>
                            </div>

                            <!-- Upload Evidence -->
                            <div class="col-12">
                                <label class="form-label-premium">Attach CCTV Snapshot / Evidence Image</label>
                                <div class="upload-dropzone p-3" data-preview="evidence-preview-container">
                                    <i class="bi bi-cloud-arrow-up-fill upload-icon fs-2"></i>
                                    <div class="fs-8 text-bold">Drop Evidence JPG/PNG Files</div>
                                    <input type="file" class="upload-file-input" accept="image/*">
                                </div>
                                <div class="upload-preview-container text-center p-2" id="evidence-preview-container" style="display: none;">
                                    <img id="evidence-preview-img" class="upload-preview-image rounded border shadow" style="max-height: 120px;">
                                    <button type="button" class="remove-upload-btn"><i class="bi bi-trash"></i></button>
                                </div>
                            </div>

                            <!-- Alert Priority -->
                            <div class="col-12">
                                <label class="form-label-premium d-block">Alert Severity Priority</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="priorityOptions" id="prHigh" value="High" checked>
                                    <label class="form-check-label text-danger text-bold fs-7" for="prHigh">High Severity (Alert Admin)</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="priorityOptions" id="prMed" value="Medium">
                                    <label class="form-check-label text-warning text-bold fs-7" for="prMed">Medium Priority</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="priorityOptions" id="prLow" value="Low">
                                    <label class="form-check-label text-secondary text-bold fs-7" for="prLow">Low Priority</label>
                                </div>
                            </div>
                        </div>

                        <div class="text-end border-top pt-4 mt-4">
                            <button type="button" onclick="location.href='dashboard.aspx'" class="btn btn-premium btn-premium-outline me-2">Cancel</button>
                            <button type="button" id="btn-submit-incident" class="btn btn-premium btn-premium-primary"><i class="bi bi-send-fill"></i> Submit Safety Report</button>
                        </div>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const incidentForm = document.getElementById('incident-report-form');
        const submitBtn = document.getElementById('btn-submit-incident');
        if (submitBtn && incidentForm) {
            submitBtn.addEventListener('click', (e) => {
                e.preventDefault();
                if (window.SVPMSForms && !window.SVPMSForms.validateForm(incidentForm, true)) {
                    return;
                }

                // Field level validation
                let valid = true;
                incidentForm.querySelectorAll('[required]').forEach(input => {
                    if (!input.value || !input.value.trim()) {
                        input.classList.add('is-invalid');
                        input.classList.remove('is-valid');
                        valid = false;
                    } else {
                        input.classList.remove('is-invalid');
                        input.classList.add('is-valid');
                    }
                });

                if (!valid) return;

                Swal.fire({
                    title: 'Report Logged!',
                    text: 'Your security incident report has been registered and dispatched.',
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                }).then(() => {
                    incidentForm.querySelectorAll('input, select, textarea').forEach(el => {
                        el.value = '';
                        el.classList.remove('is-valid', 'is-invalid');
                    });
                    window.location.href = 'dashboard.aspx';
                });
            });
        }
    });
</script>
</asp:Content>
