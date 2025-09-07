CALL usp_AddColumn('tblCopies','book_id','BIGINT');
CALL usp_AddColumn('tblCopies','barcode','VARCHAR(100)');
CALL usp_AddColumn('tblCopies','branch_id','BIGINT');
CALL usp_AddColumn('tblCopies','location_code','VARCHAR(50)');
CALL usp_AddColumn('tblCopies','status','TINYINT');
CALL usp_AddColumn('tblCopies','condition_note','TEXT');
CALL usp_AddColumn('tblCopies','acquisition_date','DATE');
CALL usp_AddColumn('tblCopies','price','DECIMAL(10,2)');