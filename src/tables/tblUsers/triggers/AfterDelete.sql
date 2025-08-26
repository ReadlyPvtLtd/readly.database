DELIMITER $$

CREATE TRIGGER trg_after_delete_users
AFTER DELETE ON tblUsers
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs (
        table_name,
        record_id,
        action,
        old_value,
        new_value,
        changed_by,
        changed_at
    )
    VALUES (
        'tblUsers',
        OLD.id,
        'delete',
        JSON_OBJECT(
            'member_id', OLD.member_id,
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'email', OLD.email,
            'phone', OLD.phone,
            'address', OLD.address,
            'city', OLD.city,
            'state', OLD.state,
            'country', OLD.country,
            'postal_code', OLD.postal_code,
            'status', OLD.status,
            'created_at', OLD.created_at
        ),
        NULL,          -- new_value is NULL because record is deleted
        OLD.id,        -- Who performed delete (adjust if you track logged-in user separately)
        NOW()
    );
END $$

DELIMITER ;
