CALL uspAddPKIfNotExists('tblGenres','id');
CALL uspApplyAutoIncrementIfExists('tblGenres','id');
CALL uspAlterColumnNotNull('tblGenres','name');