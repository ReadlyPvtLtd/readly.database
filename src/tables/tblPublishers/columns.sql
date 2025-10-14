CALL usp_AddColumn('tblPublishers','name','VARCHAR(255)', NULL, TRUE);
CALL usp_AddColumn('tblPublishers','address','TEXT', NULL, TRUE);
CALL usp_AddColumn('tblPublishers','city','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblPublishers','country','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblPublishers','website_url','VARCHAR(512)', NULL, TRUE);