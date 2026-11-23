USE yacht_charters;
-- Handy Procedures I can use in demonstration

DELIMITER //

CREATE PROCEDURE reset()
BEGIN
    CALL makeTables();
    CALL insertData();
END //

DELIMITER ;