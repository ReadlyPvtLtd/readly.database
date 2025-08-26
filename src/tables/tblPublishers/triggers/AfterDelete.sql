DELIMITER $$

CREATE TRIGGER trg_after_delete_tblPublishers
AFTER DELETE ON tblPublishers
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
        OLD.id,
        'delete',
        JSON_OBJECT(
            'name', OLD.name,
            'address', OLD.address,
            'city', OLD.city,
            'website_url', OLD.website_url
        ),
        NULL,
        NOW()
    );
END$$

DELIMITER ;
