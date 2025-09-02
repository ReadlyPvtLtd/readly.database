DELIMITER $$

CREATE TRIGGER trg_after_update_tblBookAttributes
AFTER UPDATE ON tblBookAttributes
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
        'tblBookAttributes',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'book_id', NEW.book_id,
            'attribute_name', NEW.attribute_name,
            'attribute_value', NEW.attribute_value
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;