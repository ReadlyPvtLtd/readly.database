CALL usp_CreateUniqueKey('tblPublishers', 'name');
CALL usp_AddCheck('tblPublishers', 'CK_tblPublishers_name', 'name IS NOT NULL AND name <> ''''');
CALL usp_AddCheck('tblPublishers', 'CK_tblPublishers_address', 'address IS NOT NULL AND address <> ''''');
CALL usp_AddCheck('tblPublishers', 'CK_tblPublishers_city', 'city IS NOT NULL AND city <> ''''');
CALL usp_AddCheck('tblPublishers', 'CK_tblPublishers_country', 'country IS NOT NULL AND country <> ''''');
CALL usp_AddCheck('tblPublishers', 'CK_tblPublishers_website_url', 'website_url IS NOT NULL AND website_url LIKE ''http%''');