CALL uspAddPKIfNotExists('tblUsers','id');
CALL uspApplyAutoIncrementIfExists('tblUsers','id');
CALL uspAddCheckIfNotExists('tblUsers','status','CHK_tblUsers_Status','BETWEEN 1 AND 3');
CALL uspAlterColumnNotNull('tblUsers','member_id');
CALL uspAlterColumnNotNull('tblUsers','first_name');
CALL uspAlterColumnNotNull('tblUsers','last_name');
CALL uspAlterColumnNotNull('tblUsers','email');
CALL uspAlterColumnNotNull('tblUsers','password_hash');