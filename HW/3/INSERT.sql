--Author: [Jiaxi Zhang]
--Assignment# 3 / Part 2
--Date due: Mar 16, 2025
--I pledge that I have completed this assignment without collaborating
--with anyone else, in conformance with the NYU School of Engineering
--Policies and Procedures on Academic Misconduct.

INSERT INTO hotel (hotelno, hotelname, hotelcity) VALUES
('H111', 'Marriott', 'New York'),
('H235', 'Hilton', 'New York'),
('H432', 'Kempinski', 'Cancun'),
('H498', 'Hyatt Zilara', 'Cancun'),
('H193', 'Ramada Encore', 'Istanbul'),
('H437', 'Primero', 'Istanbul');

INSERT INTO room (roomno, hotelno, roomtype, roomprice) VALUES
(313, 'H111', 'N', 145.00),
(412, 'H111', 'N', 145.00),
(1267, 'H235', 'N', 175.00),
(1289, 'H235', 'N', 195.00),
(876, 'H432', 'N', 124.00),
(898, 'H432', 'N', 124.00),
(345, 'H498', 'N', 160.00),
(467, 'H498', 'N', 180.00),
(1001, 'H193', 'N', 150.00),
(1201, 'H193', 'N', 175.00),
(257, 'H437', 'N', 140.00),
(223, 'H437', 'N', 155.00);

INSERT INTO guest (guestno, guestname, guestcity) VALUES
('G256', 'Adam Wayne', 'New York'),
('G367', 'Tara Cummings', 'London'),
('G879', 'Vanessa Parry', 'California'),
('G230', 'Tom Hancock', 'Istanbul'),
('G467', 'Robert Swift', 'Istanbul'),
('G190', 'Edward Cane', 'London');

INSERT INTO booking(hotelno, guestno, datefrom, dateto, roomno) VALUES
('H111', 'G256', '2023-08-10', '2023-08-15', 412),
('H111', 'G367', '2023-08-18', '2023-08-21', 412),
('H235', 'G879', '2023-09-05', '2023-09-12', 1267),
('H498', 'G230', '2023-09-15', '2023-09-18', 467),
('H498', 'G256', '2023-11-30', '2023-12-02', 345),
('H498', 'G467', '2023-11-03', '2023-11-05', 345),
('H193', 'G190', '2023-11-15', '2023-11-19', 1001),
('H193', 'G367', '2023-09-12', '2023-09-14', 1001),
('H193', 'G367', '2023-10-01', '2023-10-06', 1201),
('H437', 'G190', '2023-10-04', '2023-10-06', 223),
('H437', 'G879', '2023-09-14', '2023-09-17', 223);
