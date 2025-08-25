CALL uspAddPKIfNotExists('tblDigitalResources','id');
CALL uspApplyAutoIncrementIfExists('tblDigitalResources','id');
CALL uspAlterColumnNotNull('tblDigitalResources','book_id');
CALL uspAlterColumnNotNull('tblDigitalResources','file_url');