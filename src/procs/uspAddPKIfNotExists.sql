DROP PROCEDURE IF EXISTS uspAddPKIfNotExists;
DELIMITER $$

CREATE PROCEDURE uspAddPKIfNotExists(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE table_name = in_table_name
          AND constraint_type = 'PRIMARY KEY'
    ) THEN
        SET @sql = CONCAT('ALTER TABLE ', in_table_name,
                          ' ADD PRIMARY KEY (', in_column_name, ')');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$

DELIMITER ;