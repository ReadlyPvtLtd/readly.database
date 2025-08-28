DELIMITER $$

CREATE TRIGGER trg_after_update_users
AFTER UPDATE ON tblUsers
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        old_value,
        new_value,
        changed_by,
        changed_at
    )
    VALUES (
        'tblUsers',
        NEW.id,
        'update',
        JSON_OBJECT(
            'member_id', OLD.member_id,
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'email', OLD.email,
            'phone', OLD.phone,
            'address', OLD.address,
            'city', OLD.city,
            'state', OLD.state,
            'country', OLD.country,
            'postal_code', OLD.postal_code,
            'status', OLD.status,
            'created_at', OLD.created_at
        ),
        JSON_OBJECT(
            'member_id', NEW.member_id,
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'email', NEW.email,
            'phone', NEW.phone,
            'address', NEW.address,
            'city', NEW.city,
            'state', NEW.state,
            'country', NEW.country,
            'postal_code', NEW.postal_code,
            'status', NEW.status,
            'created_at', NEW.created_at
        ),
        NEW.id,
        NOW()
    );
END $$

DELIMITER ;
