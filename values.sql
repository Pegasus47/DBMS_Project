-- Insert Pharma Companies
-- -------------------------------
INSERT INTO pharma_comp VALUES ('Pfizer', '1234567890');
INSERT INTO pharma_comp VALUES ('Cipla', '9876543210');
INSERT INTO pharma_comp VALUES ('SunPharma', '1122334455');
INSERT INTO pharma_comp VALUES ('DrReddy', '8899776655');
INSERT INTO pharma_comp VALUES ('Lupin', '7788990011');

-- -------------------------------
-- Insert Pharmacies
-- -------------------------------
INSERT INTO pharmacy VALUES ('NovaHyd', 'Banjara Hills, Hyderabad', '0401234567');
INSERT INTO pharmacy VALUES ('NovaDelhi', 'Connaught Place, Delhi', '0117654321');
INSERT INTO pharmacy VALUES ('NovaMumbai', 'Andheri West, Mumbai', '0229988776');
INSERT INTO pharmacy VALUES ('NovaChennai', 'T Nagar, Chennai', '0442233445');

-- -------------------------------
-- Insert Drugs
-- -------------------------------
INSERT INTO drugs VALUES ('Pfizer', 'Panadol', 'Paracetamol 500mg');
INSERT INTO drugs VALUES ('Pfizer', 'Azithro', 'Azithromycin 250mg');
INSERT INTO drugs VALUES ('Cipla', 'Cetrizine', 'Cetirizine 10mg');
INSERT INTO drugs VALUES ('Cipla', 'Montair', 'Montelukast 10mg');
INSERT INTO drugs VALUES ('SunPharma', 'Calpol', 'Paracetamol 650mg');
INSERT INTO drugs VALUES ('SunPharma', 'Azee', 'Azithromycin 500mg');
INSERT INTO drugs VALUES ('DrReddy', 'Levocet', 'Levocetirizine 5mg');
INSERT INTO drugs VALUES ('DrReddy', 'Dolo', 'Paracetamol 650mg');
INSERT INTO drugs VALUES ('Lupin', 'Zifi', 'Cefixime 200mg');
INSERT INTO drugs VALUES ('Lupin', 'Metrogyl', 'Metronidazole 400mg');
INSERT INTO drugs VALUES ('Cipla', 'Zyrtec', 'Cetirizine 5mg');
INSERT INTO drugs VALUES ('Pfizer', 'Augmentin', 'Amoxicillin + Clavulanic Acid');
INSERT INTO drugs VALUES ('SunPharma', 'T-Minic', 'Chlorpheniramine + Paracetamol');
INSERT INTO drugs VALUES ('Lupin', 'Moxikind', 'Amoxicillin 500mg');


-- -------------------------------
-- Insert Doctors
-- -------------------------------
INSERT INTO doctors VALUES ('111122223333', 'Dr. A Sharma', 'General Physician', 10);
INSERT INTO doctors VALUES ('444455556666', 'Dr. M Iyer', 'Pulmonologist', 15);
INSERT INTO doctors VALUES ('777788889999', 'Dr. K Mehta', 'Pediatrician', 12);
INSERT INTO doctors VALUES ('999900001111', 'Dr. R Das', 'Cardiologist', 20);
INSERT INTO doctors VALUES ('555566667777', 'Dr. L Khan', 'Dermatologist', 8);

