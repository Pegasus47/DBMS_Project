-- add pharmacy
CREATE OR REPLACE PROCEDURE add_pharmacy(
  p_name IN VARCHAR,
  p_address IN VARCHAR,
  p_contact IN VARCHAR
) AS
BEGIN
  INSERT INTO pharmacy(name, address, pharmacy_contact)
  VALUES (p_name, p_address, p_contact);
END;
/

-- update Pharmacy
CREATE OR REPLACE PROCEDURE update_pharmacy(
  p_name IN VARCHAR,
  p_new_address IN VARCHAR,
  p_new_contact IN VARCHAR
) AS
BEGIN
  UPDATE pharmacy
  SET address = p_new_address,
      pharmacy_contact = p_new_contact
  WHERE name = p_name;
END;
/

-- Delete Pharmacy
CREATE OR REPLACE PROCEDURE delete_pharmacy(
  p_name IN VARCHAR
) AS
BEGIN
  DELETE FROM pharmacy WHERE name = p_name;
END;
/

-- Add Pharma Company
CREATE OR REPLACE PROCEDURE add_pharma_company(
  p_name IN VARCHAR,
  p_contact IN VARCHAR
) AS
BEGIN
  INSERT INTO pharma_comp(name, contact_number)
  VALUES (p_name, p_contact);
END;
/

-- Update Pharma Company
CREATE OR REPLACE PROCEDURE update_pharma_company(
  p_name IN VARCHAR,
  p_new_contact IN VARCHAR
) AS
BEGIN
  UPDATE pharma_comp
  SET contact_number = p_new_contact
  WHERE name = p_name;
END;
/

-- Delete Pharma Company
CREATE OR REPLACE PROCEDURE delete_pharma_company(
  p_name IN VARCHAR
) AS
BEGIN
  DELETE FROM pharma_comp WHERE name = p_name;
END;
/

-- Add Doctor
CREATE OR REPLACE PROCEDURE add_doctor(
  p_aadhar IN VARCHAR,
  p_name IN VARCHAR,
  p_specialty IN VARCHAR,
  p_exp IN NUMBER
) AS
BEGIN
  INSERT INTO doctors(aadhar_no, name, specialty, years_of_exp)
  VALUES (p_aadhar, p_name, p_specialty, p_exp);
END;
/

-- Update Doctor
CREATE OR REPLACE PROCEDURE update_doctor(
  p_aadhar IN VARCHAR,
  p_name IN VARCHAR,
  p_specialty IN VARCHAR,
  p_exp IN NUMBER
) AS
BEGIN
  UPDATE doctors
  SET name = p_name,
      specialty = p_specialty,
      years_of_exp = p_exp
  WHERE aadhar_no = p_aadhar;
END;
/

-- Delete Doctor
CREATE OR REPLACE PROCEDURE delete_doctor(
  p_aadhar IN VARCHAR
) AS
BEGIN
  DELETE FROM doctors
  WHERE aadhar_no = p_aadhar;
END;
/

-- Add Patient
CREATE OR REPLACE PROCEDURE add_patient(
  p_aadhar IN VARCHAR,
  p_name IN VARCHAR,
  p_age IN NUMBER,
  p_address IN VARCHAR,
  p_doc_aadhar IN VARCHAR
) AS
BEGIN
  INSERT INTO patients(aadhar_no, name, age, address, aadhar_d)
  VALUES (p_aadhar, p_name, p_age, p_address, p_doc_aadhar);
END;
/

-- Update Patient
CREATE OR REPLACE PROCEDURE update_patient(
  p_aadhar IN VARCHAR,
  p_name IN VARCHAR,
  p_age IN NUMBER,
  p_address IN VARCHAR,
  p_doc_aadhar IN VARCHAR
) AS
BEGIN
  UPDATE patients
  SET name = p_name,
      age = p_age,
      address = p_address,
      aadhar_d = p_doc_aadhar
  WHERE aadhar_no = p_aadhar;
END;
/

-- Delete Patient
CREATE OR REPLACE PROCEDURE delete_patient(
  p_aadhar IN VARCHAR
) AS
BEGIN
  DELETE FROM patients
  WHERE aadhar_no = p_aadhar;
END;
/

-- Add Drug
CREATE OR REPLACE PROCEDURE add_drug(
  p_company IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_formula IN VARCHAR
) AS
BEGIN
  INSERT INTO drugs(pharma_company_name, trade_name, formula)
  VALUES (p_company, p_trade_name, p_formula);
END;
/

-- Update Drug
CREATE OR REPLACE PROCEDURE update_drug(
  p_company IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_new_formula IN VARCHAR
) AS
BEGIN
  UPDATE drugs
  SET formula = p_new_formula
  WHERE pharma_company_name = p_company AND trade_name = p_trade_name;
END;
/

-- Delete Drug
CREATE OR REPLACE PROCEDURE delete_drug(
  p_company IN VARCHAR,
  p_trade_name IN VARCHAR
) AS
BEGIN
  DELETE FROM drugs
  WHERE pharma_company_name = p_company AND trade_name = p_trade_name;
END;
/

-- add sells
CREATE OR REPLACE PROCEDURE add_sells(
  p_pharma_name IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_pharmacy_name IN VARCHAR,
  p_price IN NUMBER
) AS
BEGIN
  INSERT INTO sells(pharma_name, trade_name, pharmacy_name, price)
  VALUES (p_pharma_name, p_trade_name, p_pharmacy_name, p_price);
