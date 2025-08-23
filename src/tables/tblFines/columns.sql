CALL uspAddColumnIfNotExists('tblFines','user_id','BIGINT');
CALL uspAddColumnIfNotExists('tblFines','loan_id','BIGINT');
CALL uspAddColumnIfNotExists('tblFines','amount','DECIMAL(10,2)');
CALL uspAddColumnIfNotExists('tblFines','reason','TEXT');
CALL uspAddColumnIfNotExists('tblFines','paid','BOOLEAN');
CALL uspAddColumnIfNotExists('tblFines','issued_at','DATETIME');
CALL uspAddColumnIfNotExists('tblFines','paid_at','DATETIME');