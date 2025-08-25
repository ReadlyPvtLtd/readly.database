CALL uspAddPKIfNotExists('tblFines','id');
CALL uspApplyAutoIncrementIfExists('tblFines','id');
CALL uspAlterColumnNotNull('tblFines','user_id');
CALL uspAlterColumnNotNull('tblFines','loan_id');
CALL uspAlterColumnNotNull('tblFines','amount');