CALL usp_AddColumn('tblLoans','copy_id','BIGINT');
CALL usp_AddColumn('tblLoans','user_id','BIGINT');
CALL usp_AddColumn('tblLoans','issue_date','DATE');
CALL usp_AddColumn('tblLoans','due_date','DATE');
CALL usp_AddColumn('tblLoans','return_date','DATE');
CALL usp_AddColumn('tblLoans','status','TINYINT');
CALL usp_AddColumn('tblLoans','fine_amount','DECIMAL');