CALL usp_CreatePrimaryKey('tblCopies','id');
CALL usp_AutoIncrement('tblCopies','id');
CALL usp_AddCheck('tblCopies','status','CHK_tblCopies_Status','BETWEEN 1 AND 5');