DELIMITER $$

CREATE TRIGGER trg_after_insert_tblPublishers
AFTER INSERT ON tblPublishers
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
        'tblPublishers',
        NEW.id,
        'insert',
        JSON_OBJECT(
            'name', NEW.name,
            'address', NEW.address,
            'city', NEW.city,
            'website_url', NEW.website_url
        ),
        NULL,
        NOW()
    );
END$$

DELIMITER ;
