DELIMITER $$

CREATE PROCEDURE usp_AddCopy(
    IN p_book_id BIGINT,
    IN p_barcode VARCHAR(100),
    IN p_branch_id BIGINT,
    IN p_location_code VARCHAR(50),
    IN p_status TINYINT,
    IN p_condition_note TEXT,
    IN p_acquisition_date DATE,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    DECLARE barcode_exists INT;

    -- Check if the barcode already exists
    SELECT COUNT(*) INTO barcode_exists FROM tblCopies WHERE barcode = p_barcode;

    IF barcode_exists > 0 THEN
        -- Barcode already exists, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Copy with this barcode already exists.';
    ELSE
        -- Insert the new copy
        INSERT INTO tblCopies (
            book_id,
            barcode,
            branch_id,
            location_code,
            `status`,
            condition_note,
            acquisition_date,
            price,
            date_created,
            date_updated
        ) VALUES (
            p_book_id,
            p_barcode,
            p_branch_id,
            p_location_code,
            p_status,
            p_condition_note,
            p_acquisition_date,
            p_price,
            NOW(),
            NOW()
        );

        -- Return the newly created copy's ID
        SELECT LAST_INSERT_ID() AS copy_id;
    END IF;
END$$

DELIMITER ;
