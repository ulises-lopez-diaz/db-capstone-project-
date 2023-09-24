-- Task 1
INSERT INTO Bookings(Date, TableNumber)
VALUES ('2022-10-10', 5),
('2022-11-12', 3),
('2022-10-11', 2),
('2022-10-13', 2);


-- Task 2
DELIMITER //

CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
    SELECT * FROM Bookings
    WHERE Date = BookingDate
    AND TableNumber = TableNumber;
END;
//

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);

-- Task 3
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
    DECLARE Message VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF EXISTS (
        SELECT * FROM Bookings
        WHERE Date = BookingDate AND TableNumber = TableNumber
    ) THEN
        SET Message = CONCAT('Table ', TableNumber, ' is already booked - booking cancelled');
        SELECT Message AS 'Booking status';

        ROLLBACK;
    ELSE
        INSERT INTO Bookings (Date, TableNumber)
        VALUES (BookingDate, TableNumber);

        SET Message = CONCAT('Table ', TableNumber, ' booking success');
        SELECT Message AS 'Booking status';

        COMMIT;
    END IF;
END;
//

DELIMITER ;

CALL AddValidBooking('2024-09-22', 99);
CALL AddValidBooking("2022-12-17", 6);

