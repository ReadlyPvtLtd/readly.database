CALL usp_CreateUniqueKey('tblBooks', 'isbn10');
CALL usp_CreateUniqueKey('tblBooks', 'isbn13');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_isbn10', 'isbn10 IS NOT NULL AND CHAR_LENGTH(isbn10) = 10');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_isbn13', 'isbn13 IS NOT NULL AND CHAR_LENGTH(isbn13) = 13');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_title', 'title IS NOT NULL AND title <> ''''');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_description', 'description IS NOT NULL AND description <> ''''');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_page_count', 'page_count > 0');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_publication_year', 'publication_year <= YEAR(CURDATE())');
CALL usp_AddCheck('tblBooks', 'CK_tblBooks_cover_image_url', 'cover_image_url IS NULL OR cover_image_url LIKE ''http%''');