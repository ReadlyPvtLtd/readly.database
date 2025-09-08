-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterInsert_tblUsers`
AFTER INSERT ON `tblUsers`
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
        1, -- 1 for INSERT
        NULL,
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
