CALL usp_AddColumn('tblReservations','book_id','BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblReservations','user_id','BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblReservations','reservation_date','DATE', NULL, TRUE);
CALL usp_AddColumn('tblReservations','status','TINYINT UNSIGNED', NULL, TRUE);