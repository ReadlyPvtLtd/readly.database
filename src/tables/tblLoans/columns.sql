CALL uspAddColumnIfNotExists('tblLoans','copy_id','BIGINT');
CALL uspAddColumnIfNotExists('tblLoans','user_id','BIGINT');
CALL uspAddColumnIfNotExists('tblLoans','issue_date','DATE');
CALL uspAddColumnIfNotExists('tblLoans','due_date','DATE');
CALL uspAddColumnIfNotExists('tblLoans','return_date','DATE');
CALL uspAddColumnIfNotExists('tblLoans','status','TINYINT');
CALL uspAddColumnIfNotExists('tblLoans','fine_amount','DECIMAL');