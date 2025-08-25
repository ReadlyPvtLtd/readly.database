CALL uspAddPKIfNotExists('tblBooks','id');
CALL uspApplyAutoIncrementIfExists('tblBooks','id');
CALL uspAlterColumnNotNull('tblBook','title');