
# NOVA Pharmacy Relational Database

This repository contains SQL scripts to build, manage, and populate the **NOVA Pharmacy Chain** relational database system using **Oracle SQL*Plus**.

## 📌 Project Overview

“NOVA” is a fictional chain of pharmacies that sources drugs from various pharmaceutical companies and serves patients through licensed doctors and pharmacy outlets. This project implements a relational database to capture:

- Pharmacy and pharmaceutical company data
- Drug inventory and sales
- Doctor and patient records
- Prescriptions and patient drug history
- Company-pharmacy contracts

## 🗃️ Database Schema

The database consists of the following tables:

| Table Name         | Description |
|--------------------|-------------|
| `pharma_comp`      | Pharmaceutical companies (name, contact) |
| `drugs`            | Drugs with trade name, formula, and associated company |
| `pharmacy`         | Pharmacy branches of NOVA with contact details |
| `doctors`          | Registered doctors with specialties and experience |
| `patients`         | Patients with primary doctors |
| `sells`            | Drug listings per pharmacy with price |
| `patient_drugs`    | Drug purchase history of patients |
| `prescription`     | Prescription details issued by doctors to patients |
| `contract`         | Business contracts between companies and pharmacies |

All tables enforce referential integrity through primary and foreign key constraints, with appropriate `ON DELETE CASCADE` actions.

## 📁 Project Structure

```

📦 nova-pharmacy-database/
├── create\_schema.sql         # Creates all tables and constraints
├── drop\_schema.sql           # Drops all tables and constraints
├── insert\_data.sql           # Populates the database with dummy data
├── README.md                 # Project documentation

````

## ✅ Features & Business Rules

- Each drug is uniquely identified by its **pharmaceutical company** and **trade name**.
- Each **patient has one primary doctor**.
- Each **doctor has at least one patient**.
- Each **pharmacy sells at least 10 drugs**.
- The **same drug may have different prices** across pharmacies.
- **Doctors prescribe drugs** to patients, with the latest prescription stored for any doctor-patient-date combination.
- **Pharmaceutical companies contract with pharmacies**, with contract periods, contents, and assigned supervisors.

## 🚀 How to Use

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/nova-pharmacy-database.git
   cd nova-pharmacy-database
````

2. **Run in Oracle SQL\*Plus**
   Open Oracle SQL\*Plus and execute:

   ```sql
   @create_schema.sql
   @insert_data.sql
   ```

3. **To reset the database**

   ```sql
   @drop_schema.sql
   ```

## 🔍 Sample Queries (Coming Soon)

* List all drugs prescribed to a patient
* Find pharmacies selling a particular drug at the lowest price
* Show all contracts expiring in the next 30 days
* Retrieve doctors with the most patients

