CALL usp_CreateUniqueKey('tblReservations', 'UK_tblReservations_book_id_user_id', 'book_id, user_id');
CALL usp_AddCheck('tblReservations', 'CK_tblReservations_reservation_date', 'reservation_date <= CURDATE()');
CALL usp_AddCheck('tblReservations', 'CK_tblReservations_status', 'status IN (0, 1, 2)');