END;
/

-- update sells
CREATE OR REPLACE PROCEDURE update_sells(
  p_pharma_name IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_pharmacy_name IN VARCHAR,
  p_price IN NUMBER
) AS
BEGIN
  UPDATE sells
  SET price = p_price
  WHERE pharma_name = p_pharma_name AND trade_name = p_trade_name AND pharmacy_name = p_pharmacy_name;
END;
/

-- delete sells
CREATE OR REPLACE PROCEDURE delete_sells(
  p_pharma_name IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_pharmacy_name IN VARCHAR
) AS
BEGIN
  DELETE FROM sells
  WHERE pharma_name = p_pharma_name AND trade_name = p_trade_name AND pharmacy_name = p_pharmacy_name;
END;
/

-- Add Prescription
CREATE OR REPLACE PROCEDURE add_prescription(
  p_patient_aadhar IN VARCHAR,
  p_date IN DATE,
  p_doctor_aadhar IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_pharma_name IN VARCHAR,
  p_qty IN NUMBER
) AS
BEGIN
  INSERT INTO prescription(aadhar_patient, presc_date, aadhar_doctor, trade_name, pharma_name, qty)
  VALUES (p_patient_aadhar, p_date, p_doctor_aadhar, p_trade_name, p_pharma_name, p_qty);
END;
/

-- Update Prescription
CREATE OR REPLACE PROCEDURE update_prescription(
  p_patient_aadhar IN VARCHAR,
  p_date IN DATE,
  p_doctor_aadhar IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_pharma_name IN VARCHAR,
  p_new_qty IN NUMBER
) AS
BEGIN
  UPDATE prescription
  SET qty = p_new_qty
  WHERE aadhar_patient = p_patient_aadhar
    AND presc_date = p_date
    AND aadhar_doctor = p_doctor_aadhar
    AND trade_name = p_trade_name
    AND pharma_name = p_pharma_name;
END;
/

-- Delete Prescription
CREATE OR REPLACE PROCEDURE delete_prescription(
  p_patient_aadhar IN VARCHAR,
  p_date IN DATE,
  p_doctor_aadhar IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_pharma_name IN VARCHAR
) AS
BEGIN
  DELETE FROM prescription
  WHERE aadhar_patient = p_patient_aadhar
    AND presc_date = p_date
    AND aadhar_doctor = p_doctor_aadhar
    AND trade_name = p_trade_name
    AND pharma_name = p_pharma_name;
END;
/

-- Add Patient Drug
CREATE OR REPLACE PROCEDURE add_patient_drug(
  p_pharma_name IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_date IN DATE,
  p_aadhar IN VARCHAR,
  p_quantity IN NUMBER
) AS
BEGIN
  INSERT INTO patient_drugs(pharma_name, trade_name, drug_date, aadhar_p, quantity)
  VALUES (p_pharma_name, p_trade_name, p_date, p_aadhar, p_quantity);
END;
/

-- Update Patient Drug
CREATE OR REPLACE PROCEDURE update_patient_drug(
  p_pharma_name IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_date IN DATE,
  p_aadhar IN VARCHAR,
  p_new_quantity IN NUMBER
) AS
BEGIN
  UPDATE patient_drugs
  SET quantity = p_new_quantity
  WHERE pharma_name = p_pharma_name
    AND trade_name = p_trade_name
    AND drug_date = p_date
    AND aadhar_p = p_aadhar;
END;
/

-- Delete Patient Drug
CREATE OR REPLACE PROCEDURE delete_patient_drug(
  p_pharma_name IN VARCHAR,
  p_trade_name IN VARCHAR,
  p_date IN DATE,
  p_aadhar IN VARCHAR
) AS
BEGIN
  DELETE FROM patient_drugs
  WHERE pharma_name = p_pharma_name
    AND trade_name = p_trade_name
    AND drug_date = p_date
    AND aadhar_p = p_aadhar;
END;
/

-- add contract
CREATE OR REPLACE PROCEDURE add_contract(
  p_pharmacy_name IN VARCHAR,
  p_pharma_comp_name IN VARCHAR,
  p_start_date IN DATE,
  p_end_date IN DATE,
  p_content IN CLOB,
  p_supervisor IN VARCHAR
) AS
BEGIN
  INSERT INTO contract(pharmacy_name, pharma_comp_name, start_date, end_date, content, supervisor)
  VALUES (p_pharmacy_name, p_pharma_comp_name, p_start_date, p_end_date, p_content, p_supervisor);
END;
/

--update contract
CREATE OR REPLACE PROCEDURE update_contract(
  p_pharmacy_name IN VARCHAR,
  p_pharma_comp_name IN VARCHAR,
  p_start_date IN DATE,
  p_end_date IN DATE,
  p_content IN CLOB,
  p_supervisor IN VARCHAR
) AS
BEGIN
  UPDATE contract
  SET start_date = p_start_date,
      end_date = p_end_date,
      content = p_content,
      supervisor = p_supervisor
  WHERE pharmacy_name = p_pharmacy_name AND pharma_comp_name = p_pharma_comp_name;
END;
/

--delete contract
CREATE OR REPLACE PROCEDURE delete_contract(
  p_pharmacy_name IN VARCHAR,
  p_pharma_comp_name IN VARCHAR
) AS
BEGIN
  DELETE FROM contract
  WHERE pharmacy_name = p_pharmacy_name AND pharma_comp_name = p_pharma_comp_name;
END;
/

