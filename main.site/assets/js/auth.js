/* svpms/assets/js/auth.js */

const DEMO_USERS = {
    'admin@svpms.demo': { password: 'admin123', role: 'admin', name: 'Rajesh Sharma' },
    'reception@svpms.demo': { password: 'reception123', role: 'receptionist', name: 'Pooja Patel' },
    'security@svpms.demo': { password: 'security123', role: 'security', name: 'Vikram Singh' }
};

// Check path depth to get correct relative URLs
function getPathPrefix() {
    const path = window.location.pathname.toLowerCase().replace(/\\/g, '/');
    if (path.includes('/admin/') || path.includes('/receptionist/') || path.includes('/security/') || path.includes('/visitor/')) {
        return '../';
    }
    return './';
}

function login(email, password) {
    const user = DEMO_USERS[email.toLowerCase().trim()];
    if (user && user.password === password) {
        localStorage.setItem('svpms_logged_in', 'true');
        localStorage.setItem('svpms_role', user.role);
        localStorage.setItem('svpms_email', email);
        localStorage.setItem('svpms_name', user.name);
        
        const prefix = getPathPrefix();
        // Redirect to respective dashboard .aspx
        if (user.role === 'admin') {
            window.location.href = prefix + 'admin/dashboard.aspx';
        } else if (user.role === 'receptionist') {
            window.location.href = prefix + 'receptionist/dashboard.aspx';
        } else if (user.role === 'security') {
            window.location.href = prefix + 'security/dashboard.aspx';
        }
        return true;
    }
    return false;
}

function logout() {
    localStorage.removeItem('svpms_logged_in');
    localStorage.removeItem('svpms_role');
    localStorage.removeItem('svpms_email');
    localStorage.removeItem('svpms_name');
    
    const prefix = getPathPrefix();
    window.location.href = prefix + 'login.aspx';
}

function checkSession() {
    const loggedIn = localStorage.getItem('svpms_logged_in') === 'true';
    const role = localStorage.getItem('svpms_role');
    const path = window.location.pathname.toLowerCase().replace(/\\/g, '/');
    const prefix = getPathPrefix();

    const segments = path.split('/').filter(Boolean);
    const lastSegment = segments.length > 0 ? segments[segments.length - 1].replace(/\.(aspx|html)$/, '') : '';

    // Skip check for login, index, Default, forgot password, error pages, and visitor portal
    const isPublicPage = lastSegment === 'login' ||
                         lastSegment === 'index' ||
                         lastSegment === 'default' ||
                         lastSegment === '' ||
                         lastSegment === 'forgot-password' ||
                         lastSegment === 'reset-password' ||
                         lastSegment === 'contact' ||
                         lastSegment === 'features' ||
                         lastSegment === 'pricing' ||
                         lastSegment === 'how-it-works' ||
                         lastSegment === 'faq' ||
                         lastSegment === 'privacy' ||
                         lastSegment === '404' ||
                         lastSegment === '403' ||
                         lastSegment === '500' ||
                         path.includes('/visitor/');

    if (isPublicPage) {
        return;
    }

    if (!loggedIn) {
        window.location.href = prefix + 'login.aspx';
        return;
    }

    // Role verification based on directory
    if (path.includes('/admin/') && role !== 'admin') {
        window.location.href = prefix + '403.aspx';
    } else if (path.includes('/receptionist/') && role !== 'receptionist') {
        window.location.href = prefix + '403.aspx';
    } else if (path.includes('/security/') && role !== 'security') {
        window.location.href = prefix + '403.aspx';
    }
}

// Automatically check session on script load
checkSession();
