CALL usp_CreateUniqueKey('tblGenres', 'UK_tblGenres_name', 'name');
CALL usp_AddCheck('tblGenres', 'CK_tblGenres_name', 'name IS NOT NULL AND name <> ''''');
CALL usp_AddCheck('tblGenres', 'CK_tblGenres_description', 'description IS NOT NULL AND description <> ''''');