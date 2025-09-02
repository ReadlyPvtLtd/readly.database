DELIMITER $$

CREATE TRIGGER trg_after_update_tblLoans
AFTER UPDATE ON tblLoans
FOR EACH ROW
BEGIN
    INSERT INTO tblAuditLogs VALUES (
        'tblLoans',
        NEW.id,
        2,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at, 
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by, 
            'updated_by', NEW.updated_by, 
            'void', NEW.void,
            'copy_id', NEW.copy_id,
            'user_id', NEW.user_id,
            'issue_date', NEW.issue_date,
            'due_date', NEW.due_date,
            'return_date', NEW.return_date,
            'status', NEW.status,
            'fine_amount', NEW.fine_amount
        ),
        NEW.updated_by,
        UTC_TIMESTAMP()
    );
END$$