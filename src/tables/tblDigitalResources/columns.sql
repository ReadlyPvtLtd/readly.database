CALL uspAddColumnIfNotExists('tblDigitalResources','book_id','BIGINT');
CALL uspAddColumnIfNotExists('tblDigitalResources','file_url','TEXT');
CALL uspAddColumnIfNotExists('tblDigitalResources','file_type','VARCHAR(50)');
CALL uspAddColumnIfNotExists('tblDigitalResources','File_size','BIGINT');
CALL uspAddColumnIfNotExists('tblDigitalResources','Access_restrictions','TEXT');
