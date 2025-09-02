CALL uspAddPKIfNotExists('tblBookGenres','id');
CALL uspApplyAutoIncrementIfExists('tblBookGenres','id');
CALL uspAlterColumnNotNull('tblBookGenres','book_id');
CALL uspAlterColumnNotNull('tblBookGenres','genre_id');