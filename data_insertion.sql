USE yacht_charters;

-- SQL Queries to populate database from the provided Excel file.
-- Produced using scripts and tooling as repetitive task.
-- Author: Phelim Hannon

DELIMITER //

DROP PROCEDURE IF EXISTS insertData //

CREATE PROCEDURE insertData()
BEGIN
-- CUSTOMER Insertions
    INSERT INTO CUSTOMER (customer_id, name, nationality, email, phone) VALUES
        ('D13-R20', 'Jean Harlow', 'German', 'jeanh99@gmail.com', 5866419887654),
        ('D17-022', 'Marilyn Monroe', 'French', 'marilyn@hotmail.com', 88487618356732),
        ('D13-101', 'Bette Davis', 'American', 'bette.davis@ulster.ac.uk', 41728003),
        ('D13-203', 'Cary Grant', 'British', 'bigcary@yahoo.com', 44417654321),
        ('D13-42 ', 'Humphrey Bogart', 'American', 'bogieh@gmail.com', 7782751839),
        ('D13-306', 'William Holden', 'Irish', 'billyho66@yahoo.com', 38198322843),
        ('D14-38 ', 'Katharine Hepburn', 'Irish', 'kath_hep29@hotmail.com', 447880708090),
        ('D13-R93', 'John Wayne', 'South African', 'john.wayne@ulster.ac.uk', 2890112233),
        ('D13-51 ', 'Ingrid Bergman', 'Swedish', 'IngridB@hotmail.com', 2890123456);

    -- PORT Insertions
    INSERT INTO PORT (port_id, name, phone, email, docking_places) VALUES
        ('P001', 'Genoa', '+3984774025', 'genoa667@genoaadmin.co.it', 160),
        ('P002', 'Kusadasi', '+9045204295', 'Kusadasi_harbour@hotmail.co.tr', 96),
        ('P003', 'Barcelona', '+34(0)8892436767', 'harbourmaster@barcelona_marina.com', 211),
        ('P004', 'Marmaris', '+90(0)62228138', NULL, 69),
        ('P005', 'Perpignan', '+3373600125', NULL, 88),
        ('P006', 'Paphos', '+35788301000', 'paphosmariana@cyprusports.cy', 47),
        ('P007', 'Monaco', '0037788356302', 'mariana@monacoport.mc', 104),
        ('P008', 'Dénia', '+90229453883', 'denia_port@denia_port.com', 31),
        ('P009', 'St Tropez', NULL, 'master@sttropezmarina.fr', 239),
        ('P010', 'Cartagena', '+34(0)62045005', NULL, 21),
        ('P011', 'Palma', '+3494955320', NULL, 74),
        ('P012', 'Marseiles', '+3330026016', 'marseiles_port@france_ports.fr', 92),
        ('P013', 'Malaga', '+3430336117', 'harbour_master@malagaport.com', 198),
        ('P014', 'Heraklion', NULL, 'herp@heraklioncity.co.gr', 85),
        ('P015', 'Athens', '+3014936640', 'paays7@athensport.gr', 106),
        ('P016', 'Valencia', '+3483884002', NULL, 74),
        ('P017', 'Izmir', '009062602105', NULL, 93),
        ('P018', 'Cagliari', '+3963660326', 'ettwu7@gmail.com', 40),
        ('P019', 'Naples', '+3990583686', NULL, 132),
        ('P020', 'Palermo', '+3922746104', 'ggaft4@visitpalermo.co.it', 57),
        ('P021', 'Bodrum', '+9099264831', NULL, 89),
        ('P022', 'Lisbon', '0035144700212', NULL, 79),
        ('P023', 'Magaluf', NULL, 'maghar@maghar.com', 88),
        ('P024', 'Cadiz', '+34(0)18128403', NULL, 90),
        ('P025', 'Montpelier', '+33(0)51411947', NULL, 79),
        ('P026', 'Cannes', '+3366295633', 'cannes.marina@yahoo.com', 148),
        ('P027', 'Tangier', '+21245936724', 'tan778@tangierport.com', 63);

    -- YACHT Insertions
    INSERT INTO YACHT (yacht_id, name, type, model, number_of_berths, cost_of_hire, home_port_id) VALUES
        ('Y005', 'Windsong', 'Catamaran', 'MacGregor 26X', 7, 1352.9, 'P008'),
        ('Y001', 'Serendipity', 'Monohull', 'Catalina 350', 9, 2995.92, 'P001'),
        ('Y002', 'Second Wind', 'Catamaran', 'MacGregor 26X', 8, 1063.45, 'P002'),
        ('Y003', 'Mad Hatter', 'Monohull', 'Jeanneau 42 DS', 4, 869.45, 'P003'),
        ('Y004', 'Serenity', 'Powered', 'Ranger 28', 11, 2294.0, 'P001'),
        ('Y006', 'Orion', 'Powered', 'Ranger 28', 9, 2309.56, 'P004'),
        ('Y007', 'Wind Dancer', 'Monohull', 'Jeanneau 42 DS', 4, 892.4, 'P003'),
        ('Y008', 'Escape', 'Monohull', 'Beneteau 373', 10, 3016.34, 'P002');

    -- CHARTER Insertions
    INSERT INTO CHARTER (charter_id, start_date, duration, customer_id, yacht_id) VALUES
        ('CH-033 ', '2018-06-17', 7, 'D13-R20', 'Y001'),
        ('CH-032 ', '2018-06-24', 36, 'D17-022', 'Y002'),
        ('CH-027 ', '2018-06-25', 7, 'D13-101', 'Y003'),
        ('CH-034 ', '2018-06-30', 18, 'D13-203', 'Y001'),
        ('CH-036 ', '2018-07-02', 14, 'D13-42 ', 'Y004'),
        ('CH-028 ', '2018-07-05', 21, 'D13-42 ', 'Y003'),
        ('CH-043 ', '2018-07-06', 10, 'D13-306', 'Y005'),
        ('CH-030 ', '2018-07-11', 14, 'D13-R20', 'Y006'),
        ('CH-039 ', '2018-07-12', 7, 'D13-101', 'Y007'),
        ('CH-035 ', '2018-07-22', 10, 'D13-R20', 'Y001'),
        ('CH-037 ', '2018-07-23', 21, 'D14-38 ', 'Y004'),
        ('CH-044 ', '2018-07-29', 35, 'D13-306', 'Y005'),
        ('CH-031 ', '2018-07-30', 10, 'D13-101', 'Y006'),
        ('CH-029 ', '2018-08-05', 14, 'D13-R93', 'Y003'),
        ('CH-040 ', '2018-08-10', 10, 'D17-022', 'Y007'),
        ('CH-038 ', '2018-08-18', 7, 'D13-203', 'Y004'),
        ('CH-041 ', '2018-08-23', 7, 'D13-51 ', 'Y007'),
        ('CH-026 ', '2018-08-25', 14, 'D13-51 ', 'Y008'),
        ('CH-042 ', '2018-09-06', 15, 'D14-38 ', 'Y007'),
        ('CH-045 ', '2018-09-06', 21, 'D13-203', 'Y005');

    -- VISITS Insertions
    INSERT INTO VISIT (visit_id, charter_id, port_id, expected_arrival, duration) VALUES
        ('V101', 'CH-033 ', 'P001', '2018-06-17', 0),
        ('V102', 'CH-032 ', 'P002', '2018-06-24', 0),
        ('V103', 'CH-027 ', 'P003', '2018-06-25', 0),
        ('V104', 'CH-032 ', 'P004', '2018-06-27', 1),
        ('V105', 'CH-027 ', 'P005', '2018-06-29', 1),
        ('V106', 'CH-034 ', 'P001', '2018-06-30', 1),
        ('V107', 'CH-036 ', 'P001', '2018-07-02', 1),
        ('V108', 'CH-032 ', 'P006', '2018-07-04', 3),
        ('V109', 'CH-034 ', 'P007', '2018-07-04', 2),
        ('V110', 'CH-028 ', 'P003', '2018-07-05', 1),
        ('V111', 'CH-043 ', 'P008', '2018-07-06', 0),
        ('V112', 'CH-036 ', 'P009', '2018-07-07', 2),
        ('V113', 'CH-043 ', 'P010', '2018-07-08', 1),
        ('V114', 'CH-028 ', 'P011', '2018-07-09', 3),
        ('V115', 'CH-034 ', 'P012', '2018-07-10', 1),
        ('V116', 'CH-030 ', 'P004', '2018-07-11', 0),
        ('V117', 'CH-043 ', 'P013', '2018-07-11', 3),
        ('V118', 'CH-039 ', 'P003', '2018-07-12', 1),
        ('V119', 'CH-032 ', 'P014', '2018-07-13', 1),
        ('V120', 'CH-036 ', 'P007', '2018-07-13', 1),
        ('V121', 'CH-034 ', 'P009', '2018-07-15', 1),
        ('V122', 'CH-028 ', 'P010', '2018-07-16', 1),
        ('V123', 'CH-030 ', 'P006', '2018-07-16', 2),
        ('V124', 'CH-032 ', 'P015', '2018-07-19', 3),
        ('V125', 'CH-030 ', 'P014', '2018-07-21', 1),
        ('V126', 'CH-028 ', 'P016', '2018-07-22', 2),
        ('V127', 'CH-035 ', 'P001', '2018-07-22', 1),
        ('V128', 'CH-032 ', 'P017', '2018-07-23', 1),
        ('V129', 'CH-037 ', 'P001', '2018-07-23', 0),
        ('V130', 'CH-035 ', 'P018', '2018-07-26', 1),
        ('V131', 'CH-037 ', 'P019', '2018-07-26', 1),
        ('V132', 'CH-044 ', 'P008', '2018-07-29', 0),
        ('V133', 'CH-031 ', 'P004', '2018-07-30', 0),
        ('V134', 'CH-035 ', 'P019', '2018-07-30', 1),
        ('V135', 'CH-037 ', 'P020', '2018-07-31', 1),
        ('V136', 'CH-044 ', 'P013', '2018-08-02', 1),
        ('V137', 'CH-031 ', 'P014', '2018-08-03', 1),
        ('V138', 'CH-029 ', 'P003', '2018-08-05', 0),
        ('V139', 'CH-037 ', 'P018', '2018-08-05', 2),
        ('V140', 'CH-031 ', 'P021', '2018-08-06', 2),
        ('V141', 'CH-044 ', 'P022', '2018-08-07', 4),
        ('V142', 'CH-029 ', 'P010', '2018-08-10', 1),
        ('V143', 'CH-037 ', 'P019', '2018-08-10', 1),
        ('V144', 'CH-040 ', 'P003', '2018-08-10', 0),
        ('V145', 'CH-040 ', 'P009', '2018-08-13', 1),
        ('V146', 'CH-029 ', 'P023', '2018-08-15', 1),
        ('V147', 'CH-044 ', 'P024', '2018-08-15', 1),
        ('V148', 'CH-040 ', 'P025', '2018-08-17', 1),
        ('V149', 'CH-038 ', 'P001', '2018-08-18', 0),
        ('V150', 'CH-038 ', 'P026', '2018-08-22', 1),
        ('V151', 'CH-044 ', 'P027', '2018-08-22', 2),
        ('V152', 'CH-041 ', 'P003', '2018-08-23', 0),
        ('V153', 'CH-026 ', 'P002', '2018-08-25', 0),
        ('V154', 'CH-041 ', 'P025', '2018-08-27', 1),
        ('V155', 'CH-044 ', 'P011', '2018-08-27', 1),
        ('V156', 'CH-026 ', 'P015', '2018-08-29', 2),
        ('V157', 'CH-026 ', 'P017', '2018-09-05', 1),
        ('V158', 'CH-042 ', 'P003', '2018-09-06', 0),
        ('V159', 'CH-045 ', 'P008', '2018-09-06', 1),
        ('V160', 'CH-042 ', 'P023', '2018-09-08', 1),
        ('V161', 'CH-042 ', 'P010', '2018-09-10', 2),
        ('V162', 'CH-045 ', 'P003', '2018-09-12', 2),
        ('V163', 'CH-042 ', 'P008', '2018-09-15', 1),
        ('V164', 'CH-045 ', 'P025', '2018-09-17', 2),
        ('V165', 'CH-042 ', 'P023', '2018-09-18', 1),
        ('V166', 'CH-045 ', 'P023', '2018-09-23', 1);
END //

DELIMITER ;

CALL insertData()
