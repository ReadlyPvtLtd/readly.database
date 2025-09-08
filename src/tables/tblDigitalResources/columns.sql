CALL usp_AddColumn('tblDigitalResources','book_id','BIGINT SIGNED', NULL, TRUE);
CALL usp_AddColumn('tblDigitalResources','file_url','TEXT', NULL, TRUE);
CALL usp_AddColumn('tblDigitalResources','file_type','VARCHAR(50)', NULL, TRUE);
CALL usp_AddColumn('tblDigitalResources','file_size','BIGINT SIGNED', NULL, TRUE);
CALL usp_AddColumn('tblDigitalResources','access_restrictions','TEXT', NULL, TRUE);
