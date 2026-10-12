<%@ Page Title="Track Visit Status" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="status.aspx.cs" Inherits="main.site.VisitorStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content Status check -->
    <main class="flex-grow-1 py-5" style="background-color: var(--bg-primary);">
        <div class="container px-4" data-aos="fade-up">

            <!-- Quick Track Search Bar -->
            <div class="card-premium mx-auto mb-4" style="max-width: 600px;">
                <h5 class="text-bold text-color-primary mb-3">Track Access Pass File</h5>
                <form id="track-search-form" class="needs-validation" novalidate>
                    <div class="input-group has-validation">
                        <input type="text" class="form-control form-control-premium" id="track-id-input"
                            placeholder="Enter your Pass ID (e.g. VP-264025)..." required minlength="3">
                        <button class="btn btn-premium btn-premium-primary" type="submit"><i class="bi bi-search"></i>
                            Search</button>
                        <div class="invalid-feedback text-start">Please enter a valid Pass ID (e.g. VP-264025).</div>
                    </div>
                </form>
            </div>

            <!-- Status Timeline target container -->
            <div class="mx-auto" id="visitor-status-container" style="max-width: 600px;" data-aos="zoom-in"
                data-aos-delay="100">
                <!-- Dynamically loaded from visitor.js -->
            </div>

        </div>
    </main>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        const trackForm = document.getElementById('track-search-form');
        trackForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(trackForm)) {
                return;
            } else if (!trackForm.checkValidity()) {
                trackForm.classList.add('was-validated');
                return;
            }
            const id = document.getElementById('track-id-input').value.trim();
            if (id) {
                window.location.href = `status.aspx?visitorId=${encodeURIComponent(id.toUpperCase())}`;
            }
        });

        // Set value in search if query param matches
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
            const visitorId = urlParams.get('visitorId');
            if (visitorId) {
                document.getElementById('track-id-input').value = visitorId;
            }
        });
    </script>
</asp:Content>
