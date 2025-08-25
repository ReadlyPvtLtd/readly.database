CALL uspAddPKIfNotExists('tblBooksAttributes','id');
CALL uspApplyAutoIncrementIfExists('tblBooksAttributes','id');
CALL uspAlterColumnNotNull('tblBooksAttributes','book_id');
CALL uspAlterColumnNotNull('tblBooksAttributes','attribute_name');
CALL uspAlterColumnNotNull('tblBooksAttributes','attribute_value');