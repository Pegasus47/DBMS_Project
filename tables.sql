  SET DEFINE OFF;

-- 1. Pharmaceutical companies
CREATE TABLE pharma_comp (
  name               VARCHAR(20) PRIMARY KEY,
  contact_number     VARCHAR(12)
);

-- 2. Drugs (each drug uniquely identified by company + trade name)
CREATE TABLE drugs (
  pharma_company_name VARCHAR(20),
  trade_name          VARCHAR(20),
  formula             VARCHAR(200),
  CONSTRAINT pk_drugs PRIMARY KEY (pharma_company_name, trade_name),
  CONSTRAINT fk_drugs_company FOREIGN KEY (pharma_company_name)
    REFERENCES pharma_comp(name)
    ON DELETE CASCADE
);

-- 3. Pharmacies
CREATE TABLE pharmacy (
  name              VARCHAR(20),
  address           VARCHAR(100),
  pharmacy_contact  VARCHAR(12),
  CONSTRAINT pk_pharma PRIMARY KEY (name)
);

-- 4. Doctors
CREATE TABLE doctors (
  aadhar_no        VARCHAR(12) PRIMARY KEY,
  name             VARCHAR(20) NOT NULL,
  specialty        VARCHAR(100),
  years_of_exp     NUMBER(3) --check this if integer 
);

-- 5. Patients
CREATE TABLE patients (
  aadhar_no    VARCHAR(12) PRIMARY KEY,
  name         VARCHAR(20) NOT NULL,
  age          NUMBER(3),
  address      VARCHAR(100),
  aadhar_d     VARCHAR(12),
  CONSTRAINT fk_pat_primary_doc FOREIGN KEY (aadhar_d)
    REFERENCES doctors(aadhar_no)
    ON DELETE CASCADE
);

-- 6. Sells (which pharmacy sells which drug at what price)
CREATE TABLE sells (
  pharma_name   VARCHAR(20),
  trade_name    VARCHAR(20),
  pharmacy_name VARCHAR(20),
  price         NUMBER(10,2),
  CONSTRAINT pk_sells PRIMARY KEY (pharma_name, trade_name, pharmacy_name),
  CONSTRAINT fk_sells_drug FOREIGN KEY (pharma_name, trade_name)
    REFERENCES drugs(pharma_company_name, trade_name) ON DELETE CASCADE,
  CONSTRAINT fk_sells_pharmacy FOREIGN KEY (pharmacy_name)
    REFERENCES pharmacy(name) ON DELETE CASCADE
);

-- 7. Has (linking patient with drug on a given date, quantity)
CREATE TABLE patient_drugs (
  pharma_name    VARCHAR(20),
  trade_name     VARCHAR(20),
  drug_date      DATE,
  aadhar_p       VARCHAR(12),
  quantity       NUMBER,
  CONSTRAINT pk_has PRIMARY KEY (pharma_name, trade_name, drug_date, aadhar_p),
  CONSTRAINT fk_has_drug FOREIGN KEY (pharma_name, trade_name)
    REFERENCES drugs(pharma_company_name, trade_name) ON DELETE CASCADE,
  CONSTRAINT fk_has_patient FOREIGN KEY (aadhar_p)
    REFERENCES patients(aadhar_no) ON DELETE CASCADE
);

-- 8. Prescription (doctor prescribes drug to patient)
CREATE TABLE prescription (
  aadhar_patient  VARCHAR(12),
  presc_date      DATE,
  aadhar_doctor   VARCHAR(12),
  trade_name      VARCHAR(20),
  pharma_name     VARCHAR(20),
  qty             NUMBER,
  CONSTRAINT pk_prescription PRIMARY KEY (
    aadhar_patient, presc_date, aadhar_doctor, trade_name, pharma_name
  ),
  CONSTRAINT fk_pres_pat FOREIGN KEY (aadhar_patient)
    REFERENCES patients(aadhar_no)
    ON DELETE CASCADE,
  CONSTRAINT fk_pres_doc FOREIGN KEY (aadhar_doctor)
    REFERENCES doctors(aadhar_no)
    ON DELETE CASCADE,
  CONSTRAINT fk_pres_drug FOREIGN KEY (pharma_name, trade_name)
    REFERENCES drugs(pharma_company_name, trade_name) ON DELETE CASCADE
);

-- 9. Contracts between pharmacy and company
CREATE TABLE contract (
  pharmacy_name     VARCHAR(20),
  pharma_comp_name  VARCHAR(20),
  start_date        DATE,
  end_date          DATE,
  content           CLOB,
  supervisor        VARCHAR(20),
  CONSTRAINT pk_contract PRIMARY KEY (pharmacy_name, pharma_comp_name),
  CONSTRAINT fk_contract_pharmacy FOREIGN KEY (pharmacy_name)
    REFERENCES pharmacy(name) ON DELETE CASCADE,
  CONSTRAINT fk_contract_company FOREIGN KEY (pharma_comp_name)
    REFERENCES pharma_comp(name) ON DELETE CASCADE,
  CONSTRAINT chk_date_order CHECK (start_date < end_date)
);

-- 6.1 This is a view implementing good pharmacies
CREATE VIEW pharmacies_good AS
SELECT pharmacy_name
FROM PharmacyDrug
GROUP BY pharma_company_name
HAVING COUNT(*) < 10;
