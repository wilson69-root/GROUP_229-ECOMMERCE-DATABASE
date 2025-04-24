-- 1. brand
CREATE TABLE IF NOT EXISTS brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- 2. product_category
CREATE TABLE IF NOT EXISTS product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- 3. attribute_type
CREATE TABLE IF NOT EXISTS attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- 4. attribute_category
CREATE TABLE IF NOT EXISTS attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- 5. color
CREATE TABLE IF NOT EXISTS color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    hex_code VARCHAR(7)
);

-- 6. size_category
CREATE TABLE IF NOT EXISTS size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- 7. size_option
CREATE TABLE IF NOT EXISTS size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    label VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- 8. product
CREATE TABLE IF NOT EXISTS product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- 9. product_image
CREATE TABLE IF NOT EXISTS product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_path VARCHAR(255) NOT NULL,
    image_name VARCHAR(100) NOT NULL,
    image_type VARCHAR(10) NOT NULL,
    alt_text VARCHAR(255),
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Now insert the data with the new structure
INSERT INTO product_image (product_id, image_path, image_name, image_type, alt_text, is_primary) VALUES
(1, 'd:/Ecommerce database/images/ultrabook/', 'ultrabook_pro_15', 'jpg', 'Image of UltraBook Pro 15', TRUE),
(2, 'd:/Ecommerce database/images/smartphone two/', 'nova_smartphone_x', 'jpg', 'Front view of Nova Smartphone X', TRUE),
(3, 'd:/Ecommerce database/images/tshirt/', 'cotton_tee_black', 'jpg', 'Black Classic Cotton Tee', TRUE),
(4, 'd:/Ecommerce database/images/jenas/', 'slim_fit_jeans', 'jpg', 'Stone Wash Slim Fit Denim Jeans', TRUE),
(5, 'd:/Ecommerce database/images/book/', 'enigma_code', 'jpg', 'Cover of The Enigma Code', TRUE),
(6, 'd:/Ecommerce database/images/intro to AI book/', 'intro_to_ai', 'jpg', 'Cover of Introduction to AI', TRUE),
(7, 'd:/Ecommerce database/images/mouse/', 'wireless_mouse', 'jpg', 'Image of Wireless Mouse', TRUE),
(8, 'd:/Ecommerce database/images/leather waller/', 'leather_wallet', 'jpg', 'Image of Leather Wallet', TRUE);

-- 10. product_variation
CREATE TABLE IF NOT EXISTS product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    stock_quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- 11. product_item
CREATE TABLE IF NOT EXISTS product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    sku VARCHAR(100) NOT NULL,
    barcode VARCHAR(100),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- 12. product_attribute
CREATE TABLE IF NOT EXISTS product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(255) NOT NULL,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);


-- insert data into the data base

-- More Realistic Sample data for 'brand' table
INSERT INTO brand (name, description) VALUES
('TechGenius', 'Leading innovator in consumer electronics.'),
('Fashionista Apparel', 'Trendy clothing for all styles.'),
('Bookworm Haven', 'A vast collection of books for every reader.'),
('GadgetPro', 'Specializing in professional electronic gadgets.'),
('StyleCraft', 'High-quality, handcrafted apparel.'),
('PageTurner Books', 'Curated selection of popular and classic books.');

-- More Realistic Sample data for 'product_category' table
INSERT INTO product_category (name, description) VALUES
('Laptops', 'Portable computers for work and leisure.'),
('Smartphones', 'Mobile communication and computing devices.'),
('T-Shirts', 'Casual and comfortable tops.'),
('Jeans', 'Durable denim trousers.'),
('Fiction', 'Engaging stories across various genres.'),
('Non-Fiction', 'Informative books on a wide range of topics.'),
('Accessories', 'Complementary items for electronics and apparel.');

-- Sample data for 'attribute_type' table (These are fairly standard)
INSERT INTO attribute_type (name) VALUES
('Text'),
('Number'),
('Boolean'),
('Date');

-- Sample data for 'attribute_category' table (These are fairly standard)
INSERT INTO attribute_category (name) VALUES
('Technical Specifications'),
('Material'),
('General Features'),
('Dimensions'),
('Publication Details');

