/* svpms/assets/js/admin.js
 * Comprehensive CRUD and Validation Engine for SVPMS Admin Portal
 */

document.addEventListener('DOMContentLoaded', () => {
    initAdminCRUD();
    initSettingsForm();
    initProfileForms();
});

function initAdminCRUD() {
    // 1. Initialize Tables based on present elements
    if (document.getElementById('employees-table')) {
        renderEmployeesTable();
        initEmployeeFormHandlers();
    }

    if (document.getElementById('departments-table')) {
        renderDepartmentsTable();
        initDepartmentFormHandlers();
    }

    if (document.getElementById('buildings-table')) {
        renderBuildingsTable();
        initBuildingFormHandlers();
    }

    if (document.getElementById('gates-table')) {
        renderGatesTable();
        initGateFormHandlers();
    }

    if (document.getElementById('visitors-directory-table')) {
        renderVisitorsTable();
        initVisitorEditHandler();
    }
}

/* ==========================================================================
   1. EMPLOYEES CRUD
   ========================================================================== */

function getEmployees() {
    let list = JSON.parse(localStorage.getItem('svpms_employees') || '[]');
    if (!list || list.length === 0) {
        list = [
            { id: 'EMP-2084', name: 'Dr. Priya Sharma', email: 'priya.sharma@college.edu', department: 'Information Technology', status: 'Active' },
            { id: 'EMP-2085', name: 'Arjun Mehta', email: 'arjun.mehta@college.edu', department: 'Human Resources', status: 'Active' },
            { id: 'EMP-2086', name: 'Prof. Anand Kulkarni', email: 'anand.kulkarni@college.edu', department: 'Academics & Research', status: 'Active' },
            { id: 'EMP-2087', name: 'Capt. Devendra Rathore', email: 'devendra.rathore@college.edu', department: 'Administration', status: 'Active' },
            { id: 'EMP-2088', name: 'Dr. Sunita Rao', email: 'sunita.rao@college.edu', department: 'Information Technology', status: 'Active' },
            { id: 'EMP-2089', name: 'Siddharth Malhotra', email: 'siddharth.m@college.edu', department: 'Academics & Research', status: 'Active' },
            { id: 'EMP-2090', name: 'Meera Joshi', email: 'meera.joshi@college.edu', department: 'Finance & Commerce', status: 'Active' },
            { id: 'EMP-2091', name: 'Vikram Singh', email: 'vikram.singh@college.edu', department: 'Administration', status: 'Active' }
        ];
        saveEmployees(list);
    }
    return list;
}

function saveEmployees(list) {
    localStorage.setItem('svpms_employees', JSON.stringify(list));
}

function renderEmployeesTable() {
    const tableEl = document.getElementById('employees-table');
    if (!tableEl) return;

    // Destroy existing datatable instance if exists
    if ($.fn.DataTable.isDataTable('#employees-table')) {
        $('#employees-table').DataTable().destroy();
    }

    const tbody = tableEl.querySelector('tbody');
    if (!tbody) return;
    tbody.innerHTML = '';

    const employees = getEmployees();
    employees.forEach(emp => {
        const tr = document.createElement('tr');
        const badgeClass = emp.status === 'Active' ? 'bg-success' : 'bg-secondary';
        tr.innerHTML = `
            <td><span class="badge bg-light text-dark border">${emp.id}</span></td>
            <td class="text-bold text-color-primary">${emp.name}</td>
            <td>${emp.email}</td>
            <td>${emp.department}</td>
            <td><span class="badge ${badgeClass} rounded-pill">${emp.status}</span></td>
            <td class="text-end">
                <div class="d-flex align-items-center justify-content-end gap-1">
                    <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline" onclick="openEditEmployeeModal('${emp.id}')" data-bs-toggle="tooltip" title="Edit Employee">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-danger btn-premium-outline" onclick="deleteEmployee('${emp.id}')" data-bs-toggle="tooltip" title="Delete Employee">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
            </td>
        `;
        tbody.appendChild(tr);
    });

    if (typeof initPremiumDataTable === 'function') {
        initPremiumDataTable('#employees-table');
    }
}

