<%@ Page Title="Login - Smart Visitor Pass Management System" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="main.site.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-primary);
        }

        /* Split-screen layout */
        .split-left {
            background: radial-gradient(circle at 20% 30%, rgba(37, 99, 235, 0.95) 0%, rgba(79, 70, 229, 0.98) 100%);
            color: #FFFFFF;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 60px 48px;
            position: relative;
            overflow: hidden;
        }

        /* Beautiful Humanist Grid Overlay */
        .grid-overlay {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-image: linear-gradient(rgba(255, 255, 255, 0.05) 1px, transparent 1px),
                              linear-gradient(90deg, rgba(255, 255, 255, 0.05) 1px, transparent 1px);
            background-size: 32px 32px;
            mask-image: radial-gradient(circle at 20% 30%, black, transparent 80%);
            pointer-events: none;
            z-index: 1;
        }

        .split-left-content {
            position: relative;
            z-index: 2;
        }

        /* Floating UI Preview Element */
        .preview-pass-mockup {
            background-color: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            max-width: 320px;
            margin: 40px 0;
        }

        .split-right {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 48px;
            background-color: var(--bg-primary);
        }

        .login-card {
            width: 100%;
            max-width: 420px;
        }

        /* Input Controls */
        .form-floating > .form-control-premium {
            border-radius: 10px;
            border: 1px solid var(--border-color);
            transition: all 0.25s ease;
        }

        .form-floating > .form-control-premium:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        /* Demo login buttons */
        .demo-pill-btn {
            background-color: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 10px;
            padding: 12px 16px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 500;
            color: var(--text-primary);
            transition: all 0.2s ease;
        }

        .demo-pill-btn:hover {
            border-color: var(--primary);
            background-color: rgba(37, 99, 235, 0.02);
            transform: translateY(-2px);
            box-shadow: var(--shadow-sm);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container-fluid p-0">
        <div class="row g-0">
            <!-- Left Side - Branding & Vector Grid Visuals -->
            <div class="col-lg-6 d-none d-lg-flex split-left">
                <div class="grid-overlay"></div>
                
                <div class="split-left-content" data-aos="fade-down">
                    <a class="d-flex align-items-center gap-2 text-white text-decoration-none" href="index.aspx">
                        <i class="bi bi-shield-check fs-2"></i>
                        <span class="fs-4 text-bold tracking-wider">SVPMS</span>
                    </a>
                </div>

                <div class="split-left-content my-auto text-start" data-aos="zoom-in" data-aos-delay="100">
                    <h1 class="text-extrabold mb-3 display-4" style="line-height: 1.1;">Secure Campus Gateways</h1>
                    <p class="fs-6 text-white text-opacity-75 mb-4" style="max-width: 460px;">
                        Enterprise visitor pass management system designed to log entry validations, monitor blacklists, and accelerate employee check-ins.
                    </p>

                    <!-- Preview Badge Mockup -->
                    <div class="preview-pass-mockup">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="fs-8 text-bold tracking-wider uppercase text-white text-opacity-70">Security Pass</span>
                            <span class="badge" style="background-color: rgba(74, 222, 128, 0.15); color: #4ade80; border: 1px solid rgba(74, 222, 128, 0.3); font-size: 0.75rem; font-weight: 700;">APPROVED</span>
                        </div>
                        <div class="d-flex align-items-center gap-3">
                            <div class="bg-white bg-opacity-10 p-2 rounded-3 text-white"><i class="bi bi-qr-code-scan fs-4"></i></div>
                            <div>
                                <h6 class="text-bold text-white mb-0">Siddharth Malhotra</h6>
                                <small class="text-white text-opacity-60">Infosys Ltd.</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="split-left-content fs-8 text-white text-opacity-40" data-aos="fade-up" data-aos-delay="200">
                    <span>SVPMS Secure Portal &bull; Enterprise Standard Design</span>
                </div>
            </div>

            <!-- Right Side - Humanist Login Form -->
            <div class="col-lg-6 split-right">
                <div class="login-card" data-aos="fade-left">
                    <!-- Mobile Logo Header -->
                    <div class="d-flex d-lg-none align-items-center gap-2 mb-4">
                        <i class="bi bi-shield-check text-primary fs-3"></i>
                        <span class="fs-4 text-bold text-color-primary">SVPMS</span>
                    </div>

                    <div class="mb-4">
                        <h2 class="text-bold text-color-primary">Welcome back</h2>
                        <p class="text-color-secondary mb-0">Sign in to access your administrative operations.</p>
                    </div>

                    <div id="login-form-wrapper">
                        <asp:ValidationSummary ID="vsLogin" runat="server" CssClass="alert alert-danger py-2 px-3 fs-8 mb-3" DisplayMode="BulletList" HeaderText="Please correct the following errors:" ValidationGroup="LoginGroup" />

                        <!-- Email Field -->
                        <div class="mb-3 text-start">
                            <label class="form-label-premium" for="<%= txtEmail.ClientID %>">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-premium" TextMode="Email" placeholder="name@svpms.demo" ValidationGroup="LoginGroup" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="LoginGroup" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Please enter a valid email address (e.g. name@svpms.demo)." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="LoginGroup" />
                        </div>

                        <!-- Password Field -->
                        <div class="mb-3 position-relative text-start">
                            <label class="form-label-premium" for="<%= txtPassword.ClientID %>">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-premium" TextMode="Password" placeholder="Password" ValidationGroup="LoginGroup" />
                            <button type="button" class="btn btn-link position-absolute text-color-muted border-0 p-0" id="btn-toggle-pwd" style="right: 16px; top: 38px; z-index: 10;">
                                <i class="bi bi-eye-slash fs-5"></i>
                            </button>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="LoginGroup" />
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ValidationExpression="^.{6,}$" ErrorMessage="Password must be at least 6 characters." CssClass="validator-error" Display="Dynamic" SetFocusOnError="True" ValidationGroup="LoginGroup" />
                        </div>

                        <!-- Controls Row -->
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check d-flex align-items-center">
                                <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input me-2" />
                                <label class="form-check-label text-color-secondary fs-7" for="<%= chkRememberMe.ClientID %>">
                                    Remember me
                                </label>
                            </div>
                            <a href="forgot-password.aspx" class="fs-7 text-primary text-semibold text-decoration-none">Forgot Password?</a>
                        </div>

                        <!-- Sign In Button -->
                        <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary w-100 py-3 mb-4 text-semibold" ValidationGroup="LoginGroup" OnClick="btnLogin_Click" />
                    </div>

                    <!-- Demo Accounts Quick Fill -->
                    <div class="mt-4 pt-4 border-top">
                        <h6 class="text-semibold text-color-secondary mb-3 text-center">Demo Quick-Logins</h6>
                        <div class="d-flex flex-column gap-2">
                            <button type="button" class="demo-pill-btn" onclick="demoLogin('admin@svpms.demo', 'admin123')">
                                <span><i class="bi bi-gear-fill text-primary me-2"></i> Super Admin (Rajesh Sharma)</span>
                                <i class="bi bi-arrow-right-short text-muted fs-5"></i>
                            </button>
                            <button type="button" class="demo-pill-btn" onclick="demoLogin('reception@svpms.demo', 'reception123')">
                                <span><i class="bi bi-person-badge-fill text-secondary me-2"></i> Receptionist (Pooja Patel)</span>
                                <i class="bi bi-arrow-right-short text-muted fs-5"></i>
                            </button>
                            <button type="button" class="demo-pill-btn" onclick="demoLogin('security@svpms.demo', 'security123')">
                                <span><i class="bi bi-shield-fill text-success me-2"></i> Security Officer (Vikram Singh)</span>
                                <i class="bi bi-arrow-right-short text-muted fs-5"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        function demoLogin(email, pass) {
            const emailInput = document.getElementById('<%= txtEmail.ClientID %>');
            const passInput = document.getElementById('<%= txtPassword.ClientID %>');
            if (emailInput && passInput) {
                emailInput.value = email;
                passInput.value = pass;
                document.getElementById('<%= btnLogin.ClientID %>').click();
            }
        }

        // Toggle eye
        const btnToggle = document.getElementById('btn-toggle-pwd');
        if (btnToggle) {
            btnToggle.addEventListener('click', () => {
                const pwdInput = document.getElementById('<%= txtPassword.ClientID %>');
                if (pwdInput) {
                    const isPass = pwdInput.type === 'password';
                    pwdInput.type = isPass ? 'text' : 'password';
                    btnToggle.innerHTML = isPass ? '<i class="bi bi-eye fs-5"></i>' : '<i class="bi bi-eye-slash fs-5"></i>';
                }
            });
        }
    </script>
</asp:Content>