-- More Realistic Sample data for 'color' table
INSERT INTO color (name, hex_code) VALUES
('Black', '#000000'),
('White', '#FFFFFF'),
('Navy Blue', '#000080'),
('Charcoal Gray', '#36454F'),
('Stone Wash', '#8D8B8B'),
('Crimson Red', '#DC143C'),
('Forest Green', '#228B22');

-- More Realistic Sample data for 'size_category' table
INSERT INTO size_category (name) VALUES
('Apparel (Alpha)'),
('Apparel (Numeric)'),
('Shoe Size (US Men)'),
('Shoe Size (US Women)'),
('Book Dimensions');

-- More Realistic Sample data for 'size_option' table (depends on size_category)
INSERT INTO size_option (size_category_id, label) VALUES
(1, 'XS'), (1, 'S'), (1, 'M'), (1, 'L'), (1, 'XL'), (1, 'XXL'), -- Apparel (Alpha)
(2, '28'), (2, '30'), (2, '32'), (2, '34'), (2, '36'), -- Apparel (Numeric)
(3, '8'), (3, '8.5'), (3, '9'), (3, '9.5'), (3, '10'), -- Shoe Size (US Men)
(4, '6'), (4, '6.5'), (4, '7'), (4, '7.5'), (4, '8'), -- Shoe Size (US Women)
(5, '6x9 inches'); -- Book Dimensions

-- More Realistic Sample data for 'product' table (depends on brand and product_category)
INSERT INTO product (name, brand_id, category_id, base_price, description) VALUES
('UltraBook Pro 15', 1, 1, 1499.99, 'Slim and powerful laptop for professionals.'),
('Nova Smartphone X', 1, 2, 799.50, 'Feature-rich smartphone with amazing camera.'),
('Classic Cotton Tee', 2, 3, 19.99, 'Comfortable and durable everyday t-shirt.'),
('Slim Fit Denim Jeans', 2, 4, 49.00, 'Stylish slim fit jeans made from quality denim.'),
('The Enigma Code', 3, 5, 14.50, 'A thrilling mystery novel.'),
('Introduction to AI', 3, 6, 29.95, 'A comprehensive guide to Artificial Intelligence.'),
('Wireless Mouse', 4, 7, 25.00, 'Ergonomic wireless mouse with long battery life.'),
('Leather Wallet', 5, 7, 35.50, 'Genuine leather wallet with multiple card slots.');

-- More Realistic Sample data for 'product_image' table (depends on product)
INSERT INTO product_image (product_id, image_path, image_name, image_type, alt_text, is_primary) VALUES
(1, 'd:/posts/images/ultrabook/', 'ultrabook_pro_15', 'jpg', 'Image of UltraBook Pro 15', TRUE),
(2, 'd:/posts/images/smartphone two/', 'nova_smartphone_x', 'jpg', 'Front view of Nova Smartphone X', TRUE),
(3, 'd:/posts/images/tshirt/', 'cotton_tee_black', 'jpg', 'Black Classic Cotton Tee', TRUE),
(4, 'd:/posts/images/jenas/', 'slim_fit_jeans', 'jpg', 'Stone Wash Slim Fit Denim Jeans', TRUE),
(5, 'd:/posts/images/book/', 'enigma_code', 'jpg', 'Cover of The Enigma Code', TRUE),
(6, 'd:/posts/images/intro to AI book/', 'intro_to_ai', 'jpg', 'Cover of Introduction to AI', TRUE),
(7, 'd:/posts/images/mouse/', 'wireless_mouse', 'jpg', 'Image of Wireless Mouse', TRUE),
(8, 'd:/posts/images/leather waller/', 'leather_wallet', 'jpg', 'Image of Leather Wallet', TRUE);

