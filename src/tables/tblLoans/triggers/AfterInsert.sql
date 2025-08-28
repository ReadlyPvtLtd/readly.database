DELIMITER $$

CREATE TRIGGER trg_after_insert_tblLoans
AFTER INSERT ON tblLoans
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
        NEW.id,
        'insert',
        JSON_OBJECT(
            'book_id', NEW.book_id,
            'user_id', NEW.user_id,
            'loan_date', NEW.loan_date,
            'return_date', NEW.return_date,
            'status', NEW.status
        ),
        NULL,
        NOW()
    );
END$$

DELIMITER ;
