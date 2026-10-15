/* svpms/assets/js/tables.js */

function initPremiumDataTable(selector, customOptions = {}) {
    const tableEl = document.querySelector(selector);
    if (!tableEl) return null;

    const defaultOptions = {
        responsive: true,
        autoWidth: false,
        pageLength: 10,
        lengthMenu: [5, 10, 25, 50],
        language: {
            search: "_INPUT_",
            searchPlaceholder: "Search records...",
            lengthMenu: "Show _MENU_ entries",
            info: "Showing _START_ to _END_ of _TOTAL_ entries",
            infoEmpty: "Showing 0 to 0 of 0 entries",
            paginate: {
                first: "<i class='bi bi-chevron-double-left'></i>",
                last: "<i class='bi bi-chevron-double-right'></i>",
                next: "<i class='bi bi-chevron-right'></i>",
                previous: "<i class='bi bi-chevron-left'></i>"
            }
        },
        drawCallback: function() {
            // Apply custom styles to pagination buttons after load
            $('.dataTables_paginate .paginate_button').addClass('btn btn-sm btn-outline-light text-dark mx-1');
            $('.dataTables_paginate .paginate_button.current').addClass('btn-primary text-white').removeClass('btn-outline-light text-dark');
        }
    };

    const finalOptions = $.extend(true, {}, defaultOptions, customOptions);
    const table = $(selector).DataTable(finalOptions);

    // Style search container
    const searchWrapper = $(selector + '_wrapper .dataTables_filter');
    if (searchWrapper.length) {
        searchWrapper.addClass('d-flex align-items-center justify-content-md-end justify-content-start');
        searchWrapper.find('input').addClass('form-control form-control-sm form-control-premium').removeClass('form-control-sm');
    }

    // Style length container
    const lengthWrapper = $(selector + '_wrapper .dataTables_length');
    if (lengthWrapper.length) {
        lengthWrapper.addClass('d-flex align-items-center');
        lengthWrapper.find('select').addClass('form-select form-select-sm form-control-premium mx-2').css('width', '80px');
    }

    return table;
}
