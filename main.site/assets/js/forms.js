/* svpms/assets/js/forms.js
 * Universal Form Validation, Multi-Step Wizard & Input Controls Engine
 */

(function () {
    'use strict';

    // Regex Rules
    const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[a-zA-Z]{2,}$/;
    const PHONE_REGEX = /^(?:\+?\d{1,4}[-\s]?)?(?:\(?\d{2,5}\)?[-\s]?)?\d{3,5}[-\s]?\d{3,5}$/;

    // Strip non-digits to verify length
    function getCleanPhoneDigits(val) {
        return (val || '').replace(/\D/g, '');
    }

    /**
     * Determines whether an input element is currently visible
     */
    function isElementVisible(el) {
        if (!el) return false;
        return !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length);
    }

    /**
     * Finds or creates the .invalid-feedback container for an input element
     */
    function getOrCreateFeedback(input) {
        let feedback = null;

        // 1. Direct next sibling
        if (input.nextElementSibling && input.nextElementSibling.classList.contains('invalid-feedback')) {
            feedback = input.nextElementSibling;
        }

        // 2. Inside form-floating parent or input-group
        if (!feedback && input.parentElement) {
            feedback = input.parentElement.querySelector('.invalid-feedback');
            // If parent is input-group or form-floating, look for feedback as sibling of parent if not inside
            if (!feedback && (input.parentElement.classList.contains('input-group') || input.parentElement.classList.contains('form-floating'))) {
                const parentSibling = input.parentElement.nextElementSibling;
                if (parentSibling && parentSibling.classList.contains('invalid-feedback')) {
                    feedback = parentSibling;
                }
            }
        }

        // 3. Fallback: Create and insert
        if (!feedback && input.parentElement) {
            feedback = document.createElement('div');
            feedback.className = 'invalid-feedback';
            input.parentElement.appendChild(feedback);
        }

        return feedback;
    }

    /**
     * Computes the error message for an input field
     */
    function getFieldErrorMessage(input) {
        const val = (input.value || '').trim();
        const type = (input.type || '').toLowerCase();
        const id = (input.id || '').toLowerCase();
        const name = (input.name || '').toLowerCase();
        const placeholder = (input.placeholder || '').toLowerCase();
        const isRequired = input.hasAttribute('required') || input.required;

        // Checkbox validation
        if (type === 'checkbox') {
            if (isRequired && !input.checked) {
                return 'You must agree or check this box to proceed.';
            }
            return null;
        }

        // Required check
        if (isRequired && !val) {
            if (type.startsWith('select') || input.tagName === 'SELECT') {
                return 'Please select an option from the list.';
            }
            if (id.includes('name') || name.includes('name')) {
                return 'Please enter your full name.';
            }
            if (id.includes('email') || name.includes('email')) {
                return 'Email address is required.';
            }
            if (id.includes('phone') || name.includes('phone') || placeholder.includes('phone')) {
                return 'Phone number is required.';
            }
            if (id.includes('pwd') || id.includes('password') || name.includes('password')) {
                return 'Password is required.';
            }
            if (id.includes('date') || name.includes('date')) {
                return 'Please choose a scheduled date.';
            }
            if (id.includes('time') || name.includes('time')) {
                return 'Please select a time slot.';
            }
            if (id.includes('purpose') || name.includes('purpose')) {
                return 'Purpose of visit is required.';
            }
            if (id.includes('company') || name.includes('company')) {
                return 'Company or organization name is required.';
            }
            if (id.includes('host') || name.includes('host')) {
                return 'Please select an employee host.';
            }
            if (id.includes('dept') || name.includes('dept')) {
                return 'Please select a department.';
            }
            if (id.includes('gate') || name.includes('gate')) {
                return 'Gate name or location is required.';
            }
            if (id.includes('desc') || name.includes('desc') || input.tagName === 'TEXTAREA') {
                return 'Description or details cannot be blank.';
            }
            return 'This field is required.';
        }

        // If field has a value, validate format rules:

        // 1. Email format
        if (val && (type === 'email' || id.includes('email') || name.includes('email'))) {
            if (!EMAIL_REGEX.test(val)) {
                return 'Please enter a valid email address (e.g. name@domain.com).';
            }
        }

        // 2. Phone format
        if (val && (type === 'tel' || id.includes('phone') || name.includes('phone') || placeholder.includes('phone') || id.includes('mobile'))) {
            const digits = getCleanPhoneDigits(val);
            if (digits.length < 10 || !PHONE_REGEX.test(val)) {
                return 'Please enter a valid phone number (at least 10 digits).';
            }
        }

        // 3. Password matching
        if (id.includes('confirm') || name.includes('confirm')) {
            // Find target password field
            const targetPwd = document.getElementById('new-pwd') ||
                              document.getElementById('pwdNew') ||
                              document.getElementById('login-pwd') ||
                              document.querySelector('input[type="password"]:not([id*="confirm"])');
            if (targetPwd && val !== targetPwd.value) {
                return 'Passwords do not match.';
            }
        }

        // 4. Minlength check
        const minLen = input.getAttribute('minlength') ? parseInt(input.getAttribute('minlength'), 10) : (type === 'password' ? 6 : 0);
        if (val && minLen && val.length < minLen) {
            if (type === 'password') {
                return `Password must be at least ${minLen} characters long.`;
            }
            return `Must be at least ${minLen} characters.`;
        }

        // 5. HTML5 Custom pattern check
        if (val && input.hasAttribute('pattern')) {
            const pattern = new RegExp(input.getAttribute('pattern'));
            if (!pattern.test(val)) {
                return input.title || 'Please match the requested format.';
            }
        }

        // 6. Number / hours bounds
        if (val && type === 'number') {
            const num = parseFloat(val);
            if (input.hasAttribute('min') && num < parseFloat(input.getAttribute('min'))) {
                return `Value must be at least ${input.getAttribute('min')}.`;
            }
            if (input.hasAttribute('max') && num > parseFloat(input.getAttribute('max'))) {
                return `Value must be at most ${input.getAttribute('max')}.`;
            }
        }

        return null; // Valid
    }

    /**
     * Validates a single input field, updating classes and message
     */
    function validateField(input, triggerShake = false) {
        if (!input || input.disabled || input.readOnly || input.type === 'hidden') {
            return true;
        }

        const errorMessage = getFieldErrorMessage(input);
        const feedback = getOrCreateFeedback(input);

        if (errorMessage) {
            input.classList.add('is-invalid');
            input.classList.remove('is-valid');
            if (feedback) {
                feedback.textContent = errorMessage;
                feedback.style.display = 'block';
            }
            if (triggerShake) {
                input.classList.remove('field-shake');
                void input.offsetWidth; // Trigger reflow
                input.classList.add('field-shake');
            }
            return false;
        } else {
            input.classList.remove('is-invalid');
            input.classList.remove('field-shake');
            if (feedback) {
                feedback.style.display = 'none';
            }
            // Add is-valid only if input has value or was checked
            if ((input.value && input.value.trim().length > 0) || input.checked) {
                input.classList.add('is-valid');
            } else {
                input.classList.remove('is-valid');
            }
            return true;
        }
    }

    /**
     * Attaches live input/change/blur listeners to form controls
     */
    function attachLiveValidation(container) {
        if (!container) return;
        const inputs = Array.from(container.querySelectorAll('input, select, textarea'));

        inputs.forEach(input => {
            if (input.dataset.validationBound) return;
            input.dataset.validationBound = 'true';

            // Mark inputs that have eye toggle button
            if (input.parentElement && input.parentElement.querySelector('#btn-toggle-pwd, .btn-toggle-pwd')) {
                input.classList.add('has-toggle');
            }

            // Real-time on typing
            input.addEventListener('input', () => {
                if (input.classList.contains('is-invalid') || container.classList.contains('was-validated')) {
                    validateField(input, false);
                }

                // If typing into a new password, check confirm-password simultaneously
                if (input.id === 'new-pwd' || input.id === 'pwdNew') {
                    const confirmField = document.getElementById('confirm-pwd') || document.getElementById('pwdConfirm');
                    if (confirmField && confirmField.value) {
                        validateField(confirmField, false);
                    }
                }
            });

            // On select dropdown change
            input.addEventListener('change', () => {
                validateField(input, false);
            });

            // On blur
            input.addEventListener('blur', () => {
                if (input.value.trim().length > 0 || container.classList.contains('was-validated')) {
                    validateField(input, false);
                }
            });
        });
    }

    /**
     * Validates all visible fields within a form or section
     */
    function validateForm(form, visibleOnly = true) {
        if (!form) return true;

        const allInputs = Array.from(form.querySelectorAll('input, select, textarea'));
        const inputsToValidate = visibleOnly ? allInputs.filter(isElementVisible) : allInputs;

        let isValid = true;
        let firstInvalidField = null;

        inputsToValidate.forEach(input => {
            const valid = validateField(input, true);
            if (!valid) {
                isValid = false;
                if (!firstInvalidField) {
                    firstInvalidField = input;
                }
            }
        });

        if (!isValid) {
            form.classList.add('was-validated');
            if (firstInvalidField) {
                firstInvalidField.focus();
                firstInvalidField.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
            if (typeof showWarningToast === 'function') {
                showWarningToast('Please complete all required fields correctly.');
            }
        } else {
            form.classList.remove('was-validated');
        }

        return isValid;
    }

    /**
     * Multi-step Wizard Engine
     */
    function initWizardForms() {
        // 1. Receptionist wizard form
        const recWizard = document.querySelector('.wizard-form-container');
        if (recWizard) {
            const steps = Array.from(recWizard.querySelectorAll('.wizard-step-content'));
            const stepIndicators = Array.from(document.querySelectorAll('.wizard-step'));
            const nextBtns = Array.from(recWizard.querySelectorAll('.btn-next-step'));
            const prevBtns = Array.from(recWizard.querySelectorAll('.btn-prev-step'));
            let currentStep = 0;

            function showStep(stepIdx) {
                steps.forEach((step, idx) => {
                    step.style.display = idx === stepIdx ? 'block' : 'none';
                });

                stepIndicators.forEach((indicator, idx) => {
                    if (idx < stepIdx) {
                        indicator.className = 'wizard-step completed';
                    } else if (idx === stepIdx) {
                        indicator.className = 'wizard-step active';
                    } else {
                        indicator.className = 'wizard-step';
                    }
                });

                if (stepIdx === steps.length - 1) {
                    generateWizardSummary();
                }
            }

            nextBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    const activeStepContent = steps[currentStep];
                    if (!validateForm(activeStepContent, true)) {
                        return;
                    }

                    if (currentStep < steps.length - 1) {
                        currentStep++;
                        showStep(currentStep);
                    }
                });
            });

            prevBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    if (currentStep > 0) {
                        currentStep--;
                        showStep(currentStep);
                    }
                });
            });

            showStep(currentStep);
        }

        // 2. Public Visitor Registration wizard (#multi-step-form)
        const publicWizardForm = document.getElementById('multi-step-form');
        const pubNextBtn = document.getElementById('btn-wizard-next');
        const pubPrevBtn = document.getElementById('btn-wizard-prev');

        if (publicWizardForm && pubNextBtn) {
            attachLiveValidation(publicWizardForm);
        }
    }

    /**
     * Generate complete summary in the review step for receptionist wizard
     */
    function generateWizardSummary() {
        const name = document.getElementById('vName')?.value || 'N/A';
        const email = document.getElementById('vEmail')?.value || 'N/A';
        const phone = document.getElementById('vPhone')?.value || 'N/A';
        const company = document.getElementById('vCompany')?.value || 'N/A';

        const host = document.getElementById('vHost')?.value || 'N/A';
        const dept = document.getElementById('vDept')?.value || 'N/A';
        const purpose = document.getElementById('vPurpose')?.value || 'N/A';
        const date = document.getElementById('vDate')?.value || 'N/A';
        const time = document.getElementById('vTime')?.value || 'N/A';

        const summaryHtml = `
            <div class="row g-3 fs-7">
                <div class="col-md-6 border-end">
                    <h6 class="text-bold text-primary mb-2"><i class="bi bi-person-circle"></i> Visitor Details</h6>
                    <p class="mb-1"><strong>Name:</strong> ${name}</p>
                    <p class="mb-1"><strong>Email:</strong> ${email}</p>
                    <p class="mb-1"><strong>Phone:</strong> ${phone}</p>
                    <p class="mb-1"><strong>Company:</strong> ${company}</p>
                </div>
                <div class="col-md-6">
                    <h6 class="text-bold text-primary mb-2"><i class="bi bi-calendar-event"></i> Visit Information</h6>
                    <p class="mb-1"><strong>Host Employee:</strong> ${host}</p>
                    <p class="mb-1"><strong>Department:</strong> ${dept}</p>
                    <p class="mb-1"><strong>Purpose:</strong> ${purpose}</p>
                    <p class="mb-1"><strong>Schedule:</strong> ${date} at ${time}</p>
                </div>
            </div>
        `;

        const summaryTarget = document.getElementById('wizard-summary-target');
        if (summaryTarget) {
            summaryTarget.innerHTML = summaryHtml;
        }
    }

    /**
     * Drag & Drop Zone upload handlers with file size and type validation
     */
    function initDropzones() {
        const dropzones = Array.from(document.querySelectorAll('.upload-dropzone'));

        dropzones.forEach(zone => {
            const fileInput = zone.querySelector('.upload-file-input');
            const previewContainer = document.getElementById(zone.dataset.preview);
            const previewImage = previewContainer?.querySelector('.upload-preview-image');
            const removeBtn = previewContainer?.querySelector('.remove-upload-btn');

            if (!fileInput) return;

            zone.addEventListener('dragover', (e) => {
                e.preventDefault();
                zone.classList.add('border-primary');
            });

            zone.addEventListener('dragleave', () => {
                zone.classList.remove('border-primary');
            });

            zone.addEventListener('drop', (e) => {
                e.preventDefault();
                zone.classList.remove('border-primary');
                if (e.dataTransfer.files.length) {
                    fileInput.files = e.dataTransfer.files;
                    handleFilePreview(fileInput.files[0], previewContainer, previewImage, zone);
                }
            });

            fileInput.addEventListener('change', () => {
                if (fileInput.files.length) {
                    handleFilePreview(fileInput.files[0], previewContainer, previewImage, zone);
                }
            });

            if (removeBtn) {
                removeBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    fileInput.value = '';
                    if (previewImage) previewImage.src = '';
                    if (previewContainer) previewContainer.style.display = 'none';
                    zone.style.display = 'block';
                });
            }
        });
    }

    function handleFilePreview(file, container, img, zone) {
        if (!file || !container || !img) return;

        // Max 5MB file size check
        const MAX_SIZE = 5 * 1024 * 1024;
        if (file.size > MAX_SIZE) {
            if (typeof showErrorToast === 'function') {
                showErrorToast('File exceeds 5MB size limit. Please upload a smaller image or document.');
            } else if (typeof Swal !== 'undefined') {
                Swal.fire('File Too Large', 'File exceeds 5MB limit. Please upload a smaller file.', 'warning');
            }
            return;
        }

        if (file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = (e) => {
                img.src = e.target.result;
                container.style.display = 'block';
                zone.style.display = 'none';
                if (typeof showSuccessToast === 'function') {
                    showSuccessToast('Image uploaded successfully.');
                }
            };
            reader.readAsDataURL(file);
        } else {
            // PDF or Document
            img.src = 'https://placehold.co/400x250/2563eb/ffffff?text=' + encodeURIComponent(file.name);
            container.style.display = 'block';
            zone.style.display = 'none';
            if (typeof showSuccessToast === 'function') {
                showSuccessToast('Document proof attached.');
            }
        }
    }

    /**
     * Flatpickr initializations
     */
    function initDatepickers() {
        if (typeof flatpickr !== 'undefined') {
            flatpickr('.datepicker-premium', {
                dateFormat: 'Y-m-d',
                minDate: 'today',
                disableMobile: true
            });

            flatpickr('.timepicker-premium', {
                enableTime: true,
                noCalendar: true,
                dateFormat: 'H:i',
                disableMobile: true
            });
        }
    }

    /**
     * Attach universal validation listeners to all forms found on the page
     */
    function initAllForms() {
        const containers = Array.from(document.querySelectorAll('form, .needs-validation'));
        containers.forEach(container => {
            attachLiveValidation(container);

            if (container.classList.contains('needs-validation')) {
                if (container.tagName.toLowerCase() === 'form') {
                    container.addEventListener('submit', (e) => {
                        if (!validateForm(container, true)) {
                            e.preventDefault();
                            e.stopPropagation();
                        }
                    }, false);
                }
            }
        });

        // Re-bind when Bootstrap modals are opened
        document.addEventListener('shown.bs.modal', (e) => {
            const modal = e.target;
            if (modal) {
                const modalForms = modal.querySelectorAll('form, .needs-validation');
                modalForms.forEach(f => attachLiveValidation(f));
            }
        });
    }

    // Expose global API
    window.SVPMSForms = {
        validateField,
        validateForm,
        attachLiveValidation,
        initWizardForms,
        initDropzones,
        initDatepickers,
        initAllForms
    };

    // Auto-initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            initAllForms();
            initWizardForms();
            initDropzones();
            initDatepickers();
        });
    } else {
        initAllForms();
        initWizardForms();
        initDropzones();
        initDatepickers();
    }
})();
