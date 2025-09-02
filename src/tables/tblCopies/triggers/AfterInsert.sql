DELIMITER $$

CREATE TRIGGER trg_after_insert_tblCopies
AFTER INSERT ON tblCopies
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
        'tblCopies',
        NEW.id,
        1,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'book_id', NEW.book_id,
            'barcode', NEW.barcode,
            'branch_id', NEW.branch_id,
            'location_code', NEW.location_code,
            'status', NEW.status,
            'condition_note', NEW.condition_note,
            'acquisition_date', NEW.acquisition_date,
            'price', NEW.price
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;