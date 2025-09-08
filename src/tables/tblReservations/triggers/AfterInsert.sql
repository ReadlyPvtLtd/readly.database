DELIMITER $$

CREATE TRIGGER trg_after_insert_tblReservations
AFTER INSERT ON tblReservations
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        new_data,
        changed_by,
        changed_at
    ) VALUES (
        'tblReservations',
        NEW.id,
        1,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'book_id', NEW.book_id,
            'user_id', NEW.user_id,
            'reservation_date', NEW.reservation_date,
            'status', NEW.status
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;