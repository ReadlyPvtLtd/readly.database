DELIMITER $$

CREATE PROCEDURE usp_CreateFine(
    IN p_user_id BIGINT,
    IN p_loan_id BIGINT,
    IN p_amount DECIMAL(10, 2),
    IN p_reason TEXT
)
BEGIN
    -- Insert the new fine
    INSERT INTO tblFines (
        user_id,
        loan_id,
        amount,
        reason,
        paid,
        issued_at,
        paid_at,
        date_created,
        date_updated
    ) VALUES (
        p_user_id,
        p_loan_id,
        p_amount,
        p_reason,
        0, -- paid is false by default
        NOW(), -- issued_at is the current time
        NULL, -- paid_at is null by default
        NOW(),
        NOW()
    );

    -- Return the newly created fine's ID
    SELECT LAST_INSERT_ID() AS fine_id;
END$$

DELIMITER ;
