CALL usp_CreateUniqueKey('tblCopies', 'UK_tblCopies_barcode', 'barcode');
CALL usp_AddCheck('tblCopies', 'CK_tblCopies_barcode', 'barcode IS NOT NULL AND barcode <> ''''');
CALL usp_AddCheck('tblCopies', 'CK_tblCopies_location_code', 'location_code IS NOT NULL AND location_code <> ''''');
CALL usp_AddCheck('tblCopies', 'CK_tblCopies_status', 'status IN (0, 1, 2, 3, 4)');
CALL usp_AddCheck('tblCopies', 'CK_tblCopies_acquisition_date', 'acquisition_date <= CURDATE()');
CALL usp_AddCheck('tblCopies', 'CK_tblCopies_price', 'price >= 0');