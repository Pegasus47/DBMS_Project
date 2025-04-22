-- Insert Pharmaceutical Companies
INSERT INTO pharma_comp VALUES ('Pfizer', '1234567890');
INSERT INTO pharma_comp VALUES ('Cipla', '9876543210');
INSERT INTO pharma_comp VALUES ('SunPharma', '1122334455');

-- Insert Drugs
INSERT INTO drugs VALUES ('Pfizer', 'Panadol', 'Paracetamol 500mg');
INSERT INTO drugs VALUES ('Pfizer', 'Azithro', 'Azithromycin 250mg');
INSERT INTO drugs VALUES ('Cipla', 'Cetrizine', 'Cetirizine 10mg');
INSERT INTO drugs VALUES ('Cipla', 'Montair', 'Montelukast 10mg');
INSERT INTO drugs VALUES ('SunPharma', 'Calpol', 'Paracetamol 650mg');
INSERT INTO drugs VALUES ('SunPharma', 'Azee', 'Azithromycin 500mg');

-- Insert Pharmacies
INSERT INTO pharmacy VALUES ('NovaHyd', 'Banjara Hills, Hyderabad', '0401234567');
INSERT INTO pharmacy VALUES ('NovaDelhi', 'Connaught Place, Delhi', '0117654321');
INSERT INTO pharmacy VALUES ('NovaMumbai', 'Andheri West, Mumbai', '0229988776');

-- Insert Doctors
INSERT INTO doctors VALUES ('111122223333', 'Dr. A Sharma', 'General Physician', 10);
INSERT INTO doctors VALUES ('444455556666', 'Dr. M Iyer', 'Pulmonologist', 15);
INSERT INTO doctors VALUES ('777788889999', 'Dr. K Mehta', 'Pediatrician', 12);

-- Insert Patients (each assigned a primary doctor)
INSERT INTO patients VALUES ('101010101010', 'Ravi Kumar', 30, 'Secunderabad', '111122223333');
INSERT INTO patients VALUES ('202020202020', 'Sneha Rao', 25, 'Delhi NCR', '444455556666');
INSERT INTO patients VALUES ('303030303030', 'Aditya Jain', 40, 'Powai, Mumbai', '777788889999');
INSERT INTO patients VALUES ('404040404040', 'Meera Patil', 32, 'Worli, Mumbai', '111122223333');

-- Insert Drug Sales (10+ entries across pharmacies)
INSERT INTO sells VALUES ('Pfizer', 'Panadol', 'NovaHyd', 12.50);
INSERT INTO sells VALUES ('Pfizer', 'Azithro', 'NovaHyd', 18.00);
INSERT INTO sells VALUES ('Cipla', 'Cetrizine', 'NovaHyd', 10.00);
INSERT INTO sells VALUES ('Cipla', 'Montair', 'NovaHyd', 20.00);
INSERT INTO sells VALUES ('SunPharma', 'Calpol', 'NovaHyd', 11.00);
INSERT INTO sells VALUES ('SunPharma', 'Azee', 'NovaHyd', 22.00);

INSERT INTO sells VALUES ('Pfizer', 'Panadol', 'NovaDelhi', 13.00);
INSERT INTO sells VALUES ('Cipla', 'Cetrizine', 'NovaDelhi', 10.50);
INSERT INTO sells VALUES ('SunPharma', 'Calpol', 'NovaDelhi', 11.50);
INSERT INTO sells VALUES ('SunPharma', 'Azee', 'NovaDelhi', 23.00);

INSERT INTO sells VALUES ('Cipla', 'Montair', 'NovaMumbai', 21.00);
INSERT INTO sells VALUES ('Pfizer', 'Azithro', 'NovaMumbai', 19.00);

-- Insert Prescriptions (one per patient per doctor per date max)
INSERT INTO prescription VALUES ('101010101010', DATE '2023-12-01', '111122223333', 'Panadol', 'Pfizer', 10);
INSERT INTO prescription VALUES ('202020202020', DATE '2023-12-05', '444455556666', 'Cetrizine', 'Cipla', 5);
INSERT INTO prescription VALUES ('303030303030', DATE '2023-12-10', '777788889999', 'Azee', 'SunPharma', 7);
INSERT INTO prescription VALUES ('404040404040', DATE '2023-12-15', '111122223333', 'Montair', 'Cipla', 6);

-- Insert Patient Drug Purchases (consistent with prescription)
INSERT INTO patient_drugs VALUES ('Pfizer', 'Panadol', DATE '2023-12-01', '101010101010', 10);
INSERT INTO patient_drugs VALUES ('Cipla', 'Cetrizine', DATE '2023-12-05', '202020202020', 5);
INSERT INTO patient_drugs VALUES ('SunPharma', 'Azee', DATE '2023-12-10', '303030303030', 7);
INSERT INTO patient_drugs VALUES ('Cipla', 'Montair', DATE '2023-12-15', '404040404040', 6);

-- Insert Contracts (pharmacy and company)
INSERT INTO contract VALUES ('NovaHyd', 'Pfizer', DATE '2022-01-01', DATE '2024-12-31', 'Supply of general drugs including antibiotics', 'Mr. Ramesh');
INSERT INTO contract VALUES ('NovaDelhi', 'Cipla', DATE '2023-01-01', DATE '2025-12-31', 'Antihistamine and allergy drug supply', 'Mrs. Rekha');
INSERT INTO contract VALUES ('NovaMumbai', 'SunPharma', DATE '2021-06-01', DATE '2024-06-01', 'Fever and pain relief medicines', 'Mr. Suresh');
