DELIMITER $$

CREATE PROCEDURE usp_AssignGenreToBook(
    IN p_book_id BIGINT,
    IN p_genre_id BIGINT
)
BEGIN
    DECLARE assignment_exists INT;

    -- Check if the assignment already exists
    SELECT COUNT(*) INTO assignment_exists FROM tblBooksGenres WHERE book_id = p_book_id AND genre_id = p_genre_id;

    IF assignment_exists = 0 THEN
        -- Create the assignment
        INSERT INTO tblBooksGenres (
            book_id,
            genre_id,
            date_created,
            date_updated
        ) VALUES (
            p_book_id,
            p_genre_id,
            NOW(),
            NOW()
        );
    END IF;
END$$

DELIMITER ;
