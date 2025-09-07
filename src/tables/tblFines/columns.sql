CALL usp_AddColumn('tblFines','user_id','BIGINT');
CALL usp_AddColumn('tblFines','loan_id','BIGINT');
CALL usp_AddColumn('tblFines','amount','DECIMAL(10,2)');
CALL usp_AddColumn('tblFines','reason','TEXT');
CALL usp_AddColumn('tblFines','paid','BOOLEAN');
CALL usp_AddColumn('tblFines','issued_at','DATETIME');
CALL usp_AddColumn('tblFines','paid_at','DATETIME');