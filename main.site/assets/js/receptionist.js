/* svpms/assets/js/receptionist.js */

document.addEventListener('DOMContentLoaded', () => {
    initReceptionistActions();
    loadBadgeDetails();
    loadQRDetails();
});

function initReceptionistActions() {
    // 1. Wizard visitor registration form submit
    const wizardForm = document.getElementById('receptionist-wizard-form');
    if (wizardForm) {
        wizardForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(wizardForm, false)) {
                return;
            } else if (!wizardForm.checkValidity()) {
                wizardForm.classList.add('was-validated');
                return;
            }
            
            // Gather values
            const name = document.getElementById('vName').value.trim();
            const email = document.getElementById('vEmail').value.trim();
            const phone = document.getElementById('vPhone').value.trim();
            const company = document.getElementById('vCompany').value.trim();
            const host = document.getElementById('vHost').value;
            const dept = document.getElementById('vDept').value;
            const purpose = document.getElementById('vPurpose').value.trim();
            const date = document.getElementById('vDate').value;
            const time = document.getElementById('vTime').value;

            const newVisitor = {
                id: 'VP-26' + Math.floor(1000 + Math.random() * 9000),
                name,
                email,
                phone,
                company,
                host,
                department: dept,
                purpose,
                date,
                time,
                status: 'Approved', // Auto-approved when registered by receptionist
                photo: document.querySelector('#avatar-preview-img')?.src || 'https://placehold.co/150x150/2563eb/ffffff?text=' + name.split(' ').map(n=>n[0]).join(''),
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=ID+Proof',
                entryTime: '',
                exitTime: ''
            };

            saveVisitorToLocalStorage(newVisitor);

            Swal.fire({
                title: 'Visitor Registered!',
                text: `${name} has been pre-registered. QR Pass is ready.`,
                icon: 'success',
                confirmButtonColor: '#2563EB',
                confirmButtonText: 'Generate QR Pass'
            }).then(() => {
                window.location.href = `generate-qr.aspx?visitorId=${newVisitor.id}`;
            });
        });
    }

    // 2. Walk-in visitor form submit
    const walkinForm = document.getElementById('receptionist-walkin-form');
    if (walkinForm) {
        walkinForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(walkinForm, true)) {
                return;
            } else if (!walkinForm.checkValidity()) {
                walkinForm.classList.add('was-validated');
                return;
            }
            
            const name = document.getElementById('walkName').value.trim();
            const phone = document.getElementById('walkPhone').value.trim();
            const company = document.getElementById('walkCompany').value.trim();
            const host = document.getElementById('walkHost').value;
            const purpose = document.getElementById('walkPurpose').value.trim();

            const newVisitor = {
                id: 'VP-WI' + Math.floor(1000 + Math.random() * 9000),
                name,
                email: name.toLowerCase().replace(' ', '') + '@walkin.demo',
                phone,
                company,
                host,
                department: 'Administration',
                purpose,
                date: new Date().toISOString().split('T')[0],
                time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
                status: 'Approved', // Walk-in is auto approved
                photo: document.querySelector('#walk-avatar-preview-img')?.src || 'https://placehold.co/150x150/4f46e5/ffffff?text=' + name.split(' ').map(n=>n[0]).join(''),
                idProof: 'https://placehold.co/400x250/4f46e5/ffffff?text=WalkIn+ID',
                entryTime: '',
                exitTime: ''
            };

            saveVisitorToLocalStorage(newVisitor);

            Swal.fire({
                title: 'Walk-In Registered!',
                text: `${name} registered. Ready to generate pass.`,
                icon: 'success',
                confirmButtonColor: '#2563EB',
                confirmButtonText: 'View Pass'
            }).then(() => {
                window.location.href = `generate-qr.aspx?visitorId=${newVisitor.id}`;
            });
        });
    }
}

