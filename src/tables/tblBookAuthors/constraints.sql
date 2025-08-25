CALL uspAddPKIfNotExists('tblBookAuthors','id');
CALL uspApplyAutoIncrementIfExists('tblBookAuthors','id');
CALL uspAlterColumnNotNull('tblBookAuthors','book_id');
CALL uspAlterColumnNotNull('tblBookAuthors','author_id');