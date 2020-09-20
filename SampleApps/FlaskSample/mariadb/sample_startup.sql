-- mysql -P 33306 -u User -h 127.0.0.1 -p 
SET CHARACTER_SET_CLIENT = utf8;
SET CHARACTER_SET_CONNECTION = utf8;
create database list;
-- create user User@'%' identified by 'Password';
GRANT all on list.* TO `listUser`@'%' IDENTIFIED BY 'Password';
GRANT all on list.* TO `listUser`@'localhost' IDENTIFIED BY 'Password';
-- SELECT user,host FROM mysql.user;
-- grant all on itms.* to itmsUser;
use list;

-- data
CREATE TABLE t_list (
    id int PRIMARY KEY AUTO_INCREMENT,  -- プライマーキー
    Name VARCHAR(64) NOT NULL,
    quantity VARCHAR(64) NOT NULL, -- 数量
    flag int NOT NULL -- 削除フラッグ(0:有効,1:削除+パスワード空白)
);
-- SELECT * FROM t_list;
