DELIMITER $$

CREATE TRIGGER trg_after_insert_tblGenres
AFTER INSERT ON tblGenres
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs VALUES (
        'tblGenres',
        NEW.id,
        1,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at, 
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by, 
            'updated_by', NEW.updated_by, 
            'void', NEW.void,
            'name', NEW.`name`,
            'description', NEW.`description`
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
    
    END$$