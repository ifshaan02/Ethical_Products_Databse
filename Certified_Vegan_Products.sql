-- Query: Certified Vegan Products
-- Lists products that are marked as vegan and have at least one certification with "Vegan" in its name.
-- Useful for consumers looking specifically for vegan-certified products.

SELECT 
  p.product_id, 
  p.name AS product_name, 
  b.name AS brand_name,
  c.name AS certification_name, 
  pc.date_awarded
FROM Products p
JOIN Brands b ON p.brand_id = b.brand_id
JOIN Product_Certifications pc ON p.product_id = pc.product_id
JOIN Certifications c ON pc.cert_id = c.cert_id
WHERE p.is_vegan = TRUE
  AND c.name LIKE '%Vegan%'
ORDER BY pc.date_awarded DESC;
