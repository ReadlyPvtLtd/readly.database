CALL uspAddPKIfNotExists('tblPublishers','id');
CALL uspApplyAutoIncrementIfExists('tblPublishers','id');
CALL uspAlterColumnNotNull('tblPublishers','name');