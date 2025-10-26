DELIMITER $$

CREATE PROCEDURE usp_DoesUserExists(IN p_email VARCHAR(255))
BEGIN
    DECLARE user_count INT;

    -- Check if a user with the given email exists
    SELECT COUNT(*) INTO user_count FROM tblUsers WHERE email = p_email;

    -- Return 1 if the user exists, 0 otherwise
    SELECT IF(user_count > 0, 1, 0) AS user_exists;
END$$

DELIMITER ;s