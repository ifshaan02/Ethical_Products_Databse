CREATE TABLE Brands(
	brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    headquarters VARCHAR(100),
	labor_score DECIMAL(5,2),     -- Ethical labor score (0-100)
    emission_score DECIMAL(5,2),
    transparent_score DECIMAL(5,2)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    material VARCHAR(100),
    is_vegan BOOLEAN,
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

CREATE TABLE Certifications (
    cert_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    criteria_summary TEXT,
    issuer VARCHAR(100)
);

CREATE TABLE Product_Certifications (
    product_id INT,
    cert_id INT,
    date_awarded DATE,
    PRIMARY KEY (product_id, cert_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (cert_id) REFERENCES Certifications(cert_id)
);

CREATE TABLE Violations (
    violation_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT,
    type VARCHAR(100),
    date_reported DATE,
    resolved BOOLEAN,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);