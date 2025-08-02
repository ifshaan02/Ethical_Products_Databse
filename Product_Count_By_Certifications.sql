-- Query: Product Count by Certification Type
-- Shows how many products have each certification.
-- Helps identify which certifications are most widely used or adopted.

SELECT 
  c.name AS certification_name, 
  COUNT(DISTINCT pc.product_id) AS product_count
FROM Certifications c
LEFT JOIN Product_Certifications pc ON c.cert_id = pc.cert_id
GROUP BY c.cert_id, c.name
ORDER BY product_count DESC;
