DELIMITER $$

CREATE FUNCTION ColumnExists(in_table_name VARCHAR(64), in_column_name VARCHAR(64))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_exists BOOLEAN DEFAULT FALSE;

    SELECT TRUE
    INTO v_exists
    FROM information_schema.columns
    WHERE table_schema = DATABASE()
      AND table_name = in_table_name
      AND column_name = in_column_name
    LIMIT 1;

    RETURN v_exists;
END$$

DELIMITER ;
