DELIMITER $$

CREATE TRIGGER trg_before_update_tblPublishers
BEFORE UPDATE ON tblPublishers
FOR EACH ROW
BEGIN
    IF NEW.name IS NULL OR TRIM(NEW.name) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Publisher name cannot be empty';
    END IF;

    IF NEW.website_url IS NOT NULL AND NEW.website_url NOT LIKE 'http%' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Website URL must start with http or https';
    END IF;
END$$

DELIMITER ;
