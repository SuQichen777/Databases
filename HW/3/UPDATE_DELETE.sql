--Author: [Jiaxi Zhang]
--Assignment# 3 / Part 4
--Date due: Mar 16, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.
UPDATE room SET roomtype = 'S' 
WHERE roomno = 313 AND hotelno = (SELECT hotelno FROM hotel WHERE hotelname = 'Marriott');
UPDATE room SET roomtype = 'S'
WHERE roomno IN (876,898) AND hotelno = (SELECT hotelno FROM hotel WHERE hotelname = 'Kempinski');
UPDATE room SET roomtype = 'S' 
WHERE roomno = 1001 AND hotelno = (SELECT hotelno FROM hotel WHERE hotelname = 'Ramada Encore');

UPDATE guest SET guestmail = 'ec@example.com'
UPDATE hotel SET hotelphone = "1111111111"
UPDATE room SET roomprice = roomprice * 1.05
WHERE hotelno = (SELECT hotelno FROM hotel WHERE hotelname = 'Marriott');
DELETE FROM guest WHERE guestno = 'G190';

-- this is my answer to question 6
-- The DELETE statement in Q5 does not work because the foreign key constraint is violated
-- The guestno 'G190' is referenced in the booking table, so it cannot be deleted from the guest table
