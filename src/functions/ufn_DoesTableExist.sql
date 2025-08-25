DELIMITER $$

CREATE FUNCTION TableExists(in_table_name VARCHAR(64))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_exists BOOLEAN DEFAULT FALSE;

    SELECT TRUE
    INTO v_exists
    FROM information_schema.tables
    WHERE table_schema = DATABASE()   -- current database
      AND table_name = in_table_name
    LIMIT 1;

    RETURN v_exists;
END$$

DELIMITER ;