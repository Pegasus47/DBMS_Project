CREATE OR REPLACE PROCEDURE get_prescription_details (
  p_aadhar_patient IN VARCHAR2,
  p_presc_date IN DATE
) IS
BEGIN
  FOR rec IN (
    SELECT 
      p.name AS patient_name,
      pr.presc_date,
      d.name AS doctor_name,
      dr.trade_name,
      dr.pharma_company_name,
      pr.qty
    FROM 
      prescription pr
      JOIN patients p ON p.aadhar_no = pr.aadhar_patient
      JOIN doctors d ON d.aadhar_no = pr.aadhar_doctor
      JOIN drugs dr ON dr.trade_name = pr.trade_name AND dr.pharma_company_name = pr.pharma_name
    WHERE 
      pr.aadhar_patient = p_aadhar_patient
      AND pr.presc_date = p_presc_date
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Patient: ' || rec.patient_name);
    DBMS_OUTPUT.PUT_LINE('Date: ' || rec.presc_date);
    DBMS_OUTPUT.PUT_LINE('Doctor: ' || rec.doctor_name);
    DBMS_OUTPUT.PUT_LINE('Drug: ' || rec.trade_name || ' (' || rec.pharma_company_name || ')');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || rec.qty);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
  END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE get_pharmacy_stock (
  p_pharmacy_name IN VARCHAR2
) IS
BEGIN
  FOR rec IN (
    SELECT 
      s.trade_name,
      s.pharma_name,
      s.price
    FROM 
      sells s
    WHERE 
      s.pharmacy_name = p_pharmacy_name
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Drug: ' || rec.trade_name || ' (' || rec.pharma_name || ')');
    DBMS_OUTPUT.PUT_LINE('Price: Rs. ' || rec.price);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
  END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE get_patients_of_doctor (
  p_doctor_aadhar IN VARCHAR2
) IS
BEGIN
  FOR rec IN (
    SELECT 
      name,
      age,
      address
    FROM 
      patients
    WHERE 
      aadhar_d = p_doctor_aadhar
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Name: ' || rec.name);
    DBMS_OUTPUT.PUT_LINE('Age: ' || rec.age);
    DBMS_OUTPUT.PUT_LINE('Address: ' || rec.address);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
  END LOOP;
END;
/
