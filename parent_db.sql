/* Create table mst_parent*/
CREATE TABLE mst_parent(
id INT PRIMARY KEY,
family_id INT,
name VARCHAR(25));

/* Insert value parent, for id 1 can be set like (1, null, null) because no restrict not null and not Primary Key*/
INSERT INTO mst_parent(id, family_id ,name) VALUES
(1,1,'Mamang'),
(2,2,'Ilham'),
(3,3,'Irawan'),
(4,4,'Arka');

/* Update data for null*/
UPDATE mst_parent SET family_id = NULL ,name = NULL WHERE id = 1

/* Create view mst_parent*/
SELECT * FROM mst_parent;

/* Create table child*/
CREATE TABLE mst_child(
id SERIAL PRIMARY KEY,
name VARCHAR(25),
parent_id INT,
FOREIGN KEY (parent_id) REFERENCES mst_parent(id));

/* insert value mst_child*/
INSERT INTO mst_child(name,parent_id) VALUES
('Zaki',2),
('Ilham',1),
('Irwan',2),
('Arka',3);

/* Create view mst_child*/
SELECT * FROM mst_child;

/* Create view with parent id*/
SELECT s.id,s.name,p.name AS parent_name FROM mst_child as s
JOIN mst_parent as p
ON p.id = s.parent_id;

/* Create view with parent name*/
SELECT s.id,s.name,p.family_id AS parent_name FROM mst_child as s
JOIN mst_parent as p
ON p.id = s.parent_id;