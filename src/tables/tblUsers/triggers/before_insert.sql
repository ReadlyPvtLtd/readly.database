DROP TRIGGER IF EXISTS `trg_BeforeInsert_tblUsers`;

DELIMITER $$

CREATE TRIGGER `trg_BeforeInsert_tblUsers`
BEFORE INSERT ON `tblUsers`
FOR EACH ROW
BEGIN
  SET NEW.internal_id = UUID_TO_BIN(UUID());
  SET NEW.created_at = UTC_TIMESTAMP();
END$$

DELIMITER ;
