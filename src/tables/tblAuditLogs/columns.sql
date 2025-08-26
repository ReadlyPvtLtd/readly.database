CALL uspAddColumnIfNotExists('tblAuditLogs','table_name','VARCHAR(255)');
CALL uspAddColumnIfNotExists('tblAuditLogs','record_id','BIGINT');
CALL uspAddColumnIfNotExists('tblAuditLogs','action','TINYINT');
CALL uspAddColumnIfNotExists('tblAuditLogs','old_value','JSON');
CALL uspAddColumnIfNotExists('tblAuditLogs','new_value','JSON');
CALL uspAddColumnIfNotExists('tblAuditLogs','changed_by','BIGINT');
CALL uspAddColumnIfNotExists('tblAuditLogs','changed_at','DATETIME');