function initEmployeeFormHandlers() {
    // Add Employee Submit
    const addForm = document.getElementById('add-employee-form');
    if (addForm) {
        addForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(addForm, true)) {
                return;
            }

            const name = document.getElementById('empName').value.trim();
            const email = document.getElementById('empEmail').value.trim();
            const dept = document.getElementById('empDept').value;
            const status = document.getElementById('empStatus') ? document.getElementById('empStatus').value : 'Active';

            const employees = getEmployees();
            const newEmp = {
                id: 'EMP-' + Math.floor(2100 + Math.random() * 8000),
                name,
                email,
                department: dept,
                status
            };

            employees.push(newEmp);
            saveEmployees(employees);

            // Hide modal
            const modalEl = document.getElementById('addEmployeeModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            addForm.reset();
            addForm.classList.remove('was-validated');
            addForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

            renderEmployeesTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Employee ${name} registered successfully.`);
            } else {
                Swal.fire({
                    title: 'Registered!',
                    text: `${name} has been added as a host employee.`,
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }

    // Edit Employee Submit
    const editForm = document.getElementById('edit-employee-form');
    if (editForm) {
        editForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(editForm, true)) {
                return;
            }

            const empId = document.getElementById('editEmpId').value;
            const name = document.getElementById('editEmpName').value.trim();
            const email = document.getElementById('editEmpEmail').value.trim();
            const dept = document.getElementById('editEmpDept').value;
            const status = document.getElementById('editEmpStatus').value;

            const employees = getEmployees();
            const idx = employees.findIndex(emp => emp.id === empId);
            if (idx !== -1) {
                employees[idx].name = name;
                employees[idx].email = email;
                employees[idx].department = dept;
                employees[idx].status = status;
                saveEmployees(employees);
            }

            const modalEl = document.getElementById('editEmployeeModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            renderEmployeesTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Employee ${name} updated successfully.`);
            } else {
                Swal.fire({
                    title: 'Updated!',
                    text: `Employee details have been saved.`,
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }
}

function openEditEmployeeModal(empId) {
    const employees = getEmployees();
    const emp = employees.find(e => e.id === empId);
    if (!emp) return;

    document.getElementById('editEmpId').value = emp.id;
    document.getElementById('editEmpName').value = emp.name;
    document.getElementById('editEmpEmail').value = emp.email;
    document.getElementById('editEmpDept').value = emp.department;
    document.getElementById('editEmpStatus').value = emp.status;

    const modalEl = document.getElementById('editEmployeeModal');
    if (modalEl) {
        const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
        modal.show();
    }
}

function deleteEmployee(empId) {
    const employees = getEmployees();
    const emp = employees.find(e => e.id === empId);
    const empName = emp ? emp.name : empId;

    Swal.fire({
        title: 'Delete Employee?',
        text: `Are you sure you want to remove ${empName} from the host directory?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#64748B',
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            const updated = employees.filter(e => e.id !== empId);
            saveEmployees(updated);
            renderEmployeesTable();
            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Employee ${empName} removed.`);
            }
        }
    });
}

/* ==========================================================================
   2. DEPARTMENTS CRUD
   ========================================================================== */

function getDepartments() {
    let list = JSON.parse(localStorage.getItem('svpms_departments') || '[]');
    if (!list || list.length === 0) {
        list = [
            { code: 'DEPT-10', name: 'Information Technology', hostCount: 16, building: 'Main Admin Block A', status: 'Active' },
            { code: 'DEPT-11', name: 'Human Resources', hostCount: 8, building: 'Admin Block B', status: 'Active' },
            { code: 'DEPT-12', name: 'Finance & Accounts', hostCount: 6, building: 'Main Admin Block A', status: 'Active' },
            { code: 'DEPT-13', name: 'Academics & Research', hostCount: 24, building: 'Science & Lab Block B', status: 'Active' },
            { code: 'DEPT-14', name: 'Campus Safety & Administration', hostCount: 12, building: 'Main Admin Block A', status: 'Active' },
            { code: 'DEPT-15', name: 'Biotechnology & Innovation', hostCount: 10, building: 'Science & Lab Block B', status: 'Active' },
            { code: 'DEPT-16', name: 'Robotics & Mechanical', hostCount: 14, building: 'Engineering Wing C', status: 'Active' }
        ];
        saveDepartments(list);
    }
    return list;
}

function saveDepartments(list) {
    localStorage.setItem('svpms_departments', JSON.stringify(list));
}

