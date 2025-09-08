CALL usp_AddColumn('tblCopies','book_id','BIGINT SIGNED', NULL, TRUE);
CALL usp_AddColumn('tblCopies','barcode','VARCHAR(100)', NULL, TRUE);
CALL usp_AddColumn('tblCopies','branch_id','BIGINT SIGNED', NULL, TRUE);
CALL usp_AddColumn('tblCopies','location_code','VARCHAR(50)', NULL, TRUE);
CALL usp_AddColumn('tblCopies','status','TINYINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblCopies','condition_note','TEXT', NULL, FALSE);
CALL usp_AddColumn('tblCopies','acquisition_date','DATE', NULL, TRUE);
CALL usp_AddColumn('tblCopies','price','DECIMAL(10,2)', NULL, TRUE);