DELIMITER $$

DROP PROCEDURE IF EXISTS uspApplyAutoIncrementIfExists $$
CREATE PROCEDURE uspApplyAutoIncrementIfExists (
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64)
)
BEGIN
    DECLARE table_exists INT DEFAULT 0;
    DECLARE column_exists INT DEFAULT 0;
    DECLARE is_auto_increment INT DEFAULT 0;
    DECLARE col_type VARCHAR(255);

    -- Check if table exists in current database
    SELECT COUNT(*) INTO table_exists
    FROM information_schema.tables
    WHERE table_schema = DATABASE()
      AND table_name = in_table_name;

    IF table_exists > 0 THEN

        -- Check if column exists in the table
        SELECT COUNT(*), COLUMN_TYPE, EXTRA
        INTO column_exists, col_type, @extra
        FROM information_schema.columns
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND column_name = in_column_name;

        IF column_exists > 0 THEN

            -- Check if column already has AUTO_INCREMENT
            IF LOCATE('auto_increment', @extra) = 0 THEN
                SET @sql = CONCAT('ALTER TABLE `', in_table_name, '` 
                                   MODIFY COLUMN `', in_column_name, '` ', col_type, ' AUTO_INCREMENT');
                PREPARE stmt FROM @sql;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
            END IF;

        END IF;

    END IF;

END $$

DELIMITER ;
