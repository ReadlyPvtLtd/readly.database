DELIMITER $$

CREATE TRIGGER trg_after_update_tblPublishers
AFTER UPDATE ON tblPublishers
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
        'update',
        JSON_OBJECT(
            'old_name', OLD.name,
            'new_name', NEW.name,
            'old_address', OLD.address,
            'new_address', NEW.address,
            'old_city', OLD.city,
            'new_city', NEW.city,
            'old_website_url', OLD.website_url,
            'new_website_url', NEW.website_url
        ),
        NULL,
        NOW()
    );
END$$

DELIMITER ;
