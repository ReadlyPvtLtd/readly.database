CALL uspAddPKIfNotExists('tblFines','user_id','tblUsers','id','fk_tblFines.user_id_tblUsers.id');
CALL uspAddPKIfNotExists('tblFines','loan_id','tblLoans','id','fk_tblFines.loan_id_tblLoans.id');