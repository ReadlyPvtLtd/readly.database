DELIMITER $$

CREATE PROCEDURE usp_AddGenre(
    IN p_name VARCHAR(100),
    IN p_description TEXT
)
BEGIN
    DECLARE genre_exists INT;

    -- Check if the genre already exists
    SELECT COUNT(*) INTO genre_exists FROM tblGenres WHERE name = p_name;

    IF genre_exists > 0 THEN
        -- Genre already exists, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Genre with this name already exists.';
    ELSE
        -- Insert the new genre
        INSERT INTO tblGenres (
            `name`,
            `description`,
            date_created,
            date_updated
        ) VALUES (
            p_name,
            p_description,
            NOW(),
            NOW()
        );

        -- Return the newly created genre's ID
        SELECT LAST_INSERT_ID() AS genre_id;
    END IF;
END$$

DELIMITER ;
