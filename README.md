# Visitor Management System (.NET Web Forms)

An enterprise-grade Visitor & Gate Access Management solution developed with ASP.NET Web Forms (.NET Framework), SQL Server, Bootstrap, and modern JavaScript.

---

## 🏛️ System Architecture & Modules

### 1. Administration & System Management (`/admin`)
- **Executive Dashboard**: Real-time statistics, capacity limits, and traffic analytics.
- **Organization Structure**: Management of departments, employees, buildings, and perimeter security gates.
- **Visitor Governance**: Reviewing access requests, pass approvals, historical logs, and blacklist policies.
- **Reporting & Auditing**: Detailed access reports and compliance audit trail.

### 2. Receptionist Desk & Guest Onboarding (`/receptionist`)
- **Front-Desk Dashboard**: Quick visitor intake, schedule lookups, and host notifications.
- **Visitor Registration & Walk-Ins**: Immediate walk-in check-in, photo capture, and document validation.
- **Badge & QR Printing**: Instant badge generation and digital pass delivery.
- **Approvals & Schedules**: Monitoring incoming appointments and today's visitor lists.

### 3. Security Operations & Gate Control (`/security`)
- **Checkpoint Scanner**: QR code digital pass verification for fast scanning at perimeter gates.
- **Entry & Exit Verification**: Multi-point validation for visitors, vehicles, and authorized guests.
- **Live Monitoring & Access Logs**: Real-time tracking of on-premises visitors and time-stamped gate logs.
- **Incident Reporting & Blacklist**: Security incident documentation and immediate gate-level blacklist enforcement.

### 4. Visitor Self-Service Portal (`/visitor`)
- **Digital Registration**: Self-service pre-registration and document upload for fast check-in.
- **Digital Pass & QR Code**: Mobile-ready QR passes for touchless checkpoint clearance.
- **Status & Assistance**: Real-time pass status tracker and visitor guidance.

---

## 👥 Contributors

- **Jaimil Trivedi** ([@jaimiltrived](https://github.com/jaimiltrived)) — *System Architecture, Core Framework, Database & Admin Module*
- **Anas Shaikh** ([@anasshaikhh2006-lgtm](https://github.com/anasshaikhh2006-lgtm)) — *Receptionist Operations, Visitor Check-In Desk, UI Design & Visitor Portal*
- **Uramani** ([@uramani438-jpg](https://github.com/uramani438-jpg)) — *Security Checkpoint Portal, Gate Verification, Scanner & Access Audit*

---

## 🛠️ Tech Stack & Requirements

- **Backend**: ASP.NET Web Forms, C#, .NET Framework 4.8
- **Database**: Microsoft SQL Server (`database_schema.sql`)
- **Frontend**: Bootstrap 5, Vanilla CSS3 (Dark/Light themes), Modular ES6 JavaScript
- **IDE**: Visual Studio 2022+ / Visual Studio Solution (`main.site.slnx`)

---

## 🚀 Getting Started

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/jaimiltrived/.netwebsite.git
   ```
2. **Setup Database**:
   - Open SQL Server Management Studio (SSMS).
   - Execute the SQL script located at `main.site/database_schema.sql` to initialize tables, constraints, and seed data.
3. **Configure Connection**:
   - Update the connection string in `main.site/Web.config` to point to your local SQL Server instance.
4. **Run Application**:
   - Open `main.site.slnx` in Visual Studio and press `F5` / Run via IIS Express.
