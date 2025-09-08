CALL usp_CreatePrimaryKey('tblReservations','id');
CALL usp_AutoIncrement('tblReservations','id');
CALL usp_AddCheck('tblReservations','status','CHK_tblReservations_Status','BETWEEN 1 AND 3');