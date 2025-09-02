DELIMITER $$

CREATE TRIGGER trg_after_insert_tblPublishers
AFTER INSERT ON tblPublishers
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (table_name, record_id, action, new_data, changed_by, changed_at)
    VALUES (
        'tblPublishers',
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
            'country', NEW.country,
            'website_url', NEW.website_url
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
END$$