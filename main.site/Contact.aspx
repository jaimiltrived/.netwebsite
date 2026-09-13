<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="main.site.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">Contact Sales & Support</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">Get in touch to request enterprise demonstrations or custom pricing tiers configuration.</p>
        </div>
    </header>

    <!-- Contact Form and details Grid -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row g-5">
                <!-- Left Side: Form -->
                <div class="col-lg-7" data-aos="fade-right">
                    <div class="bg-card-theme p-4 shadow rounded-4">
                        <h4 class="text-bold text-color-primary mb-4">Send us a message</h4>

                        <asp:ValidationSummary ID="vsContact" runat="server" CssClass="alert alert-danger py-2 px-3 fs-8 mb-3" DisplayMode="BulletList" HeaderText="Please correct the following errors:" ValidationGroup="ContactGroup" />
                        <asp:Panel ID="pnlContactSuccess" runat="server" Visible="false" CssClass="alert alert-success py-3 px-4 mb-3">
                            <i class="bi bi-check-circle-fill me-2"></i> Thank you! Your inquiry has been submitted successfully. A representative will contact you soon.
                        </asp:Panel>

                        <div id="contact-form-wrapper">
                            <div class="row g-3 mb-3">
                                <div class="col-md-6 text-start">
                                    <label class="form-label text-bold fs-7 text-color-secondary" for="<%= txtContactName.ClientID %>">Full Name <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control form-control-premium" placeholder="e.g. Rahul Sharma" ValidationGroup="ContactGroup" />
                                    <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ControlToValidate="txtContactName" ErrorMessage="Full name is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ContactGroup" />
                                </div>
                                <div class="col-md-6 text-start">
                                    <label class="form-label text-bold fs-7 text-color-secondary" for="<%= txtContactEmail.ClientID %>">Email Address <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control form-control-premium" TextMode="Email" placeholder="e.g. name@company.com" ValidationGroup="ContactGroup" />
                                    <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="txtContactEmail" ErrorMessage="Email address is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ContactGroup" />
                                    <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="txtContactEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Please enter a valid email address (e.g. name@company.com)." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ContactGroup" />
                                </div>
                            </div>
                            
                            <div class="mb-3 text-start">
                                <label class="form-label text-bold fs-7 text-color-secondary" for="<%= txtContactOrg.ClientID %>">Organization / Company <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtContactOrg" runat="server" CssClass="form-control form-control-premium" placeholder="e.g. Tech University" ValidationGroup="ContactGroup" />
                                <asp:RequiredFieldValidator ID="rfvContactOrg" runat="server" ControlToValidate="txtContactOrg" ErrorMessage="Organization name is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ContactGroup" />
                            </div>

                            <div class="mb-4 text-start">
                                <label class="form-label text-bold fs-7 text-color-secondary" for="<%= txtContactMsg.ClientID %>">Message <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtContactMsg" runat="server" CssClass="form-control form-control-premium" TextMode="MultiLine" Rows="5" placeholder="How can we assist you with gate security?" ValidationGroup="ContactGroup" />
                                <asp:RequiredFieldValidator ID="rfvContactMsg" runat="server" ControlToValidate="txtContactMsg" ErrorMessage="Message details are required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ContactGroup" />
                                <asp:RegularExpressionValidator ID="revContactMsg" runat="server" ControlToValidate="txtContactMsg" ValidationExpression="^[\s\S]{10,}$" ErrorMessage="Message must be at least 10 characters long." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ContactGroup" />
                            </div>

                            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="btn btn-primary w-100 py-3 text-semibold" ValidationGroup="ContactGroup" OnClick="btnSendMessage_Click" />
                        </div>
                    </div>
                </div>

                <!-- Right Side: Details -->
                <div class="col-lg-5" data-aos="fade-left">
                    <div class="d-flex flex-column gap-4">
                        <div class="feature-card">
                            <h5 class="text-bold text-color-primary mb-2"><i class="bi bi-envelope-fill text-primary me-2"></i> Email Address</h5>
                            <p class="text-color-secondary mb-0">support@svpms.demo</p>
                            <p class="text-color-secondary mb-0 font-weight-bold">sales@svpms.demo</p>
                        </div>
                        <div class="feature-card">
                            <h5 class="text-bold text-color-primary mb-2"><i class="bi bi-telephone-fill text-primary me-2"></i> Phone Contact</h5>
                            <p class="text-color-secondary mb-0">Toll Free: +1-555-SVPMS-GATE</p>
                            <p class="text-color-secondary mb-0">Local: +91 98765 43210</p>
                        </div>
                        <div class="feature-card">
                            <h5 class="text-bold text-color-primary mb-2"><i class="bi bi-geo-alt-fill text-primary me-2"></i> Corporate Headquarters</h5>
                            <p class="text-color-secondary mb-0">Tech Hub Center, Phase 2, Silicon Valley, CA, USA</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
