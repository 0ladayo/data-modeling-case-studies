CREATE TYPE Data_Modeling.Field_Status AS ENUM ('Exploration', 'Development', 'Production', 'Decommissioning');

CREATE TYPE Data_Modeling.Reservoir_Status AS ENUM ('Discovered', 'Appraised', 'Production', 'Mature', 'Depleted');

CREATE TYPE Data_Modeling.Well_Status AS ENUM ('Drilling', 'Completed', 'Producing', 'Injecting', 'Shut-in', 'Permanently Abandoned');

CREATE TABLE Data_Modeling.Fields
(
    Field_ID       INT PRIMARY KEY,
    Field_Name     VARCHAR(50)                NOT NULL,
    Discovery_Date DATE,
    Field_Status   data_modeling.Field_Status NOT NULL,
    Updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Data_Modeling.Reservoirs
(
    Reservoir_ID     INT PRIMARY KEY,
    Reservoir_Name   VARCHAR(50)                    NOT NULL,
    Field_ID         INT                            NOT NULL,
    Discovery_Date   DATE,
    Reservoir_Status data_modeling.Reservoir_Status NOT NULL,
    Updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Field_ID) REFERENCES Data_Modeling.Fields (Field_ID)
);

CREATE TABLE Data_Modeling.Wells
(
    Well_ID       INT PRIMARY KEY,
    Well_Name     VARCHAR(50)               NOT NULL,
    Reservoir_ID  INT                       NOT NULL,
    Well_Status   data_modeling.Well_Status NOT NULL,
    Drilling_Date DATE,
    Updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Reservoir_ID) REFERENCES Data_Modeling.Reservoirs (Reservoir_ID)
);

CREATE TABLE Data_Modeling.Production
(
    Date             DATE NOT NULL,
    Well_ID          INT  NOT NULL,
    Oil_Production   DECIMAL(10, 2) DEFAULT 0.00,
    Gas_Production   DECIMAL(10, 2) DEFAULT 0.00,
    Water_Production DECIMAL(10, 2) DEFAULT 0.00,
    PRIMARY KEY (Date, Well_ID),
    FOREIGN KEY (Well_ID) REFERENCES Data_Modeling.Wells (Well_ID)
);