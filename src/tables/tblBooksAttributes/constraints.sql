CALL usp_AddCheck('tblBooksAttributes', 'CK_tblBooksAttributes_attribute_name', 'attribute_name IS NOT NULL AND attribute_name <> ''''');
CALL usp_AddCheck('tblBooksAttributes', 'CK_tblBooksAttributes_attribute_value', 'attribute_value IS NOT NULL AND attribute_value <> ''''');
CALL usp_CreateUniqueKey('tblBooksAttributes', 'book_id, attribute_name');