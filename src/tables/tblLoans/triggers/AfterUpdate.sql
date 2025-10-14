-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterUpdate_tblLoans`
AFTER UPDATE ON `tblLoans`
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
        'tblLoans',
        NEW.id,
        2, -- 2 for UPDATE
        JSON_OBJECT(
            'id', OLD.id,
            'copy_id', OLD.copy_id,
            'user_id', OLD.user_id,
            'issue_date', OLD.issue_date,
            'due_date', OLD.due_date,
            'return_date', OLD.return_date,
            'status', OLD.status,
            'fine_amount', OLD.fine_amount
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'copy_id', NEW.copy_id,
            'user_id', NEW.user_id,
            'issue_date', NEW.issue_date,
            'due_date', NEW.due_date,
            'return_date', NEW.return_date,
            'status', NEW.status,
            'fine_amount', NEW.fine_amount
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
