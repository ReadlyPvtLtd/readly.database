CALL usp_CreateUniqueKey('tblCategories', 'UK_tblCategories_name', 'name');
CALL usp_AddCheck('tblCategories', 'CK_tblCategories_name', 'name IS NOT NULL AND name <> ''''');
CALL usp_AddCheck('tblCategories', 'CK_tblCategories_description', 'description IS NOT NULL AND description <> ''''');