// Global approval actions from receptionist console
function approveVisitor(visitorId, refresh = true) {
    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const idx = visitors.findIndex(v => v.id === visitorId);
    if (idx !== -1) {
        visitors[idx].status = 'Approved';
        localStorage.setItem('svpms_visitors', JSON.stringify(visitors));
        showSuccessToast(`Visitor ${visitors[idx].name} approved.`);
        if (refresh) {
            setTimeout(() => location.reload(), 1000);
        }
    }
}

function rejectVisitor(visitorId, refresh = true) {
    Swal.fire({
        title: 'Reject Visit Request',
        text: 'Provide a reason for rejecting this visiting request:',
        input: 'text',
        inputPlaceholder: 'Reason for rejection...',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#E2E8F0',
        confirmButtonText: 'Confirm Reject',
        customClass: {
            cancelButton: 'text-dark'
        },
        inputValidator: (value) => {
            if (!value) {
                return 'You need to write a reason!';
            }
        }
    }).then((result) => {
        if (result.isConfirmed) {
            let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const idx = visitors.findIndex(v => v.id === visitorId);
            if (idx !== -1) {
                visitors[idx].status = 'Rejected';
                localStorage.setItem('svpms_visitors', JSON.stringify(visitors));
                showSuccessToast('Visitor request rejected.');
                if (refresh) {
                    setTimeout(() => location.reload(), 1000);
                }
            }
        }
    });
}

function saveVisitorToLocalStorage(visitor) {
    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    visitors.unshift(visitor); // Add to beginning of array
    localStorage.setItem('svpms_visitors', JSON.stringify(visitors));
}

// Pre-fill Badge page details
function loadBadgeDetails() {
    const badgeName = document.getElementById('badge-visitor-name');
    if (!badgeName) return;

    const urlParams = new URLSearchParams(window.location.search);
    const visitorId = urlParams.get('visitorId') || 'VP-264025';
    
    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const visitor = visitors.find(v => v.id === visitorId);

    if (visitor) {
        document.getElementById('badge-visitor-name').textContent = visitor.name;
        document.getElementById('badge-visitor-company').textContent = visitor.company;
        document.getElementById('badge-visitor-host').textContent = visitor.host;
        document.getElementById('badge-visitor-dept').textContent = visitor.department;
        document.getElementById('badge-visitor-date').textContent = visitor.date;
        document.getElementById('badge-visitor-id').textContent = visitor.id;
        
        if (visitor.photo) {
            document.getElementById('badge-visitor-photo').src = visitor.photo;
        }

        // Print trigger
        const printBtn = document.getElementById('print-badge-trigger-btn');
        if (printBtn) {
            printBtn.addEventListener('click', () => {
                window.print();
            });
        }
    }
}

// Pre-fill QR page details
function loadQRDetails() {
    const qrTitle = document.getElementById('qr-pass-title');
    if (!qrTitle) return;

    const urlParams = new URLSearchParams(window.location.search);
    const visitorId = urlParams.get('visitorId') || 'VP-264025';
    
    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const visitor = visitors.find(v => v.id === visitorId);

    if (visitor) {
        document.getElementById('qr-visitor-name').textContent = visitor.name;
        document.getElementById('qr-visitor-company').textContent = visitor.company;
        document.getElementById('qr-visitor-host').textContent = visitor.host;
        document.getElementById('qr-visitor-date').textContent = visitor.date;
        document.getElementById('qr-visitor-time').textContent = visitor.time;
        document.getElementById('qr-visitor-id').textContent = visitor.id;
        document.getElementById('qr-visitor-status').textContent = visitor.status;
        
        const statusBadge = document.getElementById('qr-visitor-status');
        statusBadge.className = 'status-chip ' + visitor.status.toLowerCase();
        
        if (visitor.photo) {
            document.getElementById('qr-visitor-photo').src = visitor.photo;
        }

        // Action links
        const printLink = document.getElementById('qr-print-link');
        if (printLink) {
            printLink.href = `print-badge.aspx?visitorId=${visitor.id}`;
        }
    }
}
