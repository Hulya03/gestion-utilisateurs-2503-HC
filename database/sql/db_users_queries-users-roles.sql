/*1. Sélectionner tous les utilisateurs (identifiant nom, prénom, email et nom du rôle)
sans joiture*/
SELECT user_id, user_lastname, user_firstname, user_email, role_name
FROM t_user, t_role
WHERE t_user.role_id = t_role.role_id;

/* avec jointure */
/* plus performante */
SELECT user_id,user_lastname, user_firstname, user_email, role_name 
FROM t_user 
INNER JOIN t_role ON t_user.role_id = t_role.role_id; 
-- CONDITION DE LIAISON POUR JOINTURE ENTRE DEUX TABLES : t_user.role_id = t_role.role_id
/* JOIN = par défaut INNERJOIN
   on ajoute tjrs une condition à la suite sauf pour natural join*/
/* NATURAL JOIN t_role  : peut être suffisant sur certains sgbd donc à éviter */

/*
explication INNER JOIN :

SELECT *
FROM table1
INNER JOIN table2 ON table1.id = table2.fk_id

La syntaxe ci-dessus stipule qu’il faut sélectionner les enregistrements des tables 
table1 et table2 lorsque les données de la colonne “id” de table1 est égal aux données de la colonne fk_id de table2.
*/

/*2. Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2
sans jointure*/
SELECT user_id, user_lastname, user_firstname, user_email, t_user.role_id , role_name
FROM t_user, t_role
WHERE t_user.role_id = t_role.role_id
ORDER BY role_id DESC, user_lastname ASC;

/*avec jointure*/
SELECT user_id, user_lastname, user_firstname, user_email, t_role.role_id, role_name
FROM t_user
INNER JOIN t_role ON t_user.role_id = t_role.role_id
ORDER BY role_id DESC, user_lastname ASC;


/*3. Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2 */
SELECT user_id, user_lastname, user_firstname, user_email, t_user.role_id, role_name
FROM t_user, t_role
WHERE t_user.role_id = t_role.role_id 
WHERE t_user.role_id=2;

/* AVEC JOINTURE */
SELECT user_id, user_lastname, user_firstname, user_email, t_user.role_id, role_name
FROM t_role
INNER JOIN t_role ON t_user.role_id = t_role.role_id 
WHERE t_user.role_id=2;

/* FAIRE TOUJOURS AVEC DES JOINTURES !!! */



/* 4. Sélectionner, dans les rôles, le plus grand identifiant. */
SELECT MAX(role_id) FROM t_role;



/* 5. Sélectionner le nombre d'utilisateurs.*/
SELECT COUNT(user_id) FROM t_user;
/* utiliser "*" est un emauvaise prtique */

/* 6. Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). Pour chaque rôle, afficher le nombre d'utilisateurs concernés.*/
SELECT t_user.role_id, role_name, role_description, COUNT(user_id)
FROM t_role 
INNER JOIN t_user ON t_user.role_id = t_role.role_id
GROUP BY t_user.role_id;

/* sans la clé étrangère */
SELECT role_name, role_description, COUNT(user_id)
FROM t_role 
INNER JOIN t_user ON t_user.role_id = t_role.role_id
GROUP BY t_role.role_id;

/* 7. Sélectionner la moyenne du nombre d'utilisateurs par rôle. */
SELECT (SELECT COUNT(user_id) FROM t_user)  / (SELECT COUNT(role_id) FROM t_role);

/* 8. Sélectionner nom, prénom, nom du rôle de tous les utilisateurs avec pour chaque utilisateur l'identifiant et nom de l'utilisateur possédant le même rôle et l'identifiant le plus petit.*/
SELECT 
user_id,
user_lastname,
user_firstname, 
role_name,


(SELECT(
SELECT MIN(user_id) FROM t_user 
WHERE t_user.role_id = t_role.role_id

)) AS user_2_id



FROM t_user
INNER JOIN t_role ON t_role.role_id = t_user.role_id
;





SELECT(
SELECT MIN(user_id) FROM t_user INNER JOIN t_role ON t_role.role_id = t_user.role_id WHERE t_user.role_id = t_role.role_id
) user_2_lastname

SELECT *
FROM t_user;

SELECT * 
FROM t_role;