UPDATE t_user SET user_email='germaine.lustrucru@example.fr' WHERE user_id=3;

UPDATE t_user SET 
user_lastname='Hatcher', 
user_password='tatayoyo' 
WHERE user_id=4;

SELECT user_id, user_email,user_lastname, user_firstname, user_password, role_id FROM t_user;

SELECT user_lastname, user_firstname, user_email, user_id FROM t_user;

SELECT user_id, user_firstname, user_lastname FROM t_user WHERE user_id=2;

SELECT user_id, user_lastname, user_email FROM t_user WHERE user_lastname='ingals';

SELECT user_id, user_email,user_lastname, user_firstname, user_password, role_id FROM t_user WHERE user_firstname IS NULL OR user_firstname='';

SELECT user_id, user_email,user_lastname, user_firstname, user_password, role_id FROM t_user WHERE user_firstname IS NOT NULL AND user_firstname <> '' ORDER BY user_id DESC;

SELECT user_id, user_lastname FROM t_user WHERE user_lastname LIKE '%g%';

SELECT user_id, user_lastname, user_email FROM t_user WHERE user_firstname LIKE 'c%' ORDER BY user_firstname ASC;

SELECT user_lastname, user_firstname, user_email FROM t_user WHERE user_email LIKE '%.fr' ORDER BY user_lastname ASC;

