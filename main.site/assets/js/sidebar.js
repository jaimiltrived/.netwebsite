/* svpms/assets/js/sidebar.js */

function formatLink(url) {
    if (!url) return url;
    return url.replace(/\.html([?#]|$)/ig, '.aspx$1');
}

document.addEventListener('DOMContentLoaded', () => {
    initSidebar();
});

function initSidebar() {
    // Inject Header Profile Dropdown if missing
    injectHeaderProfileDropdown();

    const sidebarMenu = document.getElementById('sidebar-menu-target');
    const path = window.location.pathname.toLowerCase().replace(/\\/g, '/');
    let role = localStorage.getItem('svpms_role');
    if (!role) {
        if (path.includes('/receptionist/')) role = 'receptionist';
        else if (path.includes('/security/')) role = 'security';
        else role = 'admin';
        localStorage.setItem('svpms_role', role);
    } else {
        if (path.includes('/admin/')) role = 'admin';
        else if (path.includes('/receptionist/')) role = 'receptionist';
        else if (path.includes('/security/')) role = 'security';
    }
    
    if (!sidebarMenu) {
        bindLogoutTriggers();
        return;
    }

    const menuData = getMenuData(role);
    
    // Clear and build menu
    sidebarMenu.innerHTML = '';
    
    menuData.forEach(section => {
        if (section.header) {
            const headerLi = document.createElement('li');
            headerLi.className = 'menu-header';
            headerLi.textContent = section.header;
            sidebarMenu.appendChild(headerLi);
        }
        
        section.items.forEach(item => {
            const li = document.createElement('li');
            const a = document.createElement('a');
            a.href = formatLink(item.link);
            a.className = 'menu-item';
            
            // Check if current page is active
            const currentPath = window.location.pathname.toLowerCase().replace(/\\/g, '/');
            const linkPageName = item.link.split('/').pop().toLowerCase().replace(/\.(html|aspx)$/, '');
            let currentPageName = (currentPath.split('/').pop() || 'dashboard').toLowerCase().replace(/\.(html|aspx)$/, '');
            if (!currentPageName) currentPageName = 'dashboard';
            
            if (currentPageName === linkPageName) {
                a.className += ' active';
            }
            
            let badgeHtml = '';
            if (item.badge) {
                const badgeClass = item.badgeClass || 'bg-warning';
                badgeHtml = `<span class="badge ${badgeClass} ms-auto rounded-pill fs-8 menu-badge">${item.badge}</span>`;
            }
            
            a.innerHTML = `
                <i class="bi ${item.icon}"></i>
                <span class="menu-item-text">${item.title}</span>
                ${badgeHtml}
            `;
            
            li.appendChild(a);
            sidebarMenu.appendChild(li);
        });
    });

    // Add Sidebar Collapse toggler event
    const sidebarToggle = document.getElementById('sidebar-toggle');
    const sidebarCollapseMobile = document.getElementById('sidebar-toggle-mobile');
    
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', () => {
            document.body.classList.toggle('sidebar-collapsed');
            const isCollapsed = document.body.classList.contains('sidebar-collapsed');
            localStorage.setItem('svpms-sidebar-collapsed', isCollapsed ? 'true' : 'false');
        });
        
        // Restore collapse state
        if (localStorage.getItem('svpms-sidebar-collapsed') === 'true') {
            document.body.classList.add('sidebar-collapsed');
        }
    }

    if (sidebarCollapseMobile) {
        sidebarCollapseMobile.addEventListener('click', () => {
            document.body.classList.add('mobile-sidebar-open');
        });
    }

    // Mobile Overlay
    let overlay = document.querySelector('.sidebar-overlay');
    if (!overlay) {
        overlay = document.createElement('div');
        overlay.className = 'sidebar-overlay';
        document.body.appendChild(overlay);
    }
    
    overlay.addEventListener('click', () => {
        document.body.classList.remove('mobile-sidebar-open');
    });

    const roleDefaultNames = {
        'admin': 'Rajesh Sharma',
        'receptionist': 'Pooja Patel',
        'security': 'Vikram Singh'
    };
    const displayName = localStorage.getItem('svpms_name') || roleDefaultNames[role] || 'Rajesh Sharma';

    // Display profile name and email in sidebar footer and header
    updateSidebarFooter(role, displayName);

    const headerUserNameEl = document.getElementById('header-user-name');
    if (headerUserNameEl) headerUserNameEl.textContent = displayName;

    bindLogoutTriggers();
}

