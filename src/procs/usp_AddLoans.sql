DELIMITER $$

CREATE PROCEDURE usp_AddLoan(
    IN p_copy_id BIGINT,
    IN p_user_id BIGINT,
    IN p_due_date TIMESTAMP
)
BEGIN
    DECLARE copy_on_loan INT;

    -- Check if the copy is already on loan (i.e., there is a loan record without a return date)
    SELECT COUNT(*) INTO copy_on_loan FROM tblLoans WHERE copy_id = p_copy_id AND return_date IS NULL;

    IF copy_on_loan > 0 THEN
        -- Copy is already on loan, return an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This copy of the book is already on loan.';
    ELSE
        -- Insert the new loan
        INSERT INTO tblLoans (
            copy_id,
            user_id,
            issue_date,
            due_date,
            return_date,
            `status`,
            fine_amount,
            date_created,
            date_updated
        ) VALUES (
            p_copy_id,
            p_user_id,
            NOW(),
            p_due_date,
            NULL, -- return_date is null when the book is first loaned
            1, -- status 1 for 'active'
            NULL, -- no fine initially
            NOW(),
            NOW()
        );

        -- Return the newly created loan's ID
        SELECT LAST_INSERT_ID() AS loan_id;
    END IF;
END$$

DELIMITER ;
