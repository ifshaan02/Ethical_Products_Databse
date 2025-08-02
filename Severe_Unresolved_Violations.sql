-- Query: Brands with Most Severe Unresolved Violations
-- Lists unresolved serious violations such as Child Labor, Toxic Chemicals, Unsafe Working Conditions.
-- Helps consumers avoid brands with ongoing ethical issues.

SELECT 
  b.brand_id, 
  b.name AS brand_name, 
  v.type AS violation_type, 
  v.date_reported
FROM Violations v
JOIN Brands b ON v.brand_id = b.brand_id
WHERE v.resolved = FALSE
  AND v.type IN ('Child Labor', 'Toxic Chemicals', 'Unsafe Working Conditions')
ORDER BY v.date_reported DESC;
