DELIMITER $$

DROP PROCEDURE IF EXISTS uspAddColumnIfNotExists $$
CREATE PROCEDURE uspAddColumnIfNotExists (
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_column_type VARCHAR(255)
)
BEGIN
    DECLARE column_exists INT DEFAULT 0;
    DECLARE table_exists INT DEFAULT 0;
    DECLARE alter_sql TEXT;
    DECLARE current_schema VARCHAR(64);

    SET current_schema = DATABASE();

    -- Check if table exists in current schema
    SELECT COUNT(*)
    INTO table_exists
    FROM information_schema.tables
    WHERE table_schema = current_schema
      AND table_name = in_table_name;

    IF table_exists > 0 THEN
        -- Check if column exists
        SELECT COUNT(*)
        INTO column_exists
        FROM information_schema.columns
        WHERE table_schema = current_schema
          AND table_name = in_table_name
          AND column_name = in_column_name;

        IF column_exists = 0 THEN
            SET @alter_sql = CONCAT(
                'ALTER TABLE `', in_table_name,
                '` ADD COLUMN `', in_column_name, '` ', in_column_type
            );
            PREPARE stmt FROM @alter_sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

            SELECT CONCAT('Column `', in_column_name, '` added to table `', in_table_name, '`') AS message;
        ELSE
            SELECT CONCAT('Column `', in_column_name, '` already exists in table `', in_table_name, '`') AS message;
        END IF;
    ELSE
        SELECT CONCAT('Table `', in_table_name, '` does not exist in database `', current_schema, '`') AS message;
    END IF;
END $$

DELIMITER ;
