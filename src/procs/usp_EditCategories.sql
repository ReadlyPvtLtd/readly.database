DELIMITER $$

CREATE PROCEDURE usp_EditCategory(
    IN p_category_id BIGINT,
    IN p_parent_id BIGINT,
    IN p_name VARCHAR(255),
    IN p_description TEXT
)
BEGIN
    DECLARE category_exists INT;
    DECLARE category_name_exists INT;

    -- Check if the category exists
    SELECT COUNT(*) INTO category_exists FROM tblCategories WHERE category_id = p_category_id;

    IF category_exists = 0 THEN
        -- Category does not exist, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Category does not exist.';
    ELSE
        -- Check if the new name is already used by another category
        SELECT COUNT(*) INTO category_name_exists FROM tblCategories WHERE name = p_name AND category_id != p_category_id;

        IF category_name_exists > 0 THEN
            -- Category name already exists, return an error
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Category with this name already exists.';
        ELSE
            -- Update the category
            UPDATE tblCategories
            SET
                parent_id = p_parent_id,
                `name` = p_name,
                `description` = p_description,
                date_updated = NOW()
            WHERE category_id = p_category_id;
        END IF;
    END IF;
END$$

DELIMITER ;
