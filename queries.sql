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
  p_presc_date     IN DATE
) IS
BEGIN
  FOR rec IN (
    SELECT 
      p.name           AS patient_name,
      pr.presc_date,
      d.name           AS doctor_name,
      LISTAGG(
        dr.trade_name 
        || ' (' || dr.pharma_company_name || ') x' || pr.qty,
        CHR(10)
      ) WITHIN GROUP (ORDER BY dr.trade_name) AS meds_list
    FROM 
      prescription pr
      JOIN patients p 
        ON p.aadhar_no = pr.aadhar_patient
      JOIN doctors d 
        ON d.aadhar_no = pr.aadhar_doctor
      JOIN drugs dr 
        ON dr.trade_name          = pr.trade_name 
       AND dr.pharma_company_name = pr.pharma_name
    WHERE 
      pr.aadhar_patient = p_aadhar_patient
      AND pr.presc_date  = p_presc_date
    GROUP BY 
      p.name, pr.presc_date, d.name
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Patient : ' || rec.patient_name);
    DBMS_OUTPUT.PUT_LINE('Date    : ' || TO_CHAR(rec.presc_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Doctor  : ' || rec.doctor_name);
    DBMS_OUTPUT.PUT_LINE('Medications:');
    DBMS_OUTPUT.PUT_LINE(rec.meds_list);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
  END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE get_contact (
    cname IN VARCHAR
)
IS
    CURSOR cursor IS
        SELECT 
            p.pharmacy_contact, 
            pc.contact_number,
            p.name 
        FROM 
            contract c
            JOIN pharmacy p ON c.pharmacy_name = p.name
            JOIN pharma_comp pc ON c.pharma_comp_name = pc.name
        WHERE 
            c.pharma_comp_name = cname; 

    v_pharmacy_contact  pharmacy.pharmacy_contact%TYPE;
    v_company_contact   pharma_comp.contact_number%TYPE;
    v_pharmacy_name     pharmacy.name%TYPE;

BEGIN 
    OPEN cursor;
    
    LOOP
        FETCH cursor INTO v_pharmacy_contact, v_company_contact, v_pharmacy_name;
        EXIT WHEN cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Pharmacy Name: ' || v_pharmacy_name || 
            ' | Pharmacy Contact: ' || v_pharmacy_contact || 
            ' | Pharma Company Contact: ' || v_company_contact
        );
    END LOOP;

    CLOSE cursor;
END;
/


CREATE OR REPLACE PROCEDURE get_patient_report (
    p_id        IN VARCHAR2,
    start_date  IN DATE,
    end_date    IN DATE
)
IS
BEGIN
  DECLARE
    v_name patients.name%TYPE;
  BEGIN
    SELECT name
      INTO v_name
      FROM patients
     WHERE aadhar_no = p_id;
    DBMS_OUTPUT.PUT_LINE('Prescription report for: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('From ' || TO_CHAR(start_date,'DD-MON-YYYY')
                         || ' to ' || TO_CHAR(end_date,'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No such patient: ' || p_id);
      RETURN;
  END;

  FOR rec IN (
    SELECT
      pr.presc_date,
      d.name AS doctor_name,
      LISTAGG(pr.trade_name || ' (' || pr.qty || ')', ', ')
        WITHIN GROUP (ORDER BY pr.trade_name) AS drugs_list
    FROM prescription pr
    JOIN doctors d 
      ON pr.aadhar_doctor = d.aadhar_no
    WHERE pr.aadhar_patient BETWEEN p_id AND p_id
      AND pr.presc_date BETWEEN start_date AND end_date
    GROUP BY pr.presc_date, d.name
    ORDER BY pr.presc_date
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      TO_CHAR(rec.presc_date, 'DD-MON-YYYY')
      || ' | ' || rec.doctor_name
      || ' | Drugs: ' || rec.drugs_list
    );
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
