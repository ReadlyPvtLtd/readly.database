DELIMITER $$

CREATE TRIGGER trg_before_update_tblReservations
BEFORE UPDATE ON tblReservations
FOR EACH ROW
BEGIN
    IF NEW.status = 'cancelled' AND OLD.status = 'fulfilled' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot cancel a fulfilled reservation';
    END IF;

    IF NEW.reservation_date < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Reservation date cannot be in the past';
    END IF;
END$$

DELIMITER ;