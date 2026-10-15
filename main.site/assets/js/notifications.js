/* svpms/assets/js/notifications.js */

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer);
        toast.addEventListener('mouseleave', Swal.resumeTimer);
    }
});

function showSuccessToast(message) {
    Toast.fire({
        icon: 'success',
        title: message,
        background: document.documentElement.getAttribute('data-theme') === 'dark' ? '#121824' : '#FFFFFF',
        color: document.documentElement.getAttribute('data-theme') === 'dark' ? '#F8FAFC' : '#0F172A'
    });
}

function showErrorToast(message) {
    Toast.fire({
        icon: 'error',
        title: message,
        background: document.documentElement.getAttribute('data-theme') === 'dark' ? '#121824' : '#FFFFFF',
        color: document.documentElement.getAttribute('data-theme') === 'dark' ? '#F8FAFC' : '#0F172A'
    });
}

function showWarningToast(message) {
    Toast.fire({
        icon: 'warning',
        title: message,
        background: document.documentElement.getAttribute('data-theme') === 'dark' ? '#121824' : '#FFFFFF',
        color: document.documentElement.getAttribute('data-theme') === 'dark' ? '#F8FAFC' : '#0F172A'
    });
}

function showInfoToast(message) {
    Toast.fire({
        icon: 'info',
        title: message,
        background: document.documentElement.getAttribute('data-theme') === 'dark' ? '#121824' : '#FFFFFF',
        color: document.documentElement.getAttribute('data-theme') === 'dark' ? '#F8FAFC' : '#0F172A'
    });
}

// Global hook to trigger toasts based on query params for demo redirects
document.addEventListener('DOMContentLoaded', () => {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('successMsg')) {
        showSuccessToast(urlParams.get('successMsg'));
    }
    if (urlParams.has('errorMsg')) {
        showErrorToast(urlParams.get('errorMsg'));
    }
});
