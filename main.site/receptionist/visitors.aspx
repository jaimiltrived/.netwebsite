<%@ Page Title="Visitor Directory" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="visitors.aspx.cs" Inherits="main.site.ReceptionistVisitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center justify-content-between gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">Visitor Directory</h5>
                    <p class="text-color-secondary fs-7 mb-0">Search, edit, update, delete and print badges for all registered visitor requests.</p>
                </div>
                <div class="d-flex gap-2 w-100 w-md-auto">
                    <select class="form-select form-control-premium text-color-secondary fs-7" id="rec-status-filter" style="width: 160px;">
                        <option value="">All Statuses</option>
                        <option value="Approved">Approved</option>
                        <option value="Pending">Pending</option>
                        <option value="Rejected">Rejected</option>
                        <option value="Inside">Inside</option>
                        <option value="Exited">Exited</option>
                    </select>
                    <button type="button" class="btn btn-premium btn-premium-primary fs-7 text-nowrap" data-bs-toggle="modal" data-bs-target="#addVisitorModal">
                        <i class="bi bi-plus-lg me-1"></i> Register Visitor
                    </button>
                </div>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="receptionist-directory-table">
                    <thead>
                        <tr>
                            <th>Visitor Details</th>
                            <th>Company</th>
                            <th>Host Employee</th>
                            <th>Scheduled Date</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="receptionist-directory-tbody">
                        <!-- Loaded dynamically via JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Visitor Modal -->
    <div class="modal fade" id="addVisitorModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-person-plus-fill text-primary me-2"></i>Register New Visitor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-visitor-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisName">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisName" placeholder="e.g. Rahul Sharma" required minlength="2">
                                <div class="invalid-feedback">Please enter visitor's full name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisEmail">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control form-control-premium" id="addVisEmail" placeholder="e.g. rahul@example.com" required>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisPhone">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control form-control-premium" id="addVisPhone" placeholder="+91 98765 01880" required>
                                <div class="invalid-feedback">Please enter a valid phone number.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisCompany">Company / Organization <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisCompany" placeholder="e.g. Tata Consultancy Services" required>
                                <div class="invalid-feedback">Company name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisHost">Host Employee <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="addVisHost" required>
                                    <option value="Dr. Priya Sharma">Dr. Priya Sharma (IT)</option>
                                    <option value="Arjun Mehta">Arjun Mehta (HR)</option>
                                    <option value="Prof. Anand Kulkarni">Prof. Anand Kulkarni (Academics)</option>
                                    <option value="Capt. Devendra Rathore">Capt. Devendra Rathore (Admin)</option>
                                    <option value="Siddharth Malhotra">Siddharth Malhotra (Engineering)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="addVisDept">Department <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="addVisDept" required>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Human Resources">Human Resources</option>
                                    <option value="Administration">Administration</option>
                                    <option value="Academics">Academics</option>
                                    <option value="Engineering">Engineering</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-premium" for="addVisDate">Schedule Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control form-control-premium" id="addVisDate" required>
                                <div class="invalid-feedback">Please select date.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-premium" for="addVisTime">Schedule Time <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisTime" placeholder="10:00 AM" required>
                                <div class="invalid-feedback">Please specify arrival time.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-premium" for="addVisStatus">Pass Status <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="addVisStatus" required>
                                    <option value="Approved" selected>Approved</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Inside">Inside</option>
                                    <option value="Exited">Exited</option>
                                    <option value="Rejected">Rejected</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <label class="form-label-premium" for="addVisPurpose">Purpose of Visit <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="addVisPurpose" placeholder="e.g. Official Vendor Meeting" required>
                                <div class="invalid-feedback">Please specify purpose of visit.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-plus-circle me-1"></i>Register Visitor</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Visitor Modal -->
    <div class="modal fade" id="editVisitorModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Visitor Record</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-visitor-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisId">Pass ID</label>
                                <input type="text" class="form-control form-control-premium bg-light" id="editVisId" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisStatus">Pass Status <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="editVisStatus" required>
                                    <option value="Approved">Approved</option>
                                    <option value="Inside">Inside</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Exited">Exited</option>
                                    <option value="Rejected">Rejected</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisName">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="editVisName" required minlength="2">
                                <div class="invalid-feedback">Please enter visitor's full name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisEmail">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control form-control-premium" id="editVisEmail" required>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisPhone">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control form-control-premium" id="editVisPhone" required>
                                <div class="invalid-feedback">Please enter a valid phone number.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisCompany">Company / Organization <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="editVisCompany" required>
                                <div class="invalid-feedback">Please enter company name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisHost">Host Employee <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="editVisHost" required>
                                    <option value="Dr. Priya Sharma">Dr. Priya Sharma (IT)</option>
                                    <option value="Arjun Mehta">Arjun Mehta (HR)</option>
                                    <option value="Prof. Anand Kulkarni">Prof. Anand Kulkarni (Academics)</option>
                                    <option value="Capt. Devendra Rathore">Capt. Devendra Rathore (Admin)</option>
                                    <option value="Siddharth Malhotra">Siddharth Malhotra (Engineering)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisDept">Department <span class="text-danger">*</span></label>
                                <select class="form-select form-control-premium" id="editVisDept" required>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Human Resources">Human Resources</option>
                                    <option value="Administration">Administration</option>
                                    <option value="Academics">Academics</option>
                                    <option value="Engineering">Engineering</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisDate">Schedule Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control form-control-premium" id="editVisDate" required>
                                <div class="invalid-feedback">Please select date.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-premium" for="editVisTime">Schedule Time <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-premium" id="editVisTime" placeholder="e.g. 10:30 AM" required>
                                <div class="invalid-feedback">Please specify schedule time.</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label-premium" for="editVisPurpose">Purpose of Visit</label>
                                <input type="text" class="form-control form-control-premium" id="editVisPurpose" placeholder="e.g. Official Meeting">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-save me-1"></i>Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
    function getRecVisitors() {
        return JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    }

    function saveRecVisitors(list) {
        localStorage.setItem('svpms_visitors', JSON.stringify(list));
    }

    function renderRecVisitorsTable(filterStatus = '') {
        const table = document.getElementById('receptionist-directory-table');
        if (!table) return;

        if ($.fn.DataTable.isDataTable('#receptionist-directory-table')) {
            $('#receptionist-directory-table').DataTable().destroy();
        }

        const tbody = document.getElementById('receptionist-directory-tbody');
        if (!tbody) return;
        tbody.innerHTML = '';

        let visitors = getRecVisitors();
        if (filterStatus) {
            visitors = visitors.filter(v => v.status.toLowerCase() === filterStatus.toLowerCase());
        }

        visitors.forEach(v => {
            const tr = document.createElement('tr');
            
            let actionsHtml = `
                <div class="d-flex align-items-center justify-content-end gap-1">
                    <a href="visitor-details.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-info btn-premium-outline" data-bs-toggle="tooltip" title="View Details">
                        <i class="bi bi-eye"></i>
                    </a>
                    <a href="generate-qr.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-primary btn-premium-outline" data-bs-toggle="tooltip" title="QR Pass">
                        <i class="bi bi-qr-code"></i>
                    </a>
                    <a href="print-badge.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-secondary btn-premium-outline" data-bs-toggle="tooltip" title="Print Badge">
                        <i class="bi bi-printer"></i>
                    </a>
                    <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline" onclick="openEditVisitorModal('${v.id}')" data-bs-toggle="tooltip" title="Edit Visitor">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-danger btn-premium-outline" onclick="deleteVisitor('${v.id}')" data-bs-toggle="tooltip" title="Delete Visitor">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
            `;

            tr.innerHTML = `
                <td>
                    <div class="d-flex align-items-center gap-2">
                        <img src="${v.photo || 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'}" alt="${v.name}" class="avatar avatar-sm">
                        <div>
                            <div class="text-bold text-color-primary">${v.name}</div>
                            <small class="text-color-muted fs-8">${v.id}</small>
                        </div>
                    </div>
                </td>
                <td>${v.company}</td>
                <td>
                    <div class="text-semibold text-color-primary">${v.host}</div>
                    <small class="text-color-secondary fs-8">${v.department}</small>
                </td>
                <td>
                    <div class="text-color-primary">${v.date}</div>
                    <small class="text-color-muted fs-8">${v.time}</small>
                </td>
                <td>
                    <span class="status-chip ${(v.status || '').toLowerCase()}">${v.status}</span>
                </td>
                <td>${actionsHtml}</td>
            `;
            tbody.appendChild(tr);
        });

        initPremiumDataTable('#receptionist-directory-table');
    }

    function openEditVisitorModal(visId) {
        const visitors = getRecVisitors();
        const v = visitors.find(item => item.id === visId);
        if (!v) return;

        document.getElementById('editVisId').value = v.id;
        document.getElementById('editVisName').value = v.name || '';
        document.getElementById('editVisEmail').value = v.email || '';
        document.getElementById('editVisPhone').value = v.phone || '';
        document.getElementById('editVisCompany').value = v.company || '';
        document.getElementById('editVisHost').value = v.host || 'Dr. Priya Sharma';
        document.getElementById('editVisDept').value = v.department || 'Information Technology';
        document.getElementById('editVisDate').value = v.date || '';
        document.getElementById('editVisTime').value = v.time || '';
        document.getElementById('editVisStatus').value = v.status || 'Approved';
        if (document.getElementById('editVisPurpose')) {
            document.getElementById('editVisPurpose').value = v.purpose || '';
        }

        const modalEl = document.getElementById('editVisitorModal');
        if (modalEl) {
            const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
            modal.show();
        }
    }

    function deleteVisitor(visId) {
        const visitors = getRecVisitors();
        const v = visitors.find(item => item.id === visId);
        const visName = v ? v.name : visId;

        Swal.fire({
            title: 'Delete Visitor?',
            text: `Are you sure you want to delete visitor ${visId} (${visName})?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#EF4444',
            cancelButtonColor: '#64748B',
            confirmButtonText: 'Yes, Delete',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                const updated = visitors.filter(item => item.id !== visId);
                saveRecVisitors(updated);
                renderRecVisitorsTable(document.getElementById('rec-status-filter')?.value || '');
                if (typeof showSuccessToast === 'function') {
                    showSuccessToast(`Visitor ${visName} deleted successfully.`);
                }
            }
        });
    }

    document.addEventListener('DOMContentLoaded', () => {
        renderRecVisitorsTable();

        const statusFilter = document.getElementById('rec-status-filter');
        if (statusFilter) {
            statusFilter.addEventListener('change', () => {
                renderRecVisitorsTable(statusFilter.value);
            });
        }

        const addForm = document.getElementById('add-visitor-form');
        if (addForm) {
            addForm.addEventListener('submit', (e) => {
                e.preventDefault();
                if (window.SVPMSForms && !window.SVPMSForms.validateForm(addForm, true)) {
                    return;
                }

                const name = document.getElementById('addVisName').value.trim();
                const email = document.getElementById('addVisEmail').value.trim();
                const phone = document.getElementById('addVisPhone').value.trim();
                const company = document.getElementById('addVisCompany').value.trim();
                const host = document.getElementById('addVisHost').value;
                const dept = document.getElementById('addVisDept').value;
                const date = document.getElementById('addVisDate').value || new Date().toISOString().split('T')[0];
                const time = document.getElementById('addVisTime').value.trim() || '10:00 AM';
                const status = document.getElementById('addVisStatus').value;
                const purpose = document.getElementById('addVisPurpose').value.trim();

                const visitors = getRecVisitors();
                const newVis = {
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
                    status,
                    photo: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                    idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=' + encodeURIComponent(name) + '+ID',
                    entryTime: status === 'Inside' ? time : '',
                    exitTime: status === 'Exited' ? time : ''
                };

                visitors.unshift(newVis);
                saveRecVisitors(visitors);

                const modalEl = document.getElementById('addVisitorModal');
                if (modalEl) {
                    const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                    modal.hide();
                }

                addForm.reset();
                addForm.classList.remove('was-validated');
                addForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

                renderRecVisitorsTable(statusFilter ? statusFilter.value : '');

                if (typeof showSuccessToast === 'function') {
                    showSuccessToast(`Visitor ${name} registered successfully.`);
                } else {
                    Swal.fire('Registered!', `${name} has been added.`, 'success');
                }
            });
        }

        const editForm = document.getElementById('edit-visitor-form');
        if (editForm) {
            editForm.addEventListener('submit', (e) => {
                e.preventDefault();
                if (window.SVPMSForms && !window.SVPMSForms.validateForm(editForm, true)) {
                    return;
                }

                const visId = document.getElementById('editVisId').value;
                const name = document.getElementById('editVisName').value.trim();
                const email = document.getElementById('editVisEmail').value.trim();
                const phone = document.getElementById('editVisPhone').value.trim();
                const company = document.getElementById('editVisCompany').value.trim();
                const host = document.getElementById('editVisHost').value;
                const dept = document.getElementById('editVisDept').value;
                const date = document.getElementById('editVisDate').value;
                const time = document.getElementById('editVisTime').value;
                const status = document.getElementById('editVisStatus').value;
                const purpose = document.getElementById('editVisPurpose') ? document.getElementById('editVisPurpose').value.trim() : '';

                const visitors = getRecVisitors();
                const idx = visitors.findIndex(v => v.id === visId);
                if (idx !== -1) {
                    visitors[idx].name = name;
                    visitors[idx].email = email;
                    visitors[idx].phone = phone;
                    visitors[idx].company = company;
                    visitors[idx].host = host;
                    visitors[idx].department = dept;
                    visitors[idx].date = date;
                    visitors[idx].time = time;
                    visitors[idx].status = status;
                    if (purpose) visitors[idx].purpose = purpose;
                    saveRecVisitors(visitors);
                }

                const modalEl = document.getElementById('editVisitorModal');
                if (modalEl) {
                    const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                    modal.hide();
                }

                renderRecVisitorsTable(statusFilter ? statusFilter.value : '');

                if (typeof showSuccessToast === 'function') {
                    showSuccessToast(`Visitor ${name} updated successfully.`);
                } else {
                    Swal.fire('Updated!', 'Visitor details have been saved.', 'success');
                }
            });
        }
    });

    window.openEditVisitorModal = openEditVisitorModal;
    window.deleteVisitor = deleteVisitor;
</script>
</asp:Content>
