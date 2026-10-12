<%@ Page Title="Help Desk" Language="C#" MasterPageFile="~/Visitor.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="main.site.VisitorHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content Help -->
    <main class="flex-grow-1 py-5">
        <div class="container px-4">
            
            <!-- Search bar header -->
            <div class="text-center mb-5" data-aos="fade-up">
                <h1 class="text-extrabold text-color-primary mb-3">How can we help?</h1>
                <p class="text-color-secondary fs-7 mb-4">Search documentation files or select support categories.</p>
                <div class="mx-auto" style="max-width: 500px;">
                    <div class="input-group input-group-lg shadow-sm border rounded-pill overflow-hidden bg-white">
                        <span class="input-group-text bg-transparent border-0 px-3"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" class="form-control border-0 bg-transparent fs-6" id="help-search-input" placeholder="Search registration, QR pass, status...">
                        <button class="btn btn-primary px-4" id="btn-help-search">Search</button>
                    </div>
                </div>
            </div>

            <!-- Categories Grid -->
            <div class="row g-3 justify-content-center mb-5" data-aos="fade-up">
                <div class="col-6 col-md-3 col-lg-2">
                    <button class="bg-card-theme p-3 text-center border rounded-3 w-100 h-100 btn-category" data-cat="Registration">
                        <i class="bi bi-person-plus text-primary fs-3 d-block mb-2"></i>
                        <span class="fs-8 text-bold text-color-primary">Registration</span>
                    </button>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <button class="bg-card-theme p-3 text-center border rounded-3 w-100 h-100 btn-category" data-cat="QR Pass">
                        <i class="bi bi-qr-code text-secondary fs-3 d-block mb-2"></i>
                        <span class="fs-8 text-bold text-color-primary">QR Pass</span>
                    </button>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <button class="bg-card-theme p-3 text-center border rounded-3 w-100 h-100 btn-category" data-cat="Visit Status">
                        <i class="bi bi-clock-history text-success fs-3 d-block mb-2"></i>
                        <span class="fs-8 text-bold text-color-primary">Visit Status</span>
                    </button>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <button class="bg-card-theme p-3 text-center border rounded-3 w-100 h-100 btn-category" data-cat="Entry">
                        <i class="bi bi-door-open text-info fs-3 d-block mb-2"></i>
                        <span class="fs-8 text-bold text-color-primary">Entry</span>
                    </button>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <button class="bg-card-theme p-3 text-center border rounded-3 w-100 h-100 btn-category" data-cat="Exit">
                        <i class="bi bi-box-arrow-right text-danger fs-3 d-block mb-2"></i>
                        <span class="fs-8 text-bold text-color-primary">Exit</span>
                    </button>
                </div>
                <div class="col-6 col-md-3 col-lg-2">
                    <button class="bg-card-theme p-3 text-center border rounded-3 w-100 h-100 btn-category" data-cat="Security">
                        <i class="bi bi-shield-check text-warning fs-3 d-block mb-2"></i>
                        <span class="fs-8 text-bold text-color-primary">Security</span>
                    </button>
                </div>
            </div>

            <div class="row g-4">
                <!-- FAQs Column -->
                <div class="col-lg-7" data-aos="fade-right">
                    <div class="bg-card-theme p-4 rounded-4 shadow-sm h-100">
                        <h4 class="text-bold text-color-primary mb-4"><i class="bi bi-question-circle text-primary me-2"></i> FAQs</h4>

                        <div class="accordion" id="faqAccordion">
                            <!-- Q1 -->
                            <div class="accordion-item border rounded-3 mb-3 overflow-hidden bg-white">
                                <h2 class="accordion-header">
                                    <button class="accordion-button text-bold text-color-primary collapsed fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                        How do I request a visitor pass?
                                    </button>
                                </h2>
                                <div id="faq1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body fs-7 text-color-secondary">
                                        Click "Register Visit" in the navbar, fill in meeting schedules, select your host employee, and upload government ID scans and selfies. After submission, you will track status timelines using the generated Pass ID.
                                    </div>
                                </div>
                            </div>

                            <!-- Q2 -->
                            <div class="accordion-item border rounded-3 mb-3 overflow-hidden bg-white">
                                <h2 class="accordion-header">
                                    <button class="accordion-button text-bold text-color-primary collapsed fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                        What identity documents are accepted?
                                    </button>
                                </h2>
                                <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body fs-7 text-color-secondary">
                                        For visitor portrait photos, we accept PNG/JPG files. For government identity cards, we support PDF files or photo scans up to 5MB size limit.
                                    </div>
                                </div>
                            </div>

                            <!-- Q3 -->
                            <div class="accordion-item border rounded-3 mb-3 overflow-hidden bg-white">
                                <h2 class="accordion-header">
                                    <button class="accordion-button text-bold text-color-primary collapsed fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                        My QR code won't scan at gate checkpoints. What should I do?
                                    </button>
                                </h2>
                                <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body fs-7 text-color-secondary">
                                        Ensure your smartphone screen brightness is set to max, or present the Pass ID reference number to the security guard, who can perform manual gate logging directly in their panel.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Support Column -->
                <div class="col-lg-5" data-aos="fade-left" data-aos-delay="100">
                    <div class="bg-card-theme p-4 rounded-4 shadow-sm h-100">
                        <h4 class="text-bold text-color-primary mb-4"><i class="bi bi-envelope-check text-primary me-2"></i> Contact Support</h4>

                        <div class="d-flex align-items-center gap-3 mb-4 fs-7 text-color-secondary">
                            <div class="icon-circle bg-primary bg-opacity-10 text-primary"><i class="bi bi-telephone-fill"></i></div>
                            <div>
                                <small class="text-color-muted d-block fs-8">Telephone Support</small>
                                <span class="text-bold text-color-primary">+1 (555) 0199</span>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mb-4 fs-7 text-color-secondary">
                            <div class="icon-circle bg-secondary bg-opacity-10 text-secondary"><i class="bi bi-envelope-at-fill"></i></div>
                            <div>
                                <small class="text-color-muted d-block fs-8">Technical Desk Email</small>
                                <span class="text-bold text-color-primary">support@svpms.demo</span>
                            </div>
                        </div>

                        <hr class="my-4">

                        <h5 class="text-bold text-color-primary mb-3">Send inquiry message</h5>
                        <asp:ValidationSummary ID="vsHelp" runat="server" CssClass="alert alert-danger py-2 px-3 fs-8 mb-3" DisplayMode="BulletList" HeaderText="Please correct the following errors:" ValidationGroup="HelpGroup" />
                        <asp:Panel ID="pnlHelpSuccess" runat="server" Visible="false" CssClass="alert alert-success py-2 px-3 fs-8 mb-3">
                            <i class="bi bi-check-circle-fill me-2"></i> Your inquiry ticket has been registered successfully!
                        </asp:Panel>

                        <div id="help-inquiry-wrapper">
                            <div class="mb-3 text-start">
                                <label class="form-label-premium" for="<%= txtHelpName.ClientID %>">Full Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtHelpName" runat="server" CssClass="form-control form-control-premium" placeholder="e.g. Rahul Sharma" ValidationGroup="HelpGroup" />
                                <asp:RequiredFieldValidator ID="rfvHelpName" runat="server" ControlToValidate="txtHelpName" ErrorMessage="Full name is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="HelpGroup" />
                            </div>
                            <div class="mb-3 text-start">
                                <label class="form-label-premium" for="<%= txtHelpMsg.ClientID %>">Message / Issue Details <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtHelpMsg" runat="server" CssClass="form-control form-control-premium" TextMode="MultiLine" Rows="3" placeholder="How can we assist you?" ValidationGroup="HelpGroup" />
                                <asp:RequiredFieldValidator ID="rfvHelpMsg" runat="server" ControlToValidate="txtHelpMsg" ErrorMessage="Message details are required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="HelpGroup" />
                                <asp:RegularExpressionValidator ID="revHelpMsg" runat="server" ControlToValidate="txtHelpMsg" ValidationExpression="^[\s\S]{10,}$" ErrorMessage="Message must be at least 10 characters long." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="HelpGroup" />
                            </div>
                            <div class="d-grid">
                                <asp:Button ID="btnSendHelp" runat="server" Text="Send Inquiry" CssClass="btn btn-primary py-2" ValidationGroup="HelpGroup" OnClick="btnSendHelp_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>

        // Category button click handling
        document.querySelectorAll('.btn-category').forEach(btn => {
            btn.addEventListener('click', () => {
                const cat = btn.getAttribute('data-cat');
                Swal.fire({
                    title: cat + ' Help',
                    text: 'Showing technical documentation related to ' + cat.toLowerCase() + ' protocols.',
                    icon: 'info',
                    confirmButtonColor: '#2563EB'
                });
            });
        });
    </script>
</asp:Content>
