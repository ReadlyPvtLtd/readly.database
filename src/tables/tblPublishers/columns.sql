CALL uspAddColumnIfNotExists('tblPublishers','nmae','VARCAHR(255)');
CALL uspAddColumnIfNotExists('tblPublishers','address','Text');
CALL uspAddColumnIfNotExists('tblPublishers','city','VARCAHR(100)');
CALL uspAddColumnIfNotExists('tblPublishers','country','VARCAHR(100)');
CALL uspAddColumnIfNotExists('tblPublishers','website_url','text');