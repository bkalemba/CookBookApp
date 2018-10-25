ALTER TABLE CATEGORIES MODIFY name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE PRODUCTS MODIFY name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE RECIPES MODIFY title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE RECIPES MODIFY description VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE UNITS MODIFY name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
INSERT INTO CATEGORIES(name) VALUES ("Makarony"),("Kasze"),("Ziarna"),("Jajka"),("Mięso"),("Warzywa"),("Owoce"),("Grzyby"),("Ryby"),("Owoce morza"),("Inne");