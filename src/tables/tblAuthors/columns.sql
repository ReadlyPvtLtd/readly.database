CALL usp_AddColumn('tblAuthors', 'first_name', 'VARCHAR(128)', NULL, TRUE);
CALL usp_AddColumn('tblAuthors', 'last_name', 'VARCHAR(128)', NULL, TRUE);
CALL usp_AddColumn('tblAuthors', 'bio', 'TEXT', NULL, TRUE);
CALL usp_AddColumn('tblAuthors', 'website_url', 'VARCHAR(512)', NULL, FALSE);
CALL usp_AddColumn('tblAuthors', 'avatar_url', 'VARCHAR(512)', NULL, FALSE);