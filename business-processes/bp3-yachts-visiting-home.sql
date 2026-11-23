USE yacht_charters;
-- Business Process 3
-- get a list of yachts (by name) visiting their home port between two given dates, together with the date of arrival
-- and the length of the stay.

DELIMITER //

DROP PROCEDURE IF EXISTS bp3GetYachtsVisitingHome //

CREATE PROCEDURE bp3GetYachtsVisitingHome
    (
        IN first_date DATE,
        IN second_date DATE
    )
BEGIN
    -- One row per yacht, for the visit by aggregating visits and duration of those visits.

    SELECT
        y.name AS 'Yacht Name',
        COUNT(v.visit_id) AS 'Visit Count',
        -- Group Concat used to show the expected arrival as verification of visits.
        -- Output is now more useful.
        GROUP_CONCAT(
            CONCAT(v.expected_arrival, ' (', v.duration,' night)')
            SEPARATOR '; ') AS 'Expected Arrivals',
        SUM(v.duration) AS 'Total length of Stay'
    FROM YACHT y
             INNER JOIN CHARTER c
                        ON y.yacht_id = c.yacht_id
             INNER JOIN VISIT v
                        ON c.charter_id = v.charter_id
    WHERE v.port_id = y.home_port_id
      AND v.expected_arrival BETWEEN first_date AND second_date
    GROUP BY y.name
    ORDER BY y.name;
END //

DELIMITER ;

call bp3GetYachtsVisitingHome('2018-06-07', '2018-09-14')