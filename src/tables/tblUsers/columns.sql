CALL usp_AddColumn('tblUsers', 'member_id', 'VARCHAR(20)', 'ufn_GenerateMemberId()', TRUE);
CALL usp_AddColumn('tblUsers', 'first_name', 'VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblUsers', 'last_name', 'VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblUsers', 'email', 'VARCHAR(255)', NULL, TRUE);
CALL usp_AddColumn('tblUsers', 'phone', 'VARCHAR(50)', NULL, TRUE);
CALL usp_AddColumn('tblUsers', 'password', 'VARCHAR(255)', NULL, TRUE);