DELIMITER $$

CREATE TRIGGER trg_after_insert_tblDigitalResources
AFTER INSERT ON tblDigitalResources
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
        'tblDigitalResources',
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
            'file_url', NEW.file_url,
            'file_type', NEW.file_type,
            'file_size', NEW.file_size,
            'access_restrictions', NEW.access_restrictions
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;