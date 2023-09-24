-- Task 1
DELIMITER //

CREATE PROCEDURE AddBooking(IN BookingId INT, IN CustomerID INT, IN BookingDate DATE, IN TableNumber INT)
BEGIN
    DECLARE Message VARCHAR(100);

    SET NOCOUNT ON;

    INSERT INTO Bookings (Date, TableNumber)
    VALUES (BookingDate, TableNumber);

    SET Message = 'New booking added';
    SELECT Message AS Confirmation;
END;
//

DELIMITER ;

CALL AddBooking(109, 3, '2022-12-30', 3);


-- Task 2
DELIMITER //

CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN BookingDate DATE)
BEGIN
    DECLARE Message VARCHAR(100);

    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT * FROM Bookings
        WHERE BookingID = BookingID
    ) THEN
        UPDATE Bookings
        SET Date = BookingDate
        WHERE BookingID = BookingID;

        SET Message = CONCAT('Booking ', BookingID, ' updated');
        SELECT Message AS 'Confirmation';
    ELSE
        SET Message = CONCAT('Booking ', BookingID, ' Not found');
        SELECT Message AS 'Confirmation';
    END IF;
END;
//

DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');


-- Task 3
DELIMITER //

CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
    DECLARE Message VARCHAR(100);

    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT * FROM Bookings
        WHERE BookingID = BookingID
    ) THEN
        DELETE FROM Bookings
        WHERE BookingID = BookingID;

        SET Message = CONCAT('Booking ', BookingID, ' cancelled');
        SELECT Message AS 'Confirmation';
    ELSE
        SET Message = CONCAT('Booking ', BookingID, ' Not Found');
        SELECT Message AS 'Confirmation';
    END IF;
END;
//

DELIMITER ;

CALL CancelBooking(2);
