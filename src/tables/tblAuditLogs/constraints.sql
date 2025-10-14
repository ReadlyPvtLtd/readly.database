CALL usp_AddCheck('tblAuditLogs', 'action', '`action` IN (1, 2, 3)');
CALL usp_AddCheck('tblAuditLogs', 'changed_at', '`changed_at` <= UTC_TIMESTAMP()');