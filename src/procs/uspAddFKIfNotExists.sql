DROP PROCEDURE IF EXISTS uspAddFKIfNotExists;
DELIMITER $$

CREATE PROCEDURE uspAddFKIfNotExists(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64),
    IN in_ref_table_name VARCHAR(64),
    IN in_ref_column_name VARCHAR(64),
    IN in_fk_name VARCHAR(64)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.key_column_usage
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND column_name = in_column_name
          AND referenced_table_name IS NOT NULL
    ) THEN
        -- Build ALTER TABLE statement to add foreign key
        SET @sql = CONCAT(
							'ALTER TABLE ', in_table_name,
							' ADD CONSTRAINT ', in_fk_name,
							' FOREIGN KEY (', in_column_name, ')',
							' REFERENCES ', in_ref_table_name, '(', in_ref_column_name, ')'
						);
        
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$

DELIMITER ;