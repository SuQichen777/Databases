--Author: [Jiaxi Zhang]
--Assignment# 3 / Part 3
--Date due: Mar 16, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.
ALTER TABLE room MODIFY roomtype CHAR(1) DEFAULT 'N';
ALTER TABLE hotel ADD hotelphone VARCHAR(15);
ALTER TABLE guest ADD guestmail VARCHAR(25);
ALTER TABLE hotel MODIFY hotelname VARCHAR(35);
