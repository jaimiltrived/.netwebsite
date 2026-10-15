/* svpms/assets/js/app.js */

document.addEventListener('DOMContentLoaded', () => {
    // 1. Initialize Shared Visitor Database if not exists
    initMockDatabase();

    // 2. Initialize Bootstrap Tooltips
    const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

    // 3. Initialize AOS (Animate on Scroll)
    if (typeof AOS !== 'undefined') {
        AOS.init({
            duration: 800,
            once: true,
            easing: 'ease-in-out'
        });
    }

    // 4. Auto-boot Charts based on loaded elements
    if (typeof initAdminCharts === 'function' && document.getElementById('visitorTrendChart')) {
        initAdminCharts();
    }
    if (typeof initReceptionistCharts === 'function' && document.getElementById('hourlyVisitorsChart')) {
        initReceptionistCharts();
    }
    if (typeof initSecurityCharts === 'function' && document.getElementById('securityTrafficChart')) {
        initSecurityCharts();
    }
});

function initMockDatabase() {
    // Check if visitors data needs migration (contains old English names) or is missing
    const existing = localStorage.getItem('svpms_visitors');
    const hasOldData = existing && (existing.includes('John Doe') || existing.includes('Sarah Jenkins') || existing.includes('Alice Smith'));

    if (!existing || hasOldData) {
        const dummyVisitors = [
            {
                id: 'VP-264025',
                name: 'Aarav Patel',
                email: 'aarav.patel@tata.com',
                phone: '+91 98765 01234',
                company: 'Tata Consultancy Services',
                host: 'Dr. Priya Sharma',
                department: 'Information Technology',
                purpose: 'System Maintenance Integration',
                date: new Date().toISOString().split('T')[0],
                time: '10:00 AM',
                status: 'Approved',
                photo: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=Aarav+Patel+ID+Card',
                entryTime: '',
                exitTime: ''
            },
            {
                id: 'VP-264026',
                name: 'Ananya Iyer',
                email: 'ananya.iyer@infosys.com',
                phone: '+91 98765 05678',
                company: 'Infosys Technologies',
                host: 'Arjun Mehta',
                department: 'Human Resources',
                purpose: 'Recruitment Interview Panel',
                date: new Date().toISOString().split('T')[0],
                time: '11:30 AM',
                status: 'Pending',
                photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=Ananya+Iyer+ID+Card',
                entryTime: '',
                exitTime: ''
            },
            {
                id: 'VP-264027',
                name: 'Rohan Verma',
                email: 'rohan.verma@wipro.com',
                phone: '+91 98765 09112',
                company: 'Wipro Technologies',
                host: 'Capt. Devendra Rathore',
                department: 'Administration',
                purpose: 'Gate Access CCTV Inspection',
                date: new Date().toISOString().split('T')[0],
                time: '09:00 AM',
                status: 'Inside',
                photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=Rohan+Verma+ID+Card',
                entryTime: '09:12 AM',
                exitTime: ''
            },
            {
                id: 'VP-264028',
                name: 'Sneha Kulkarni',
                email: 'sneha.k@reliance.com',
                phone: '+91 98765 03456',
                company: 'Reliance Industries',
                host: 'Prof. Anand Kulkarni',
                department: 'Academics',
                purpose: 'Guest Lecture in Data Science',
                date: new Date().toISOString().split('T')[0],
                time: '08:30 AM',
                status: 'Exited',
                photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=Sneha+Kulkarni+ID+Card',
                entryTime: '08:28 AM',
                exitTime: '10:45 AM'
            },
            {
                id: 'VP-264029',
                name: 'Deepak Malhotra',
                email: 'deepak.malhotra@spam.com',
                phone: '+91 98765 07890',
                company: 'Independent Freelance',
                host: 'Unknown',
                department: 'Information Technology',
                purpose: 'Intrusion Investigation',
                date: new Date().toISOString().split('T')[0],
                time: '02:00 PM',
                status: 'Pending',
                photo: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=Deepak+Malhotra+ID+Card',
                entryTime: '',
                exitTime: ''
            }
        ];
        
        localStorage.setItem('svpms_visitors', JSON.stringify(dummyVisitors));
    }

    // Pre-populate system blacklist if not exists
    if (!localStorage.getItem('svpms_blacklisted_ids')) {
        const dummyBlacklist = ['VP-264029', 'VP-999999'];
        localStorage.setItem('svpms_blacklisted_ids', JSON.stringify(dummyBlacklist));
    }

    // Pre-populate Employees CRUD database
    if (!localStorage.getItem('svpms_employees')) {
        const dummyEmployees = [
            { id: 'EMP-2084', name: 'Dr. Priya Sharma', email: 'priya.sharma@college.edu', department: 'Information Technology', status: 'Active' },
            { id: 'EMP-2085', name: 'Arjun Mehta', email: 'arjun.mehta@college.edu', department: 'Human Resources', status: 'Active' },
            { id: 'EMP-2086', name: 'Prof. Anand Kulkarni', email: 'anand.kulkarni@college.edu', department: 'Academics & Research', status: 'Active' },
            { id: 'EMP-2087', name: 'Capt. Devendra Rathore', email: 'devendra.rathore@college.edu', department: 'Administration', status: 'Active' }
        ];
        localStorage.setItem('svpms_employees', JSON.stringify(dummyEmployees));
    }

    // Pre-populate Departments CRUD database
    if (!localStorage.getItem('svpms_departments')) {
        const dummyDepartments = [
            { code: 'DEPT-10', name: 'Information Technology', hostCount: 12, building: 'Main Block A', status: 'Active' },
            { code: 'DEPT-11', name: 'Human Resources', hostCount: 8, building: 'Admin Block B', status: 'Active' },
            { code: 'DEPT-12', name: 'Finance & Accounts', hostCount: 5, building: 'Main Block A', status: 'Active' }
        ];
        localStorage.setItem('svpms_departments', JSON.stringify(dummyDepartments));
    }

    // Pre-populate Buildings CRUD database
    if (!localStorage.getItem('svpms_buildings')) {
        const dummyBuildings = [
            { code: 'BLDG-01', name: 'Main Admin Block A', departments: 'Finance, IT, Reception', gatesCount: 2, status: 'Active' },
            { code: 'BLDG-02', name: 'Science & Lab Block B', departments: 'Biotechnology, Chemistry', gatesCount: 3, status: 'Active' },
            { code: 'BLDG-03', name: 'Auditorium Wing C', departments: 'Academics', gatesCount: 1, status: 'Active' }
        ];
        localStorage.setItem('svpms_buildings', JSON.stringify(dummyBuildings));
    }

    // Pre-populate Gates CRUD database
    if (!localStorage.getItem('svpms_gates')) {
        const dummyGates = [
            { code: 'GATE-101', name: 'Main Entrance Gate A', building: 'Admin Block A', roles: 'All Roles', status: 'Online' },
            { code: 'GATE-102', name: 'North Service Gate B', building: 'Science Block B', roles: 'Staff & Visitors', status: 'Online' },
            { code: 'GATE-103', name: 'VIP Gate C', building: 'Admin Block A', roles: 'VIP & Dignitaries', status: 'Online' }
        ];
        localStorage.setItem('svpms_gates', JSON.stringify(dummyGates));
    }
}
