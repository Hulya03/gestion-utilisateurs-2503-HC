ALTER TABLE t_role

	ADD COLUMN role_level INT NOT NULL DEFAULT '0';


UPDATE t_role SET role_level=0 WHERE role_id=1;

UPDATE t_role SET role_level=9 WHERE role_id=2;

UPDATE t_role SET role_level=10 WHERE role_id=3;
 
INSERT INTO

t_role (role_name, role_description, role_level, role_register_code) 

VALUES

('employé','les salariés','1', '7896'),

('cadre','les managers','2','asd44'),

('dirigeant','La big boss','3','4561');
 
 
INSERT INTO 
t_user (user_lastname, user_firstname, user_email, user_password, role_id)
VALUES
('danloss', 'ella', 'ella.danloss@example.com', 12345, 4),
('golay','jerry','j.golay@example.fr','azerty', (SELECT role_id FROM t_role WHERE role_name='employé')),
('camant','medhi','	medhi@example.fr','password',5),
('javelle','aude','aj@example.com','121180',4),
('scroute','jessica','jescr@example.fr','231297',6);
