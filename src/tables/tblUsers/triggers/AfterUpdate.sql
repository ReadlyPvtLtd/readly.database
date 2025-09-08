-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterUpdate_tblUsers`
AFTER UPDATE ON `tblUsers`
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
        'tblUsers',
        NEW.id,
        2, -- 2 for UPDATE
        JSON_OBJECT(
            'id', OLD.id,
            'first_name', OLD.first_name,
            'last_name', OLD.last_name,
            'email', OLD.email,
            'phone', OLD.phone,
            'password', '[REDACTED]',
            'address', OLD.address,
            'city', OLD.city,
            'state', OLD.state,
            'country', OLD.country,
            'postal_code', OLD.postal_code,
            'role', OLD.role,
            'status', OLD.status
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'first_name', NEW.first_name,
            'last_name', NEW.last_name,
            'email', NEW.email,
            'phone', NEW.phone,
            'password', '[REDACTED]',
            'address', NEW.address,
            'city', NEW.city,
            'state', NEW.state,
            'country', NEW.country,
            'postal_code', NEW.postal_code,
            'role', NEW.role,
            'status', NEW.status
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
