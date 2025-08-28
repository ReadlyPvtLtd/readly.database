DELIMITER $$
DROP PROCEDURE IF EXISTS usp_AutoIncrement$$

-- =============================================
-- usp_AutoIncrement
-- Alters a column in a table to make it AUTO_INCREMENT if it is not already.
--
-- Parameters:
--   in_table_name   - The name of the table to alter.
--   in_column_name  - The name of the column to modify.
--
-- Usage:
--   CALL usp_AutoIncrement('tblExample', 'id');
--
-- Notes:
--   - Checks if the table and column exist before attempting to alter.
--   - Only works for integer columns that are not already AUTO_INCREMENT.
--   - Handles exceptions and prints messages for each execution flow.
-- =============================================

CREATE PROCEDURE usp_AutoIncrement(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64)
)
BEGIN
    DECLARE v_data_type VARCHAR(64);
    DECLARE v_extra VARCHAR(64);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT CONCAT(
            'Failed to set AUTO_INCREMENT for column ',
            in_column_name,
            ' in table ',
            in_table_name,
            '.'
        ) AS message;
    END;

    IF NOT ufn_DoesTableExist(in_table_name) THEN
        SELECT CONCAT(
            'Table ',
            in_table_name,
            ' does not exist.'
        ) AS message;
    ELSEIF NOT ufn_DoesColumnExist(in_table_name, in_column_name) THEN
        SELECT CONCAT(
            'Column ',
            in_column_name,
            ' does not exist in table ',
            in_table_name,
            '.'
        ) AS message;
    ELSE
        SELECT COLUMN_TYPE, EXTRA
        INTO v_data_type, v_extra
        FROM information_schema.columns
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND column_name = in_column_name;

        IF v_extra LIKE '%auto_increment%' THEN
            SELECT CONCAT(
                'Column ',
                in_column_name,
                ' is already AUTO_INCREMENT in table ',
                in_table_name,
                '.'
            ) AS message;
        ELSEIF v_data_type NOT REGEXP '^(int|bigint|smallint|mediumint|tinyint)' THEN
            SELECT CONCAT(
                'Column ',
                in_column_name,
                ' is not an integer type and cannot be set to AUTO_INCREMENT.'
            ) AS message;
        ELSE
            SET @sql = CONCAT(
                'ALTER TABLE ', in_table_name,
                ' MODIFY COLUMN ', in_column_name, ' ', v_data_type, ' NOT NULL AUTO_INCREMENT'
            );
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

            SELECT CONCAT(
                'Column ',
                in_column_name,
                ' is now AUTO_INCREMENT in table ',
                in_table_name,
                '.'
            ) AS message;
        END IF;
    END IF;
END
$$

DELIMITER ;