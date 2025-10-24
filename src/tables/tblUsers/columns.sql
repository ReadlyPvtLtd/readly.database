DELIMITER $

CREATE PROCEDURE usp_CreateColumns_tblUsers()
BEGIN
    DECLARE v_required BOOLEAN DEFAULT TRUE;
    DECLARE v_optional BOOLEAN DEFAULT FALSE;

    CALL usp_AddColumn('tblUsers', 'firstname', 'VARCHAR(128)', NULL, v_required);
    CALL usp_AddColumn('tblUsers', 'lastname', 'VARCHAR(128)', NULL, v_required);
    CALL usp_AddColumn('tblUsers', 'email', 'VARCHAR(255)', NULL, v_required);
    CALL usp_AddColumn('tblUsers', 'password', 'VARCHAR(255)', NULL, v_required);
    CALL usp_AddColumn('tblUsers', 'phone', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'address', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'city', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'state', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'country', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'postal_code', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'role', 'VARCHAR(255)', NULL, v_optional);
    CALL usp_AddColumn('tblUsers', 'status', 'VARCHAR(255)', NULL, v_optional);
END$

DELIMITER ;

CALL usp_CreateColumns_tblUsers();
DROP PROCEDURE usp_CreateColumns_tblUsers;