-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterUpdate_tblBooksAttributes`
AFTER UPDATE ON `tblBooksAttributes`
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
        'tblBooksAttributes',
        NEW.id,
        2, -- 2 for UPDATE
        JSON_OBJECT(
            'id', OLD.id,
            'book_id', OLD.book_id,
            'attribute_name', OLD.attribute_name,
            'attribute_value', OLD.attribute_value
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'book_id', NEW.book_id,
            'attribute_name', NEW.attribute_name,
            'attribute_value', NEW.attribute_value
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
