CALL usp_AddColumn('tblLoans','copy_id','BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblLoans','user_id','BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblLoans','issue_date','TIMESTAMP', NULL, TRUE);
CALL usp_AddColumn('tblLoans','due_date','TIMESTAMP', NULL, TRUE);
CALL usp_AddColumn('tblLoans','return_date','TIMESTAMP', NULL, TRUE);
CALL usp_AddColumn('tblLoans','status','TINYINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblLoans','fine_amount','DECIMAL', NULL, FALSE);