CALL usp_CreateUniqueKey('tblGenres', 'name');
CALL usp_AddCheck('tblGenres', 'CK_tblGenres_name', 'name IS NOT NULL AND name <> ''''');
CALL usp_AddCheck('tblGenres', 'CK_tblGenres_description', 'description IS NOT NULL AND description <> ''''');