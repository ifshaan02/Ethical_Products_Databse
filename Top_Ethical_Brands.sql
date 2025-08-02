-- Query: Top Ethical Brands Ranking
-- This query ranks brands by the number of certifications minus unresolved violations.
-- Higher ethical_score means a brand is more ethical.

WITH CertCount AS (
  SELECT p.brand_id, COUNT(*) AS cert_total
  FROM Products p
  JOIN Product_Certifications pc ON p.product_id = pc.product_id
  GROUP BY p.brand_id
),
ViolationCount AS (
  SELECT brand_id, COUNT(*) AS unresolved_violations
  FROM Violations
  WHERE resolved = FALSE
  GROUP BY brand_id
)

SELECT 
  b.brand_id,
  b.name AS brand_name,
  COALESCE(c.cert_total, 0) AS certifications,
  COALESCE(v.unresolved_violations, 0) AS unresolved_violations,
  (COALESCE(c.cert_total, 0) - COALESCE(v.unresolved_violations, 0)) AS ethical_score
FROM Brands b
LEFT JOIN CertCount c ON b.brand_id = c.brand_id
LEFT JOIN ViolationCount v ON b.brand_id = v.brand_id
ORDER BY ethical_score DESC, certifications DESC

