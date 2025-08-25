CALL uspAddPKIfNotExists('tblBranches','id');
CALL uspApplyAutoIncrementIfExists('tblBranches','id');
CALL uspAlterColumnNotNull('tblBranches','name');