function renderDepartmentsTable() {
    const tableEl = document.getElementById('departments-table');
    if (!tableEl) return;

    if ($.fn.DataTable.isDataTable('#departments-table')) {
        $('#departments-table').DataTable().destroy();
    }

    const tbody = tableEl.querySelector('tbody');
    if (!tbody) return;
    tbody.innerHTML = '';

    const departments = getDepartments();
    departments.forEach(dept => {
        const tr = document.createElement('tr');
        const badgeClass = dept.status === 'Active' ? 'bg-success' : 'bg-secondary';
        tr.innerHTML = `
            <td><span class="badge bg-light text-dark border">${dept.code}</span></td>
            <td class="text-bold text-color-primary">${dept.name}</td>
            <td>${dept.hostCount || 0} Hosts</td>
            <td>${dept.building || 'Main Block'}</td>
            <td><span class="badge ${badgeClass} rounded-pill">${dept.status || 'Active'}</span></td>
            <td class="text-end">
                <div class="d-flex align-items-center justify-content-end gap-1">
                    <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline" onclick="openEditDepartmentModal('${dept.code}')" data-bs-toggle="tooltip" title="Edit Department">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-danger btn-premium-outline" onclick="deleteDepartment('${dept.code}')" data-bs-toggle="tooltip" title="Delete Department">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
            </td>
        `;
        tbody.appendChild(tr);
    });

    if (typeof initPremiumDataTable === 'function') {
        initPremiumDataTable('#departments-table');
    }
}

function initDepartmentFormHandlers() {
    // Add Department Submit
    const addForm = document.getElementById('add-dept-form');
    if (addForm) {
        addForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(addForm, true)) {
                return;
            }

            const name = document.getElementById('deptName').value.trim();
            const building = document.getElementById('deptBld').value.trim() || 'Main Block A';
            const hostCount = document.getElementById('deptHosts') ? parseInt(document.getElementById('deptHosts').value, 10) || 0 : 0;
            const status = document.getElementById('deptStatus') ? document.getElementById('deptStatus').value : 'Active';

            const departments = getDepartments();
            const newDept = {
                code: 'DEPT-' + Math.floor(15 + Math.random() * 85),
                name,
                building,
                hostCount,
                status
            };

            departments.push(newDept);
            saveDepartments(departments);

            const modalEl = document.getElementById('addDeptModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            addForm.reset();
            addForm.classList.remove('was-validated');
            addForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

            renderDepartmentsTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Department ${name} added successfully.`);
            } else {
                Swal.fire({
                    title: 'Department Added!',
                    text: `${name} has been added to enterprise departments.`,
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }

    // Edit Department Submit
    const editForm = document.getElementById('edit-dept-form');
    if (editForm) {
        editForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(editForm, true)) {
                return;
            }

            const code = document.getElementById('editDeptCode').value;
            const name = document.getElementById('editDeptName').value.trim();
            const building = document.getElementById('editDeptBld').value.trim();
            const hostCount = parseInt(document.getElementById('editDeptHosts').value, 10) || 0;
            const status = document.getElementById('editDeptStatus').value;

            const departments = getDepartments();
            const idx = departments.findIndex(d => d.code === code);
            if (idx !== -1) {
                departments[idx].name = name;
                departments[idx].building = building;
                departments[idx].hostCount = hostCount;
                departments[idx].status = status;
                saveDepartments(departments);
            }

            const modalEl = document.getElementById('editDeptModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            renderDepartmentsTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Department ${name} updated successfully.`);
            } else {
                Swal.fire({
                    title: 'Updated!',
                    text: 'Department details have been updated.',
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }
}

function openEditDepartmentModal(deptCode) {
    const departments = getDepartments();
    const dept = departments.find(d => d.code === deptCode);
    if (!dept) return;

    document.getElementById('editDeptCode').value = dept.code;
    document.getElementById('editDeptName').value = dept.name;
    document.getElementById('editDeptBld').value = dept.building || 'Main Block A';
    document.getElementById('editDeptHosts').value = dept.hostCount || 0;
    document.getElementById('editDeptStatus').value = dept.status || 'Active';

    const modalEl = document.getElementById('editDeptModal');
    if (modalEl) {
        const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
        modal.show();
    }
}

function deleteDepartment(deptCode) {
    const departments = getDepartments();
    const dept = departments.find(d => d.code === deptCode);
    const deptName = dept ? dept.name : deptCode;

    Swal.fire({
        title: 'Delete Department?',
        text: `Are you sure you want to remove ${deptName}?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#64748B',
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            const updated = departments.filter(d => d.code !== deptCode);
            saveDepartments(updated);
            renderDepartmentsTable();
            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Department ${deptName} removed.`);
            }
        }
    });
}

/* ==========================================================================
   3. BUILDINGS CRUD
   ========================================================================== */

