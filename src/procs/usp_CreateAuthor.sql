DELIMITER $$

CREATE PROCEDURE usp_CreateAuthor(
    IN p_first_name VARCHAR(128),
    IN p_last_name VARCHAR(128),
    IN p_bio TEXT,
    IN p_website_url VARCHAR(512),
    IN p_avatar_url VARCHAR(512)
)
BEGIN
    -- Insert the new author
    INSERT INTO tblAuthors (
        first_name,
        last_name,
        bio,
        website_url,
        avatar_url,
        date_created,
        date_updated
    ) VALUES (
        p_first_name,
        p_last_name,
        p_bio,
        p_website_url,
        p_avatar_url,
        NOW(),
        NOW()
    );

    -- Return the newly created author's ID
    SELECT LAST_INSERT_ID() AS author_id;
END$$

DELIMITER ;
