<%@ Page Title="Live Visitors On-Site" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true" CodeBehind="live-visitors.aspx.cs" Inherits="main.site.SecurityLiveVisitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Main Content -->
            <main class="main-content flex-grow-1">
                <div class="mb-4" data-aos="fade-up">
                    <h5 class="text-bold mb-1">Live Occupancy Monitor</h5>
                    <p class="text-color-secondary fs-7 mb-0">List of all visitors scanned inside the campus borders. Security check-outs must be logged on exit.</p>
                </div>

                <div class="row g-4" id="live-visitors-grid" data-aos="fade-up" data-aos-delay="100">
                    <!-- Dynamic rendering -->
                </div>
            </main>

    <!-- Core Javascript Libraries -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
<script>
        document.addEventListener('DOMContentLoaded', () => {
            loadLiveGuests();
        });

        function loadLiveGuests() {
            const container = document.getElementById('live-visitors-grid');
            const visitors = JSON.parse(localStorage.getItem('svpms_visitors') || '[]');
            const live = visitors.filter(v => v.status === 'Inside');

            container.innerHTML = '';

            if (live.length === 0) {
                container.innerHTML = `
                    <div class="col-12 text-center py-5">
                        <div class="card-premium py-5">
                            <i class="bi bi-door-closed text-color-muted empty-state-icon" style="font-size: 4rem;"></i>
                            <h5 class="text-bold mt-3">No Guests On-Site</h5>
                            <p class="text-color-secondary">All registered visitors have successfully checked-out of the facility.</p>
                            <a href="dashboard.aspx" class="btn btn-premium btn-premium-primary mt-2">Back to Dashboard</a>
                        </div>
                    </div>
                `;
                return;
            }

            live.forEach(v => {
                const card = document.createElement('div');
                card.className = 'col-xl-4 col-md-6';
                card.innerHTML = `
                    <div class="card-premium h-100 d-flex flex-column justify-content-between">
                        <div>
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <img src="${v.photo}" alt="${v.name}" class="avatar avatar-md">
                                <div>
                                    <h6 class="text-bold text-color-primary mb-0">${v.name}</h6>
                                    <small class="text-color-muted fs-8">Pass ID: ${v.id}</small>
                                </div>
                            </div>
                            
                            <hr class="my-3">
                            
                            <div class="fs-7 text-color-secondary">
                                <p class="mb-1"><strong>Company:</strong> ${v.company}</p>
                                <p class="mb-1"><strong>Host Employee:</strong> ${v.host}</p>
                                <p class="mb-1"><strong>Purpose:</strong> ${v.purpose}</p>
                                <p class="mb-1"><strong>Check-In Time:</strong> <span class="text-primary text-bold">${v.entryTime || '09:12 AM'}</span></p>
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-4 pt-3 border-top">
                            <a href="exit-verification.aspx?visitorId=${v.id}" class="btn btn-sm btn-premium btn-premium-primary"><i class="bi bi-box-arrow-left"></i> Confirm Exit Check-Out</a>
                        </div>
                    </div>
                `;
                container.appendChild(card);
            });
        }
    </script>
</asp:Content>
