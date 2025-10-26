DELIMITER $$

CREATE PROCEDURE usp_CreateCategory(
    IN p_parent_id BIGINT,
    IN p_name VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    DECLARE category_exists INT;

    -- Check if the category already exists
    SELECT COUNT(*) INTO category_exists FROM tblCategories WHERE name = p_name;

    IF category_exists > 0 THEN
        -- Category already exists, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Category with this name already exists.';
    ELSE
        -- Insert the new category
        INSERT INTO tblCategories (
            parent_id,
            `name`,
            `description`,
            date_created,
            date_updated
        ) VALUES (
            p_parent_id,
            p_name,
            p_description,
            NOW(),
            NOW()
        );

        -- Return the newly created category's ID
        SELECT LAST_INSERT_ID() AS category_id;
    END IF;
END$$

DELIMITER ;
