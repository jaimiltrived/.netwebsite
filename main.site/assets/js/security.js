/* svpms/assets/js/security.js */

document.addEventListener('DOMContentLoaded', () => {
    initScanner();
    initEntryVerification();
    initExitVerification();
    initIncidentReporting();
});

// Simulator Scanner Logic
function initScanner() {
    const scannerForm = document.getElementById('scanner-mock-form');
    if (!scannerForm) return;

    scannerForm.addEventListener('submit', (e) => {
        e.preventDefault();
        if (window.SVPMSForms && !window.SVPMSForms.validateForm(scannerForm)) {
            return;
        } else if (!scannerForm.checkValidity()) {
            scannerForm.classList.add('was-validated');
            return;
        }

        const input = document.getElementById('scanner-code-input');
        const code = input ? input.value.trim().toUpperCase() : '';
        
        if (!code) {
            if (input) input.classList.add('is-invalid');
            showErrorToast('Please enter a Pass ID.');
            return;
        }

        let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
        const visitor = visitors.find(v => v.id === code);

        if (!visitor) {
            // Check if it matches blacklisted ids
            const blacklist = JSON.parse(localStorage.getItem('svpms_blacklisted_ids') || '[]');
            if (blacklist.includes(code)) {
                Swal.fire({
                    title: 'BLACKLIST WARNING!',
                    text: `Pass ${code} belongs to a blacklisted individual. Bar entry immediately!`,
                    icon: 'error',
                    confirmButtonColor: '#EF4444'
                });
                return;
            }
            
            showErrorToast('Invalid Pass ID. Code not found.');
            return;
        }

        // Direct based on status
        if (visitor.status === 'Approved') {
            window.location.href = `entry-verification.aspx?visitorId=${visitor.id}`;
        } else if (visitor.status === 'Inside') {
            window.location.href = `exit-verification.aspx?visitorId=${visitor.id}`;
        } else if (visitor.status === 'Pending') {
            Swal.fire({
                title: 'Entry Denied',
                text: `Visitor ${visitor.name} has not been approved by the host employee yet.`,
                icon: 'warning',
                confirmButtonColor: '#F59E0B'
            });
        } else if (visitor.status === 'Rejected') {
            Swal.fire({
                title: 'Entry Blocked',
                text: `Visiting request for ${visitor.name} has been Rejected.`,
                icon: 'error',
                confirmButtonColor: '#EF4444'
            });
        } else if (visitor.status === 'Exited') {
            Swal.fire({
                title: 'Expired Pass',
                text: `Visitor ${visitor.name} has already checked out. This pass is no longer active.`,
                icon: 'info',
                confirmButtonColor: '#06B6D4'
            });
        }
    });
}

