USE db_zoo 
GO

/* DRILL 1, step 65 */
SELECT * FROM tbl_habitat;

/* DRILL 2, step 66 */
SELECT species_name FROM tbl_species
WHERE species_order = 3
;

/* DRILL 3, step 67 */
SELECT nutrition_type FROM tbl_nutrition
WHERE nutrition_cost <= 600.00
;

/* DRILL 4, step 68 */
SELECT species_name FROM tbl_species a1
INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
WHERE nutrition_id >= 2202 AND nutrition_id <= 2206
;

/* DRILL 5, step 69 */
SELECT a1.species_name AS "Species Name:", a2.nutrition_type AS "Nutrition Type:"
FROM tbl_species a1
INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
;

/* DRILL 6, step 70 */
SELECT a3.specialist_fname, a3.specialist_lname, a3.specialist_contact
FROM tbl_care a1
INNER JOIN tbl_species a2 ON a2.species_care = a1.care_id
INNER JOIN tbl_specialist a3 ON a3.specialist_id = a1.care_specialist
WHERE a2.species_name = 'penguin'
;

/* DRILL 7, step 71 */
CREATE DATABASE db_customers
CREATE TABLE tbl_contact(
	contact_id INT PRIMARY KEY NOT NULL IDENTITY(1000, 1),
	telephone VARCHAR(20),
	street_address VARCHAR(50)
);
CREATE TABLE tbl_names (
	name_id INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	name_contact INT NOT NULL FOREIGN KEY REFERENCES tbl_contact(contact_id) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO tbl_contact
		(telephone, street_address)
		VALUES
		('270-483-4489', '2995 Lincoln Farm Road, Hodgenville, KY, 42748'),
		('845-324-5793', '4097 Albany Post Rd, Hyde Park, NY 12538'),
		('360-748-2839', '3200 Mount Vernon Hwy, Mt Vernon, VA 22121')
;
INSERT INTO tbl_names
		(fname, lname, name_contact)
		VALUES 
		('Abraham', 'Lincoln', (SELECT contact_id FROM tbl_contact WHERE telephone ='270-483-4489')),
		('Franklin', 'Roosevelt', (SELECT contact_id FROM tbl_contact WHERE telephone ='845-324-5793')),
		('Eleanor', 'Roosevelt', (SELECT contact_id FROM tbl_contact WHERE telephone ='845-324-5793')),
		('George', 'Washington', (SELECT contact_id FROM tbl_contact WHERE telephone ='360-748-2839'))
;
SELECT a1.name_id, a1.fname, a1.lname, a2.telephone, a2.street_address
FROM tbl_names a1
INNER JOIN tbl_contact a2 ON a2.contact_id = a1.name_contact
;