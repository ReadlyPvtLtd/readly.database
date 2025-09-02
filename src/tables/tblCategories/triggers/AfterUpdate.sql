DELIMITER $$

CREATE TRIGGER trg_after_update_tblCategories
AFTER UPDATE ON tblCategories
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
        'tblCategories',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'parent_id', NEW.parent_id,
            'name', NEW.name,
            'description', NEW.description
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;