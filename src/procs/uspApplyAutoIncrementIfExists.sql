DELIMITER $$

DROP PROCEDURE IF EXISTS uspApplyAutoIncrementIfExists $$
CREATE PROCEDURE uspApplyAutoIncrementIfExists (
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64)
)
BEGIN
    DECLARE col_type VARCHAR(255);
    DECLARE extra_info VARCHAR(255);

    -- Step 1: Check table existence using the function
    IF TableExists(in_table_name) THEN

        -- Step 2: Check column existence using the function
        IF ColumnExists(in_table_name, in_column_name) THEN

            -- Step 3: Get the column type and EXTRA info (AUTO_INCREMENT flag lives in EXTRA)
            SELECT COLUMN_TYPE, EXTRA
            INTO col_type, extra_info
            FROM information_schema.columns
            WHERE table_schema = DATABASE()
              AND table_name = in_table_name
              AND column_name = in_column_name;

            -- Step 4: If column is not AUTO_INCREMENT already, alter it
            IF LOCATE('auto_increment', extra_info) = 0 THEN
                SET @sql = CONCAT(
                    'ALTER TABLE `', in_table_name, '` ',
                    'MODIFY COLUMN `', in_column_name, '` ',
                    col_type, ' AUTO_INCREMENT'
                );

                PREPARE stmt FROM @sql;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
            END IF;

        END IF;

    END IF;

END $$

DELIMITER ;