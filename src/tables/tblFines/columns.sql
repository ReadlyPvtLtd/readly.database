CALL usp_AddColumn('tblFines','user_id','BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblFines','loan_id','BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblFines','amount','DECIMAL(10,2)', NULL, TRUE);
CALL usp_AddColumn('tblFines','reason','TEXT', NULL, TRUE);
CALL usp_AddColumn('tblFines','paid','BOOLEAN', NULL, TRUE);
CALL usp_AddColumn('tblFines','issued_at','DATETIME', NULL, TRUE);
CALL usp_AddColumn('tblFines','paid_at','DATETIME', NULL, TRUE);