// Entry verification actions
function initEntryVerification() {
    const entryPage = document.getElementById('entry-verification-container');
    if (!entryPage) return;

    const urlParams = new URLSearchParams(window.location.search);
    const visitorId = urlParams.get('visitorId');

    if (!visitorId) {
        // Show manual lookup form if no query param is loaded
        entryPage.innerHTML = `
            <div class="row g-4 justify-content-center" data-aos="fade-up">
                <div class="col-lg-6">
                    <div class="card-premium text-center shadow-lg border">
                        <div class="kpi-icon primary mx-auto mb-3" style="width: 60px; height: 60px; font-size: 1.8rem;">
                            <i class="bi bi-box-arrow-in-right"></i>
                        </div>
                        <h4 class="text-bold text-color-primary mb-2">Gate Entry Verification</h4>
                        <p class="text-color-secondary fs-7 mb-4">No visitor file loaded. Scan a QR code at the gate camera or enter a Pass ID manually below to audit the pass.</p>
                        
                        <form id="entry-manual-lookup-form" class="text-start needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label-premium" for="entryLookupId">Enter Pass ID</label>
                                <input type="text" class="form-control form-control-premium" id="entryLookupId" placeholder="e.g. VP-264025" required minlength="3">
                                <div class="invalid-feedback">Please enter a valid Pass ID (e.g. VP-264025).</div>
                            </div>
                            <button type="submit" class="btn btn-premium btn-premium-primary w-100 py-3"><i class="bi bi-shield-check"></i> Load Visitor File</button>
                        </form>
                    </div>
                </div>
            </div>
        `;
        
        const lookupForm = document.getElementById('entry-manual-lookup-form');
        lookupForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(lookupForm)) {
                return;
            } else if (!lookupForm.checkValidity()) {
                lookupForm.classList.add('was-validated');
                return;
            }
            const input = document.getElementById('entryLookupId');
            const id = input.value.trim().toUpperCase();
            if (id) {
                const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
                const v = visitors.find(item => item.id === id);
                if (v) {
                    window.location.href = `entry-verification.aspx?visitorId=${encodeURIComponent(v.id)}`;
                } else {
                    input.classList.add('is-invalid');
                    showErrorToast('Pass ID not found in database.');
                }
            }
        });
        return;
    }

    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const visitor = visitors.find(v => v.id === visitorId);

    if (visitor) {
        // Load details to page
        document.getElementById('entry-visitor-name').textContent = visitor.name;
        document.getElementById('entry-visitor-company').textContent = visitor.company;
        document.getElementById('entry-visitor-host').textContent = visitor.host;
        document.getElementById('entry-visitor-purpose').textContent = visitor.purpose;
        document.getElementById('entry-visitor-schedule').textContent = visitor.date + ' at ' + visitor.time;
        document.getElementById('entry-visitor-id').textContent = visitor.id;
        
        if (visitor.photo) {
            document.getElementById('entry-visitor-photo').src = visitor.photo;
        }

        // Action handles
        document.getElementById('btn-allow-entry').addEventListener('click', () => {
            allowVisitorEntry(visitor.id);
        });

        document.getElementById('btn-reject-entry').addEventListener('click', () => {
            rejectVisitorEntry(visitor.id);
        });
    }
}

function allowVisitorEntry(visitorId) {
    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const idx = visitors.findIndex(v => v.id === visitorId);
    if (idx !== -1) {
        visitors[idx].status = 'Inside';
        visitors[idx].entryTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        localStorage.setItem('svpms_visitors', JSON.stringify(visitors));

        // Add to entry logs
        let entryLogs = JSON.parse(localStorage.getItem('svpms_entry_logs') || '[]');
        entryLogs.unshift({
            id: visitorId,
            name: visitors[idx].name,
            photo: visitors[idx].photo,
            gate: 'Main Gate A',
            date: new Date().toLocaleDateString(),
            time: visitors[idx].entryTime,
            officer: localStorage.getItem('svpms_name') || 'Officer Vikram Singh'
        });
        localStorage.setItem('svpms_entry_logs', JSON.stringify(entryLogs));

        Swal.fire({
            title: 'Entry Recorded!',
            text: `${visitors[idx].name} checked-in successfully.`,
            icon: 'success',
            confirmButtonColor: '#2563EB'
        }).then(() => {
            window.location.href = 'dashboard.aspx';
        });
    }
}

function rejectVisitorEntry(visitorId) {
    Swal.fire({
        title: 'Report Incident or Bar Entry?',
        text: "Are you sure you want to deny entry to this visitor?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#E2E8F0',
        confirmButtonText: 'Deny Entry',
        customClass: {
            cancelButton: 'text-dark'
        }
    }).then((result) => {
        if (result.isConfirmed) {
            let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const idx = visitors.findIndex(v => v.id === visitorId);
            if (idx !== -1) {
                visitors[idx].status = 'Rejected';
                localStorage.setItem('svpms_visitors', JSON.stringify(visitors));
            }
            window.location.href = 'dashboard.aspx';
        }
    });
}

