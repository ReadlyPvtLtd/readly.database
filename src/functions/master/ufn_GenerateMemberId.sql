DELIMITER $$

DROP FUNCTION IF EXISTS ufn_GenerateMemberId$$

-- =============================================
-- ufn_GenerateMemberId
-- Generates a unique member ID based on the current UTC timestamp with microsecond precision.
-- This function is designed to produce highly unique IDs suitable for high-volume insertions.
--
-- Returns:
--   A VARCHAR(50) string representing the unique member ID.
--
-- Notes:
--   - The ID format is YYYYMMDDHHMMSSuuuuuu (YearMonthDayHourMinuteSecondMicrosecond).
--   - Uses UTC_TIMESTAMP(6) for maximum precision.
--   - Marked as NOT DETERMINISTIC as its output depends on the current time.
-- =============================================

CREATE FUNCTION ufn_GenerateMemberId()
RETURNS VARCHAR(50)
NOT DETERMINISTIC
BEGIN
    RETURN DATE_FORMAT(UTC_TIMESTAMP(6), '%Y%m%d%H%i%s%f');
END$$

DELIMITER ;