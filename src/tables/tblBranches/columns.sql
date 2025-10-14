CALL usp_AddColumn('tblBranches','name','VARCHAR(255)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','address','TEXT(255)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','city','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','state','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','country','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','postal_code','VARCHAR(20)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','phone','VARCHAR(50)', NULL, TRUE);
CALL usp_AddColumn('tblBranches','email','VARCHAR(255)', NULL, TRUE);