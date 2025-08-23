CALL uspAddColumnIfNotExists('tblReservations','book_id','BIGINT');
CALL uspAddColumnIfNotExists('tblReservations','user_id','BIGINT');
CALL uspAddColumnIfNotExists('tblReservations','reservation_date','DATETIME');
CALL uspAddColumnIfNotExists('tblReservations','status','TINYINT');