function getBuildings() {
    let list = JSON.parse(localStorage.getItem('svpms_buildings') || '[]');
    if (!list || list.length === 0) {
        list = [
            { code: 'BLDG-01', name: 'Main Admin Block A', departments: 'Finance, HR, Administration, Security', gatesCount: 2, status: 'Active' },
            { code: 'BLDG-02', name: 'Science & Lab Block B', departments: 'Biotechnology, Physics, Research Labs', gatesCount: 3, status: 'Active' },
            { code: 'BLDG-03', name: 'Engineering Wing C', departments: 'IT Labs, Robotics, Electronics', gatesCount: 2, status: 'Active' },
            { code: 'BLDG-04', name: 'Auditorium & Arts Complex D', departments: 'Cultural Center, Main Hall', gatesCount: 2, status: 'Active' },
            { code: 'BLDG-05', name: 'Sports & Athletics Arena', departments: 'Physical Education, Medical Unit', gatesCount: 1, status: 'Active' },
            { code: 'BLDG-06', name: 'Central Library & Media Center', departments: 'Digital Archives, Reading Halls', gatesCount: 2, status: 'Active' }
        ];
        saveBuildings(list);
    }
    return list;
}

function saveBuildings(list) {
    localStorage.setItem('svpms_buildings', JSON.stringify(list));
}

function renderBuildingsTable() {
    const tableEl = document.getElementById('buildings-table');
    if (!tableEl) return;

    if ($.fn.DataTable.isDataTable('#buildings-table')) {
        $('#buildings-table').DataTable().destroy();
    }

    const tbody = tableEl.querySelector('tbody');
    if (!tbody) return;
    tbody.innerHTML = '';

    const buildings = getBuildings();
    buildings.forEach(bld => {
        const tr = document.createElement('tr');
        const badgeClass = bld.status === 'Active' ? 'bg-success' : 'bg-secondary';
        tr.innerHTML = `
            <td><span class="badge bg-light text-dark border">${bld.code}</span></td>
            <td class="text-bold text-color-primary">${bld.name}</td>
            <td>${bld.departments}</td>
            <td>${bld.gatesCount} Gates</td>
            <td><span class="badge ${badgeClass} rounded-pill">${bld.status}</span></td>
            <td class="text-end">
                <div class="d-flex align-items-center justify-content-end gap-1">
                    <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline" onclick="openEditBuildingModal('${bld.code}')" data-bs-toggle="tooltip" title="Edit Building">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-danger btn-premium-outline" onclick="deleteBuilding('${bld.code}')" data-bs-toggle="tooltip" title="Delete Building">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
            </td>
        `;
        tbody.appendChild(tr);
    });

    if (typeof initPremiumDataTable === 'function') {
        initPremiumDataTable('#buildings-table');
    }
}

function initBuildingFormHandlers() {
    // Add Building Submit
    const addForm = document.getElementById('add-building-form');
    if (addForm) {
        addForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(addForm, true)) {
                return;
            }

            const code = document.getElementById('bldCode').value.trim().toUpperCase();
            const name = document.getElementById('bldName').value.trim();
            const depts = document.getElementById('bldDepts').value.trim();
            const gates = parseInt(document.getElementById('bldGates').value, 10) || 1;
            const status = document.getElementById('bldStatus') ? document.getElementById('bldStatus').value : 'Active';

            const buildings = getBuildings();
            buildings.push({
                code: code || 'BLDG-0' + (buildings.length + 1),
                name,
                departments: depts,
                gatesCount: gates,
                status
            });
            saveBuildings(buildings);

            const modalEl = document.getElementById('addBuildingModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            addForm.reset();
            addForm.classList.remove('was-validated');
            addForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

            renderBuildingsTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Building ${name} registered successfully.`);
            } else {
                Swal.fire({
                    title: 'Registered!',
                    text: `Building ${name} has been added.`,
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }

    // Edit Building Submit
    const editForm = document.getElementById('edit-building-form');
    if (editForm) {
        editForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(editForm, true)) {
                return;
            }

            const code = document.getElementById('editBldCode').value;
            const name = document.getElementById('editBldName').value.trim();
            const depts = document.getElementById('editBldDepts').value.trim();
            const gates = parseInt(document.getElementById('editBldGates').value, 10) || 1;
            const status = document.getElementById('editBldStatus').value;

            const buildings = getBuildings();
            const idx = buildings.findIndex(b => b.code === code);
            if (idx !== -1) {
                buildings[idx].name = name;
                buildings[idx].departments = depts;
                buildings[idx].gatesCount = gates;
                buildings[idx].status = status;
                saveBuildings(buildings);
            }

            const modalEl = document.getElementById('editBuildingModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            renderBuildingsTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Building ${name} updated successfully.`);
            } else {
                Swal.fire({
                    title: 'Updated!',
                    text: 'Building details have been updated.',
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }
}

function openEditBuildingModal(bldCode) {
    const buildings = getBuildings();
    const bld = buildings.find(b => b.code === bldCode);
    if (!bld) return;

    document.getElementById('editBldCode').value = bld.code;
    document.getElementById('editBldName').value = bld.name;
    document.getElementById('editBldDepts').value = bld.departments;
    document.getElementById('editBldGates').value = bld.gatesCount;
    document.getElementById('editBldStatus').value = bld.status;

    const modalEl = document.getElementById('editBuildingModal');
    if (modalEl) {
        const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
        modal.show();
    }
}

function deleteBuilding(bldCode) {
    const buildings = getBuildings();
    const bld = buildings.find(b => b.code === bldCode);
    const bldName = bld ? bld.name : bldCode;

    Swal.fire({
        title: 'Delete Building?',
        text: `Are you sure you want to remove ${bldName}?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#64748B',
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            const updated = buildings.filter(b => b.code !== bldCode);
            saveBuildings(updated);
            renderBuildingsTable();
            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Building ${bldName} removed.`);
            }
        }
    });
}

