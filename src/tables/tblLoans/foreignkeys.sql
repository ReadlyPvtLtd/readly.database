CALL uspAddPKIfNotExists('tblLoans','user_id','tblUsers','id','fk_tblLoans.user_id_tblUsers.id');
CALL uspAddPKIfNotExists('tblLoans','Copy_id','tblCopies','id','fk_tblLoans.Copy_id_tblCopies.id');