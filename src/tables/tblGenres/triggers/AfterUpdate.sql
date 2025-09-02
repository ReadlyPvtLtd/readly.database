DELIMITER $$

CREATE TRIGGER trg_after_update_tblGenres
AFTER UPDATE ON tblGenres
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs VALUES (
        'tblGenres',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at, 
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by, 
            'updated_by', NEW.updated_by, 
            'void', NEW.void,
            'name', NEW.name,
            'description', NEW.description
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$