/* ==========================================================================
   4. GATES CRUD
   ========================================================================== */

function getGates() {
    let list = JSON.parse(localStorage.getItem('svpms_gates') || '[]');
    if (!list || list.length === 0) {
        list = [
            { code: 'GATE-101', name: 'Main Entrance Gate A', building: 'Main Admin Block A', roles: 'All Roles', status: 'Online' },
            { code: 'GATE-102', name: 'North Service Gate B', building: 'Science & Lab Block B', roles: 'Staff & Visitors', status: 'Online' },
            { code: 'GATE-103', name: 'VIP Gate C', building: 'Main Admin Block A', roles: 'VIP & Dignitaries', status: 'Online' },
            { code: 'GATE-104', name: 'East Campus Gate D', building: 'Engineering Wing C', roles: 'Staff & Visitors', status: 'Online' },
            { code: 'GATE-105', name: 'South Logistics Gate E', building: 'Sports & Athletics Arena', roles: 'Staff Only', status: 'Online' },
            { code: 'GATE-106', name: 'Auditorium Gate F', building: 'Auditorium & Arts Complex D', roles: 'All Roles', status: 'Maintenance' }
        ];
        saveGates(list);
    }
    return list;
}

function saveGates(list) {
    localStorage.setItem('svpms_gates', JSON.stringify(list));
}

function renderGatesTable() {
    const tableEl = document.getElementById('gates-table');
    if (!tableEl) return;

    if ($.fn.DataTable.isDataTable('#gates-table')) {
        $('#gates-table').DataTable().destroy();
    }

    const tbody = tableEl.querySelector('tbody');
    if (!tbody) return;
    tbody.innerHTML = '';

    const gates = getGates();
    gates.forEach(gate => {
        const tr = document.createElement('tr');
        const badgeClass = gate.status === 'Online' ? 'bg-success' : (gate.status === 'Maintenance' ? 'bg-warning text-dark' : 'bg-secondary');
        tr.innerHTML = `
            <td><span class="badge bg-light text-dark border">${gate.code}</span></td>
            <td class="text-bold text-color-primary">${gate.name}</td>
            <td>${gate.building}</td>
            <td>${gate.roles}</td>
            <td><span class="badge ${badgeClass} rounded-pill">${gate.status}</span></td>
            <td class="text-end">
                <div class="d-flex align-items-center justify-content-end gap-1">
                    <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline" onclick="openEditGateModal('${gate.code}')" data-bs-toggle="tooltip" title="Edit Gate">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-danger btn-premium-outline" onclick="deleteGate('${gate.code}')" data-bs-toggle="tooltip" title="Delete Gate">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
            </td>
        `;
        tbody.appendChild(tr);
    });

    if (typeof initPremiumDataTable === 'function') {
        initPremiumDataTable('#gates-table');
    }
}

