-- Drop existing tables if they exist
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS patients;

-- Create Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    address TEXT
);

-- Create Visits Table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    department VARCHAR(100),
    doctor_name VARCHAR(100),
    diagnosis TEXT,
    bill_amount DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Sample Data for Patients
INSERT INTO patients (name, age, gender, address) VALUES
('Alice Johnson', 29, 'Female', 'Mumbai'),
('Bob Smith', 45, 'Male', 'Delhi'),
('Carol White', 35, 'Female', 'Chennai');

-- Sample Data for Visits
INSERT INTO visits (patient_id, visit_date, department, doctor_name, diagnosis, bill_amount) VALUES
(1, '2024-05-01', 'Cardiology', 'Dr. Raj', 'Hypertension', 2500.00),
(1, '2024-06-01', 'Dermatology', 'Dr. Priya', 'Allergy', 1800.00),
(2, '2024-05-20', 'Neurology', 'Dr. Khan', 'Migraine', 3000.00),
(3, '2024-06-10', 'Cardiology', 'Dr. Raj', 'Arrhythmia', 4000.00),
(3, '2024-06-15', 'Orthopedics', 'Dr. Mehta', 'Fracture', 3500.00);

-- View: High Billing Patients
CREATE VIEW high_billing_patients AS
SELECT p.name, SUM(v.bill_amount) AS total_spent
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.name
HAVING total_spent > 3000;

-- View: Visit Summary per Department
CREATE VIEW department_visit_summary AS
SELECT department, COUNT(*) AS total_visits, AVG(bill_amount) AS avg_billing
FROM visits
GROUP BY department;

-- Stored Procedure: Get Visit Details by Department
DELIMITER //
CREATE PROCEDURE GetVisitsByDepartment(IN dept_name VARCHAR(100))
BEGIN
    SELECT p.name, v.visit_date, v.doctor_name, v.diagnosis, v.bill_amount
    FROM visits v
    JOIN patients p ON v.patient_id = p.patient_id
    WHERE v.department = dept_name;
END //
DELIMITER ;

-- Stored Procedure: Get Total Billing for a Patient
DELIMITER //
CREATE PROCEDURE GetPatientBillingSummary(IN patientName VARCHAR(100))
BEGIN
    SELECT p.name, SUM(v.bill_amount) AS total_billed
    FROM patients p
    JOIN visits v ON p.patient_id = v.patient_id
    WHERE p.name = patientName
    GROUP BY p.name;
END //
DELIMITER ;

-- Example Query 1: List all patients and their latest visit
SELECT p.name, MAX(v.visit_date) AS latest_visit
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.name;

-- Example Query 2: Total revenue generated
SELECT SUM(bill_amount) AS total_revenue FROM visits;

-- Example Query 3: Most visited department
SELECT department, COUNT(*) AS visit_count
FROM visits
GROUP BY department
ORDER BY visit_count DESC
LIMIT 1;
