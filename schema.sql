Show Databases;
CREATE DATABASE IF NOT EXISTS Housify;
use Housify;

CREATE TABLE IF NOT EXISTS USER (
    USER_ID VARCHAR(100) NOT NULL PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL, 
    EMAIL VARCHAR(100) NOT NULL UNIQUE, 
    PASSWORD VARCHAR(50) NOT NULL, 
    PHONE VARCHAR(50),
    INCOME DECIMAL(30 , 2)
);

CREATE TABLE IF NOT EXISTS LISTING (
    IMAGE_URL TEXT,
    ID VARCHAR(100)  PRIMARY KEY ,
    USER_ID VARCHAR(100) NOT NULL ,-- id of the owner of this listing
    NAME VARCHAR(100) , 
    DESCRIPTION TEXT(1000) NOT NULL,
    STREET VARCHAR(100),
    CITY VARCHAR(100) NOT NULL,
    STATE VARCHAR(100) NOT NULL,
    PINCODE INT(6) NOT NULL,
    AVAILABILITY BOOLEAN DEFAULT TRUE , 
    PRICEPERMONTH DECIMAL(10 ,2) NOT NULL,
    DISCOUNT DECIMAL(4 , 2),
    SIZE INT NOT NULL , 
    RATING INT
);


CREATE TABLE IF NOT EXISTS BOOKING (
    ID VARCHAR(100) NOT NULL PRIMARY KEY , 
    USER_ID VARCHAR(100) NOT NULL,--id of user who has made this booking , not the id of the listing owner
    LISTING_ID VARCHAR(100) NOT NULL, -- id of the listing booked 
    START_DATE DATE , 
    END_DATE DATE
);

ALTER TABLE LISTING
ADD FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE;

ALTER TABLE BOOKING 
ADD FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE, 
ADD FOREIGN KEY (LISTING_ID) REFERENCES LISTING(ID) ON DELETE CASCADE;