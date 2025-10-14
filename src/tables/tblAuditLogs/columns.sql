CALL usp_AddColumn('tblAuditLogs', 'table_name', 'VARCHAR(255)', NULL, TRUE);
CALL usp_AddColumn('tblAuditLogs', 'record_id', 'BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblAuditLogs', 'action', 'TINYINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblAuditLogs', 'old_value', 'JSON', NULL, FALSE);
CALL usp_AddColumn('tblAuditLogs', 'new_value', 'JSON', NULL, FALSE);
CALL usp_AddColumn('tblAuditLogs', 'changed_by', 'BIGINT UNSIGNED', NULL, TRUE);
CALL usp_AddColumn('tblAuditLogs', 'changed_at', 'TIMESTAMP', 'UTC_TIMESTAMP', TRUE);