DELIMITER $$

CREATE TRIGGER trg_after_insert_reservation
AFTER INSERT ON tblReservation
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        new_value,
        changed_by,
        changed_at
    )
    VALUES (
        'tblReservation',
        NEW.id,
        'insert',
        JSON_OBJECT(
            'reservation_id', NEW.id,
            'user_id', NEW.user_id,
            'room_id', NEW.room_id,
            'check_in_date', NEW.check_in_date,
            'check_out_date', NEW.check_out_date,
            'status', NEW.status,
            'created_at', NEW.created_at
        ),
        NEW.user_id,
        NOW()
    );
END $$

DELIMITER ;
