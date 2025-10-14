CALL usp_AddColumn('tblbookAttributes','book_id','BIGINT SIGNED', NULL, TRUE);
CALL usp_AddColumn('tblbookAttributes','attribute_name','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblbookAttributes','attribute_value','VARCHAR(255)', NULL, TRUE);