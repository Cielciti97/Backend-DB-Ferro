
-- DATABASE SELECTION --
    USE MYDB;
    
-- INSERT INTO PRIVILEGES TABLE --
	INSERT INTO 
    PRIVILEGES(PRIVILEGE) 
	VALUES ("USER"), ("ADMIN");
     -- SELECT * FROM PRIVILEGEs;


-- INSERT INTO USERS TABLE --
	INSERT INTO 
    USERS(NAME, LAST_NAME, ADDRESS, PHONE, EMAIL, privileges_ID) 
    VALUES
    ("Sebastian", "Montes", "Florida 23", "551242154976", "sebas94@gmail.com", 1),
    ("Andres", "Perez", "Madero 12", "5642154873", "andrew21@hotmail.com", 1),
    ("Arely", "Rizo", "Polanco 144", "5621421586", "arely123@edu.org", 2),
    ("Luz", "Prado", "Orizaba 23", "5544125478", "lucero69@mail.com",1),
	("Gabriela", "Ferro", "Cardenales 85", "5512658741", "gabyfx@mail.com",2);
	-- SELECT * FROM USERS;
	-- ALTER TABLE USERS AUTO_INCREMENT = 1;


-- INSERT INTO PRODUCT TABLE --
	INSERT INTO 
	PRODUCT(TITLE, PRICE, `DESCRIPTION`, WIDTH, LENGTH, COLOR, IMG_LINK)
	VALUES 
	('Figuras de Zempoala.', 27000, 'Cuadro abstracto, predominante azul.', '190', '40', 'azul', 'www.linkimg.com'),
	('Destellos', 25000, 'Cuadro abstracto, colores: azul y amarillo.', '150', '100', 'azul y amarillo', 'www.linkimg2.com'),
	('Ritmos en el desierto', 23000, 'Cuadro abstracto, predominante amarillo.', '180', '140', 'amarillo', 'www.linkimg22.com'),
	('La vendedora de Flores', 24000, 'Cuadro abstracto, predomina azul.', '150', '175', 'azul', 'www.222.com'),
	('Abstraccion', 20000, 'Cuadro abstracto, predominante rojo.', '180', '140', 'rojo', 'www.linkimg2234.com');
	-- SELECT * FROM PRODUCT;
	-- ALTER TABLE PRODUCT AUTO_INCREMENT = 1;


-- INSERT INTO ORDER TABLE --
	INSERT INTO 
	`ORDER` (ORDER_DATE, TOTAL, USERS_ID) 
	VALUES 
	('2023-12-21 10:30:00', 125.75,1),
	('2023-12-20 15:45:00', 89.99,2),
	('2023-12-19 08:00:00', 201.50,3),
	('2023-12-18 20:15:00', 45.30,4),
	('2023-12-17 12:00:00', 150.25,5);
	-- SELECT * FROM `ORDER`;
    
        
-- INSERT INTO ORDER_HAS_PRODUCT TABLE --
	INSERT INTO 
	`ORDER_HAS_PRODUCT`(ORDER_ID, PRODUCT_ID)
	VALUES 
	(1,1), (2,2), (3,3), (4,4), (5,5);
	-- SELECT * FROM `order_has_product`;
    
    