function initGateFormHandlers() {
    // Add Gate Submit
    const addForm = document.getElementById('add-gate-form');
    if (addForm) {
        addForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(addForm, true)) {
                return;
            }

            const code = document.getElementById('gateCode') ? document.getElementById('gateCode').value.trim().toUpperCase() : 'GATE-' + Math.floor(104 + Math.random() * 890);
            const name = document.getElementById('gateName').value.trim();
            const bld = document.getElementById('gateBuilding').value.trim() || 'Admin Block A';
            const roles = document.getElementById('gateRoles') ? document.getElementById('gateRoles').value : 'All Roles';
            const status = document.getElementById('gateStatus') ? document.getElementById('gateStatus').value : 'Online';

            const gates = getGates();
            gates.push({
                code: code || 'GATE-104',
                name,
                building: bld,
                roles,
                status
            });
            saveGates(gates);

            const modalEl = document.getElementById('addGateModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            addForm.reset();
            addForm.classList.remove('was-validated');
            addForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

            renderGatesTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Gate ${name} registered.`);
            } else {
                Swal.fire({
                    title: 'Registered!',
                    text: `Gate ${name} has been added to checkpoints.`,
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }

    // Edit Gate Submit
    const editForm = document.getElementById('edit-gate-form');
    if (editForm) {
        editForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(editForm, true)) {
                return;
            }

            const code = document.getElementById('editGateCode').value;
            const name = document.getElementById('editGateName').value.trim();
            const bld = document.getElementById('editGateBuilding').value.trim();
            const roles = document.getElementById('editGateRoles').value;
            const status = document.getElementById('editGateStatus').value;

            const gates = getGates();
            const idx = gates.findIndex(g => g.code === code);
            if (idx !== -1) {
                gates[idx].name = name;
                gates[idx].building = bld;
                gates[idx].roles = roles;
                gates[idx].status = status;
                saveGates(gates);
            }

            const modalEl = document.getElementById('editGateModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            renderGatesTable();

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Gate ${name} updated successfully.`);
            } else {
                Swal.fire({
                    title: 'Updated!',
                    text: 'Gate checkpoint details have been saved.',
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }
}

function openEditGateModal(gateCode) {
    const gates = getGates();
    const gate = gates.find(g => g.code === gateCode);
    if (!gate) return;

    document.getElementById('editGateCode').value = gate.code;
    document.getElementById('editGateName').value = gate.name;
    document.getElementById('editGateBuilding').value = gate.building;
    document.getElementById('editGateRoles').value = gate.roles;
    document.getElementById('editGateStatus').value = gate.status;

    const modalEl = document.getElementById('editGateModal');
    if (modalEl) {
        const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
        modal.show();
    }
}

function deleteGate(gateCode) {
    const gates = getGates();
    const gate = gates.find(g => g.code === gateCode);
    const gateName = gate ? gate.name : gateCode;

    Swal.fire({
        title: 'Delete Gate?',
        text: `Are you sure you want to remove ${gateName}?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#64748B',
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            const updated = gates.filter(g => g.code !== gateCode);
            saveGates(updated);
            renderGatesTable();
            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Gate ${gateName} removed.`);
            }
        }
    });
}

/* ==========================================================================
   5. VISITORS DIRECTORY CRUD & EDIT MODAL
   ========================================================================== */

