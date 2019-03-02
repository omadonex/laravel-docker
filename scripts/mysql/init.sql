CREATE DATABASE IF NOT EXISTS `dev`;

CREATE USER 'root'@'localhost' IDENTIFIED BY root;
GRANT ALL ON *.* TO 'root'@'%';