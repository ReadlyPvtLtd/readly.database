-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterUpdate_tblFines`
AFTER UPDATE ON `tblFines`
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
        'tblFines',
        NEW.id,
        2, -- 2 for UPDATE
        JSON_OBJECT(
            'id', OLD.id,
            'user_id', OLD.user_id,
            'loan_id', OLD.loan_id,
            'amount', OLD.amount,
            'reason', OLD.reason,
            'paid', OLD.paid,
            'issued_at', OLD.issued_at,
            'paid_at', OLD.paid_at
        ),
        JSON_OBJECT(
            'id', NEW.id,
            'user_id', NEW.user_id,
            'loan_id', NEW.loan_id,
            'amount', NEW.amount,
            'reason', NEW.reason,
            'paid', NEW.paid,
            'issued_at', NEW.issued_at,
            'paid_at', NEW.paid_at
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
