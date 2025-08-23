CALL uspAddColumnIfNotExists('tblCopies','book_id','BIGINT');
CALL uspAddColumnIfNotExists('tblCopies','barcode','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblCopies','branch_id','BIGINT');
CALL uspAddColumnIfNotExists('tblCopies','location_code','VARCHAR(50)');
CALL uspAddColumnIfNotExists('tblCopies','status','TINYINT');
CALL uspAddColumnIfNotExists('tblCopies','condition_note','TEXT');
CALL uspAddColumnIfNotExists('tblCopies','acquisition_date','DATE');
CALL uspAddColumnIfNotExists('tblCopies','price','DECIMAL(10,2)');