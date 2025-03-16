--Author: [Jiaxi Zhang]
--Assignment# 3 / Part 1
--Date due: Mar 16, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.

CREATE DATABASE HotelBooking;
USE HotelBooking;

-- Hotel table
CREATE TABLE hotel(
    hotelno CHAR(4) PRIMARY KEY,
    hotelname VARCHAR(50),
    hotelcity VARCHAR(50)
)

-- room table
CREATE TABLE room(
    roomno INT,
    hotelno CHAR(4),
    roomtype char(1),
    roomprice DECIMAL(8,2),
    PRIMARY KEY(roomno, hotelno),
    FOREIGN KEY(hotelno) REFERENCES hotel(hotelno)
)

-- guest table
CREATE TABLE guest(
    guestno CHAR(4) PRIMARY KEY,
    guestname VARCHAR(50),
    guestcity VARCHAR(50)
)

-- booking table
CREATE TABLE booking(
    hotelno Char(4),
    roomno INT,
    guestno CHAR(4),
    datefrom DATE,
    dateto DATE,
    PRIMARY KEY(hotelno, roomno, guestno, datefrom),
    FOREIGN KEY(hotelno, roomno) REFERENCES room(hotelno, roomno),
    FOREIGN KEY(guestno) REFERENCES guest(guestno)
)