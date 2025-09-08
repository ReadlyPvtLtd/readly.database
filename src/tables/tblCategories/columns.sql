CALL usp_AddColumn('tblCategories','parent_id','BIGINT SIGNED', NULL, FALSE);
CALL usp_AddColumn('tblCategories','name','VARCHAR(255)', NULL, TRUE);
CALL usp_AddColumn('tblCategories','description','TEXT', NULL, TRUE);