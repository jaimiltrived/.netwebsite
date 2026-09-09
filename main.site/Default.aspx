<%@ Page Title="SVPMS - Smart Visitor Pass Management System" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="main.site._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Hero Section -->
    <header class="py-5 overflow-hidden min-vh-90 d-flex align-items-center">
        <div class="container">
            <div class="row align-items-center g-5">
                <!-- Hero Left -->
                <div class="col-lg-6 text-start" data-aos="fade-right">
                    <span class="badge bg-primary bg-opacity-10 text-primary text-semibold px-3 py-2 rounded-pill mb-3">
                        Smart Visitor Management
                    </span>
                    <h1 class="text-extrabold text-color-primary display-4 mb-3" style="line-height: 1.15;">
                        Welcome Every Visitor.<br>Secure Every Visit.
                    </h1>
                    <p class="text-color-secondary fs-5 mb-4" style="max-width: 540px;">
                        SVPMS helps organizations manage visitor registration, approvals, QR passes, entry verification and visitor security from one simple platform.
                    </p>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="visitor/register.aspx" class="btn btn-primary btn-lg px-4 py-3 text-semibold">Register Your Visit</a>
                        <a href="visitor/status.aspx" class="btn btn-outline-secondary btn-lg px-4 py-3 text-semibold">Track Visit</a>
                    </div>
                </div>
                
                <!-- Hero Right (Floating UI Composition) -->
                <div class="col-lg-6 hero-composition" data-aos="fade-left">
                    <div class="hero-dashboard-preview p-2">
                        <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=800&q=80" class="img-fluid rounded-3 shadow" alt="Office Reception">
                    </div>
                    
                    <!-- Floating Card 1: Pass Status -->
                    <div class="floating-element floating-element-1 p-3">
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <div class="bg-success bg-opacity-10 p-2 rounded-circle text-success"><i class="bi bi-check-circle-fill"></i></div>
                            <div>
                                <h6 class="text-bold text-color-primary mb-0 fs-7">VP-PUB7321</h6>
                                <span class="fs-8 text-color-muted">Pass ID</span>
                            </div>
                        </div>
                        <div class="text-center py-2 bg-light rounded-3">
                            <span class="badge bg-success text-semibold">APPROVED</span>
                        </div>
                    </div>

                    <!-- Floating Card 2: Security Badge -->
                    <div class="floating-element floating-element-2 p-3">
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <div class="bg-primary bg-opacity-10 p-2 rounded-circle text-primary"><i class="bi bi-qr-code"></i></div>
                            <span class="text-bold text-color-primary fs-7">Visitor Digital QR</span>
                        </div>
                        <div class="text-center border-top pt-2">
                            <i class="bi bi-qr-code fs-1 text-primary"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Trust Logo Section -->
    <section class="py-5 border-top border-bottom bg-light bg-opacity-50">
        <div class="container text-center">
            <p class="text-color-muted text-uppercase tracking-wider fs-8 text-bold mb-4">
                Trusted visitor management for modern organizations
            </p>
            <div class="row row-cols-2 row-cols-md-6 g-4 justify-content-center align-items-center">
                <div class="col"><span class="trust-logo">NEXORA</span></div>
                <div class="col"><span class="trust-logo">TECHCORE</span></div>
                <div class="col"><span class="trust-logo">ORBIT</span></div>
                <div class="col"><span class="trust-logo">MEDICARE</span></div>
                <div class="col"><span class="trust-logo">EDUVISTA</span></div>
                <div class="col"><span class="trust-logo">URBANHUB</span></div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5" id="features">
        <div class="container py-5 text-center">
            <div class="max-w-700 mx-auto mb-5" data-aos="fade-up">
                <h2 class="text-extrabold text-color-primary display-6 mb-3">Everything you need to manage visitors</h2>
                <p class="text-color-secondary">Designed for companies, schools, universities, and government gates to register and monitor check-ins.</p>
            </div>
            
            <div class="row g-4">
                <!-- Feature 1 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="50">
                    <div class="feature-card h-100 text-start">
                        <div class="icon-circle bg-primary bg-opacity-10 text-primary mb-3"><i class="bi bi-pencil-square fs-4"></i></div>
                        <h5 class="text-bold text-color-primary">Easy Visitor Registration</h5>
                        <p class="text-color-secondary fs-7">Smooth self-service portal layout to pre-register visit files, upload identity cards and capture webcam images.</p>
                        <a href="features.aspx" class="text-semibold text-primary fs-7">Learn More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Feature 2 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="feature-card h-100 text-start">
                        <div class="icon-circle bg-secondary bg-opacity-10 text-secondary mb-3"><i class="bi bi-qr-code fs-4"></i></div>
                        <h5 class="text-bold text-color-primary">Digital QR Pass</h5>
                        <p class="text-color-secondary fs-7">Instantly retrieve a digital gate pass with scannable QR structures to traverse entry verification gates.</p>
                        <a href="features.aspx" class="text-semibold text-primary fs-7">Learn More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Feature 3 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="150">
                    <div class="feature-card h-100 text-start">
                        <div class="icon-circle bg-success bg-opacity-10 text-success mb-3"><i class="bi bi-check2-circle fs-4"></i></div>
                        <h5 class="text-bold text-color-primary">Fast Entry Verification</h5>
                        <p class="text-color-secondary fs-7">Security scanners instantly read passes to verify identity, cross-reference hosts and logging check-in times.</p>
                        <a href="features.aspx" class="text-semibold text-primary fs-7">Learn More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Feature 4 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="feature-card h-100 text-start">
                        <div class="icon-circle bg-info bg-opacity-10 text-info mb-3"><i class="bi bi-eye fs-4"></i></div>
                        <h5 class="text-bold text-color-primary">Real-Time Visitor Tracking</h5>
                        <p class="text-color-secondary fs-7">Live tracking on the administrator console of visitors currently inside the campus and expected logs.</p>
                        <a href="features.aspx" class="text-semibold text-primary fs-7">Learn More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Feature 5 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="250">
                    <div class="feature-card h-100 text-start">
                        <div class="icon-circle bg-warning bg-opacity-10 text-warning mb-3"><i class="bi bi-shield-check fs-4"></i></div>
                        <h5 class="text-bold text-color-primary">Secure ID Verification</h5>
                        <p class="text-color-secondary fs-7">Upload driver licenses or government cards and verify security details before checking passes.</p>
                        <a href="features.aspx" class="text-semibold text-primary fs-7">Learn More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <!-- Feature 6 -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="feature-card h-100 text-start">
                        <div class="icon-circle bg-danger bg-opacity-10 text-danger mb-3"><i class="bi bi-file-earmark-bar-graph fs-4"></i></div>
                        <h5 class="text-bold text-color-primary">Complete Visitor History</h5>
                        <p class="text-color-secondary fs-7">Search, filter, and audit past visitor lists to compile reports on gate activity and statistics.</p>
                        <a href="features.aspx" class="text-semibold text-primary fs-7">Learn More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="py-5 border-top border-bottom bg-light bg-opacity-50" id="how-it-works">
        <div class="container py-5 text-center">
            <div class="max-w-700 mx-auto mb-5" data-aos="fade-up">
                <h2 class="text-extrabold text-color-primary display-6 mb-3">How It Works</h2>
                <p class="text-color-secondary">A highly simplified and structured gate access sequence for security staff and visitors.</p>
            </div>
            
            <div class="workflow-timeline" data-aos="fade-up">
                <!-- Step 1 -->
                <div class="workflow-step">
                    <div class="step-badge">1</div>
                    <h6 class="text-bold text-color-primary mt-3">Register</h6>
                    <p class="fs-8 text-color-secondary px-3">Visitor enters visit details and documents in public portal.</p>
                </div>
                <!-- Step 2 -->
                <div class="workflow-step">
                    <div class="step-badge">2</div>
                    <h6 class="text-bold text-color-primary mt-3">Verify</h6>
                    <p class="fs-8 text-color-secondary px-3">Reception verifies visitor details and uploads.</p>
                </div>
                <!-- Step 3 -->
                <div class="workflow-step">
                    <div class="step-badge">3</div>
                    <h6 class="text-bold text-color-primary mt-3">Approve</h6>
                    <p class="fs-8 text-color-secondary px-3">Visit is approved by the host organization employee.</p>
                </div>
                <!-- Step 4 -->
                <div class="workflow-step">
                    <div class="step-badge">4</div>
                    <h6 class="text-bold text-color-primary mt-3">Get QR Pass</h6>
                    <p class="fs-8 text-color-secondary px-3">Visitor receives a secure scannable digital access pass.</p>
                </div>
                <!-- Step 5 -->
                <div class="workflow-step">
                    <div class="step-badge">5</div>
                    <h6 class="text-bold text-color-primary mt-3">Enter Securely</h6>
                    <p class="fs-8 text-color-secondary px-3">Security officer scans the QR pass to record entry.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Visitor Experience Journey -->
    <section class="py-5">
        <div class="container py-5 text-center">
            <div class="max-w-700 mx-auto mb-5" data-aos="fade-up">
                <h2 class="text-extrabold text-color-primary display-6 mb-3">Your visit, made simple.</h2>
                <p class="text-color-secondary">Follow our step-by-step visitor checklist from booking to gate exit.</p>
            </div>
            
            <div class="row g-2 justify-content-center align-items-center mb-5" data-aos="fade-up">
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Register</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Upload ID</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Confirm Details</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Get Approval</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Receive QR</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Arrive</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-primary px-3 py-2">Scan</span></div>
                <div class="col-auto text-color-muted"><i class="bi bi-chevron-right"></i></div>
                <div class="col-auto"><span class="badge bg-success px-3 py-2">Visit Complete</span></div>
            </div>
            
            <div data-aos="fade-up" data-aos-delay="100">
                <a href="visitor/register.aspx" class="btn btn-primary btn-lg px-5 py-3 text-semibold">Register Your Visit Now</a>
            </div>
        </div>
    </section>

    <!-- Security Section (Dark Background) -->
    <section class="py-5 bg-dark text-white border-top border-bottom">
        <div class="container py-5">
            <div class="row align-items-center g-5">
                <div class="col-lg-6" data-aos="fade-right">
                    <h2 class="text-extrabold display-6 mb-4" style="color: #ffffff;">Security without the complexity.</h2>
                    <p class="text-white-50 mb-5">We protect organization logs, staff databases, and gate access files using enterprise grade verification structures.</p>
                    
                    <ul class="list-unstyled d-flex flex-column gap-3">
                        <li class="d-flex align-items-center gap-3">
                            <i class="bi bi-check-circle-fill text-success fs-5"></i>
                            <span>Secure visitor records with custom encryption</span>
                        </li>
                        <li class="d-flex align-items-center gap-3">
                            <i class="bi bi-check-circle-fill text-success fs-5"></i>
                            <span>Role-based access controls for officers and admin</span>
                        </li>
                        <li class="d-flex align-items-center gap-3">
                            <i class="bi bi-check-circle-fill text-success fs-5"></i>
                            <span>Dynamic single-use QR pass verification check</span>
                        </li>
                        <li class="d-flex align-items-center gap-3">
                            <i class="bi bi-check-circle-fill text-success fs-5"></i>
                            <span>Gate entry and exit timestamps logging</span>
                        </li>
                    </ul>
                </div>
                
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="bg-white bg-opacity-5 p-4 rounded-4 border border-white border-opacity-10">
                        <h5 class="text-bold mb-4 text-white"><i class="bi bi-shield-shaded me-2 text-primary"></i> Enterprise Shield Features</h5>
                        <div class="d-flex flex-column gap-3">
                            <div class="p-3 bg-white bg-opacity-5 rounded-3 border border-white border-opacity-10">
                                <h6 class="text-bold mb-1 text-white">Blacklist Management</h6>
                                <p class="mb-0 text-white-50 fs-8">Instantly deny entries to blocked identity numbers or warning files at the security scanner gate.</p>
                            </div>
                            <div class="p-3 bg-white bg-opacity-5 rounded-3 border border-white border-opacity-10">
                                <h6 class="text-bold mb-1 text-white">Audit Log Reports</h6>
                                <p class="mb-0 text-white-50 fs-8">Maintain detailed system audit histories of who approved, modified, or verified visitor records.</p>
                            </div>
                            <div class="p-3 bg-white bg-opacity-5 rounded-3 border border-white border-opacity-10">
                                <h6 class="text-bold mb-1 text-white">Real-Time Alerts</h6>
                                <p class="mb-0 text-white-50 fs-8">Send emails or desktop warnings to hosts when visitors scan at gate thresholds.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Dashboard Preview Section -->
    <section class="py-5" id="preview">
        <div class="container py-5 text-center">
            <div class="max-w-700 mx-auto mb-5" data-aos="fade-up">
                <h2 class="text-extrabold text-color-primary display-6 mb-3">Designed for Professional Operations</h2>
                <p class="text-color-secondary">Take a glance at the real-time reception and guard interface.</p>
            </div>
            
            <!-- Realistic SVPMS Dashboard Preview Component -->
            <div class="bg-card-theme p-4 text-start shadow-lg mb-5" data-aos="zoom-in" style="max-width: 960px; margin: 0 auto;">
                <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-4 flex-wrap gap-2">
                    <div>
                        <h5 class="text-bold text-color-primary mb-0">Live Gate Monitoring Console</h5>
                        <span class="fs-8 text-color-muted">Today's real-time check-in registers</span>
                    </div>
                    <div>
                        <span class="badge bg-success bg-opacity-10 text-success text-bold px-3 py-2"><i class="bi bi-circle-fill me-2 animated pulse"></i> Live Syncing</span>
                    </div>
                </div>
                
                <div class="row g-3 mb-4">
                    <div class="col-6 col-md-3">
                        <div class="p-3 bg-light rounded-3">
                            <span class="fs-8 text-color-secondary text-bold">TODAY'S VISITORS</span>
                            <h3 class="text-bold text-primary mb-0">124</h3>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="p-3 bg-light rounded-3">
                            <span class="fs-8 text-color-secondary text-bold">PENDING APPROVALS</span>
                            <h3 class="text-bold text-warning mb-0">12</h3>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="p-3 bg-light rounded-3">
                            <span class="fs-8 text-color-secondary text-bold">VISITORS INSIDE</span>
                            <h3 class="text-bold text-success mb-0">43</h3>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="p-3 bg-light rounded-3">
                            <span class="fs-8 text-color-secondary text-bold">VISITORS EXITED</span>
                            <h3 class="text-bold text-secondary mb-0">69</h3>
                        </div>
                    </div>
                </div>
                
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th class="fs-8">Visitor ID</th>
                                <th class="fs-8">Visitor</th>
                                <th class="fs-8">Host Employee</th>
                                <th class="fs-8">Purpose</th>
                                <th class="fs-8">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="fs-7 text-bold text-primary">VP-PUB2614</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle bg-secondary bg-opacity-20 d-flex align-items-center justify-content-center" style="width: 32px; height: 32px; font-weight: 700; font-size: 0.8rem;">RS</div>
                                        <div>
                                            <h6 class="mb-0 fs-7 text-bold text-color-primary">Rahul Sharma</h6>
                                            <span class="fs-8 text-color-secondary">Tata Tech Solutions</span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h6 class="mb-0 fs-7 text-color-primary">Dr. Amit Patel</h6>
                                    <span class="fs-8 text-color-muted">Computer Dept.</span>
                                </td>
                                <td class="fs-7 text-color-secondary">Project Seminar</td>
                                <td><span class="badge bg-success">Approved</span></td>
                            </tr>
                            <tr>
                                <td class="fs-7 text-bold text-primary">VP-PUB2615</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-circle bg-secondary bg-opacity-20 d-flex align-items-center justify-content-center" style="width: 32px; height: 32px; font-weight: 700; font-size: 0.8rem;">SP</div>
                                        <div>
                                            <h6 class="mb-0 fs-7 text-bold text-color-primary">Sneha Patel</h6>
                                            <span class="fs-8 text-color-secondary">Infosys Design Studio</span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h6 class="mb-0 fs-7 text-color-primary">Prof. Priya Sen</h6>
                                    <span class="fs-8 text-color-muted">Design Lab</span>
                                </td>
                                <td class="fs-7 text-color-secondary">Interview Meeting</td>
                                <td><span class="badge bg-warning">Under Review</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Accordions -->
    <section class="py-5 border-top border-bottom bg-light bg-opacity-50" id="faq">
        <div class="container py-5">
            <div class="max-w-700 mx-auto text-center mb-5" data-aos="fade-up">
                <h2 class="text-extrabold text-color-primary display-6 mb-3">Frequently Asked Questions</h2>
                <p class="text-color-secondary">Find instant answers to general questions about registration and security.</p>
            </div>
            
            <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="100">
                <div class="col-lg-8">
                    <div class="accordion" id="accordionFAQ">
                        <!-- Q1 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    What is SVPMS?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body text-color-secondary fs-7">
                                    SVPMS stands for Smart Visitor Pass Management System. It is an enterprise ready digital solution designed to replace paper based registration logbooks at entrance gates with digital workflows, visitor photos, and scanned passes.
                                </div>
                            </div>
                        </div>
                        <!-- Q2 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Does the visitor need to create an account?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body text-color-secondary fs-7">
                                    No, visitors do not need to register accounts. The public website offers a direct self-service visitor portal to pre-register visit requests and check statuses without storing username/passwords.
                                </div>
                            </div>
                        </div>
                        <!-- Q3 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    How does QR pass verification work?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Once approved by the host employee, a digital pass with a unique QR code is generated. Visitors show this pass at the gate security kiosk. The officer scans it to verify legitimacy and instantly log their entry check-in.
                                </div>
                            </div>
                        </div>
                        <!-- Q4 -->
                        <div class="accordion-item mb-3 bg-white border rounded-3 overflow-hidden">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed text-bold fs-7" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    Can I manage multiple gates?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body text-color-secondary fs-7">
                                    Yes! SVPMS is architected to link multiple gates (e.g. Main Gate, South Gate, Hostels) under a unified administrator dashboard, tracking entry and exit verification logs dynamically.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Large Contact / CTA Section -->
    <section class="py-5 bg-primary text-white text-center">
        <div class="container py-5" data-aos="zoom-in">
            <h2 class="text-extrabold display-5 mb-3" style="color: #ffffff;">Ready to simplify visitor management?</h2>
            <p class="fs-5 mb-5 opacity-90 mx-auto" style="max-width: 580px;">Get started today with pre-registration bookings or secure a pricing subscription for your organization.</p>
            <div class="d-flex gap-3 justify-content-center flex-wrap">
                <a href="visitor/register.aspx" class="btn btn-light text-primary btn-lg px-4 py-3 text-semibold">Register Your Visit</a>
                <a href="contact.aspx" class="btn btn-outline-light btn-lg px-4 py-3 text-semibold">Talk to Sales</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        // Redirect active staff session immediately
        const activeRole = localStorage.getItem('svpms_role');
        if (activeRole) {
            window.location.href = `${activeRole}/dashboard.aspx`;
        }
    </script>
</asp:Content>
