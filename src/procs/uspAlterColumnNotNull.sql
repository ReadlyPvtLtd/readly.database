DROP PROCEDURE IF EXISTS uspAlterColumnNotNull;
DELIMITER $$

CREATE PROCEDURE uspAlterColumnNotNull(
    IN in_table_name VARCHAR(64),
    IN in_column_name VARCHAR(64)
)
BEGIN
    DECLARE v_count INT;

    -- Check if the table exists
    SELECT COUNT(*)
    INTO v_count
    FROM information_schema.tables
    WHERE table_schema = DATABASE()
      AND table_name = in_table_name;

    IF v_count = 0 THEN
		SELECT 'Table does not exists!';

    ELSE
        -- Check if column exists in that table
        SELECT COUNT(*)
        INTO v_count
        FROM information_schema.columns
        WHERE table_schema = DATABASE()
          AND table_name = in_table_name
          AND column_name = in_column_name;

        IF v_count = 0 THEN
            SELECT 'Coloumn does not exists!';
        ELSE
            -- Dynamically alter column to NOT NULL, preserving its type
            SELECT COLUMN_TYPE
            INTO @col_type
            FROM information_schema.columns
            WHERE table_schema = DATABASE()
              AND table_name = in_table_name
              AND column_name = in_column_name;

            SET @sql = CONCAT(
                'ALTER TABLE ', in_table_name,
                ' MODIFY ', in_column_name, ' ', @col_type, ' NOT NULL'
            );

            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    END IF;
END$$

DELIMITER ;
