--Author: [Jiaxi Zhang]
--Assignment# 3 / Part 5
--Date due: Mar 16, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.

--1) Fetch full details of all hotels.
SELECT * FROM hotel;
--2) Fetch full details of all hotels located in Istanbul.
SELECT * FROM hotel WHERE hotelcity = 'Istanbul';
--3) List the names and cities of all guests, ordered according to their cities.
SELECT guestname, guestcity FROM guest ORDER BY guestcity;
--4) List all details for non-smoking rooms in ascending order of price.
SELECT * FROM room WHERE roomtype = 'N' ORDER BY roomprice;
--5) Find the total number of hotels there are.
SELECT COUNT(*) AS total_hotels FROM hotel;
--6) List the cities in which guests live. Each city should be listed only once.
SELECT DISTINCT guestcity FROM guest;
--7) Find the average price of a room.
SELECT AVG(roomprice) AS average_price FROM room;
--8) List hotel names, their room numbers, and the type of that room.
SELECT h.hotelname, r.roomno, r.roomtype FROM room r JOIN hotel h ON  r.hotelno = h.hotelno
--9) List the hotel names, booking dates, and room numbers for all hotels in New York.
SELECT h.hotelname, b.datefrom, b.dateto, b.roomno FROM booking b 
JOIN hotel h ON b.hotelno = h.hotelno WHERE h.hotelcity = 'New York'
--10) What is the number of bookings that started in the month of September?
SELECT COUNT(*) AS booking_count FROM booking WHERE MONTH(datefrom) = 9
--11) List the names and cities of guests who began a stay in New York in August.
SELECT g.guestname, g.guestcity FROM guest g 
JOIN booking b ON b.guestno = g.guestno WHERE MONTH(b.datefrom) = 8
--12) List the hotel names and room numbers of any hotel rooms that have not been booked.
SELECT r.roomno, h.hotelname FROM hotel h 
JOIN room r ON h.hotelno = r.hotelno WHERE r.roomno NOT IN (SELECT roomno FROM booking);
--13) Find the hotel name and city of the hotel with the highest priced room.
SELECT h.hotelname, h.hotelcity FROM hotel h
JOIN room r ON h.hotelno = r.hotelno WHERE r.roomprice = (
    SELECT MAX(roomprice) FROM room
)
--14) List hotel names, room numbers, cities, and prices for hotels 
-- that have rooms with prices lower than the lowest priced room in a Cancun hotel.
SELECT h.hotelname, r.roomno, h.hotelcity, r.roomprice
FROM room r JOIN hotel h ON r.hotelno = h.hotelno WHERE r.roomprice < (
    SELECT MIN(r.roomprice) FROM room r JOIN hotel h ON r.hotelno = h.hotelno
    WHERE h.hotelcity = 'Cancun'
)
--15) Find the average price of a room for each city
SELECT h.hotelcity, AVG(r.roomprice) AS avg_price FROM room r
JOIN hotel h ON h.hotelno = r.hotelno
GROUP BY h.hotelcity;
