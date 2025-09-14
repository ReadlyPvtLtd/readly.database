CALL usp_AddCheck('tblLoans', 'CK_tblLoans_issue_date', 'issue_date <= NOW()');
CALL usp_AddCheck('tblLoans', 'CK_tblLoans_due_date', 'due_date > issue_date');
CALL usp_AddCheck('tblLoans', 'CK_tblLoans_return_date', 'return_date IS NULL OR return_date >= issue_date');
CALL usp_AddCheck('tblLoans', 'CK_tblLoans_status', 'status IN (0, 1, 2)');
CALL usp_AddCheck('tblLoans', 'CK_tblLoans_fine_amount', 'fine_amount IS NULL OR fine_amount >= 0');