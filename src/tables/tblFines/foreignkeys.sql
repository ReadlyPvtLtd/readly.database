CALL usp_CreateForeignKey('tblFines','user_id','tblUsers','id','fk_tblFines.user_id_tblUsers.id');
CALL usp_CreateForeignKey('tblFines','loan_id','tblLoans','id','fk_tblFines.loan_id_tblLoans.id');