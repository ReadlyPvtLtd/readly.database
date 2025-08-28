DELIMITER $$

CREATE TRIGGER trg_after_delete_tblLoans
AFTER DELETE ON tblLoans
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
        'tblLoans',
        OLD.id,
        'delete',
        JSON_OBJECT(
            'book_id', OLD.book_id,
            'user_id', OLD.user_id,
            'loan_date', OLD.loan_date,
            'return_date', OLD.return_date,
            'status', OLD.status
        ),
        NULL,
        NOW()
    );
END$$

DELIMITER ;
