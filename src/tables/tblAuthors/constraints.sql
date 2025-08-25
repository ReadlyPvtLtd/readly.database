CALL uspAddPKIfNotExists('tblAuthors','id');
CALL uspApplyAutoIncrementIfExists('tblAuthors','id');
CALL uspAlterColumnNotNull('tblAuthors','first_name');
CALL uspAlterColumnNotNull('tblAuthors','last_name');