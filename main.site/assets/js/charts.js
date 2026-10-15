/* svpms/assets/js/charts.js */

// Global Chart Store to handle redraws on theme change
const activeCharts = {};

function getChartColors() {
    const isDark = document.documentElement.getAttribute('data-theme') === 'dark';
    return {
        text: isDark ? '#94A3B8' : '#64748B',
        grid: isDark ? '#1E293B' : '#E2E8F0',
        primary: '#2563EB',
        primaryLight: 'rgba(37, 99, 235, 0.1)',
        secondary: '#4F46E5',
        secondaryLight: 'rgba(79, 70, 229, 0.1)',
        success: '#22C55E',
        warning: '#F59E0B',
        danger: '#EF4444',
        info: '#06B6D4'
    };
}

// Listening to theme change events to redraw charts with correct gridline colors
window.addEventListener('themeChanged', () => {
    Object.keys(activeCharts).forEach(chartId => {
        if (activeCharts[chartId]) {
            const colors = getChartColors();
            const chart = activeCharts[chartId];
            
            // Update options
            if (chart.options.scales) {
                if (chart.options.scales.x) {
                    chart.options.scales.x.grid.color = colors.grid;
                    chart.options.scales.x.ticks.color = colors.text;
                }
                if (chart.options.scales.y) {
                    chart.options.scales.y.grid.color = colors.grid;
                    chart.options.scales.y.ticks.color = colors.text;
                }
            }
            if (chart.options.plugins && chart.options.plugins.legend) {
                chart.options.plugins.legend.labels.color = colors.text;
            }
            chart.update();
        }
    });
});

// Admin Dashboard Charts
function initAdminCharts() {
    const colors = getChartColors();

    // 1. Visitor Trend (Line)
    const trendCtx = document.getElementById('visitorTrendChart');
    if (trendCtx) {
        if (activeCharts['trend']) activeCharts['trend'].destroy();
        activeCharts['trend'] = new Chart(trendCtx, {
            type: 'line',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Visitor Entries',
                    data: [142, 168, 155, 192, 210, 85, 62],
                    borderColor: colors.primary,
                    backgroundColor: colors.primaryLight,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { labels: { color: colors.text } }
                },
                scales: {
                    x: { grid: { color: colors.grid }, ticks: { color: colors.text } },
                    y: { grid: { color: colors.grid }, ticks: { color: colors.text }, beginAtZero: true }
                }
            }
        });
    }

    // 2. Department Visitors (Bar)
    const deptCtx = document.getElementById('deptVisitorsChart');
    if (deptCtx) {
        if (activeCharts['dept']) activeCharts['dept'].destroy();
        activeCharts['dept'] = new Chart(deptCtx, {
            type: 'bar',
            data: {
                labels: ['IT', 'HR', 'Finance', 'Academics', 'Admin'],
                datasets: [{
                    label: 'Visitors Logged',
                    data: [420, 240, 180, 510, 310],
                    backgroundColor: colors.secondary,
                    borderRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    x: { grid: { display: false }, ticks: { color: colors.text } },
                    y: { grid: { color: colors.grid }, ticks: { color: colors.text }, beginAtZero: true }
                }
            }
        });
    }

    // 3. Visitor Status (Doughnut)
    const statusCtx = document.getElementById('visitorStatusChart');
    if (statusCtx) {
        if (activeCharts['status']) activeCharts['status'].destroy();
        activeCharts['status'] = new Chart(statusCtx, {
            type: 'doughnut',
            data: {
                labels: ['Approved', 'Pending', 'Rejected', 'Inside'],
                datasets: [{
                    data: [320, 45, 12, 68],
                    backgroundColor: [colors.success, colors.warning, colors.danger, colors.primary],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom', labels: { color: colors.text, boxWidth: 12 } }
                },
                cutout: '70%'
            }
        });
    }

    // 4. Gate entries traffic (Bar)
    const gateCtx = document.getElementById('gateTrafficChart');
    if (gateCtx) {
        if (activeCharts['gate']) activeCharts['gate'].destroy();
        activeCharts['gate'] = new Chart(gateCtx, {
            type: 'bar',
            data: {
                labels: ['Main Gate', 'North Gate', 'South Gate', 'VIP Gate'],
                datasets: [{
                    label: 'Entries',
                    data: [580, 290, 140, 95],
                    backgroundColor: colors.info,
                    borderRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { grid: { display: false }, ticks: { color: colors.text } },
                    y: { grid: { color: colors.grid }, ticks: { color: colors.text }, beginAtZero: true }
                }
            }
        });
    }
}

// Receptionist Dashboard Charts
function initReceptionistCharts() {
    const colors = getChartColors();

    const hourlyCtx = document.getElementById('hourlyVisitorsChart');
    if (hourlyCtx) {
        if (activeCharts['hourly']) activeCharts['hourly'].destroy();
        activeCharts['hourly'] = new Chart(hourlyCtx, {
            type: 'line',
            data: {
                labels: ['08:00', '10:00', '12:00', '14:00', '16:00', '18:00'],
                datasets: [{
                    label: 'Check-ins',
                    data: [15, 45, 38, 56, 22, 8],
                    borderColor: colors.primary,
                    backgroundColor: colors.primaryLight,
                    fill: true,
                    tension: 0.4,
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { grid: { color: colors.grid }, ticks: { color: colors.text } },
                    y: { grid: { color: colors.grid }, ticks: { color: colors.text }, beginAtZero: true }
                }
            }
        });
    }

    const statusCtx = document.getElementById('receptionStatusChart');
    if (statusCtx) {
        if (activeCharts['receptionStatus']) activeCharts['receptionStatus'].destroy();
        activeCharts['receptionStatus'] = new Chart(statusCtx, {
            type: 'doughnut',
            data: {
                labels: ['Checked In', 'Expected', 'Completed'],
                datasets: [{
                    data: [28, 42, 35],
                    backgroundColor: [colors.primary, colors.warning, colors.success],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom', labels: { color: colors.text, boxWidth: 12 } }
                },
                cutout: '70%'
            }
        });
    }
}

// Security Dashboard Charts
function initSecurityCharts() {
    const colors = getChartColors();

    const flowCtx = document.getElementById('securityTrafficChart');
    if (flowCtx) {
        if (activeCharts['securityTraffic']) activeCharts['securityTraffic'].destroy();
        activeCharts['securityTraffic'] = new Chart(flowCtx, {
            type: 'bar',
            data: {
                labels: ['08:00', '10:00', '12:00', '14:00', '16:00', '18:00'],
                datasets: [
                    {
                        label: 'Entries',
                        data: [12, 35, 28, 48, 18, 5],
                        backgroundColor: colors.primary,
                        borderRadius: 4
                    },
                    {
                        label: 'Exits',
                        data: [2, 10, 24, 32, 42, 28],
                        backgroundColor: colors.secondary,
                        borderRadius: 4
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top', labels: { color: colors.text } }
                },
                scales: {
                    x: { grid: { display: false }, ticks: { color: colors.text } },
                    y: { grid: { color: colors.grid }, ticks: { color: colors.text }, beginAtZero: true }
                }
            }
        });
    }
}
