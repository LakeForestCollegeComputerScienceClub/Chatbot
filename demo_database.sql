/*NOTE: in SQL, any changes you make to a database are saved after the program stops.
So, for example, if you insert a line into a table, you don't need to keep that line in your program
after it finishes executing. If you do, it will attempt to add the same user again, which won't work
because 'username' in this example only accepts unique values.*/

/*Create your database:*/
CREATE DATABASE IF NOT EXISTS chatbot_userlist;

/*Indicate which database you want to use*/
USE chatbot_userlist;

/*Create tables that will hold your data and specify column names and types*/
CREATE TABLE IF NOT EXISTS users (username VARCHAR(20) PRIMARY KEY, user_password VARCHAR(20), first_name VARCHAR(20), last_name VARCHAR(20));

/*Add new rows to a table:*/
INSERT INTO users VALUES ('csclub', 'csclubpassword', 'C.S.','Club');

/*Update user data associated with a particular subset of users
(in this case, we are updating the password for an existing user)*/
UPDATE users SET user_password = 'new password' WHERE username = 'testuser';

/*Delete a user's data*/
DELETE FROM users WHERE username = 'testuser';

/*Select a particular row from a table based on value from a given column:
(in this case, we are selecting the row that is associated with the username "existing username")
SELECT * FROM users WHERE username = 'username';*/

/*Select all rows from a table:*/
SELECT * FROM users;