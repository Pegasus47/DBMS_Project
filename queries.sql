CREATE OR REPLACE PROCEDURE company_drugs (
    company_name in VARCHAR
) 
IS 
    CURSOR cursor IS 
        SELECT d.trade_name, d.formula
        FROM drugs d
        WHERE d.pharma_company_name = company_name;

    v_trade_name drugs.trade_name%TYPE;
    v_formula drugs.formula%TYPE;

    BEGIN
    OPEN cursor;
    LOOP
    FETCH cursor INTO v_trade_name, v_formula;
    EXIT WHEN cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Trade Name: ' || v_trade_name || ' Formula: ' || v_formula);
    END LOOP;
    CLOSE cursor;

END;
/

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

CREATE OR REPLACE PROCEDURE get_contact (
    cname IN VARCHAR
)
IS

    CURSOR cursor IS
        SELECT p.pharmacy_contact, 
               pc.contact_number 
        FROM 
            contract c
            join pharmacy p on c.pharmacy_name = p.name
            join pharma_comp pc on c.pharma_comp_name = pc.name
        WHERE c.pharma_comp_name = cname; 

    cnumber pharmacy.pharmacy_contact%TYPE;
    pcnumber pharma_comp.contact_number%TYPE;


    begin 
    open cursor;
    
    loop
    fetch cursor into cnumber, pcnumber;
    exit when cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Pharmacy Contact: ' || cnumber || ' Pharmaceutical Company Contact: ' || pcnumber);
    end loop;
    close cursor;

END;
/

CREATE OR REPLACE PROCEDURE get_patient_report (
    p_id  IN VARCHAR,
    start_date  IN DATE,
    end_date    IN DATE
)
IS
    CURSOR cursor IS
        SELECT 
            p.name AS patient_name,
            d.name AS doctor_name,
            pr.presc_date,
            pr.trade_name,
            pr.qty
        FROM prescription pr
        JOIN patients p ON pr.aadhar_patient = p.aadhar_no
        JOIN doctors d ON pr.aadhar_doctor = d.aadhar_no
        WHERE pr.aadhar_patient = p_id
          AND pr.presc_date BETWEEN start_date AND end_date
        ORDER BY pr.presc_date;

    v_patient_name   patients.name%TYPE; 
    v_doctor_name    doctors.name%TYPE;   
    v_date           prescription.presc_date%TYPE;
    v_drug_name      prescription.trade_name%TYPE; 
    v_quantity       prescription.qty%TYPE;
BEGIN
    OPEN cursor;
    LOOP
        FETCH cursor 
        INTO v_patient_name, v_doctor_name, v_date, v_drug_name, v_quantity;
        EXIT WHEN cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Date: ' || v_date || 
                             ' | Drug: ' || v_drug_name || 
                             ' | Quantity: ' || v_quantity || 
                             ' | Doctor: ' || v_doctor_name);
    END LOOP;
    CLOSE cursor;
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
