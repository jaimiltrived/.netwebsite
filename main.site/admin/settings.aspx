<%@ Page Title="System Settings" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="main.site.AdminSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="row g-4" data-aos="fade-up">
                    <!-- Config settings form -->
                    <div class="col-lg-8">
                        <div class="card-premium">
                            <h5 class="text-bold mb-4">Gate Security Settings</h5>
                            <form id="settings-form" class="needs-validation" novalidate>
                                <div class="row g-3 mb-4">
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="optOpen">Gate Opening Hours</label>
                                        <input type="text" class="form-control form-control-premium" id="optOpen" value="06:00 AM">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="optClose">Gate Closing Hours</label>
                                        <input type="text" class="form-control form-control-premium" id="optClose" value="10:00 PM">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="optExpiry">Default Pass Expiry (hours)<span class="required-indicator">*</span></label>
                                        <input type="number" class="form-control form-control-premium" id="optExpiry" value="8" required min="1" max="72">
                                        <div class="invalid-feedback">Please enter valid expiry hours (1-72).</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="optThreshold">Blacklist Strike Threshold</label>
                                        <input type="number" class="form-control form-control-premium" id="optThreshold" value="3" min="1" max="10">
                                        <div class="invalid-feedback">Threshold must be between 1 and 10.</div>
                                    </div>
                                </div>

                                <hr class="my-4">

                                <h5 class="text-bold mb-3">System Flags</h5>
                                <div class="d-flex flex-column gap-3 mb-4">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch" id="flagOTP" checked>
                                        <label class="form-check-label text-bold fs-7 text-color-primary" for="flagOTP">Require SMS OTP verification for Walk-ins</label>
                                        <small class="text-color-muted d-block fs-8">Sends verification codes to visitor phone numbers prior to print.</small>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch" id="flagPreApp">
                                        <label class="form-check-label text-bold fs-7 text-color-primary" for="flagPreApp">Enable host auto-approvals for VIP guests</label>
                                        <small class="text-color-muted d-block fs-8">Bypasses verification approvals queue for guests marked as high-priority.</small>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch" id="flagMaint">
                                        <label class="form-check-label text-bold fs-7 text-color-primary" for="flagMaint">Put Public Portal into Maintenance Mode</label>
                                        <small class="text-color-muted d-block fs-8">Locks the public booking screen, returning a scheduled warning splash.</small>
                                    </div>
                                </div>

                                <div class="text-end border-top pt-4">
                                    <button type="submit" class="btn btn-premium btn-premium-primary px-4"><i class="bi bi-save"></i> Save Configurations</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Right sidebar status checks -->
                    <div class="col-lg-4">
                        <div class="card-premium h-100">
                            <h5 class="text-bold mb-4">Maintenance & Backup</h5>
                            <div class="d-flex flex-column gap-3 mb-4">
                                <div class="p-3 border rounded-card bg-light bg-opacity-10">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-bold fs-7 text-color-primary">Daily Database Backup</span>
                                        <span class="badge bg-success rounded-pill">Done</span>
                                    </div>
                                    <small class="text-color-secondary d-block fs-8 mb-2">Last backup completed today at 02:15 AM (AWS S3 storage bucket).</small>
                                    <button onclick="triggerBackupMock()" class="btn btn-sm btn-premium btn-premium-outline w-100 mt-2"><i class="bi bi-cloud-arrow-up"></i> Backup Database Now</button>
                                </div>

                                <div class="p-3 border rounded-card bg-light bg-opacity-10">
                                    <span class="text-bold fs-7 text-color-primary d-block mb-1">Pass Encryption Keys</span>
                                    <small class="text-color-secondary d-block fs-8 mb-3">System generates passes using SHA-256 tokens linked to QR values.</small>
                                    <button onclick="triggerKeyRefreshMock()" class="btn btn-sm btn-premium btn-premium-outline w-100"><i class="bi bi-arrow-repeat"></i> Regenerate Cryptography Keys</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        const settingsForm = document.getElementById('settings-form');
        settingsForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(settingsForm)) {
                return;
            } else if (!settingsForm.checkValidity()) {
                settingsForm.classList.add('was-validated');
                return;
            }
            showSuccessToast('System configurations updated.');
        });

        function triggerBackupMock() {
            Swal.fire({
                title: 'Triggering Backup...',
                text: 'Writing system schema dump to AWS S3 container. Please wait.',
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading();
                    setTimeout(() => {
                        Swal.fire({
                            title: 'Backup Successful!',
                            text: 'Archived snapshot VP_BACKUP_2026.zip written successfully.',
                            icon: 'success',
                            confirmButtonColor: '#2563EB'
                        });
                    }, 2000);
                }
            });
        }

        function triggerKeyRefreshMock() {
            Swal.fire({
                title: 'Refresh Keys?',
                text: 'Regenerating gate decryption salts will invalidate all active QR codes. Proceed?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#EF4444',
                confirmButtonText: 'Yes, Refresh Keys'
            }).then((result) => {
                if (result.isConfirmed) {
                    showSuccessToast('Salts regenerated. Decryption index flushed.');
                }
            });
        }
    </script>
</asp:Content>
