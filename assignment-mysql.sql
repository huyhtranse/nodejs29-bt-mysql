CREATE DATABASE assignment;
USE assignment;

-- create tables
CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE order_food (
	user_id INT,
    food_id INT,
    amount VARCHAR(100),
    code_food VARCHAR(100),
    arr_sub_id VARCHAR(100)
);

CREATE TABLE restaurant (
	res_id INT AUTO_INCREMENT PRIMARY KEY,
    res_name VARCHAR(100),
    image VARCHAR(100),
    descr VARCHAR(100)
);

CREATE TABLE rate_res (
	user_id INT,
    res_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
    amount INT,
    date_rate DATETIME
);
CREATE TABLE like_res (
	user_id INT,
    res_id INT,
    date_like DATETIME,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE food (
	food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100),
    image VARCHAR(100),
    price FLOAT,
    descr VARCHAR(100),
    type_id INT 
);
CREATE TABLE food_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    tye_name VARCHAR(100)
);
CREATE TABLE sub_food (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(100),
    sub_price FLOAT,
    food_id INT
);

-- insert data
INSERT INTO users(full_name, email, password)
VALUES
	("An", "An@sql.com", "AN"),
    ("Binh", "binh@sql.com", "BINH"),
    ("Chi", "chi@sql.com", "CHI"),
    ("Danh", "danh@sql.com", "DANH"),
    ("Yen", "yen@sql.com", "YEN"),
    ("Phuc", "phuc@sql.com", "PHUC"),
    ("Giau", "giau@sql.com", "GIAU"),
    ("Hien", "hien@sql.com", "HIEN");

INSERT INTO restaurant(res_name, image, descr)
VALUES
	("Shopee Food", "https://image.com/shopee", "shop shop pe pe pe"),
    ("Beamin", "https://image.com/beamin", "Bo e be mo in min"),
    ("Gojek", "https://image.com/gojek", "Mau xanh le"),
    ("Be Food", "https://image.com/be", "Mau vang khe"),
    ("Quan dau hem", "https://image.com/hem", "Khong ve sinh");

INSERT INTO food(`food_id`, `food_name`, `image`, `price`, `descr`, `type_id`)
VALUES
	('1', 'Hu tieu', 'https://image/vn/hutieu', '30', 'Hu tieu gia truyen', '3'),
	('2', 'Bun bo', 'https://image/vn/bunbo', '35', 'Bun bo thit', '2'),
	('3', 'Pho', 'https://image/vn/pho', '40', 'Pho ga', '1'),
	('4', 'Banh cuon', 'https://image/vn/banhcuon', '20', 'Banh cuon nong', '1'),
	('5', 'Banh canh', 'https://image/vn/banhcanh', '25', 'Banh canh thit', '2'),
	('6', 'Goi cuon', 'https://image/vn/goicuon', '5', 'Goi cuon banh dan', '3'),
	('7', 'Com tam', 'https://image/vn/comtam', '25', 'Com tam Sai Gon', '5'),
	('8', 'Banh mi', 'https://image/vn/banhmi', '15', 'Banh mi heo quay', '2'),
	('9', 'Khoai lang', 'https://image/vn/khoailang', '10', 'Khoai lang mo', '4');
    
INSERT INTO `assignment`.`food_type` (`type_id`, `tye_name`) VALUES ('1', 'Thuc uong');
INSERT INTO `assignment`.`food_type` (`type_id`, `tye_name`) VALUES ('2', 'Thuc an nhanh');
INSERT INTO `assignment`.`food_type` (`type_id`, `tye_name`) VALUES ('3', 'Mon nuoc');
INSERT INTO `assignment`.`food_type` (`type_id`, `tye_name`) VALUES ('4', 'An vat');
INSERT INTO `assignment`.`food_type` (`type_id`, `tye_name`) VALUES ('5', 'Chay');

INSERT INTO like_res (user_id, res_id, date_like)
VALUES
	(1, 1, '2023-03-14 09:00:00'),
    (1, 2, '2023-03-14 09:00:00'),
    (1, 3, '2023-03-14 09:00:00'),
    (2, 2, '2023-03-14 09:00:00'),
    (2, 3, '2023-03-14 09:00:00'),
    (3, 5, '2023-03-14 09:00:00'),
    (2, 1, '2023-03-14 09:00:00'),
    (3, 4, '2023-03-14 09:00:00'),
    (3, 1, '2023-03-14 09:00:00'),
    (4, 3, '2023-03-14 09:00:00'),
    (4, 5, '2023-03-14 09:00:00'),
    (8, 1, '2023-03-14 09:00:00'),
    (7, 3, '2023-03-14 09:00:00'),
    (7, 1, '2023-03-14 09:00:00'),
    (3, 3, '2023-03-14 09:00:00');
    
INSERT INTO order_food (user_id, food_id, amount, code_food, arr_sub_id)
VALUES
	(1, 1, 3, '', '[1, 2]'),
    (1, 2, 2, '', '[4, 5]'),
    (3, 1, 1, '', ''),
    (1, 4, 1, '', ''),
    (3, 5, 5, '', ''),
    (3, 8, 10, '', ''),
    (3, 9, 10, '', '[1, 2, 3]'),
    (3, 10, 10, '', '');
    
INSERT INTO rate_res (user_id, res_id, amount, date_rate)
VALUES
	(1, 2, 4, '2023-03-14 09:00:00'),
    (1, 3, 5, '2023-03-14 09:00:00'),
    (2, 1, 3, '2023-03-14 09:00:00'),
    (2, 3, 3, '2023-03-14 09:00:00');

INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('1', 'Thit them', '5', '4');
INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('2', 'Bun them', '5', '5');
INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('3', 'Nuoc da', '2', '8');
INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('4', 'Nem', '7', '1');
INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('5', 'Cha', '10', '2');
INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('6', 'Suon', '10', '3');
INSERT INTO `assignment`.`sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES ('7', 'Rau', '5', '10');

--  1. tim 5 nguoi da like nha hang nhieu nhat
SELECT users.user_id, users.full_name, count(1) AS likes
FROM like_res 
INNER JOIN users 
ON like_res.user_id = users.user_id 
GROUP BY user_id
ORDER BY likes DESC
LIMIT 5;

-- 2. tim 2 nha hang co so luot like nhieu nhat
SELECT restaurant.res_id, restaurant.res_name, count(1) AS likes
FROM like_res 
INNER JOIN restaurant 
ON like_res.res_id = restaurant.res_id 
GROUP BY res_id
ORDER BY likes DESC
LIMIT 2;

-- 3. tim nguoi da dat hang nhieu nhat
SELECT users.user_id, users.full_name, count(1) AS orders
FROM order_food 
INNER JOIN users 
ON order_food.user_id = users.user_id 
GROUP BY user_id
ORDER BY orders DESC
LIMIT 1;

-- 4. tim nguoi dung khong hoat dong trong he thong (khong dat hang, khong like, khong danh gia nha hang)
SELECT users.user_id, users.full_name, users.email
	FROM users
	LEFT JOIN order_food
	ON users.user_id = order_food.user_id
	LEFT JOIN like_res
	ON users.user_id = like_res.user_id
    LEFT JOIN rate_res
    ON users.user_id = rate_res.user_id
    WHERE order_food.amount IS NULL AND like_res.date_like IS NULL AND rate_res.date_rate IS NULL;

-- 5. Tinh trung binh sub_food cua mot food