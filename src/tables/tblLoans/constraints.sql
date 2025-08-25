CALL uspAddPKIfNotExists('tblLoans','id');
CALL uspApplyAutoIncrementIfExists('tblLoans','id');
CALL uspAddCheckIfNotExists('tblLoans','status','CHK_tblLoans_Status','BETWEEN 1 AND 3');
CALL uspAlterColumnNotNull('tblLoans','copy_id');
CALL uspAlterColumnNotNull('tblLoans','user_id');
CALL uspAlterColumnNotNull('tblLoans','issue_id');
CALL uspAlterColumnNotNull('tblLoans','due_date');