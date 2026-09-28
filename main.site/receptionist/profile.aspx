<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="main.site.ReceptionistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="row g-4" data-aos="fade-up">
                    <!-- Left - User summary -->
                    <div class="col-lg-4">
                        <div class="card-premium text-center">
                            <div class="position-relative d-inline-block mb-3">
                                <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="Avatar" class="avatar avatar-xl shadow border border-3 border-white" id="profile-card-avatar">
                                <button class="position-absolute bottom-0 end-0 btn btn-sm btn-primary rounded-circle p-2 border border-2 border-white" style="width: 36px; height: 36px;" onclick="document.getElementById('avatar-upload-file').click()">
                                    <i class="bi bi-camera"></i>
                                </button>
                                <input type="file" id="avatar-upload-file" style="display: none;" accept="image/*" onchange="uploadAvatarPreview(this)">
                            </div>
                            <h4 class="text-bold text-color-primary mb-1" id="profile-card-name">Pooja Patel</h4>
                            <p class="text-color-secondary fs-7 mb-2" id="profile-card-role">Reception Desk Host</p>
                            <span class="badge bg-success rounded-pill px-3 py-1 fs-8">Active Session</span>
                        </div>
                    </div>

                    <!-- Right - Settings -->
                    <div class="col-lg-8">
                        <!-- Profile Form -->
                        <div class="card-premium mb-4">
                            <h5 class="text-bold mb-4">Profile Details</h5>
                            <form id="profile-details-form" class="needs-validation" novalidate>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="profName">Full Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control form-control-premium" id="profName" value="Pooja Patel" required minlength="2">
                                        <div class="invalid-feedback">Full name is required.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="profEmail">Email Address</label>
                                        <input type="email" class="form-control form-control-premium" id="profEmail" value="reception@svpms.demo" disabled>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="profPhone">Phone Number <span class="text-danger">*</span></label>
                                        <input type="tel" class="form-control form-control-premium" id="profPhone" value="+91 98765 43211" required>
                                        <div class="invalid-feedback">Please enter a valid phone number.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium" for="profTitle">Role Title</label>
                                        <input type="text" class="form-control form-control-premium" id="profTitle" value="Front Desk Representative" disabled>
                                    </div>
                                </div>
                                <div class="text-end border-top pt-4 mt-4">
                                    <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-check2"></i> Save Profile</button>
                                </div>
                            </form>
                        </div>

                        <!-- Password Form -->
                        <div class="card-premium">
                            <h5 class="text-bold mb-4">Security Settings (Change Password)</h5>
                            <form id="profile-password-form" class="needs-validation" novalidate>
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <label class="form-label-premium" for="pwdCurrent">Current Password <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control form-control-premium" id="pwdCurrent" required>
                                        <div class="invalid-feedback">Please enter current password.</div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label-premium" for="pwdNew">New Password <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control form-control-premium" id="pwdNew" required minlength="6">
                                        <div class="invalid-feedback">New password must be at least 6 characters.</div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label-premium" for="pwdConfirm">Confirm New Password <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control form-control-premium" id="pwdConfirm" required>
                                        <div class="invalid-feedback">Passwords do not match.</div>
                                    </div>
                                </div>
                                <div class="text-end border-top pt-4 mt-4">
                                    <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-shield-lock"></i> Update Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
            const role = localStorage.getItem('svpms_role') || 'receptionist';
            const name = localStorage.getItem('svpms_name') || 'Reception Desk User';
            const email = localStorage.getItem('svpms_email') || 'reception@svpms.demo';

            document.getElementById('profName').value = name;
            document.getElementById('profEmail').value = email;
            document.getElementById('profile-card-name').textContent = name;
            
            const roleTitle = getRoleDisplayName(role);
            document.getElementById('profTitle').value = roleTitle;
            document.getElementById('profile-card-role').textContent = roleTitle;
        });

        const detailsForm = document.getElementById('profile-details-form');
        detailsForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(detailsForm)) {
                return;
            } else if (!detailsForm.checkValidity()) {
                detailsForm.classList.add('was-validated');
                return;
            }

            const name = document.getElementById('profName').value.trim();
            localStorage.setItem('svpms_name', name);
            
            document.getElementById('profile-card-name').textContent = name;
            const headerUserName = document.getElementById('header-user-name');
            if (headerUserName) headerUserName.textContent = name;
            const sidebarUserName = document.getElementById('sidebar-user-name');
            if (sidebarUserName) sidebarUserName.textContent = name;

            showSuccessToast('Profile details updated.');
        });

        const pwdForm = document.getElementById('profile-password-form');
        pwdForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const cur = document.getElementById('pwdCurrent').value;
            const val = document.getElementById('pwdNew').value;
            const conf = document.getElementById('pwdConfirm').value;

            if (val !== conf) {
                const confInput = document.getElementById('pwdConfirm');
                confInput.classList.add('is-invalid');
                confInput.classList.remove('is-valid');
                showErrorToast('New password confirmation does not match.');
                return;
            }

            if (window.SVPMSForms && !window.SVPMSForms.validateForm(pwdForm)) {
                return;
            } else if (!pwdForm.checkValidity()) {
                pwdForm.classList.add('was-validated');
                return;
            }

            Swal.fire({
                title: 'Password Updated!',
                text: 'Your password has been changed successfully.',
                icon: 'success',
                confirmButtonColor: '#2563EB'
            }).then(() => {
                pwdForm.reset();
                pwdForm.classList.remove('was-validated');
                pwdForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));
            });
        });

        function uploadAvatarPreview(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    document.getElementById('profile-card-avatar').src = e.target.result;
                    const headerAvatar = document.getElementById('header-user-avatar');
                    if (headerAvatar) headerAvatar.src = e.target.result;
                    showSuccessToast('Avatar uploaded successfully.');
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
