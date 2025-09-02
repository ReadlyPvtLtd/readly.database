DELIMITER $$

CREATE TRIGGER trg_after_insert_tblBranches
AFTER INSERT ON tblBranches
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        changed_data,
        changed_by,
        changed_at
    ) VALUES (
        'tblBranches',
        NEW.id,
        1,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'name', NEW.name,
            'address', NEW.address,
            'city', NEW.city,
            'state', NEW.state,
            'country', NEW.country,
            'postal_code', NEW.postal_code,
            'phone', NEW.phone,
            'email', NEW.email
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;