function getVisitors() {
    let list = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
    if (!list || list.length === 0) {
        list = [
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
        saveVisitors(list);
    }
    return list;
}

function saveVisitors(list) {
    localStorage.setItem('svpms_visitors', JSON.stringify(list));
}

function renderVisitorsTable(filterStatus = '') {
    const tableEl = document.getElementById('visitors-directory-table');
    if (!tableEl) return;

    if ($.fn.DataTable.isDataTable('#visitors-directory-table')) {
        $('#visitors-directory-table').DataTable().destroy();
    }

    const tbody = document.getElementById('visitors-directory-tbody');
    if (!tbody) return;
    tbody.innerHTML = '';

    let visitors = getVisitors();
    if (filterStatus) {
        visitors = visitors.filter(v => v.status.toLowerCase() === filterStatus.toLowerCase());
    }

    const blacklist = JSON.parse(localStorage.getItem('svpms_blacklisted_ids') || '[]');

    visitors.forEach(v => {
        const tr = document.createElement('tr');
        const isBanned = blacklist.includes(v.id);

        let actionsHtml = `
            <div class="d-flex align-items-center justify-content-end gap-1">
                <a href="visitor-details.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-info btn-premium-outline" data-bs-toggle="tooltip" title="View Details">
                    <i class="bi bi-eye"></i>
                </a>
                <a href="../receptionist/generate-qr.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-primary btn-premium-outline" data-bs-toggle="tooltip" title="QR Pass">
                    <i class="bi bi-qr-code"></i>
                </a>
                <a href="../receptionist/print-badge.aspx?visitorId=${v.id}" class="btn btn-sm btn-outline-secondary btn-premium-outline" data-bs-toggle="tooltip" title="Print Badge">
                    <i class="bi bi-printer"></i>
                </a>
                <button type="button" class="btn btn-sm btn-outline-warning btn-premium-outline" onclick="openEditVisitorModal('${v.id}')" data-bs-toggle="tooltip" title="Edit Visitor">
                    <i class="bi bi-pencil-square"></i>
                </button>
        `;

        if (isBanned) {
            actionsHtml += `<button type="button" class="btn btn-sm btn-dark" disabled title="Already Blacklisted"><i class="bi bi-slash-circle"></i></button>`;
        } else {
            actionsHtml += `<button type="button" onclick="blacklistVisitor('${v.id}', '${v.name}')" class="btn btn-sm btn-outline-danger btn-premium-outline" data-bs-toggle="tooltip" title="Blacklist Visitor"><i class="bi bi-slash-circle-fill"></i></button>`;
        }

        actionsHtml += `
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

    if (typeof initPremiumDataTable === 'function') {
        initPremiumDataTable('#visitors-directory-table');
    }
}

function initVisitorEditHandler() {
    const filterSelect = document.getElementById('status-filter');
    if (filterSelect) {
        filterSelect.addEventListener('change', () => {
            renderVisitorsTable(filterSelect.value);
        });
    }

    // Add visitor form submit
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
            const date = document.getElementById('addVisDate').value;
            const time = document.getElementById('addVisTime').value;
            const status = document.getElementById('addVisStatus').value;
            const purpose = document.getElementById('addVisPurpose') ? document.getElementById('addVisPurpose').value.trim() : 'Official Visit';

            const newVisitor = {
                id: 'VP-26' + Math.floor(1000 + Math.random() * 9000),
                name,
                email,
                phone,
                company,
                host,
                department: dept,
                date,
                time,
                status,
                purpose,
                photo: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
                idProof: 'https://placehold.co/400x250/2563eb/ffffff?text=ID+Proof',
                entryTime: '',
                exitTime: ''
            };

            const visitors = getVisitors();
            visitors.unshift(newVisitor);
            saveVisitors(visitors);

            const modalEl = document.getElementById('addVisitorModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            addForm.reset();
            addForm.classList.remove('was-validated');
            addForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

            renderVisitorsTable(filterSelect ? filterSelect.value : '');

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Visitor ${name} registered successfully.`);
            } else {
                Swal.fire({
                    title: 'Registered!',
                    text: `${name} registered with Pass ID ${newVisitor.id}.`,
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }

    // Edit visitor form submit
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

            const visitors = getVisitors();
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
                saveVisitors(visitors);
            }

            const modalEl = document.getElementById('editVisitorModal');
            if (modalEl) {
                const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
                modal.hide();
            }

            renderVisitorsTable(filterSelect ? filterSelect.value : '');

            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Visitor ${name} updated successfully.`);
            } else {
                Swal.fire({
                    title: 'Updated!',
                    text: 'Visitor details have been updated.',
                    icon: 'success',
                    confirmButtonColor: '#2563EB'
                });
            }
        });
    }
}

function openEditVisitorModal(visId) {
    const visitors = getVisitors();
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

    const modalEl = document.getElementById('editVisitorModal');
    if (modalEl) {
        const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
        modal.show();
    }
}

function deleteVisitor(visId) {
    const visitors = getVisitors();
    const v = visitors.find(item => item.id === visId);
    const visName = v ? v.name : visId;

    Swal.fire({
        title: 'Delete Visitor?',
        text: `Are you sure you want to delete pass record ${visId} (${visName})?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#64748B',
        confirmButtonText: 'Yes, Delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            const updated = visitors.filter(item => item.id !== visId);
            saveVisitors(updated);
            renderVisitorsTable();
            if (typeof showSuccessToast === 'function') {
                showSuccessToast(`Visitor ${visName} deleted.`);
            }
        }
    });
}

