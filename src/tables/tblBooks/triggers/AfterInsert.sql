-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DELIMITER $$

CREATE TRIGGER `trg_AfterInsert_tblBooks`
AFTER INSERT ON `tblBooks`
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
        'tblBooks',
        NEW.id,
        1, -- 1 for INSERT
        NULL,
        JSON_OBJECT(
            'id', NEW.id,
            'isbn10', NEW.isbn10,
            'isbn13', NEW.isbn13,
            'title', NEW.title,
            'subtitle', NEW.subtitle,
            'description', NEW.description,
            'edition', NEW.edition,
            'language_id', NEW.language_id,
            'page_count', NEW.page_count,
            'publication_year', NEW.publication_year,
            'publisher_id', NEW.publisher_id,
            'cover_image_url', NEW.cover_image_url
        ),
        0, -- Placeholder for user ID
        NOW()
    );
END$$

DELIMITER ;
