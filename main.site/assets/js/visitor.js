/* svpms/assets/js/visitor.js */

document.addEventListener('DOMContentLoaded', () => {
    initNavbarAuth();
    initPublicVisitorRegistration();
    loadVisitorStatusTimeline();
    loadVisitorQRPass();
});

// Public registration submit
function initPublicVisitorRegistration() {
    const publicRegForm = document.getElementById('public-register-form');
    if (!publicRegForm) return;

    publicRegForm.addEventListener('submit', (e) => {
        e.preventDefault();
        if (window.SVPMSForms && !window.SVPMSForms.validateForm(publicRegForm)) {
            return;
        } else if (!publicRegForm.checkValidity()) {
            publicRegForm.classList.add('was-validated');
            return;
        }

        const name = document.getElementById('pubName').value;
        const email = document.getElementById('pubEmail').value;
        const phone = document.getElementById('pubPhone').value;
        const company = document.getElementById('pubCompany').value;
        const host = document.getElementById('pubHost').value;
        const dept = document.getElementById('pubDept').value;
        const purpose = document.getElementById('pubPurpose').value;
        const date = document.getElementById('pubDate').value;
        const time = document.getElementById('pubTime').value;

        const newVisitor = {
            id: 'VP-PUB' + Math.floor(1000 + Math.random() * 9000),
            name,
            email,
            phone,
            company,
            host,
            department: dept,
            purpose,
            date,
            time,
            status: 'Pending', // Public registration requires host verification first
            photo: document.getElementById('avatar-preview-img')?.src || 'https://placehold.co/150x150/06b6d4/ffffff?text=' + name.split(' ').map(n=>n[0]).join(''),
            idProof: 'https://placehold.co/400x250/06b6d4/ffffff?text=Public+ID',
            entryTime: '',
            exitTime: ''
        };

        // Save to localStorage
        let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
        visitors.unshift(newVisitor);
        localStorage.setItem('svpms_visitors', JSON.stringify(visitors));

        Swal.fire({
            title: 'Request Submitted!',
            text: `Your visit request has been sent for employee host approval. Your Pass ID is ${newVisitor.id}.`,
            icon: 'success',
            confirmButtonColor: '#2563EB',
            confirmButtonText: 'Track Status'
        }).then(() => {
            window.location.href = `status.aspx?visitorId=${newVisitor.id}`;
        });
    });
}

