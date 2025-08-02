-- Query: Products with Certifications Older Than 10 Years
-- Finds products whose certifications were awarded more than 10 years ago.
-- Helps consumers check for outdated certifications.

SELECT 
  p.product_id, 
  p.name AS product_name, 
  b.name AS brand_name,
  c.name AS certification_name, 
  pc.date_awarded,
  YEAR(CURDATE()) - YEAR(pc.date_awarded) AS years_since_certified
FROM Products p
JOIN Brands b ON p.brand_id = b.brand_id
JOIN Product_Certifications pc ON p.product_id = pc.product_id
JOIN Certifications c ON pc.cert_id = c.cert_id
WHERE YEAR(CURDATE()) - YEAR(pc.date_awarded) > 10
ORDER BY years_since_certified DESC;
