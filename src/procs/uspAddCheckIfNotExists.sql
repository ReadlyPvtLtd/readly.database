DROP PROCEDURE IF EXISTS uspAddCheckIfNotExists;
DELIMITER $$

CREATE PROCEDURE uspAddCheckIfNotExists(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_constraint_name VARCHAR(64),
    IN in_condition VARCHAR(255)
)
BEGIN
    -- Check if constraint already exists
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND constraint_name = in_constraint_name
          AND constraint_type = 'CHECK'
    ) THEN
        -- Build the ALTER TABLE statement
        SET @sql = CONCAT(
            'ALTER TABLE ', in_table_name,
            ' ADD CONSTRAINT ', in_constraint_name,
            ' CHECK (', in_condition, ')'
        );

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$

DELIMITER ;