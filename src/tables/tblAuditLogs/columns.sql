CALL uspAddColumnIfNotExists('tblAuditLogs','table_name','VARCHAR(255)');
CALL uspAddColumnIfNotExists('tblAuditLogs','record_id','BIGINT');
CALL uspAddColumnIfNotExists('tblAuditLogs','action','TINYINT');
CALL uspAddColumnIfNotExists('tblAuditLogs','changed_data','JSON');
CALL uspAddColumnIfNotExists('tblAuditLogs','changed_by','BIGINT');
CALL uspAddColumnIfNotExists('tblAuditLogs','changed_at','DATETIME');