// Load tracking timeline
function loadVisitorStatusTimeline() {
    const timelineContainer = document.getElementById('visitor-status-container');
    if (!timelineContainer) return;

    const urlParams = new URLSearchParams(window.location.search);
    const visitorId = urlParams.get('visitorId');

    if (!visitorId) {
        timelineContainer.innerHTML = `
            <div class="empty-state text-center py-5" data-aos="fade-up">
                <i class="bi bi-search empty-state-icon text-primary fs-1 mb-3"></i>
                <h5 class="text-bold">No Active Tracking File</h5>
                <p class="text-color-secondary">Please enter a Pass ID in the Track tab above to lookup live gate logs.</p>
            </div>
        `;
        return;
    }

    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const visitor = visitors.find(v => v.id === visitorId);

    if (!visitor) {
        timelineContainer.innerHTML = `
            <div class="empty-state text-center py-5" data-aos="fade-up">
                <i class="bi bi-x-circle text-danger empty-state-icon fs-1 mb-3"></i>
                <h5 class="text-bold">Pass ID Not Found</h5>
                <p class="text-color-secondary">The ID "${visitorId}" does not exist or has expired. Please verify spelling.</p>
                <a href="index.aspx" class="btn btn-premium btn-premium-primary mt-3">Back to Portal Home</a>
            </div>
        `;
        return;
    }

    const status = visitor.status;
    let s1 = '', s2 = '', s3 = '', s4 = '', s5 = '';
    
    if (status === 'Pending') {
        s1 = 'completed'; 
        s2 = 'active';    
    } else if (status === 'Approved') {
        s1 = 'completed';
        s2 = 'completed';
        s3 = 'active';    
    } else if (status === 'Inside') {
        s1 = 'completed';
        s2 = 'completed';
        s3 = 'completed';
        s4 = 'active';    
    } else if (status === 'Exited') {
        s1 = 'completed';
        s2 = 'completed';
        s3 = 'completed';
        s4 = 'completed';
        s5 = 'completed'; 
    } else if (status === 'Rejected') {
        s1 = 'completed';
        s2 = 'completed';
        s3 = 'rejected';
    }

    // Dynamic QR generation if approved or checked in
    let qrSectionHtml = '';
    if (status === 'Approved' || status === 'Inside') {
        const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${visitor.id}`;
        qrSectionHtml = `
            <div class="mt-4 pt-4 border-top text-center" data-aos="zoom-in">
                <h6 class="text-bold text-color-primary mb-3"><i class="bi bi-qr-code-scan"></i> Your Digital Security Pass Card</h6>
                <div class="card p-4 mx-auto bg-card-theme border rounded-card shadow-sm" style="max-width: 320px;">
                    <div class="d-flex align-items-center gap-3 mb-3 text-start">
                        <img src="${visitor.photo}" class="rounded-circle border" style="width: 50px; height: 50px; object-fit: cover;">
                        <div>
                            <h6 class="text-bold text-color-primary mb-0">${visitor.name}</h6>
                            <small class="text-color-muted">${visitor.company}</small>
                        </div>
                    </div>
                    <div class="p-3 bg-white rounded-card border d-inline-block mx-auto mb-3">
                        <img src="${qrUrl}" alt="Access QR Code" style="width: 140px; height: 140px;">
                    </div>
                    <h5 class="text-bold text-primary mb-1">${visitor.id}</h5>
                    <span class="status-chip ${status.toLowerCase()} mx-auto d-inline-block mb-3">${status}</span>
                    <div class="d-flex gap-2">
                        <button onclick="window.print()" class="btn btn-premium btn-premium-primary btn-sm flex-grow-1"><i class="bi bi-printer"></i> Print Badge</button>
                        <button onclick="Swal.fire('Success', 'PDF version cached.', 'success')" class="btn btn-premium btn-premium-outline btn-sm flex-grow-1"><i class="bi bi-file-pdf"></i> Save PDF</button>
                    </div>
                </div>
            </div>
        `;
    }

    const defaultPhoto = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80';

    let timelineHtml = `
        <div class="card-premium p-4 shadow-lg border" data-aos="fade-up">
            <!-- Profile Info Header -->
            <div class="d-flex align-items-center gap-3 mb-4 flex-wrap pb-3 border-bottom">
                <img src="${visitor.photo || defaultPhoto}" alt="Visitor Photo" class="rounded-circle border border-2 border-primary" style="width: 70px; height: 70px; object-fit: cover;">
                <div class="flex-grow-1">
                    <div class="d-flex align-items-center gap-2 flex-wrap">
                        <h4 class="text-bold text-color-primary mb-0">${visitor.name}</h4>
                        <span class="status-chip ${status.toLowerCase()}">${status}</span>
                    </div>
                    <p class="text-color-secondary mb-0 fs-7">Company: <strong>${visitor.company}</strong> | ID: <strong>${visitor.id}</strong></p>
                </div>
            </div>

            <!-- Profile Info Details Grid -->
            <div class="row g-3 fs-7 mb-4 bg-light bg-opacity-25 p-3 rounded-card border">
                <div class="col-md-6 border-end">
                    <h6 class="text-bold text-primary mb-2"><i class="bi bi-person-lines-fill"></i> Contact Details</h6>
                    <p class="mb-1 text-truncate"><strong>Email:</strong> ${visitor.email}</p>
                    <p class="mb-1"><strong>Phone:</strong> ${visitor.phone}</p>
                    <button type="button" class="btn btn-sm btn-link text-primary p-0 border-0 fs-8 mt-2" onclick="window.viewIdProof('${visitor.idProof}')"><i class="bi bi-card-image"></i> View Uploaded ID Proof</button>
                </div>
                <div class="col-md-6">
                    <h6 class="text-bold text-primary mb-2"><i class="bi bi-info-circle-fill"></i> Visit Schedule</h6>
                    <p class="mb-1"><strong>Host:</strong> ${visitor.host}</p>
                    <p class="mb-1"><strong>Dept:</strong> ${visitor.department}</p>
                    <p class="mb-1"><strong>Purpose:</strong> ${visitor.purpose}</p>
                    <p class="mb-0"><strong>Schedule:</strong> ${visitor.date} at ${visitor.time}</p>
                </div>
            </div>

            ${status === 'Rejected' ? `
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <i class="bi bi-exclamation-octagon-fill me-3 fs-4"></i>
                    <div>
                        <strong>Visiting Request Denied:</strong> Your visit registration request has been rejected by the employee host. Please contact support or book a new slot.
                    </div>
                </div>
            ` : ''}

            <!-- Vertical Timeline Logs -->
            <h6 class="text-bold text-color-primary mb-3"><i class="bi bi-clock-history"></i> Access Audit Tracking Logs</h6>
            <ul class="timeline-vertical mt-2">
                <li class="timeline-item ${s1}">
                    <div class="timeline-marker"><i class="bi bi-send"></i></div>
                    <div class="timeline-content">
                        <h6 class="text-bold text-color-primary mb-0">Registration Request Submitted</h6>
                        <small class="text-color-muted">Done on form submission.</small>
                    </div>
                </li>
                <li class="timeline-item ${s2}">
                    <div class="timeline-marker"><i class="bi bi-eye"></i></div>
                    <div class="timeline-content">
                        <h6 class="text-bold text-color-primary mb-0">Host Employee Verification</h6>
                        <small class="text-color-muted">Under review by ${visitor.host}.</small>
                    </div>
                </li>
                <li class="timeline-item ${s3}">
                    <div class="timeline-marker"><i class="bi bi-qr-code"></i></div>
                    <div class="timeline-content">
                        <h6 class="text-bold text-color-primary mb-0">QR Digital Pass Generated</h6>
                        <small class="text-color-muted">Active immediately for scanning at gates upon approval.</small>
                    </div>
                </li>
                <li class="timeline-item ${s4}">
                    <div class="timeline-marker"><i class="bi bi-door-open"></i></div>
                    <div class="timeline-content">
                        <h6 class="text-bold text-color-primary mb-0">In-Facility (Inside Campus)</h6>
                        <small class="text-color-muted">Logged by security guard scanning upon gate arrival.</small>
                    </div>
                </li>
                <li class="timeline-item ${s5}">
                    <div class="timeline-marker"><i class="bi bi-check2-all"></i></div>
                    <div class="timeline-content">
                        <h6 class="text-bold text-color-primary mb-0">Visit Completed & Logged Out</h6>
                        <small class="text-color-muted">Logged by security guard scanning upon campus exit.</small>
                    </div>
                </li>
            </ul>

            <!-- QR Section placeholder -->
            ${qrSectionHtml}

            <div class="text-center mt-4">
                <a href="index.aspx" class="btn btn-premium btn-premium-outline"><i class="bi bi-house"></i> Portal Home</a>
            </div>
        </div>
    `;

    timelineContainer.innerHTML = timelineHtml;
}

// Global function to view ID document proof popup
window.viewIdProof = function(url) {
    Swal.fire({
        imageUrl: url || 'https://placehold.co/400x250/2563eb/ffffff?text=No+ID+Doc+Found',
        imageAlt: 'Government ID Proof',
        title: 'Visitor ID Credentials Proof',
        confirmButtonColor: '#2563EB',
        confirmButtonText: 'Close Panel'
    });
};

// Public QR Pass page loader
function loadVisitorQRPass() {
    const pubPass = document.getElementById('public-pass-id');
    if (!pubPass) return;

    const urlParams = new URLSearchParams(window.location.search);
    const visitorId = urlParams.get('visitorId') || 'VP-PUB2015';

    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const visitor = visitors.find(v => v.id === visitorId);

    if (visitor) {
        document.getElementById('pub-visitor-name').textContent = visitor.name;
        document.getElementById('pub-visitor-company').textContent = visitor.company;
        document.getElementById('pub-visitor-host').textContent = visitor.host;
        document.getElementById('pub-visitor-date').textContent = visitor.date;
        document.getElementById('pub-visitor-time').textContent = visitor.time;
        document.getElementById('pub-visitor-id').textContent = visitor.id;
        document.getElementById('pub-visitor-status').textContent = visitor.status;
        
        const statusBadge = document.getElementById('pub-visitor-status');
        statusBadge.className = 'status-chip ' + visitor.status.toLowerCase();

        if (visitor.photo) {
            document.getElementById('pub-visitor-photo').src = visitor.photo;
        }

        // Print trigger
        const printBtn = document.getElementById('pub-print-pass-btn');
        if (printBtn) {
            printBtn.addEventListener('click', () => {
                window.print();
            });
        }
    }
}

function initNavbarAuth() {
    const role = localStorage.getItem('svpms_role');
    const name = localStorage.getItem('svpms_name');
    
    if (role && name) {
        const loginBtn = document.querySelector('a[href="../login.aspx"]');
        if (loginBtn) {
            // Transform into Logout button
            loginBtn.innerHTML = '<i class="bi bi-box-arrow-right text-danger"></i> Logout';
            loginBtn.href = '#';
            loginBtn.className = 'btn btn-premium btn-premium-outline border-danger text-danger fs-7 py-2';
            loginBtn.id = 'visitor-navbar-logout-btn';
            
            loginBtn.addEventListener('click', (e) => {
                e.preventDefault();
                Swal.fire({
                    title: 'Logout',
                    text: 'Are you sure you want to sign out of the staff session?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#EF4444',
                    cancelButtonColor: '#E2E8F0',
                    confirmButtonText: 'Yes, Sign Out',
                    cancelButtonText: 'Cancel',
                    customClass: {
                        cancelButton: 'text-dark'
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        localStorage.removeItem('svpms_role');
                        localStorage.removeItem('svpms_name');
                        
                        Swal.fire({
                            title: 'Signed Out!',
                            text: 'You have been logged out successfully.',
                            icon: 'success',
                            confirmButtonColor: '#2563EB'
                        }).then(() => {
                            window.location.reload();
                        });
                    }
                });
            });

            // Prepend Dashboard link shortcut
            const parent = loginBtn.parentElement;
            if (parent) {
                const dashBtn = document.createElement('a');
                dashBtn.href = `../${role}/dashboard.aspx`;
                dashBtn.className = 'btn btn-premium btn-premium-primary fs-7 py-2 me-2';
                dashBtn.innerHTML = '<i class="bi bi-speedometer2"></i> Dashboard';
                parent.insertBefore(dashBtn, loginBtn);
            }
        }
    }
}
