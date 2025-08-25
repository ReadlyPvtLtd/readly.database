CALL uspAddPKIfNotExists('tblCopies','id');
CALL uspApplyAutoIncrementIfExists('tblCopies','id');
CALL uspAddCheckIfNotExists('tblCopies','status','CHK_tblCopies_Status','BETWEEN 1 AND 5');
CALL uspAlterColumnNotNull('tblCopies','book_id');
CALL uspAlterColumnNotNull('tblCopies','barcode');
CALL uspAlterColumnNotNull('tblCopies','branch_id');