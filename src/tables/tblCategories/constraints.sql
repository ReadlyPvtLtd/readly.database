CALL uspAddPKIfNotExists('tblCategories','id');
CALL uspApplyAutoIncrementIfExists('tblCategories','id');
CALL uspAlterColumnNotNull('tblCategories','name');