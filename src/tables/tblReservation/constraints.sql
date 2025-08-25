CALL uspAddPKIfNotExists('tblReservations','id');
CALL uspApplyAutoIncrementIfExists('tblReservations','id');
CALL uspAddCheckIfNotExists('tblReservations','status','CHK_tblReservations_Status','BETWEEN 1 AND 3');
CALL uspAlterColumnNotNull('tblReservations','book_id');
CALL uspAlterColumnNotNull('tblReservations','user_id');