-- More Realistic Sample data for 'product_variation' table (depends on product, color, and size_option)
INSERT INTO product_variation (product_id, color_id, size_option_id, stock_quantity, price) VALUES
(3, 1, 2, 100, 19.99), -- Classic Cotton Tee, Black, S
(3, 1, 3, 120, 19.99), -- Classic Cotton Tee, Black, M
(3, 2, 2, 80, 19.99), -- Classic Cotton Tee, White, S
(3, 2, 3, 90, 19.99), -- Classic Cotton Tee, White, M
(4, 5, 8, 50, 49.00), -- Slim Fit Denim Jeans, Stone Wash, 32
(4, 5, 9, 60, 49.00), -- Slim Fit Denim Jeans, Stone Wash, 34
(4, 1, 8, 40, 49.00), -- Slim Fit Denim Jeans, Black, 32
(4, 1, 9, 45, 49.00), -- Slim Fit Denim Jeans, Black, 34
(2, 1, NULL, 200, 799.50), -- Nova Smartphone X, Black (Size not applicable)
(2, 2, NULL, 150, 799.50); -- Nova Smartphone X, White (Size not applicable)

-- More Realistic Sample data for 'product_item' table (depends on product_variation)
INSERT INTO product_item (variation_id, sku, barcode) VALUES
(1, 'CCT-BLK-S-1001', '1000000001001'),
(2, 'CCT-BLK-M-1002', '1000000001002'),
(3, 'CCT-WHT-S-1003', '1000000001003'),
(4, 'CCT-WHT-M-1004', '1000000001004'),
(5, 'SFDJ-STW-32-2001', '1000000002001'),
(6, 'SFDJ-STW-34-2002', '1000000002002'),
(7, 'SFDJ-BLK-32-2003', '1000000002003'),
(8, 'SFDJ-BLK-34-2004', '1000000002004'),
(9, 'NSX-BLK-3001', '1000000003001'),
(10, 'NSX-WHT-3002', '1000000003002');

-- More Realistic Sample data for 'product_attribute' table (depends on product, attribute_category, and attribute_type)
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value) VALUES
(1, 1, 1, 'Processor', 'Intel Core i7-1260P'), -- UltraBook Pro 15, Technical, Text
(1, 1, 2, 'RAM (GB)', '16'), -- UltraBook Pro 15, Technical, Number
(1, 1, 2, 'Storage (TB)', '1'), -- UltraBook Pro 15, Technical, Number
(2, 1, 1, 'Display Type', 'AMOLED'), -- Nova Smartphone X, Technical, Text
(2, 1, 2, 'Screen Size (inches)', '6.5'), -- Nova Smartphone X, Technical, Number
(2, 1, 1, 'Rear Camera', '50MP'), -- Nova Smartphone X, Technical, Text
(3, 2, 1, 'Material', '100% Ring-spun Cotton'), -- Classic Cotton Tee, Material, Text
(4, 2, 1, 'Material', '98% Cotton, 2% Elastane'), -- Slim Fit Denim Jeans, Material, Text
(5, 5, 1, 'Author', 'Mystery Writer'), -- The Enigma Code, Publication, Text
(5, 5, 4, 'Publication Date', '2022-10-26'), -- The Enigma Code, Publication, Date
(6, 5, 1, 'Author', 'AI Expert'), -- Introduction to AI, Publication, Text
(6, 5, 4, 'Publication Date', '2023-01-15'), -- Introduction to AI, Publication, Date
(7, 3, 1, 'Connectivity', '2.4 GHz Wireless'), -- Wireless Mouse, General, Text
(8, 2, 1, 'Material', 'Genuine Cowhide Leather'), -- Leather Wallet, Material, Text
(8, 3, 2, 'Card Slots', '8'); -- Leather Wallet, General, Number


-- Add indexes for foreign keys and frequently queried columns
-- Keep only essential indexes
CREATE INDEX idx_product_brand_id ON product (brand_id);
CREATE INDEX idx_product_category_id ON product (category_id);
CREATE INDEX idx_product_variation_product_id ON product_variation (product_id);
CREATE INDEX idx_product_name ON product (name);
CREATE INDEX idx_product_category_name ON product_category (name);
CREATE INDEX idx_brand_name ON brand (name);
CREATE INDEX idx_color_name ON color (name);