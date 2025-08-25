CALL uspAddPKIfNotExists('tblAuditLogs','id');
CALL uspApplyAutoIncrementIfExists('tblAuditLogs','id');
CALL uspAlterColumnNotNull('tblAuditLogs', 'table_name');
CALL uspAlterColumnNotNull('tblAuditLogs', 'record_id');
CALL uspAlterColumnNotNull('tblAuditLogs', 'action');