function injectHeaderProfileDropdown() {
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        const parentContainer = themeToggle.parentElement;
        if (parentContainer && !parentContainer.querySelector('.dropdown-profile-injected')) {
            // Avoid duplicate injection if a dropdown containing avatar already exists
            const hasExistingAvatar = parentContainer.querySelector('img.avatar') !== null;
            if (hasExistingAvatar) return;

            const role = localStorage.getItem('svpms_role') || 'admin';
            const defaultNames = { 'admin': 'Rajesh Sharma', 'receptionist': 'Pooja Patel', 'security': 'Vikram Singh' };
            const name = localStorage.getItem('svpms_name') || defaultNames[role] || 'Rajesh Sharma';
            
            // Get correct relative prefix for links
            const path = window.location.pathname.toLowerCase().replace(/\\/g, '/');
            let prefix = './';
            if (path.includes('/admin/') || path.includes('/receptionist/') || path.includes('/security/') || path.includes('/visitor/')) {
                prefix = '../';
            }
            
            const roleTitle = getRoleDisplayName(role);
            
            // Default avatar placeholders
            let avatarUrl = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80';
            if (role === 'admin') {
                avatarUrl = 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80';
            } else if (role === 'security') {
                avatarUrl = 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80';
            }

            const dropdownDiv = document.createElement('div');
            dropdownDiv.className = 'dropdown dropdown-profile-injected';
            
            let extraLinks = '';
            if (role === 'admin') {
                extraLinks = `<li><a class="dropdown-item py-2" href="${prefix}admin/settings.aspx"><i class="bi bi-gear me-2"></i> Settings</a></li>`;
            }
            
            dropdownDiv.innerHTML = `
                <button class="btn p-0 border-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="${avatarUrl}" alt="Avatar" class="avatar avatar-sm cursor-pointer" id="header-user-avatar">
                </button>
                <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 py-2 rounded-card" style="width: 200px; font-size: 0.9rem; z-index: 1050;">
                    <li class="px-3 py-2 border-bottom">
                        <h6 class="mb-0 text-bold text-color-primary" id="header-user-name">${name}</h6>
                        <small class="text-color-muted">${roleTitle}</small>
                    </li>
                    <li><a class="dropdown-item py-2" href="${prefix}${role}/profile.aspx"><i class="bi bi-person me-2"></i> My Profile</a></li>
                    ${extraLinks}
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item py-2 text-danger text-bold" href="#" id="logout-btn"><i class="bi bi-box-arrow-right me-2"></i> Logout</a></li>
                </ul>
            `;
            parentContainer.appendChild(dropdownDiv);
        }
    }
}

function bindLogoutTriggers() {
    document.querySelectorAll('#logout-btn').forEach(logoutBtn => {
        // Clone button to strip old event handlers and avoid duplicate binding issues
        const newBtn = logoutBtn.cloneNode(true);
        logoutBtn.parentNode.replaceChild(newBtn, logoutBtn);

        newBtn.addEventListener('click', (e) => {
            e.preventDefault();
            Swal.fire({
                title: 'Logout',
                text: 'Are you sure you want to sign out of the system?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#2563EB',
                cancelButtonColor: '#E2E8F0',
                confirmButtonText: 'Yes, Sign Out',
                cancelButtonText: 'Cancel',
                customClass: {
                    cancelButton: 'text-dark'
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    logout();
                }
            });
        });
    });
}

function getRoleDisplayName(role) {
    switch (role) {
        case 'admin': return 'System Admin';
        case 'receptionist': return 'Reception Desk';
        case 'security': return 'Security Unit';
        default: return 'User';
    }
}

