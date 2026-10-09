<%@ Page Title="Access Blacklist" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="blacklist.aspx.cs" Inherits="main.site.AdminBlacklist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
    <main class="main-content flex-grow-1">
        <div class="card-premium" data-aos="fade-up">
            <div class="card-premium-header flex-column flex-md-row align-items-start align-items-md-center justify-content-between gap-3 mb-4">
                <div>
                    <h5 class="text-bold mb-1">Blacklisted Access Directory</h5>
                    <p class="text-color-secondary fs-7 mb-0">Manage flagged profiles barred from campus access checkpoints.</p>
                </div>
                <button type="button" class="btn btn-premium btn-premium-danger fs-7" data-bs-toggle="modal" data-bs-target="#addBlacklistModal">
                    <i class="bi bi-slash-circle-fill me-1"></i> Blacklist Visitor
                </button>
            </div>

            <div class="table-responsive border-0">
                <table class="table table-premium text-nowrap align-middle" id="blacklist-table">
                    <thead>
                        <tr>
                            <th>Visitor Details</th>
                            <th>Company</th>
                            <th>Blacklist Reason</th>
                            <th>Risk Level</th>
                            <th>Status</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="blacklist-tbody">
                        <!-- Loaded dynamically by Javascript -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Add Blacklist Modal -->
    <div class="modal fade" id="addBlacklistModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold text-danger"><i class="bi bi-slash-circle-fill me-2"></i>Add to Security Blacklist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="add-blacklist-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="blVisSelect">Select Visitor <span class="text-danger">*</span></label>
                            <select class="form-select form-control-premium" id="blVisSelect" required>
                                <option value="">Choose Visitor...</option>
                            </select>
                            <div class="invalid-feedback">Please select a visitor to blacklist.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="blReason">Blacklist Reason <span class="text-danger">*</span></label>
                            <textarea class="form-control form-control-premium" id="blReason" rows="3" placeholder="Describe the violation or risk justification..." required minlength="5"></textarea>
                            <div class="invalid-feedback">Please enter a reason (at least 5 characters).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="blRisk">Risk Level <span class="text-danger">*</span></label>
                            <select class="form-select form-control-premium" id="blRisk" required>
                                <option value="High" selected>High (Immediate Campus Bar)</option>
                                <option value="Medium">Medium (Escort Required)</option>
                                <option value="Low">Low (Watch List Only)</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-danger"><i class="bi bi-slash-circle-fill me-1"></i>Enforce Ban</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Blacklist Modal -->
    <div class="modal fade" id="editBlacklistModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-bold"><i class="bi bi-pencil-square text-primary me-2"></i>Edit Blacklist Record</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="edit-blacklist-form" class="needs-validation" novalidate>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBlId">Pass ID</label>
                            <input type="text" class="form-control form-control-premium bg-light" id="editBlId" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBlName">Visitor Name</label>
                            <input type="text" class="form-control form-control-premium bg-light" id="editBlName" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBlReason">Blacklist Reason <span class="text-danger">*</span></label>
                            <textarea class="form-control form-control-premium" id="editBlReason" rows="3" required minlength="5"></textarea>
                            <div class="invalid-feedback">Please enter a reason (at least 5 characters).</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label-premium" for="editBlRisk">Risk Level <span class="text-danger">*</span></label>
                            <select class="form-select form-control-premium" id="editBlRisk" required>
                                <option value="High">High</option>
                                <option value="Medium">Medium</option>
                                <option value="Low">Low</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-premium btn-premium-outline" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-premium btn-premium-primary"><i class="bi bi-save me-1"></i>Update Record</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
    function getBlacklistIds() {
        return JSON.parse(localStorage.getItem('svpms_blacklisted_ids') || '[]');
    }

    function saveBlacklistIds(ids) {
        localStorage.setItem('svpms_blacklisted_ids', JSON.stringify(ids));
    }

    function getBlacklistMeta() {
        return JSON.parse(localStorage.getItem('svpms_blacklisted_meta') || '{}');
    }

    function saveBlacklistMeta(meta) {
        localStorage.setItem('svpms_blacklisted_meta', JSON.stringify(meta));
    }

    function renderBlacklistTable() {
        const table = document.getElementById('blacklist-table');
        if (!table) return;

        if ($.fn.DataTable.isDataTable('#blacklist-table')) {
            $('#blacklist-table').DataTable().destroy();
        }

        const tbody = document.getElementById('blacklist-tbody');
        if (!tbody) return;
        tbody.innerHTML = '';

        const blacklistIds = getBlacklistIds();
        const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
        const meta = getBlacklistMeta();

        blacklistIds.forEach(id => {
            let v = visitors.find(item => item.id === id);
            if (!v) {
                v = {
                    id: id,
                    name: 'Deepak Malhotra',
                    photo: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                    company: 'Independent Freelance'
                };
            }

            const itemMeta = meta[id] || {};
            const reason = itemMeta.reason || v.reason || 'Unauthorized security perimeter attempt';
            const risk = itemMeta.risk || v.risk || 'High';
            const riskClass = risk === 'High' ? 'bg-danger text-white' : risk === 'Medium' ? 'bg-warning text-dark' : 'bg-secondary text-white';

            const tr = document.createElement('tr');
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
                <td>${v.company || 'N/A'}</td>
                <td style="max-width: 250px; white-space: normal;">${reason}</td>
                <td><span class="badge ${riskClass} rounded-pill px-3 py-1 fs-8">${risk}</span></td>
                <td><span class="status-chip blacklisted">Banned</span></td>
                <td class="text-end">
                    <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline me-1" onclick="openEditBlacklistModal('${v.id}', '${v.name.replace(/'/g, "\\'")}', '${reason.replace(/'/g, "\\'")}', '${risk}')" title="Edit Reason">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-success btn-premium-outline" onclick="removeFromBlacklist('${v.id}', '${v.name.replace(/'/g, "\\'")}')" title="Unban / Remove">
                        <i class="bi bi-shield-check"></i> Unban
                    </button>
                </td>
            `;
            tbody.appendChild(tr);
        });

        initPremiumDataTable('#blacklist-table');
        populateBlacklistSelect();
    }

    function populateBlacklistSelect() {
        const select = document.getElementById('blVisSelect');
        if (!select) return;

        const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
        const blacklistIds = getBlacklistIds();

        select.innerHTML = '<option value="">Choose Visitor...</option>';
        visitors.forEach(v => {
            if (!blacklistIds.includes(v.id)) {
                const opt = document.createElement('option');
                opt.value = v.id;
                opt.textContent = `${v.name} (${v.id} - ${v.company})`;
                select.appendChild(opt);
            }
        });
    }

    function openEditBlacklistModal(id, name, reason, risk) {
        document.getElementById('editBlId').value = id;
        document.getElementById('editBlName').value = name;
        document.getElementById('editBlReason').value = reason;
        document.getElementById('editBlRisk').value = risk;

        const modalEl = document.getElementById('editBlacklistModal');
        if (modalEl) {
            const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
            modal.show();
        }
    }

    function removeFromBlacklist(id, name) {
        Swal.fire({
            title: 'Remove from Blacklist?',
            text: `Are you sure you want to lift the access ban for ${name} (${id})?`,
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#10B981',
            cancelButtonColor: '#64748B',
            confirmButtonText: 'Yes, Unban',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                let ids = getBlacklistIds();
                ids = ids.filter(item => item !== id);
                saveBlacklistIds(ids);

                renderBlacklistTable();
                if (typeof showSuccessToast === 'function') {
                    showSuccessToast(`Access ban lifted for ${name}.`);
                }
            }
        });
    }

    document.addEventListener('DOMContentLoaded', () => {
        renderBlacklistTable();

        const addForm = document.getElementById('add-blacklist-form');
        if (addForm) {
            addForm.addEventListener('submit', (e) => {
                e.preventDefault();
                if (window.SVPMSForms && !window.SVPMSForms.validateForm(addForm, true)) {
                    return;
                }

                const visId = document.getElementById('blVisSelect').value;
                const reason = document.getElementById('blReason').value.trim();
                const risk = document.getElementById('blRisk').value;

                let ids = getBlacklistIds();
                if (!ids.includes(visId)) {
                    ids.push(visId);
                    saveBlacklistIds(ids);
                }

                const meta = getBlacklistMeta();
                meta[visId] = { reason, risk };
                saveBlacklistMeta(meta);

                const modalEl = document.getElementById('addBlacklistModal');
                if (modalEl) {
                    const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                    modal.hide();
                }

                addForm.reset();
                addForm.classList.remove('was-validated');

                renderBlacklistTable();

                if (typeof showSuccessToast === 'function') {
                    showSuccessToast('Visitor added to blacklist watch list.');
                } else {
                    Swal.fire('Blacklisted!', 'Visitor has been flagged and barred.', 'success');
                }
            });
        }

        const editForm = document.getElementById('edit-blacklist-form');
        if (editForm) {
            editForm.addEventListener('submit', (e) => {
                e.preventDefault();
                if (window.SVPMSForms && !window.SVPMSForms.validateForm(editForm, true)) {
                    return;
                }

                const id = document.getElementById('editBlId').value;
                const reason = document.getElementById('editBlReason').value.trim();
                const risk = document.getElementById('editBlRisk').value;

                const meta = getBlacklistMeta();
                meta[id] = { reason, risk };
                saveBlacklistMeta(meta);

                const modalEl = document.getElementById('editBlacklistModal');
                if (modalEl) {
                    const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                    modal.hide();
                }

                renderBlacklistTable();

                if (typeof showSuccessToast === 'function') {
                    showSuccessToast('Blacklist details updated.');
                } else {
                    Swal.fire('Updated!', 'Blacklist details saved.', 'success');
                }
            });
        }
    });

    window.openEditBlacklistModal = openEditBlacklistModal;
    window.removeFromBlacklist = removeFromBlacklist;
</script>
</asp:Content>
