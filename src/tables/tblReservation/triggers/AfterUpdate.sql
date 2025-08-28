DELIMITER $$

CREATE TRIGGER trg_after_update_tblReservations
AFTER UPDATE ON tblReservations
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        changed_data,
        changed_by,
        changed_at
    ) 
    VALUES (
        'tblReservations',
        NEW.id,
        'update',
        JSON_OBJECT(
            'old_status', OLD.status,
            'new_status', NEW.status,
            'old_reservation_date', OLD.reservation_date,
            'new_reservation_date', NEW.reservation_date
        ),
        NEW.user_id,
        NOW()
    );
END$$

DELIMITER ;
