DELIMITER $$

CREATE TRIGGER trg_after_insert_tblBooks
AFTER INSERT ON tblBooks
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
        'tblBooks',
        NEW.id,
        1,
        JSON_OBJECT(
            'id', NEW.id,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at,
            'created_by', NEW.created_by,
            'updated_by', NEW.updated_by,
            'void', NEW.void,
            'isbn_10', NEW.isbn_10,
            'isbn_13', NEW.isbn_13,
            'title', NEW.title,
            'subtitle', NEW.subtitle,
            'description', NEW.description,
            'edition', NEW.edition,
            'language_code', NEW.language_code,
            'page_count', NEW.page_count,
            'publication_year', NEW.publication_year,
            'publisher_id', NEW.publisher_id,
            'cover_image_url', NEW.cover_image_url,
            'meta_title', NEW.meta_title,
            'meta_description', NEW.meta_description
        ),
        NEW.created_by,
        UTC_TIMESTAMP()
    );
END$$

DELIMITER ;