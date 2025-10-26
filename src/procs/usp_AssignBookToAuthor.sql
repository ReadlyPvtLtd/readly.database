DELIMITER $$

CREATE PROCEDURE usp_AssignBookToAuthor(
    IN p_book_id BIGINT,
    IN p_author_id BIGINT
)
BEGIN
    DECLARE assignment_exists INT;

    -- Check if the assignment already exists
    SELECT COUNT(*) INTO assignment_exists FROM tblBooksAuthors WHERE book_id = p_book_id AND author_id = p_author_id;

    IF assignment_exists = 0 THEN
        -- Create the assignment
        INSERT INTO tblBooksAuthors (
            book_id,
            author_id,
            date_created,
            date_updated
        ) VALUES (
            p_book_id,
            p_author_id,
            NOW(),
            NOW()
        );
    END IF;
END$$

DELIMITER ;
