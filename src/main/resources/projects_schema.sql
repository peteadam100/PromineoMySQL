DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (project_id)
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT null,
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id),
	UNIQUE KEY (project_id, category_id)
);


/*
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang a door', 4, 3, 3, 'Use the door hangers from Home Depot');
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Install dishwasher', 3, 5, 2, 'some notes');
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Plant Garden', 10, 8, 3, null); 
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Redo Roof', 40, 45, 4, 'Must do on a warm day');
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Make Mud', 1, .5, 1, 'Just have fun');

INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Door hangers', 3, 5);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Screws', 20, 4.22);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'screws', 50, 2.12);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, '1x2 boards', 2, 7.79);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Paneling', 1, 14);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Tomato seedlings', 5, 14);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Cucumber seeds', 20, 5.75);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (5, 'dirt', 3, 0);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (5, 'water', 1, 0);

INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Screw door hangers on the top and bottom of each side of the door frame', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Attach Hinges', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Hang door on hinges', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Install door knob', 4);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Stain paneling', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Varnish paneling', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Something else', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Till garden', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Section off garden for different plants', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Make rows for planting seeds', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Plant seeds', 4);
INSERT INTO step (project_id, step_text, step_order) VALUES (5, 'Put dirt into bowl', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (5, 'Add water to bowl', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (5, 'Mix dirt and water with fingers',3);

INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and Windows');
INSERT INTO category (category_id, category_name) VALUES (2, 'Roof');
INSERT INTO category (category_id, category_name) VALUES (3, 'Kitchen');
INSERT INTO category (category_id, category_name) VALUES (4, 'Bathroom');
INSERT INTO category (category_id, category_name) VALUES (5, 'Yard');
INSERT INTO category (category_id, category_name) VALUES (6, 'Garden');
INSERT INTO category (category_id, category_name) VALUES (7, 'House');
INSERT INTO category (category_id, category_name) VALUES (8, 'Inside');

INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (1, 7);
INSERT INTO project_category (project_id, category_id) VALUES (1, 8);
INSERT INTO project_category (project_id, category_id) VALUES (2, 3);
INSERT INTO project_category (project_id, category_id) VALUES (2, 7);
INSERT INTO project_category (project_id, category_id) VALUES (2, 8);
INSERT INTO project_category (project_id, category_id) VALUES (3, 5);
INSERT INTO project_category (project_id, category_id) VALUES (3, 6);
INSERT INTO project_category (project_id, category_id) VALUES (5, 5);
INSERT INTO project_category (project_id, category_id) VALUES (5, 6);



*/





