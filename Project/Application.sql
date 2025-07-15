-- Veritabanını oluşturma (Örnek: PostgreSQL)
-- CREATE DATABASE social_media_db;
-- \c social_media_db;

-- USERS tablosunu oluştur
CREATE TABLE USERS (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    joindate DATE NOT NULL,
    profilepicture VARCHAR(255)
);

-- POST tablosunu oluştur
CREATE TABLE POST (
    postid SERIAL PRIMARY KEY,
    userid INTEGER NOT NULL,
    caption TEXT,
    imageurl VARCHAR(255),
    postdate DATE NOT NULL,
    FOREIGN KEY (userid) REFERENCES USERS(userid)
);

-- likes tablosunu oluştur
CREATE TABLE likes (
    likeid SERIAL PRIMARY KEY,
    userid INTEGER NOT NULL,
    postid INTEGER NOT NULL,
    likedate DATE NOT NULL,
    FOREIGN KEY (userid) REFERENCES USERS(userid),
    FOREIGN KEY (postid) REFERENCES POST(postid)
);

-- COMMENT tablosunu oluştur
CREATE TABLE COMMENT (
    commentid SERIAL PRIMARY KEY,
    userid INTEGER NOT NULL,
    postid INTEGER NOT NULL,
    commenttext TEXT,
    commentdate DATE NOT NULL,
    FOREIGN KEY (userid) REFERENCES USERS(userid),
    FOREIGN KEY (postid) REFERENCES POST(postid)
);

-- USERS tablosuna veri ekle
INSERT INTO USERS (Username, Email, Password, JoinDate, ProfilePicture)
VALUES
('ahmet41', 'ahmet41@hotmail.com', 'ahmet41', '2022-01-01', 'ahmet.jpg'),
('osman38', 'osman38@hotmail.com', 'osman38', '2022-01-02', 'osman.jpg'),
('tarık49', 'tarık49@hotmail.com', 'tarık49', '2022-01-03', 'tarık.jpg'),
('fevzi51', 'fevzi51@hotmail.com', 'fevzi51', '2022-01-04', 'fevzi.jpg'),
('mehmet69', 'mehmet69@hotmail.com', 'mehmet69', '2022-01-05', 'mehmet.jpg'),
('kemal31', 'kemal31@hotmail.com', 'kemal31', '2022-01-06', 'kemal.jpg'),
('abbas58', 'abbas58@hotmail.com', 'abbas58', '2022-01-07', 'abbas.jpg'),
('ömer101', 'ömer101@hotmail.com', 'ömer101', '2022-01-08', 'ömer.jpg'),
('cevdet62', 'cevdet62@hotmail.com', 'cevdet62', '2022-01-09', 'cevdet.jpg'),
('nuri78', 'nuri78@hotmail.com', 'nuri78', '2022-01-10', 'nuri.jpg');

-- POST tablosuna veri ekle
INSERT INTO POST (UserID, Caption, ImageURL, PostDate)
VALUES
(1, 'This is the first post', 'ahmet.jpg', '2022-01-01'),
(2, 'Another post here', 'osman.jpg', '2022-01-02'),
(3, 'Another post here', 'tarık.jpg', '2022-01-03'),
(4, 'Another post here', 'fevzi.jpg', '2022-01-04'),
(5, 'Another post here', 'mehmet.jpg', '2022-01-05'),
(6, 'Another post here', 'kemal.jpg', '2022-01-06'),
(7, 'Another post here', 'abbas.jpg', '2022-01-07'),
(8, 'Another post here', 'ömer.jpg', '2022-01-08'),
(9, 'Another post here', 'cevdet.jpg', '2022-01-09'),
(10, 'Last post of the day', 'nuri.jpg', '2022-01-10');

-- likes tablosuna veri ekle
INSERT INTO likes (UserID, PostID, LikeDate)
VALUES
(1, 1, '2022-01-01'),
(2, 2, '2022-01-02'),
(3, 3, '2022-01-03'),
(4, 4, '2022-01-04'),
(5, 5, '2022-01-05'),
(6, 6, '2022-01-06'),
(7, 7, '2022-01-07'),
(8, 8, '2022-01-08'),
(9, 9, '2022-01-09'),
(10,10, '2022-01-10');

-- COMMENT tablosuna veri ekle
INSERT INTO Comment (UserID, PostID, CommentText, CommentDate)
VALUES
(1,1, 'Nice post!', '2022-01-01'),
(2,2, 'I love this!', '2022-01-02'),
(3,3, 'Very lovely', '2022-01-03'),
(4,4, 'Awesome', '2022-01-04'),
(5,5, 'Great', '2022-01-05'),
(6,6, 'Funny', '2022-01-06'),
(7,7, 'Fire!', '2022-01-07'),
(8,8, 'Wow!,excellent', '2022-01-08'),
(9,9, 'Brilliant', '2022-01-09'),
(10,10, 'follow back', '2022-01-10');