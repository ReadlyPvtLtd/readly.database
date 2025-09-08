CALL usp_AddColumn('tblReservations','book_id','BIGINT');
CALL usp_AddColumn('tblReservations','user_id','BIGINT');
CALL usp_AddColumn('tblReservations','reservation_date','DATETIME');
CALL usp_AddColumn('tblReservations','status','TINYINT');