function blacklistVisitor(visitorId, visitorName) {
    Swal.fire({
        title: 'Add to System Blacklist',
        text: `Are you sure you want to blacklist ${visitorName}? They will be barred from entry gates immediately.`,
        icon: 'warning',
        input: 'text',
        inputPlaceholder: 'Reason for blacklisting (required)...',
        showCancelButton: true,
        confirmButtonColor: '#EF4444',
        cancelButtonColor: '#64748B',
        confirmButtonText: 'Yes, Blacklist',
        cancelButtonText: 'Cancel',
        inputValidator: (value) => {
            if (!value || value.trim().length < 5) {
                return 'Please provide a reason (at least 5 characters)!';
            }
        }
    }).then((result) => {
        if (result.isConfirmed) {
            let blacklisted = JSON.parse(localStorage.getItem('svpms_blacklisted_ids') || '[]');
            if (!blacklisted.includes(visitorId)) {
                blacklisted.push(visitorId);
                localStorage.setItem('svpms_blacklisted_ids', JSON.stringify(blacklisted));
            }

            Swal.fire({
                title: 'Visitor Blacklisted!',
                text: `${visitorName} has been flagged on watch lists.`,
                icon: 'success',
                confirmButtonColor: '#2563EB'
            }).then(() => {
                if (document.getElementById('visitors-directory-table')) {
                    renderVisitorsTable();
                } else {
                    location.reload();
                }
            });
        }
    });
}

/* ==========================================================================
   6. SETTINGS & PROFILE FORM VALIDATIONS
   ========================================================================== */

function initSettingsForm() {
    const settingsForm = document.getElementById('settings-form');
    if (!settingsForm) return;

    settingsForm.addEventListener('submit', (e) => {
        e.preventDefault();
        if (window.SVPMSForms && !window.SVPMSForms.validateForm(settingsForm, true)) {
            return;
        }

        const settings = {
            openHours: document.getElementById('optOpen')?.value || '06:00 AM',
            closeHours: document.getElementById('optClose')?.value || '10:00 PM',
            expiry: document.getElementById('optExpiry')?.value || '8',
            threshold: document.getElementById('optThreshold')?.value || '3',
            flagOTP: document.getElementById('flagOTP')?.checked ?? true,
            flagPreApp: document.getElementById('flagPreApp')?.checked ?? false,
            flagMaint: document.getElementById('flagMaint')?.checked ?? false
        };

        localStorage.setItem('svpms_settings', JSON.stringify(settings));

        Swal.fire({
            title: 'Configurations Saved!',
            text: 'Gate security parameters updated across all checkpoint gates.',
            icon: 'success',
            confirmButtonColor: '#2563EB'
        });
    });
}

function initProfileForms() {
    // 1. Profile details form
    const profForm = document.getElementById('profile-details-form');
    if (profForm) {
        profForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(profForm, true)) {
                return;
            }

            const name = document.getElementById('profName').value.trim();
            const phone = document.getElementById('profPhone').value.trim();

            localStorage.setItem('svpms_name', name);
            localStorage.setItem('svpms_phone', phone);

            // Update UI elements
            const cardName = document.getElementById('profile-card-name');
            if (cardName) cardName.textContent = name;
            const headerName = document.getElementById('header-user-name');
            if (headerName) headerName.textContent = name;
            const sidebarName = document.getElementById('sidebar-user-name');
            if (sidebarName) sidebarName.textContent = name;

            Swal.fire({
                title: 'Profile Updated!',
                text: 'Your account contact details have been updated.',
                icon: 'success',
                confirmButtonColor: '#2563EB'
            });
        });
    }

    // 2. Profile password change form
    const pwdForm = document.getElementById('profile-password-form');
    if (pwdForm) {
        pwdForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (window.SVPMSForms && !window.SVPMSForms.validateForm(pwdForm, true)) {
                return;
            }

            const current = document.getElementById('pwdCurrent').value;
            const newPwd = document.getElementById('pwdNew').value;
            const confirmPwd = document.getElementById('pwdConfirm').value;

            if (newPwd !== confirmPwd) {
                Swal.fire({
                    title: 'Password Mismatch',
                    text: 'New password and confirmation password do not match.',
                    icon: 'error',
                    confirmButtonColor: '#EF4444'
                });
                return;
            }

            pwdForm.reset();
            pwdForm.classList.remove('was-validated');
            pwdForm.querySelectorAll('.is-valid, .is-invalid').forEach(el => el.classList.remove('is-valid', 'is-invalid'));

            Swal.fire({
                title: 'Password Changed!',
                text: 'Your security password has been updated successfully.',
                icon: 'success',
                confirmButtonColor: '#2563EB'
            });
        });
    }
}
