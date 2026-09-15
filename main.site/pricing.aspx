<%@ Page Title="Pricing Plans" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pricing.aspx.cs" Inherits="main.site.Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Header Section -->
    <header class="py-5 text-center">
        <div class="container py-4" data-aos="fade-up">
            <h1 class="text-extrabold text-color-primary display-4 mb-3">Simple pricing for every organization</h1>
            <p class="text-color-secondary fs-5 mx-auto mb-4" style="max-width: 600px;">Choose a subscription scale that fits your campus visitor flows. Start trailing free today.</p>
            
            <!-- Toggle Selector -->
            <div class="billing-toggle-container">
                <button class="billing-toggle-btn active" id="billing-monthly">Monthly</button>
                <button class="billing-toggle-btn" id="billing-yearly">Yearly (Save 20%)</button>
            </div>
        </div>
    </header>

    <!-- Pricing Cards Section -->
    <section class="py-4">
        <div class="container">
            <div class="row g-4 justify-content-center">
                <!-- Starter Tier -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="50">
                    <div class="pricing-card h-100 text-center">
                        <h4 class="text-bold text-color-primary mb-1">Starter</h4>
                        <p class="text-color-secondary fs-8">For small offices and clinics.</p>
                        
                        <div class="pricing-price">
                            <span class="currency">₹</span><span class="price-val" data-monthly="1,999" data-yearly="1,599">1,999</span><span class="fs-7 text-color-secondary font-weight-normal">/mo</span>
                        </div>
                        
                        <a href="#" class="btn btn-outline-primary w-100 py-3 text-semibold mb-4 btn-checkout">Start Free Trial</a>
                        
                        <ul class="pricing-features-list">
                            <li><i class="bi bi-check2"></i> Up to 500 visitors/month</li>
                            <li><i class="bi bi-check2"></i> Pre-registration form</li>
                            <li><i class="bi bi-check2"></i> Digital QR passes</li>
                            <li><i class="bi bi-check2"></i> Email notifications</li>
                            <li><i class="bi bi-check2"></i> Basic report generation</li>
                        </ul>
                    </div>
                </div>

                <!-- Professional Tier -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="pricing-card popular h-100 text-center">
                        <div class="pricing-popular-badge">Popular</div>
                        
                        <h4 class="text-bold text-color-primary mb-1">Professional</h4>
                        <p class="text-color-secondary fs-8">For corporate buildings and colleges.</p>
                        
                        <div class="pricing-price">
                            <span class="currency">₹</span><span class="price-val" data-monthly="4,999" data-yearly="3,999">4,999</span><span class="fs-7 text-color-secondary font-weight-normal">/mo</span>
                        </div>
                        
                        <a href="#" class="btn btn-primary w-100 py-3 text-semibold mb-4 btn-checkout">Start Free Trial</a>
                        
                        <ul class="pricing-features-list">
                            <li><i class="bi bi-check2"></i> Up to 2,500 visitors/month</li>
                            <li><i class="bi bi-check2"></i> Everything in Starter</li>
                            <li><i class="bi bi-check2"></i> Multiple gate configurations</li>
                            <li><i class="bi bi-check2"></i> Blacklist threat shield</li>
                            <li><i class="bi bi-check2"></i> Security monitoring panel</li>
                            <li><i class="bi bi-check2"></i> Advanced visitor analytics</li>
                            <li><i class="bi bi-check2"></i> Priority tech support</li>
                        </ul>
                    </div>
                </div>

                <!-- Enterprise Tier -->
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="150">
                    <div class="pricing-card h-100 text-center">
                        <h4 class="text-bold text-color-primary mb-1">Enterprise</h4>
                        <p class="text-color-secondary fs-8">For multi-building campus networks.</p>
                        
                        <div class="pricing-price" style="font-size: 2.2rem; line-height: 1.2; margin: 23px 0;">
                            Custom Pricing
                        </div>
                        
                        <a href="contact.aspx" class="btn btn-outline-primary w-100 py-3 text-semibold mb-4">Contact Sales</a>
                        
                        <ul class="pricing-features-list">
                            <li><i class="bi bi-check2"></i> Unlimited monthly visitors</li>
                            <li><i class="bi bi-check2"></i> Multi-building support</li>
                            <li><i class="bi bi-check2"></i> Role-based staff access</li>
                            <li><i class="bi bi-check2"></i> System audit log tracking</li>
                            <li><i class="bi bi-check2"></i> Core REST API integrations</li>
                            <li><i class="bi bi-check2"></i> Dedicated account manager</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Pricing Comparison Section -->
    <section class="py-5">
        <div class="container py-4">
            <h3 class="text-bold text-color-primary text-center mb-5" data-aos="fade-up">Compare Plan Features</h3>
            
            <div class="table-responsive bg-white rounded-4 shadow border" data-aos="fade-up">
                <table class="pricing-comparison-table mb-0">
                    <thead>
                        <tr class="table-light">
                            <th class="w-40">Features</th>
                            <th>Starter</th>
                            <th>Professional</th>
                            <th>Enterprise</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Visitor Registration</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                        <tr>
                            <td>QR Pass Generation</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Multiple Gates Support</td>
                            <td class="text-color-muted">1 Gate</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Blacklist Directory Check</td>
                            <td class="text-color-muted">-</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Advanced Analytics</td>
                            <td class="text-color-muted">-</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                        <tr>
                            <td>System Audit Logs</td>
                            <td class="text-color-muted">-</td>
                            <td class="text-color-muted">-</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                        <tr>
                            <td>API Integration</td>
                            <td class="text-color-muted">-</td>
                            <td class="text-color-muted">-</td>
                            <td><i class="bi bi-check-circle-fill text-success"></i></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Footer -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        // Pricing toggler logic
        const billingMonthly = document.getElementById('billing-monthly');
        const billingYearly = document.getElementById('billing-yearly');
        const priceVals = document.querySelectorAll('.price-val');
        
        billingMonthly?.addEventListener('click', () => {
            billingMonthly.classList.add('active');
            billingYearly?.classList.remove('active');
            priceVals.forEach(val => {
                val.textContent = val.getAttribute('data-monthly');
            });
        });

        billingYearly?.addEventListener('click', () => {
            billingYearly.classList.add('active');
            billingMonthly?.classList.remove('active');
            priceVals.forEach(val => {
                val.textContent = val.getAttribute('data-yearly');
            });
        });

        // Checkout button click alert
        document.querySelectorAll('.btn-checkout').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.preventDefault();
                Swal.fire({
                    title: 'Start Free Trial',
                    text: 'Redirecting you to our secure checkout gateway...',
                    icon: 'info',
                    confirmButtonColor: '#2563EB',
                    timer: 2000,
                    showConfirmButton: false
                });
            });
        });
    </script>
</asp:Content>
