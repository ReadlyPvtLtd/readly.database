DELIMITER $$

CREATE TRIGGER trg_after_insert_tblUsers
AFTER INSERT ON tblUsers
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (table_name, record_id, action, new_value, changed_by, changed_at)
    VALUES (
        'tblUsers',
        NEW.id,
        'insert',
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
        NEW.id,   -- assuming the user inserting is the same as the new user
        NOW()
    );
END $$

DELIMITER ;