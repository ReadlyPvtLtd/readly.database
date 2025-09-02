DELIMITER $$

CREATE TRIGGER trg_after_update_tblFines
AFTER UPDATE ON tblFines
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs VALUES (
        'tblFines',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at, 
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by, 
            'updated_by', NEW.updated_by, 
            'void', NEW.void,
            'user_id', NEW.user_id,
            'loan_id', NEW.loan_id,
            'amount', NEW.amount,
            'paid', NEW.paid,
            'reason', NEW.reason
            'issued_at', NEW.issued_at,
            'paid_at', NEW.paid_at
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
    
END$$