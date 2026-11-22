USE yacht_charters;

-- Naming convention underscore_naming
-- PRIMARY KEY constraint is named inline
-- Other constraints to be declared in CONSTRAINT line.
-- Constraint names: <abbreviated constraint>_<linked attribute>_<table>
-- Author: Phelim Hannon

-- Clean up database, if the table is rebuilt for example in a demo.

DROP TABLE IF EXISTS MAINTENANCE;
DROP TABLE IF EXISTS VISIT;
DROP TABLE IF EXISTS CHARTER;
DROP TABLE IF EXISTS YACHT;
DROP TABLE IF EXISTS PORT;
DROP TABLE IF EXISTS CUSTOMER;

-- SQL Query facilitating the creation of tables for use in the database.

CREATE TABLE CUSTOMER
(
    customer_id char(7) PRIMARY KEY,
    name varchar(30) NOT NULL,
    nationality varchar(15) NOT NULL,
    email varchar(40) NOT NULL,
    phone varchar(16) NOT NULL
);

CREATE TABLE PORT
(
    port_id char(4) PRIMARY KEY,
    name varchar(30) NOT NULL,
    phone char(16),
    email varchar(40),
    docking_places smallint NOT NULL
);

CREATE TABLE YACHT
(
    yacht_id char(4) PRIMARY KEY,
    name varchar(20) NOT NULL,
    type varchar(20) NOT NULL,
    model varchar(20) NOT NULL,
    number_of_berths tinyint NOT NULL,
    cost_of_hire decimal(6,2) NOT NULL,
    home_port_id char(4) NOT NULL DEFAULT 1,   -- Assumes 1 is the main port
    CONSTRAINT fk_port_yacht FOREIGN KEY (home_port_id) REFERENCES PORT(port_id) ON DELETE SET NULL
);

CREATE TABLE CHARTER
(
    charter_id char(6) PRIMARY KEY,
    start_date DATE NOT NULL,
    duration tinyint NOT NULL,
    customer_id char(7) NOT NULL,
    yacht_id char(4) DEFAULT NULL,
    CONSTRAINT fk_customer_charter FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id) ON DELETE CASCADE,
    CONSTRAINT fk_yacht_charter FOREIGN KEY (yacht_id) REFERENCES YACHT(yacht_id) ON DELETE SET NULL
);

CREATE TABLE VISIT
(
    visit_id char(4) PRIMARY KEY,
    expected_arrival DATE NOT NULL,
    duration tinyint NOT NULL DEFAULT 1, -- Assume they will visit minimum one day (hence default)
    charter_id char(6) NOT NULL,
    port_id char(4) NOT NULL,
    CONSTRAINT fk_charter_visit FOREIGN KEY (charter_id) REFERENCES CHARTER(charter_id) ON DELETE CASCADE,
    CONSTRAINT fk_port_visit FOREIGN KEY (port_id) REFERENCES PORT(port_id) ON DELETE CASCADE
);

CREATE TABLE MAINTENANCE
(
    maintenance_id char(4) PRIMARY KEY,
    start_date DATE NOT NULL,
    duration tinyint NOT NULL DEFAULT 2, -- Assume as absolute minimum time.
    yacht_id char(4) NOT NULL,
    CONSTRAINT fk_yacht_maintenance FOREIGN KEY (yacht_id) REFERENCES YACHT(yacht_id) ON DELETE CASCADE
);