// Exit verification actions
function initExitVerification() {
    const exitPage = document.getElementById('exit-verification-container');
    if (!exitPage) return;

    const urlParams = new URLSearchParams(window.location.search);
    const visitorId = urlParams.get('visitorId');

    if (!visitorId) {
        // Show manual lookup form if no query param is loaded
        exitPage.innerHTML = `
            <div class="row g-4 justify-content-center" data-aos="fade-up">
                <div class="col-lg-6">
                    <div class="card-premium text-center shadow-lg border">
                        <div class="kpi-icon secondary mx-auto mb-3" style="width: 60px; height: 60px; font-size: 1.8rem;">
                            <i class="bi bi-box-arrow-left"></i>
                        </div>
                        <h4 class="text-bold text-color-primary mb-2">Gate Exit Verification</h4>
                        <p class="text-color-secondary fs-7 mb-4">No active visitor checked in. Enter a Pass ID manually below to register campus exit check-out.</p>
                        
                        <form id="exit-manual-lookup-form" class="text-start needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label-premium" for="exitLookupId">Enter Pass ID</label>
                                <input type="text" class="form-control form-control-premium" id="exitLookupId" placeholder="e.g. VP-264027" required minlength="3">
                                <div class="invalid-feedback">Please enter a valid Pass ID (e.g. VP-264027).</div>
                            </div>
                            <button type="submit" class="btn btn-premium btn-premium-primary w-100 py-3"><i class="bi bi-shield-check"></i> Load Visitor File</button>
                        </form>
                    </div>
                </div>
            </div>
        `;
        
        const exitLookupForm = document.getElementById('exit-manual-lookup-form');
        exitLookupForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(exitLookupForm)) {
                return;
            } else if (!exitLookupForm.checkValidity()) {
                exitLookupForm.classList.add('was-validated');
                return;
            }
            const input = document.getElementById('exitLookupId');
            const id = input.value.trim().toUpperCase();
            if (id) {
                const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
                const v = visitors.find(item => item.id === id && item.status === 'Inside');
                if (v) {
                    window.location.href = `exit-verification.aspx?visitorId=${encodeURIComponent(v.id)}`;
                } else {
                    input.classList.add('is-invalid');
                    showErrorToast('Pass ID not found or visitor is not checked in.');
                }
            }
        });
        return;
    }

    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const visitor = visitors.find(v => v.id === visitorId);

    if (visitor) {
        document.getElementById('exit-visitor-name').textContent = visitor.name;
        document.getElementById('exit-visitor-company').textContent = visitor.company;
        document.getElementById('exit-visitor-host').textContent = visitor.host;
        document.getElementById('exit-visitor-entry-time').textContent = visitor.entryTime || '10:00 AM';
        document.getElementById('exit-visitor-id').textContent = visitor.id;
        
        if (visitor.photo) {
            document.getElementById('exit-visitor-photo').src = visitor.photo;
        }

        // Action handles
        document.getElementById('btn-confirm-exit').addEventListener('click', () => {
            confirmVisitorExit(visitor.id);
        });
    }
}

function confirmVisitorExit(visitorId) {
    let visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    const idx = visitors.findIndex(v => v.id === visitorId);
    if (idx !== -1) {
        visitors[idx].status = 'Exited';
        visitors[idx].exitTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        localStorage.setItem('svpms_visitors', JSON.stringify(visitors));

        // Add to exit logs
        let exitLogs = JSON.parse(localStorage.getItem('svpms_exit_logs') || '[]');
        exitLogs.unshift({
            id: visitorId,
            name: visitors[idx].name,
            photo: visitors[idx].photo,
            gate: 'Main Gate A',
            date: new Date().toLocaleDateString(),
            time: visitors[idx].exitTime,
            officer: localStorage.getItem('svpms_name') || 'Officer Vikram Singh'
        });
        localStorage.setItem('svpms_exit_logs', JSON.stringify(exitLogs));

        Swal.fire({
            title: 'Exit Completed!',
            text: `${visitors[idx].name} checked-out successfully.`,
            icon: 'success',
            confirmButtonColor: '#2563EB'
        }).then(() => {
            window.location.href = 'dashboard.aspx';
        });
    }
}

// Incident Report form submit
function initIncidentReporting() {
    const reportForm = document.getElementById('incident-report-form');
    if (!reportForm || reportForm.dataset.listenerAttached === 'true') return;
    reportForm.dataset.listenerAttached = 'true';

    reportForm.addEventListener('submit', (e) => {
        e.preventDefault();
        if (window.SVPMSForms && !window.SVPMSForms.validateForm(reportForm)) {
            return;
        } else if (!reportForm.checkValidity()) {
            reportForm.classList.add('was-validated');
            return;
        }
        
        const type = document.getElementById('incType').value;
        
        Swal.fire({
            title: 'Incident Submitted!',
            text: `Incident type: ${type} has been reported.`,
            icon: 'success',
            confirmButtonColor: '#2563EB'
        }).then(() => {
            reportForm.reset();
            reportForm.classList.remove('was-validated');
            reportForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));
            window.location.href = 'dashboard.aspx';
        });
    });
}
