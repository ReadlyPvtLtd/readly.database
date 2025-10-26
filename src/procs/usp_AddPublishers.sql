DELIMITER $$

CREATE PROCEDURE usp_AddPublisher(
    IN p_name VARCHAR(255),
    IN p_address TEXT,
    IN p_city VARCHAR(100),
    IN p_country VARCHAR(100),
    IN p_website_url VARCHAR(512)
)
BEGIN
    DECLARE publisher_exists INT;

    -- Check if the publisher already exists
    SELECT COUNT(*) INTO publisher_exists FROM tblPublishers WHERE name = p_name;

    IF publisher_exists > 0 THEN
        -- Publisher already exists, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Publisher with this name already exists.';
    ELSE
        -- Insert the new publisher
        INSERT INTO tblPublishers (
            `name`,
            `address`,
            city,
            country,
            website_url,
            date_created,
            date_updated
        ) VALUES (
            p_name,
            p_address,
            p_city,
            p_country,
            p_website_url,
            NOW(),
            NOW()
        );

        -- Return the newly created publisher's ID
        SELECT LAST_INSERT_ID() AS publisher_id;
    END IF;
END$$

DELIMITER ;
