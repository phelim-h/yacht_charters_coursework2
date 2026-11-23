use yacht_charters;
-- Business Process One:
-- Function: add details of a new customer together with the start date and duration of the charter they have booked,
-- but without specifying the yacht to be used or the ports to be visited

DELIMITER //

-- Add Customer Process
CREATE PROCEDURE addCustomer
    (
        IN p_id char(7),
        IN p_name varchar(30),
        IN p_nationality varchar(15),
        IN p_email varchar(40),
        IN p_phone varchar(16)
    )
BEGIN
    INSERT INTO CUSTOMER (customer_id, name, nationality, email, phone)
        VALUES (p_id, p_name, p_nationality, p_email, p_phone);
END //

-- Add Charter Procedure
CREATE PROCEDURE addCharter
    (
        IN p_charter_id char(6),
        IN p_start_date DATE,
        IN p_duration tinyint,
        IN p_customer_id char(7)
    )
BEGIN
    INSERT INTO CHARTER (charter_id, start_date, duration, customer_id)
        VALUES (p_charter_id, p_start_date , p_duration ,
                p_customer_id);
END //

-- Business Process: Combining above
DROP PROCEDURE IF EXISTS bp1AddCustomerCharter //

CREATE PROCEDURE bp1AddCustomerCharter
    (
    -- Customer Data
        IN customer_id char(7),
        IN name varchar(30),
        IN nationality varchar(15),
        IN email varchar(40),
        IN phone varchar(16),
    -- Charter Date
        IN charter_id char(6),
        IN start_date DATE,
        IN duration tinyint
    )
BEGIN
    CALL addCustomer(customer_id, name, nationality, email, phone);
    CALL addCharter(charter_id, start_date, duration, customer_id);
END //

-- Business Process Verification
DROP PROCEDURE IF EXISTS bp1Verification //

CREATE PROCEDURE bp1Verification
    (
        IN p_customer_id char(7),
        IN p_charter_id char(6)
    )
BEGIN
    SELECT c.name, ch.charter_id, ch.yacht_id
        FROM CUSTOMER AS c
    JOIN CHARTER AS ch
        ON c.customer_id = ch.customer_id
    WHERE c.customer_id = p_customer_id
        AND ch.charter_id = p_charter_id;
END //

DELIMITER ;

/*
    Demonstration of Business Procedure 1,
    Reset the Database, add sample data, query sample data.
 */

call reset();

call bp1AddCustomerCharter
     (
    -- Customer Data
        'DDD-RRR',
        'Sample Name',
        'Unallocated',
        'sample@email.com',
        '111222333444',
    -- Charter Data
        'CH-XXX',
        '2026-12-31',
        5
     );

call bp1Verification('DDD-RRR', 'CH-XXX');