CALL uspAddColumnIfNotExists('tblAuthors','first_name','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblAuthors','last_name','VARCHAR(100)');
CALL uspAddColumnIfNotExists('tblAuthors','bio','TEXT');
CALL uspAddColumnIfNotExists('tblAuthors','website_url','TEXT');