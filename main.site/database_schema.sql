-- ============================================================================
-- SMART VISITOR PASS MANAGEMENT SYSTEM (SVPMS)
-- Database Name: svpms_db
-- Target RDBMS: MySQL / MariaDB (phpMyAdmin Compatible)
-- Engine: InnoDB, Charset: utf8mb4
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `svpms_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `svpms_db`;

-- Drop existing tables in reverse foreign key order if needed
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `tbl_IncidentReports`;
DROP TABLE IF EXISTS `tbl_Blacklist`;
DROP TABLE IF EXISTS `tbl_VisitorLogs`;
DROP TABLE IF EXISTS `tbl_Visitors`;
DROP TABLE IF EXISTS `tbl_Gates`;
DROP TABLE IF EXISTS `tbl_Employees`;
DROP TABLE IF EXISTS `tbl_Departments`;
DROP TABLE IF EXISTS `tbl_Buildings`;
DROP TABLE IF EXISTS `tbl_Users`;
DROP TABLE IF EXISTS `tbl_Roles`;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================================
-- 1. ROLES TABLE (tbl_Roles)
-- ============================================================================
CREATE TABLE `tbl_Roles` (
    `RoleId` INT AUTO_INCREMENT PRIMARY KEY,
    `RoleName` VARCHAR(50) NOT NULL UNIQUE,       -- 'Admin', 'Receptionist', 'Security', 'Host'
    `Description` VARCHAR(255) NULL,
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 2. USERS / AUTHENTICATION (tbl_Users)
-- ============================================================================
CREATE TABLE `tbl_Users` (
    `UserId` INT AUTO_INCREMENT PRIMARY KEY,
    `Username` VARCHAR(50) NOT NULL UNIQUE,
    `PasswordHash` VARCHAR(255) NOT NULL,
    `FullName` VARCHAR(100) NOT NULL,
    `Email` VARCHAR(100) NOT NULL UNIQUE,
    `RoleId` INT NOT NULL,
    `Status` VARCHAR(20) DEFAULT 'Active',         -- 'Active', 'Inactive', 'Locked'
    `LastLoginAt` DATETIME NULL,
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `FK_Users_Role` FOREIGN KEY (`RoleId`) REFERENCES `tbl_Roles`(`RoleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 3. CAMPUS BUILDINGS (tbl_Buildings)
-- ============================================================================
CREATE TABLE `tbl_Buildings` (
    `BuildingId` INT AUTO_INCREMENT PRIMARY KEY,
    `BuildingCode` VARCHAR(20) NOT NULL UNIQUE,    -- e.g. 'BLDG-01'
    `BuildingName` VARCHAR(100) NOT NULL,          -- e.g. 'Main Admin Block A'
    `Departments` VARCHAR(255) NULL,
    `GatesCount` INT DEFAULT 1,
    `Status` VARCHAR(20) DEFAULT 'Active',         -- 'Active', 'Inactive'
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 4. DEPARTMENTS (tbl_Departments)
-- ============================================================================
CREATE TABLE `tbl_Departments` (
    `DepartmentId` INT AUTO_INCREMENT PRIMARY KEY,
    `DepartmentCode` VARCHAR(20) NOT NULL UNIQUE,  -- e.g. 'DEPT-10'
    `DepartmentName` VARCHAR(100) NOT NULL,        -- e.g. 'Information Technology'
    `BuildingId` INT NULL,
    `Status` VARCHAR(20) DEFAULT 'Active',
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `FK_Departments_Building` FOREIGN KEY (`BuildingId`) REFERENCES `tbl_Buildings`(`BuildingId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 5. HOST EMPLOYEES (tbl_Employees)
-- ============================================================================
CREATE TABLE `tbl_Employees` (
    `EmployeeId` INT AUTO_INCREMENT PRIMARY KEY,
    `EmployeeCode` VARCHAR(20) NOT NULL UNIQUE,    -- e.g. 'EMP-2084'
    `FullName` VARCHAR(100) NOT NULL,
    `Email` VARCHAR(100) NOT NULL UNIQUE,
    `Phone` VARCHAR(20) NULL,
    `DepartmentId` INT NOT NULL,
    `Status` VARCHAR(20) DEFAULT 'Active',         -- 'Active', 'Inactive'
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `FK_Employees_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `tbl_Departments`(`DepartmentId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 6. GATE CHECKPOINTS (tbl_Gates)
-- ============================================================================
CREATE TABLE `tbl_Gates` (
    `GateId` INT AUTO_INCREMENT PRIMARY KEY,
    `GateCode` VARCHAR(20) NOT NULL UNIQUE,        -- e.g. 'GATE-101'
    `GateName` VARCHAR(100) NOT NULL,              -- e.g. 'Main Entrance Gate A'
    `BuildingId` INT NULL,
    `AuthorizedRoles` VARCHAR(100) DEFAULT 'All Roles',
    `Status` VARCHAR(20) DEFAULT 'Online',         -- 'Online', 'Offline', 'Maintenance'
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `FK_Gates_Building` FOREIGN KEY (`BuildingId`) REFERENCES `tbl_Buildings`(`BuildingId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 7. VISITORS & PASSES (tbl_Visitors)
-- ============================================================================
CREATE TABLE `tbl_Visitors` (
    `VisitorId` INT AUTO_INCREMENT PRIMARY KEY,
    `PassId` VARCHAR(30) NOT NULL UNIQUE,          -- e.g. 'VP-264025'
    `FullName` VARCHAR(100) NOT NULL,
    `Email` VARCHAR(100) NOT NULL,
    `Phone` VARCHAR(20) NOT NULL,
    `Company` VARCHAR(100) NOT NULL,
    `Purpose` VARCHAR(255) NOT NULL,
    `HostEmployeeId` INT NULL,
    `DepartmentId` INT NULL,
    `VisitDate` DATE NOT NULL,
    `VisitTime` VARCHAR(20) NOT NULL,
    `Status` VARCHAR(20) DEFAULT 'Pending',        -- 'Pending', 'Approved', 'Inside', 'Exited', 'Rejected'
    `PhotoUrl` VARCHAR(500) NULL,
    `IdProofUrl` VARCHAR(500) NULL,
    `QrToken` VARCHAR(255) NULL,
    `EntryTime` DATETIME NULL,
    `ExitTime` DATETIME NULL,
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `FK_Visitors_Employee` FOREIGN KEY (`HostEmployeeId`) REFERENCES `tbl_Employees`(`EmployeeId`) ON DELETE SET NULL,
    CONSTRAINT `FK_Visitors_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `tbl_Departments`(`DepartmentId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 8. GATE ENTRY & EXIT SCAN AUDIT LOGS (tbl_VisitorLogs)
-- ============================================================================
CREATE TABLE `tbl_VisitorLogs` (
    `LogId` INT AUTO_INCREMENT PRIMARY KEY,
    `PassId` VARCHAR(30) NOT NULL,
    `VisitorId` INT NULL,
    `GateId` INT NOT NULL,
    `ScanType` VARCHAR(20) NOT NULL,               -- 'Check-In', 'Check-Out'
    `ScanTimestamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `VerifyingOfficer` VARCHAR(100) NOT NULL,
    `Remarks` VARCHAR(255) NULL,
    CONSTRAINT `FK_Logs_Visitor` FOREIGN KEY (`VisitorId`) REFERENCES `tbl_Visitors`(`VisitorId`) ON DELETE CASCADE,
    CONSTRAINT `FK_Logs_Gate` FOREIGN KEY (`GateId`) REFERENCES `tbl_Gates`(`GateId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 9. ACCESS BLACKLIST / BANNED PROFILES (tbl_Blacklist)
-- ============================================================================
CREATE TABLE `tbl_Blacklist` (
    `BlacklistId` INT AUTO_INCREMENT PRIMARY KEY,
    `PassId` VARCHAR(30) NOT NULL,
    `VisitorName` VARCHAR(100) NOT NULL,
    `Reason` VARCHAR(500) NOT NULL,
    `RiskLevel` VARCHAR(20) DEFAULT 'High',        -- 'High', 'Medium', 'Low'
    `EnforcedBy` VARCHAR(100) NOT NULL,
    `BannedDate` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `Status` VARCHAR(20) DEFAULT 'Active'          -- 'Active', 'Revoked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- 10. SECURITY INCIDENT REPORTS (tbl_IncidentReports)
-- ============================================================================
CREATE TABLE `tbl_IncidentReports` (
    `IncidentId` INT AUTO_INCREMENT PRIMARY KEY,
    `IncidentType` VARCHAR(100) NOT NULL,          -- e.g. 'Unauthorized Gate Intrusion'
    `GateId` INT NULL,
    `IncidentDate` DATE NOT NULL,
    `IncidentTime` VARCHAR(20) NOT NULL,
    `Description` TEXT NOT NULL,
    `Severity` VARCHAR(20) DEFAULT 'High',         -- 'High', 'Medium', 'Low'
    `EvidenceImagePath` VARCHAR(500) NULL,
    `ReportedBy` VARCHAR(100) NOT NULL,
    `CreatedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `FK_Incidents_Gate` FOREIGN KEY (`GateId`) REFERENCES `tbl_Gates`(`GateId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- DEFAULT SEED DATA INSERTION
-- ============================================================================

-- Roles
INSERT INTO `tbl_Roles` (`RoleId`, `RoleName`, `Description`) VALUES 
(1, 'Admin', 'Complete portal administrative control and user management'),
(2, 'Receptionist', 'Front desk registration, pass issuance and visitor badges'),
(3, 'Security', 'Gate entry/exit scanner verification and security incidents'),
(4, 'Host', 'Employee host who can pre-approve and invite visitors');

-- Users
INSERT INTO `tbl_Users` (`Username`, `PasswordHash`, `FullName`, `Email`, `RoleId`, `Status`) VALUES
('admin', 'admin123', 'Aarav Mehta (Admin)', 'admin@college.edu', 1, 'Active'),
('receptionist', 'reception123', 'Sunita Rao (Front Desk)', 'reception@college.edu', 2, 'Active'),
('security', 'security123', 'Vikram Singh (Security Unit)', 'security@college.edu', 3, 'Active');

-- Buildings
INSERT INTO `tbl_Buildings` (`BuildingCode`, `BuildingName`, `Departments`, `GatesCount`, `Status`) VALUES
('BLDG-01', 'Main Admin Block A', 'Finance, HR, Administration, Security', 2, 'Active'),
('BLDG-02', 'Science & Lab Block B', 'Biotechnology, Physics, Research Labs', 3, 'Active'),
('BLDG-03', 'Engineering Wing C', 'IT Labs, Robotics, Electronics', 2, 'Active'),
('BLDG-04', 'Auditorium & Arts Complex D', 'Cultural Center, Main Hall', 2, 'Active'),
('BLDG-05', 'Sports & Athletics Arena', 'Physical Education, Medical Unit', 1, 'Active'),
('BLDG-06', 'Central Library & Media Center', 'Digital Archives, Reading Halls', 2, 'Active');

-- Departments
INSERT INTO `tbl_Departments` (`DepartmentCode`, `DepartmentName`, `BuildingId`, `Status`) VALUES
('DEPT-10', 'Information Technology', 1, 'Active'),
('DEPT-11', 'Human Resources', 1, 'Active'),
('DEPT-12', 'Finance & Accounts', 1, 'Active'),
('DEPT-13', 'Academics & Research', 2, 'Active'),
('DEPT-14', 'Campus Safety & Administration', 1, 'Active'),
('DEPT-15', 'Biotechnology & Innovation', 2, 'Active'),
('DEPT-16', 'Robotics & Mechanical', 3, 'Active');

-- Host Employees
INSERT INTO `tbl_Employees` (`EmployeeCode`, `FullName`, `Email`, `Phone`, `DepartmentId`, `Status`) VALUES
('EMP-2084', 'Dr. Priya Sharma', 'priya.sharma@college.edu', '+91 98765 01101', 1, 'Active'),
('EMP-2085', 'Arjun Mehta', 'arjun.mehta@college.edu', '+91 98765 01102', 2, 'Active'),
('EMP-2086', 'Prof. Anand Kulkarni', 'anand.kulkarni@college.edu', '+91 98765 01103', 4, 'Active'),
('EMP-2087', 'Capt. Devendra Rathore', 'devendra.rathore@college.edu', '+91 98765 01104', 5, 'Active'),
('EMP-2088', 'Dr. Sunita Rao', 'sunita.rao@college.edu', '+91 98765 01105', 6, 'Active'),
('EMP-2089', 'Siddharth Malhotra', 'siddharth.m@college.edu', '+91 98765 01106', 7, 'Active');

-- Gates
INSERT INTO `tbl_Gates` (`GateCode`, `GateName`, `BuildingId`, `AuthorizedRoles`, `Status`) VALUES
('GATE-101', 'Main Entrance Gate A', 1, 'All Roles', 'Online'),
('GATE-102', 'North Service Gate B', 2, 'Staff & Visitors', 'Online'),
('GATE-103', 'VIP Gate C', 1, 'VIP & Dignitaries', 'Online'),
('GATE-104', 'East Campus Gate D', 3, 'Staff & Visitors', 'Online'),
('GATE-105', 'South Logistics Gate E', 5, 'Staff Only', 'Online'),
('GATE-106', 'Auditorium Gate F', 4, 'All Roles', 'Maintenance');

-- Visitors
INSERT INTO `tbl_Visitors` (`PassId`, `FullName`, `Email`, `Phone`, `Company`, `Purpose`, `HostEmployeeId`, `DepartmentId`, `VisitDate`, `VisitTime`, `Status`, `PhotoUrl`, `IdProofUrl`, `QrToken`) VALUES
('VP-264025', 'Aarav Patel', 'aarav.patel@tata.com', '+91 98765 01234', 'Tata Consultancy Services', 'System Maintenance Integration', 1, 1, CURDATE(), '10:00 AM', 'Approved', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', 'https://placehold.co/400x250/2563eb/ffffff?text=Aarav+Patel+ID+Card', 'TOKEN-VP264025'),
('VP-264026', 'Ananya Iyer', 'ananya.iyer@infosys.com', '+91 98765 05678', 'Infosys Technologies', 'Recruitment Interview Panel', 2, 2, CURDATE(), '11:30 AM', 'Pending', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', 'https://placehold.co/400x250/2563eb/ffffff?text=Ananya+Iyer+ID+Card', 'TOKEN-VP264026'),
('VP-264027', 'Rohan Verma', 'rohan.verma@wipro.com', '+91 98765 09112', 'Wipro Technologies', 'Gate Access CCTV Inspection', 4, 5, CURDATE(), '09:00 AM', 'Inside', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', 'https://placehold.co/400x250/2563eb/ffffff?text=Rohan+Verma+ID+Card', 'TOKEN-VP264027'),
('VP-264028', 'Sneha Kulkarni', 'sneha.k@reliance.com', '+91 98765 03456', 'Reliance Industries', 'Guest Lecture in Data Science', 3, 4, CURDATE(), '08:30 AM', 'Exited', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', 'https://placehold.co/400x250/2563eb/ffffff?text=Sneha+Kulkarni+ID+Card', 'TOKEN-VP264028'),
('VP-264029', 'Deepak Malhotra', 'deepak.malhotra@spam.com', '+91 98765 07890', 'Independent Freelance', 'Intrusion Investigation', 1, 1, CURDATE(), '02:00 PM', 'Pending', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80', 'https://placehold.co/400x250/2563eb/ffffff?text=Deepak+Malhotra+ID+Card', 'TOKEN-VP264029');

-- Visitor Logs
INSERT INTO `tbl_VisitorLogs` (`PassId`, `VisitorId`, `GateId`, `ScanType`, `VerifyingOfficer`, `Remarks`) VALUES
('VP-264027', 3, 1, 'Check-In', 'Officer Vikram Singh', 'Identity verified via Government Aadhaar Card'),
('VP-264028', 4, 3, 'Check-In', 'Officer Vikram Singh', 'Guest Lecture Speaker VIP entry'),
('VP-264028', 4, 3, 'Check-Out', 'Officer Vikram Singh', 'Exit confirmed. Pass returned.');

-- Blacklist
INSERT INTO `tbl_Blacklist` (`PassId`, `VisitorName`, `Reason`, `RiskLevel`, `EnforcedBy`) VALUES
('VP-264029', 'Deepak Malhotra', 'Security policy violation - repeated unauthorized entry attempts into server room', 'High', 'Admin System'),
('VP-999999', 'Fake Pass Identity', 'Counterfeit badge presentation at Gate B', 'High', 'Officer Vikram Singh');

-- Incident Reports
INSERT INTO `tbl_IncidentReports` (`IncidentType`, `GateId`, `IncidentDate`, `IncidentTime`, `Description`, `Severity`, `ReportedBy`) VALUES
('Unauthorized Gate Intrusion', 1, CURDATE(), '10:15 AM', 'Suspicious individual attempted to tailgate an authorized vehicle through Gate A barrier arm.', 'High', 'Officer Vikram Singh');
