-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterUpdate_tblBranches`
AFTER UPDATE ON `tblBranches`
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
        'tblBranches',
        NEW.id,
        2, -- 2 for UPDATE
        JSON_OBJECT(
            'id', OLD.id,
            'name', OLD.name,
            'address', OLD.address,
            'city', OLD.city,
            'state', OLD.state,
            'country', OLD.country,
            'postal_code', OLD.postal_code,
            'phone', OLD.phone,
            'email', OLD.email
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'name', NEW.name,
            'address', NEW.address,
            'city', NEW.city,
            'state', NEW.state,
            'country', NEW.country,
            'postal_code', NEW.postal_code,
            'phone', NEW.phone,
            'email', NEW.email
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
