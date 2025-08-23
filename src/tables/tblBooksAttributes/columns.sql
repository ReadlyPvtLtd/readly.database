CALL uspAddColumnIfNotExists('tblbookAttributes','book_id','BIGINT');
CALL uspAddColumnIfNotExists('tblbookAttributes','attribute_name','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblbookAttributes','attribute_value','VARCHAR(255)');