DELIMITER $$

CREATE TRIGGER trg_after_update_tblAuthors
AFTER UPDATE ON tblAuthors
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
        'tblAuthors',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'bio', NEW.bio,
            'website_url', NEW.text
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;