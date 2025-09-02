DELIMITER $$

CREATE TRIGGER trg_after_update_tblUsers
AFTER UPDATE ON tblusers
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
        'tblUsers',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'member_id', NEW.member_id,
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'email', NEW.email,
            'phone', NEW.phone,
            'password', NEW.`password`,
            'address', NEW.address,
            'city', NEW.city,
            'state', NEW.state,
            'country', NEW.country,
            'postal_code', NEW.postal_code,
            'role', NEW.`role`,
            'status', NEW.`status`
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;