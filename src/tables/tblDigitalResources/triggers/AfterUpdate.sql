-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterUpdate_tblDigitalResources`
AFTER UPDATE ON `tblDigitalResources`
FOR EACH ROW
BEGIN
    -- NOTE: The changed_by column is set to 0 as a placeholder.
    -- You should replace this with a mechanism to get the current user's ID.
    INSERT INTO `tblAuditLogs` (
        `table_name`,
        `record_id`,
        `action`,
        `old_value`,
        `new_value`,
        `changed_by`,
        `changed_at`
    )
    VALUES (
        'tblDigitalResources',
        NEW.id,
        2, -- 2 for UPDATE
        JSON_OBJECT(
            'id', OLD.id,
            'book_id', OLD.book_id,
            'file_url', OLD.file_url,
            'file_type', OLD.file_type,
            'file_size', OLD.file_size,
            'access_restrictions', OLD.access_restrictions
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'book_id', NEW.book_id,
            'file_url', NEW.file_url,
            'file_type', NEW.file_type,
            'file_size', NEW.file_size,
            'access_restrictions', NEW.access_restrictions
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
