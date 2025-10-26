DELIMITER $$

CREATE PROCEDURE usp_CreateUserAccount(
    IN p_firstname VARCHAR(128),
    IN p_lastname VARCHAR(128),
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_phone VARCHAR(255),
    IN p_address VARCHAR(255),
    IN p_city VARCHAR(255),
    IN p_state VARCHAR(255),
    IN p_country VARCHAR(255),
    IN p_postal_code VARCHAR(255),
    IN p_role VARCHAR(255),
    IN p_status VARCHAR(255)
)
BEGIN
    DECLARE user_exists INT;

    -- Check if the user already exists
    SELECT COUNT(*) INTO user_exists FROM tblUsers WHERE email = p_email;

    IF user_exists > 0 THEN
        -- User already exists, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User with this email already exists.';
    ELSE
        -- Insert the new user
        INSERT INTO tblUsers (
            firstname,
            lastname,
            email,
            `password`,
            phone,
            `address`,
            city,
            `state`,
            country,
            postal_code,
            `role`,
            `status`,
            date_created,
            date_updated
        ) VALUES (
            p_firstname,
            p_lastname,
            p_email,
            p_password,
            p_phone,
            p_address,
            p_city,
            p_state,
            p_country,
            p_postal_code,
            p_role,
            p_status,
            NOW(),
            NOW()
        );

        -- Return the newly created user's ID
        SELECT LAST_INSERT_ID() AS user_id;
    END IF;
END$$

DELIMITER ;