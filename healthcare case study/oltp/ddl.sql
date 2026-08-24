CREATE TYPE Data_Modeling.Gender AS ENUM ('Male', 'Female');

CREATE TABLE Data_Modeling.Patients
(
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender data_modeling.gender NOT NULL,
    post_code VARCHAR(8),
    city VARCHAR(50),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Data_Modeling.Providers
(
    provider_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    npi CHAR(10) UNIQUE NOT NULL,
    speciality VARCHAR(20),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CK_OnlyDigits CHECK (npi ~ '^[0-9]+$')
);

CREATE TABLE Data_Modeling.Facilities
(
    facility_id INT PRIMARY KEY,
    facility_name VARCHAR(50),
    post_code VARCHAR(8),
    city VARCHAR(50),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Data_Modeling.Procedures_Catalogue
(
    procedure_catalogue_id INT PRIMARY KEY,
    procedure_name VARCHAR(50),
    cost DECIMAL(10, 2) CHECK (cost > 0),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Data_Modeling.Medical_Claims(
    claim_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    facility_id INT NOT NULL,
    procedure_catalogue_id INT NOT NULL,
    procedure_date DATE NOT NULL,
    billed_amount DECIMAL(10, 2) CHECK(billed_amount > 0) NOT NULL,
    insurance_paid_amount DECIMAL(10, 2) CHECK(insurance_paid_amount >= 0) DEFAULT 0.00,
    patient_paid_amount DECIMAL(10, 2) CHECK(patient_paid_amount >= 0) DEFAULT 0.00,
    FOREIGN KEY (patient_id) REFERENCES Data_Modeling.Patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES Data_Modeling.Providers(provider_id),
    FOREIGN KEY (facility_id) REFERENCES Data_Modeling.Facilities(facility_id),
    FOREIGN KEY (procedure_catalogue_id) REFERENCES Data_Modeling.Procedures_Catalogue(procedure_catalogue_id),
    CONSTRAINT chk_bill_payment_balance CHECK (insurance_paid_amount + patient_paid_amount <= billed_amount )

);
