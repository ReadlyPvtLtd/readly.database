DELIMITER $$
DROP PROCEDURE IF EXISTS usp_DropIndex$$

-- =============================================
-- usp_DropIndex
-- Drops an index from a specified table if it exists.
--
-- Parameters:
--   in_table_name - The name of the table from which to drop the index.
--   in_index_name - The name of the index to drop.
--
-- Usage:
--   CALL usp_DropIndex('tblBooks', 'idx_tblBooks_category_id-author_id');
--
-- Notes:
--   - Checks if the table and index exist before attempting to drop.
--   - Handles exceptions and prints messages for each execution flow.
--   - Always uses backticks for database objects.
-- =============================================

CREATE PROCEDURE usp_DropIndex(
    IN in_table_name VARCHAR(64),
    IN in_index_name VARCHAR(128)
)
BEGIN
    -- Handle any SQL exception and print a custom message
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT CONCAT(
            'Failed to drop index `',
            in_index_name,
            '` from table `',
            in_table_name,
            '` due to an exception.'
        ) AS message;
    END;

    -- Check if table exists
    IF NOT ufn_DoesTableExist(in_table_name) THEN
        SELECT CONCAT(
            'Index `',
            in_index_name,
            '` cannot be dropped: table `',
            in_table_name,
            '` does not exist.'
        ) AS message;
    -- Check if index exists on the specified table
    ELSEIF NOT EXISTS (
        SELECT 1
        FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND index_name = in_index_name
    ) THEN
        SELECT CONCAT(
            'Index `',
            in_index_name,
            '` does not exist on table `',
            in_table_name,
            '`.'
        ) AS message;
    ELSE
        -- Build dynamic SQL to drop the index
        SET @sql = CONCAT(
            'DROP INDEX `', in_index_name,
            '` ON `', in_table_name, '`'
        );

        -- Prepare and execute the dynamic SQL
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Success message after dropping the index
        SELECT CONCAT(
            'Index `',
            in_index_name,
            '` dropped successfully from table `',
            in_table_name,
            '`.'
        ) AS message;
    END IF;
END
$$

DELIMITER ;