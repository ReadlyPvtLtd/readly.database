CALL usp_AddCheck('tblAuthors', 'CK_tblAuthors_first_name', 'first_name IS NOT NULL AND first_name <> ''''');
CALL usp_AddCheck('tblAuthors', 'CK_tblAuthors_last_name', 'last_name IS NOT NULL AND last_name <> ''''');
CALL usp_AddCheck('tblAuthors', 'CK_tblAuthors_bio', 'bio IS NOT NULL AND bio <> ''''');
CALL usp_CreateUniqueKey('tblAuthors', 'UK_tblAuthors_first_name_last_name', 'first_name, last_name');
CALL usp_AddCheck('tblAuthors', 'CK_tblAuthors_website_url', 'website_url IS NULL OR website_url LIKE ''http%''');
CALL usp_AddCheck('tblAuthors', 'CK_tblAuthors_avatar_url', 'avatar_url IS NULL OR avatar_url LIKE ''http%''');