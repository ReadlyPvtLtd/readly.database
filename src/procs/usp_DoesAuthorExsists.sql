DELIMITER $$

CREATE PROCEDURE usp_DoesAuthorExists(
    IN p_first_name VARCHAR(128),
    IN p_last_name VARCHAR(128)
)
BEGIN
    DECLARE author_count INT;

    -- Check if an author with the given name exists
    SELECT COUNT(*) INTO author_count FROM tblAuthors WHERE first_name = p_first_name AND last_name = p_last_name;

    -- Return 1 if the author exists, 0 otherwise
    SELECT IF(author_count > 0, 1, 0) AS author_exists;
END$$

DELIMITER ;
