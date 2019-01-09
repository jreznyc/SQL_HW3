DROP TABLE IF EXISTS users;
CREATE TABLE users(user_id int, user_name varchar(50), group_name varchar(50));
INSERT INTO users VALUES(1, "Modesto", "I.T.");
INSERT INTO users VALUES(2, "Ayine", "I.T.");
INSERT INTO users VALUES(3, "Christopher", "Sales");
INSERT INTO users VALUES(4, "Cheong woo", "Sales");
INSERT INTO users VALUES(5, "Saulat", "Administration");
INSERT INTO users VALUES(6, "Heidy", NULL);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups(group_id int, group_name varchar(50));
INSERT INTO groups VALUES(1, "I.T.");
INSERT INTO groups VALUES(2, "Sales");
INSERT INTO groups VALUES(3, "Administration");
INSERT INTO groups VALUES(4, "Operations");

DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms(room_id int, room_name varchar(50));#, group_access int);
INSERT INTO rooms VALUES(1, "101");
INSERT INTO rooms VALUES(2, "102");
INSERT INTO rooms VALUES(3, "Auditorium A");
INSERT INTO rooms VALUES(4, "Auditorium B");

DROP TABLE IF EXISTS access_control;
CREATE TABLE access_control(access_id int, room_id int, group_id int);
INSERT INTO access_control VALUES(1,1,1);
INSERT INTO access_control VALUES(2,2,1);
INSERT INTO access_control VALUES(3,2,2);
INSERT INTO access_control VALUES(4,3,2);

SELECT 
groups.group_name AS "Group", 
users.user_name AS "Member"
FROM groups
LEFT JOIN users
ON groups.group_name = users.group_name;

SELECT
rooms.room_name AS "Room",
groups.group_name As "Group Access"
FROM rooms
LEFT JOIN access_control
ON rooms.room_id = access_control.room_id
Left JOIN groups
ON access_control.group_id = groups.group_id;

SELECT
users.user_name AS "User",
users.group_name AS "Group",
rooms.room_name AS "Room Access"
FROM users
LEFT JOIN groups
ON users.group_name = groups.group_name
LEFT JOIN access_control
ON groups.group_id = access_control.group_id
LEFT JOIN rooms
ON access_control.room_id = rooms.room_id
ORDER BY user, users.group_name, room_name;