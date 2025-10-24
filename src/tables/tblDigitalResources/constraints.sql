CALL usp_CreateUniqueKey('tblDigitalResources', 'file_url');
CALL usp_AddCheck('tblDigitalResources', 'CK_tblDigitalResources_file_url', 'file_url IS NOT NULL AND file_url LIKE ''http%''');
CALL usp_AddCheck('tblDigitalResources', 'CK_tblDigitalResources_file_type', 'file_type IS NOT NULL AND file_type <> ''''');
CALL usp_AddCheck('tblDigitalResources', 'CK_tblDigitalResources_file_size', 'file_size > 0');
CALL usp_AddCheck('tblDigitalResources', 'CK_tblDigitalResources_access_restrictions', 'access_restrictions IS NOT NULL AND access_restrictions <> ''''');