function getMenuData(role) {
    if (role === 'admin') {
        return [
            {
                items: [
                    { title: 'Dashboard', icon: 'bi-grid-1x2-fill', link: 'dashboard.aspx' }
                ]
            },
            {
                header: 'Visitors',
                items: [
                    { title: 'Visitor List', icon: 'bi-people-fill', link: 'visitors.aspx' },
                    { title: 'Pending Approvals', icon: 'bi-clock-fill', link: 'approvals.aspx', badge: '3' },
                    { title: 'Visitor History', icon: 'bi-journal-text', link: 'logs.aspx' }
                ]
            },
            {
                header: 'Enterprise',
                items: [
                    { title: 'Employees', icon: 'bi-person-badge-fill', link: 'employees.aspx' },
                    { title: 'Departments', icon: 'bi-building-fill', link: 'departments.aspx' },
                    { title: 'Buildings', icon: 'bi-geo-alt-fill', link: 'buildings.aspx' },
                    { title: 'Gates', icon: 'bi-door-closed-fill', link: 'gates.aspx' }
                ]
            },
            {
                header: 'Control',
                items: [
                    { title: 'Blacklist', icon: 'bi-slash-circle-fill', link: 'blacklist.aspx', badge: '2', badgeClass: 'bg-danger' }
                ]
            },
            {
                header: 'System',
                items: [
                    { title: 'Reports & Analytics', icon: 'bi-graph-up-arrow', link: 'reports.aspx' },
                    { title: 'System Settings', icon: 'bi-gear-fill', link: 'settings.aspx' },
                    { title: 'My Profile', icon: 'bi-person-circle', link: 'profile.aspx' }
                ]
            }
        ];
    } else if (role === 'receptionist') {
        return [
            {
                items: [
                    { title: 'Dashboard', icon: 'bi-grid-1x2-fill', link: 'dashboard.aspx' }
                ]
            },
            {
                header: 'Registrations',
                items: [
                    { title: 'Pre-Register Visitor', icon: 'bi-person-plus-fill', link: 'register-visitor.aspx' },
                    { title: 'Walk-In Visitor', icon: 'bi-lightning-fill', link: 'walk-in.aspx' }
                ]
            },
            {
                header: 'Schedules',
                items: [
                    { title: 'Visitor Directory', icon: 'bi-people-fill', link: 'visitors.aspx' },
                    { title: "Today's Arrivals", icon: 'bi-calendar-event-fill', link: 'today-visitors.aspx', badge: '5' },
                    { title: 'Upcoming Visitors', icon: 'bi-calendar-plus-fill', link: 'upcoming-visitors.aspx' },
                    { title: 'Pending Approvals', icon: 'bi-check-circle-fill', link: 'approvals.aspx', badge: '2' }
                ]
            },
            {
                header: 'Pass Management',
                items: [
                    { title: 'Generate QR', icon: 'bi-qr-code', link: 'generate-qr.aspx' },
                    { title: 'Print Badge', icon: 'bi-printer-fill', link: 'print-badge.aspx' }
                ]
            },
            {
                header: 'Account',
                items: [
                    { title: 'My Profile', icon: 'bi-person-circle', link: 'profile.aspx' }
                ]
            }
        ];
    } else if (role === 'security') {
        return [
            {
                items: [
                    { title: 'Dashboard', icon: 'bi-grid-1x2-fill', link: 'dashboard.aspx' }
                ]
            },
            {
                header: 'Verification Scanner',
                items: [
                    { title: 'QR Scanner Cam', icon: 'bi-qr-code-scan', link: 'scanner.aspx' },
                    { title: 'Entry Verification', icon: 'bi-box-arrow-in-right', link: 'entry-verification.aspx' },
                    { title: 'Exit Verification', icon: 'bi-box-arrow-left', link: 'exit-verification.aspx' }
                ]
            },
            {
                header: 'Control Panel',
                items: [
                    { title: 'Visitor Search', icon: 'bi-search', link: 'visitor-search.aspx' },
                    { title: 'Live Inside Facility', icon: 'bi-people-fill', link: 'live-visitors.aspx', badge: '8', badgeClass: 'bg-primary' }
                ]
            },
            {
                header: 'Logs & Safety',
                items: [
                    { title: 'Entry Logs', icon: 'bi-journal-arrow-down', link: 'entry-logs.aspx' },
                    { title: 'Exit Logs', icon: 'bi-journal-arrow-up', link: 'exit-logs.aspx' },
                    { title: 'Gate Blacklist', icon: 'bi-slash-circle-fill', link: 'blacklist.aspx' },
                    { title: 'Incident Report', icon: 'bi-exclamation-triangle-fill', link: 'incident-report.aspx' }
                ]
            },
            {
                header: 'Account',
                items: [
                    { title: 'My Profile', icon: 'bi-person-circle', link: 'profile.aspx' }
                ]
            }
        ];
    }
    return [];
}

function updateSidebarFooter(role, name) {
    const footer = document.querySelector('.sidebar-footer');
    if (footer) {
        // Initials calculation
        const initials = name.split(' ').map(n => n[0]).join('').substring(0, 2).toUpperCase();
        
        // Color variables based on role
        let bgStyle = 'background-color: var(--primary);';
        if (role === 'receptionist') {
            bgStyle = 'background-color: var(--secondary);';
        } else if (role === 'security') {
            bgStyle = 'background-color: var(--dark);';
        }

        const roleTitle = getRoleDisplayName(role);

        footer.innerHTML = `
            <div class="d-flex align-items-center justify-content-between w-100 gap-2">
                <div class="d-flex align-items-center gap-2 overflow-hidden">
                    <div class="avatar avatar-placeholder avatar-sm text-white" style="${bgStyle}">${initials}</div>
                    <div class="overflow-hidden">
                        <h6 class="mb-0 text-bold text-color-primary fs-7 text-truncate">${name}</h6>
                        <small class="text-color-muted text-truncate d-block fs-8">${roleTitle}</small>
                    </div>
                </div>
                <button id="logout-btn" class="btn btn-link text-danger p-0 border-0 fs-5 ms-auto" data-bs-toggle="tooltip" data-bs-placement="top" title="Sign Out">
                    <i class="bi bi-box-arrow-right"></i>
                </button>
            </div>
        `;
    }
}
