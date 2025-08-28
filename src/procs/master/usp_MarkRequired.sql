DELIMITER $$
DROP PROCEDURE IF EXISTS usp_MarkRequired$$

-- =============================================
-- usp_MarkRequired
-- Alters a column in a table to set or unset the NOT NULL (required) constraint.
--
-- Parameters:
--   in_table_name   - The name of the table to alter.
--   in_column_name  - The name of the column to modify.
--   in_required     - TRUE to make the column required (NOT NULL), FALSE to allow NULLs.
--
-- Usage:
--   CALL usp_MarkRequired('tblExample', 'colName', TRUE);
--
-- Notes:
--   - Checks if the table and column exist before attempting to alter.
--   - Handles exceptions and prints messages for each execution flow.
--   - The column's data type is preserved.
-- =============================================

CREATE PROCEDURE usp_MarkRequired(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_required BOOLEAN
)
BEGIN
    DECLARE v_data_type VARCHAR(255);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT CONCAT(
            'Failed to update required flag for column ',
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
        SELECT COLUMN_TYPE
        INTO v_data_type
        FROM information_schema.columns
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND column_name = in_column_name;

        SET @sql = CONCAT(
            'ALTER TABLE ', in_table_name,
            ' MODIFY COLUMN ', in_column_name, ' ', v_data_type,
            IF(in_required, ' NOT NULL', ' NULL')
        );

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SELECT CONCAT(
            'Column ',
            in_column_name,
            IF(in_required, ' is now required (NOT NULL)', ' is now nullable (NULL)'),
            ' in table ',
            in_table_name,
            '.'
        ) AS message;
    END IF;
END
$$

DELIMITER ;