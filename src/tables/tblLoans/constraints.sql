CALL usp_CreatePrimaryKey('tblLoans','id');
CALL usp_AutoIncrement('tblLoans','id');
CALL usp_AddCheck('tblLoans','status','CHK_tblLoans_Status','BETWEEN 1 AND 3');