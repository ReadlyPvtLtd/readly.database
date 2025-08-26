DELIMITER $$

CREATE TRIGGER trg_after_delete_reservation
AFTER DELETE ON tblReservation
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        old_value,
        changed_by,
        changed_at
    )
    VALUES (
        'tblReservation',
        OLD.id,
        'delete',
        JSON_OBJECT(
            'reservation_id', OLD.id,
            'user_id', OLD.user_id,
            'room_id', OLD.room_id,
            'check_in_date', OLD.check_in_date,
            'check_out_date', OLD.check_out_date,
            'status', OLD.status,
            'created_at', OLD.created_at
        ),
        OLD.user_id,
        NOW()
    );
END $$

DELIMITER ;