-- -------------------------------
-- Insert Patients
-- -------------------------------
INSERT INTO patients VALUES ('101010101010', 'Ravi Kumar', 30, 'Secunderabad', '111122223333');
INSERT INTO patients VALUES ('202020202020', 'Sneha Rao', 25, 'Delhi NCR', '444455556666');
INSERT INTO patients VALUES ('303030303030', 'Aditya Jain', 40, 'Powai, Mumbai', '777788889999');
INSERT INTO patients VALUES ('404040404040', 'Meera Patil', 32, 'Worli, Mumbai', '111122223333');
INSERT INTO patients VALUES ('505050505050', 'Nisha Shah', 28, 'Ahmedabad', '999900001111');
INSERT INTO patients VALUES ('606060606060', 'Rahul Yadav', 35, 'Lucknow', '555566667777');
-- -------------------------------
-- Insert Sells (Ensure at least 10 drugs per pharmacy)
-- -------------------------------
-- NovaHyd
INSERT INTO sells VALUES ('Pfizer', 'Panadol', 'NovaHyd', 12.50);
INSERT INTO sells VALUES ('Pfizer', 'Azithro', 'NovaHyd', 18.00);
INSERT INTO sells VALUES ('Cipla', 'Cetrizine', 'NovaHyd', 10.00);
INSERT INTO sells VALUES ('Cipla', 'Montair', 'NovaHyd', 20.00);
INSERT INTO sells VALUES ('SunPharma', 'Calpol', 'NovaHyd', 11.00);
INSERT INTO sells VALUES ('SunPharma', 'Azee', 'NovaHyd', 22.00);
INSERT INTO sells VALUES ('DrReddy', 'Levocet', 'NovaHyd', 9.00);
INSERT INTO sells VALUES ('DrReddy', 'Dolo', 'NovaHyd', 8.50);
INSERT INTO sells VALUES ('Lupin', 'Zifi', 'NovaHyd', 14.00);
INSERT INTO sells VALUES ('Lupin', 'Metrogyl', 'NovaHyd', 13.00);

-- NovaDelhi
INSERT INTO sells VALUES ('Pfizer', 'Panadol', 'NovaDelhi', 13.00);
INSERT INTO sells VALUES ('Cipla', 'Cetrizine', 'NovaDelhi', 10.50);
INSERT INTO sells VALUES ('SunPharma', 'Calpol', 'NovaDelhi', 11.50);
INSERT INTO sells VALUES ('SunPharma', 'Azee', 'NovaDelhi', 23.00);
INSERT INTO sells VALUES ('Cipla', 'Montair', 'NovaDelhi', 19.00);
INSERT INTO sells VALUES ('DrReddy', 'Dolo', 'NovaDelhi', 8.00);
INSERT INTO sells VALUES ('Pfizer', 'Augmentin', 'NovaDelhi', 26.00);
INSERT INTO sells VALUES ('Lupin', 'Zifi', 'NovaDelhi', 15.00);
INSERT INTO sells VALUES ('Lupin', 'Moxikind', 'NovaDelhi', 17.50);
INSERT INTO sells VALUES ('Cipla', 'Zyrtec', 'NovaDelhi', 10.25);

-- NovaMumbai
INSERT INTO sells VALUES ('Cipla', 'Montair', 'NovaMumbai', 21.00);
INSERT INTO sells VALUES ('Pfizer', 'Azithro', 'NovaMumbai', 19.00);
INSERT INTO sells VALUES ('DrReddy', 'Levocet', 'NovaMumbai', 9.20);
INSERT INTO sells VALUES ('SunPharma', 'Azee', 'NovaMumbai', 22.50);
INSERT INTO sells VALUES ('Cipla', 'Zyrtec', 'NovaMumbai', 10.00);
INSERT INTO sells VALUES ('Lupin', 'Zifi', 'NovaMumbai', 14.75);
INSERT INTO sells VALUES ('Lupin', 'Metrogyl', 'NovaMumbai', 13.25);
INSERT INTO sells VALUES ('SunPharma', 'T-Minic', 'NovaMumbai', 11.50);
INSERT INTO sells VALUES ('Pfizer', 'Augmentin', 'NovaMumbai', 27.00);
INSERT INTO sells VALUES ('Lupin', 'Moxikind', 'NovaMumbai', 16.00);

-- NovaChennai
INSERT INTO sells VALUES ('Cipla', 'Montair', 'NovaChennai', 20.25);
INSERT INTO sells VALUES ('Pfizer', 'Panadol', 'NovaChennai', 12.80);
INSERT INTO sells VALUES ('DrReddy', 'Dolo', 'NovaChennai', 9.00);
INSERT INTO sells VALUES ('Lupin', 'Zifi', 'NovaChennai', 14.00);
INSERT INTO sells VALUES ('Lupin', 'Metrogyl', 'NovaChennai', 13.20);
INSERT INTO sells VALUES ('Pfizer', 'Azithro', 'NovaChennai', 17.50);
INSERT INTO sells VALUES ('SunPharma', 'Calpol', 'NovaChennai', 11.30);
INSERT INTO sells VALUES ('SunPharma', 'Azee', 'NovaChennai', 22.10);
INSERT INTO sells VALUES ('SunPharma', 'T-Minic', 'NovaChennai', 11.60);
INSERT INTO sells VALUES ('Cipla', 'Zyrtec', 'NovaChennai', 10.10);

