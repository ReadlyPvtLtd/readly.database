CALL uspAddColumnIfNotExists('tblbranches','name','VARCHAR(255)');
CALL uspAddColumnIfNotExists('tblbranches','address','TEXT(255)');
CALL uspAddColumnIfNotExists('tblbranches','city','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblbranches','state','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblbranches','country','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblbranches','postal_code','VARCHAR(20)');
CALL uspAddColumnIfNotExists('tblbranches','phone','VARCHAR(50)');
CALL uspAddColumnIfNotExists('tblbranches','email','VARCHAR(255)');