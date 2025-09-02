DELIMITER $$

CREATE TRIGGER trg_after_update_tblBookAuthors
AFTER UPDATE ON tblBookAuthors
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
        'tblBookAuthors',
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
            'author_id', NEW.author_id
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;