-- -------------------------------
-- Insert Prescription
-- -------------------------------
INSERT INTO prescription VALUES ('101010101010', DATE '2023-12-01', '111122223333', 'Panadol', 'Pfizer', 10);
INSERT INTO prescription VALUES ('101010101010', DATE '2023-12-01', '111122223333', 'Cetrizine', 'Cipla', 10);
INSERT INTO prescription VALUES ('202020202020', DATE '2023-12-05', '444455556666', 'Cetrizine', 'Cipla', 5);
INSERT INTO prescription VALUES ('303030303030', DATE '2023-12-10', '777788889999', 'Azee', 'SunPharma', 7);
INSERT INTO prescription VALUES ('404040404040', DATE '2023-12-15', '111122223333', 'Montair', 'Cipla', 6);
INSERT INTO prescription VALUES ('505050505050', DATE '2023-12-18', '999900001111', 'Dolo', 'DrReddy', 8);
INSERT INTO prescription VALUES ('606060606060', DATE '2023-12-20', '555566667777', 'T-Minic', 'SunPharma', 5);

-- -------------------------------
-- Insert Patient Drug Purchases
-- -------------------------------
INSERT INTO patient_drugs VALUES ('Pfizer', 'Panadol', DATE '2023-12-01', '101010101010', 10);
INSERT INTO patient_drugs VALUES ('Cipla', 'Cetrizine', DATE '2023-12-05', '202020202020', 5);
INSERT INTO patient_drugs VALUES ('SunPharma', 'Azee', DATE '2023-12-10', '303030303030', 7);
INSERT INTO patient_drugs VALUES ('Cipla', 'Montair', DATE '2023-12-15', '404040404040', 6);
INSERT INTO patient_drugs VALUES ('DrReddy', 'Dolo', DATE '2023-12-18', '505050505050', 8);
INSERT INTO patient_drugs VALUES ('SunPharma', 'T-Minic', DATE '2023-12-20', '606060606060', 5);

-- Insert Contracts (pharmacy and company)
INSERT INTO contract VALUES ('NovaHyd', 'Pfizer', DATE '2022-01-01', DATE '2024-12-31', 'Supply of general drugs including antibiotics', 'Mr. Ramesh');
INSERT INTO contract VALUES ('NovaDelhi', 'Cipla', DATE '2023-01-01', DATE '2025-12-31', 'Antihistamine and allergy drug supply', 'Mrs. Rekha');
INSERT INTO contract VALUES ('NovaMumbai', 'SunPharma', DATE '2021-06-01', DATE '2024-06-01', 'Fever and pain relief medicines', 'Mr. Suresh');
INSERT INTO contract VALUES ('NovaChennai', 'DrReddy', DATE '2023-03-01', DATE '2025-03-01', 'Pain relief and anti-inflammatory drugs', 'Ms. Priya');
INSERT INTO contract VALUES ('NovaHyd', 'Lupin', DATE '2022-05-15', DATE '2024-05-15', 'Diabetes and hypertension medications', 'Mr. Arun');
INSERT INTO contract VALUES ('NovaDelhi', 'SunPharma', DATE '2023-08-01', DATE '2026-08-01', 'Cardiac health medicines', 'Dr. Amit');
INSERT INTO contract VALUES ('NovaMumbai', 'DrReddy', DATE '2024-01-01', DATE '2026-01-01', 'Antibiotics and antiviral drugs', 'Ms. Simran');
INSERT INTO contract VALUES ('NovaChennai', 'Lupin', DATE '2023-06-15', DATE '2025-06-15', 'General healthcare products and supplements', 'Mr. Rajesh');

SET serveroutput on;