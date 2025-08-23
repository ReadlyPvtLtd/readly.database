CALL uspAddColumnIfNotExists('tblCategories','parent_id','BIGINT');
CALL uspAddColumnIfNotExists('tblCategories','name','VARCHAR(255)');
CALL uspAddColumnIfNotExists('tblCategories','description','TEXT');