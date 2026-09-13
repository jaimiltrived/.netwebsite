<%@ Page Title="Features" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="features.aspx.cs" Inherits="main.site.Features" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 bg-light bg-opacity-30 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">Enterprise Features</h1>
            <p class="text-color-secondary fs-5 mx-auto" style="max-width: 600px;">Everything you need to orchestrate security checkpoints, hosts registries, and visit logs.</p>
        </div>
    </header>

    <!-- Detailed Features Grid -->
    <section class="py-5">
        <div class="container py-5">
            <!-- Row 1 -->
            <div class="row align-items-center g-5 mb-5 pb-5">
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="icon-circle bg-primary bg-opacity-10 text-primary mb-3"><i class="bi bi-pencil-square fs-3"></i></div>
                    <h3 class="text-bold text-color-primary mb-3">Easy Visitor Registration</h3>
                    <p class="text-color-secondary mb-4">Allow visitors to register online before arriving at the campus or facility. The multi-step wizard handles contact info, host directories selection, purposes of visit, and identity verification seamlessly.</p>
                    <ul class="list-unstyled d-flex flex-column gap-2 text-color-secondary fs-7">
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Custom fields configuration</li>
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Real-time host notification emails</li>
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Quick search for hosts by department</li>
                    </ul>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="bg-card-theme p-4 shadow rounded-4 text-center">
                        <img src="https://images.unsplash.com/photo-1557200134-90327ee9fafa?auto=format&fit=crop&w=600&q=80" class="img-fluid rounded shadow-sm" alt="Visitor Portal Registration Form">
                    </div>
                </div>
            </div>

            <!-- Row 2 -->
            <div class="row align-items-center g-5 mb-5 pb-5 flex-lg-row-reverse">
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="icon-circle bg-secondary bg-opacity-10 text-secondary mb-3"><i class="bi bi-qr-code fs-3"></i></div>
                    <h3 class="text-bold text-color-primary mb-3">Instant Digital QR Pass</h3>
                    <p class="text-color-secondary mb-4">Cut down queues at front desks by issuing digital QR passes instantly upon host employee approval. Visitors can print the pass, save it to their wallets, or present it directly on their phones.</p>
                    <ul class="list-unstyled d-flex flex-column gap-2 text-color-secondary fs-7">
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> High contrast readable layout</li>
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Unique security reference IDs</li>
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Local print style rules included</li>
                    </ul>
                </div>
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="bg-card-theme p-4 shadow rounded-4 text-center">
                        <img src="https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?auto=format&fit=crop&w=600&q=80" class="img-fluid rounded shadow-sm" alt="QR Pass Verification">
                    </div>
                </div>
            </div>

            <!-- Row 3 -->
            <div class="row align-items-center g-5">
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="icon-circle bg-success bg-opacity-10 text-success mb-3"><i class="bi bi-shield-check fs-3"></i></div>
                    <h3 class="text-bold text-color-primary mb-3">Fast Gate Verification Kiosk</h3>
                    <p class="text-color-secondary mb-4">Empower guard panels with rapid-lookup tools. Guard scanner pages read pass QR codes in seconds, immediately cross referencing details, blacklists, and check-in statuses.</p>
                    <ul class="list-unstyled d-flex flex-column gap-2 text-color-secondary fs-7">
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> 2-second QR checkout scan logs</li>
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Automatic blacklist threat warning shield</li>
                        <li><i class="bi bi-check-circle-fill text-success me-2"></i> Manual verification backup lookups</li>
                    </ul>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="bg-card-theme p-4 shadow rounded-4 text-center">
                        <img src="https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=600&q=80" class="img-fluid rounded shadow-sm" alt="Security gate monitoring dashboard">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="py-5 bg-primary text-white text-center">
        <div class="container py-4" data-aos="zoom-in">
            <h3 class="text-bold mb-3" style="color: #ffffff;">Need custom feature configurations?</h3>
            <p class="mb-4 opacity-90 mx-auto" style="max-width: 500px;">Contact our sales team to discuss custom integrations for university entry gates or hospitals.</p>
            <a href="contact.aspx" class="btn btn-light text-primary btn-lg px-4 py-3 text-semibold">Contact Our Sales</a>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
