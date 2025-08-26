DELIMITER $$

CREATE TRIGGER trg_after_update_tblLoans
AFTER UPDATE ON tblLoans
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
        'update',
        JSON_OBJECT(
            'old_book_id', OLD.book_id,
            'new_book_id', NEW.book_id,
            'old_user_id', OLD.user_id,
            'new_user_id', NEW.user_id,
            'old_loan_date', OLD.loan_date,
            'new_loan_date', NEW.loan_date,
            'old_return_date', OLD.return_date,
            'new_return_date', NEW.return_date,
            'old_status', OLD.status,
            'new_status', NEW.status
        ),
        NULL,
        NOW()
    );
END$$

DELIMITER ;
