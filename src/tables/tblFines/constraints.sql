CALL usp_CreateUniqueKey('tblFines', 'loan_id');
CALL usp_AddCheck('tblFines', 'CK_tblFines_amount', 'amount > 0');
CALL usp_AddCheck('tblFines', 'CK_tblFines_reason', 'reason IS NOT NULL AND reason <> ''''');
CALL usp_AddCheck('tblFines', 'CK_tblFines_issued_at', 'issued_at <= NOW()');
CALL usp_AddCheck('tblFines', 'CK_tblFines_paid_at', 'paid_at IS NULL OR paid_at <= NOW()');
CALL usp_AddCheck('tblFines', 'CK_tblFines_paid_at_issued_at', 'paid_at IS NULL OR paid_at >= issued_at');
CALL usp_AddCheck('tblFines', 'CK_tblFines_paid_at_paid', '(paid = 0 AND paid_at IS NULL) OR (paid = 1 AND paid_at IS NOT NULL)');