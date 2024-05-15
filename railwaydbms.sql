CREATE DATABASE project;
USE project;

CREATE TABLE Stations (
    StationID INT PRIMARY KEY,
    StationName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

INSERT INTO Stations (StationID, StationName, Location) VALUES
(1, 'Mumbai Central', 'Mumbai'),
(2, 'New Delhi', 'Delhi'),
(3, 'Chennai Central', 'Chennai'),
(4, 'Howrah Junction', 'Kolkata'),
(5, 'Bengaluru City', 'Bengaluru');
INSERT INTO Stations (StationID, StationName, Location) VALUES
(6, 'Jaipur Junction', 'Jaipur'),
(7, 'Ahmedabad Junction', 'Ahmedabad'),
(8, 'Hyderabad Deccan', 'Hyderabad'),
(9, 'Pune Junction', 'Pune'),
(10, 'Kochi', 'Kochi');
SELECT * FROM Stations;
CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY,
    SourceStationID INT,
    DestinationStationID INT,
    Distance FLOAT,
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

INSERT INTO Tracks (TrackID, SourceStationID, DestinationStationID, Distance) VALUES
(1, 1, 2, 1447),
(2, 1, 3, 1297),
(3, 2, 4, 1473),
(4, 3, 5, 350);
INSERT INTO Tracks (TrackID, SourceStationID, DestinationStationID, Distance) VALUES
(5, 2, 6, 703),
(6, 6, 7, 546),
(7, 7, 8, 545),
(8, 8, 9, 621),
(9, 9, 10, 849);
SELECT * FROM Tracks;
CREATE TABLE Trains (
    TrainID INT PRIMARY KEY,
    TrainName VARCHAR(100) NOT NULL,
    OriginStationID INT,
    DestinationStationID INT,
    FOREIGN KEY (OriginStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

INSERT INTO Trains (TrainID, TrainName, OriginStationID, DestinationStationID) VALUES
(101, 'Rajdhani Express', 1, 2),
(102, 'Shatabdi Express', 2, 4),
(103, 'Chennai Express', 3, 5);
INSERT INTO Trains (TrainID, TrainName, OriginStationID, DestinationStationID) VALUES
(104, 'Vande Bharat Express', 1, 7);
INSERT INTO Trains (TrainID, TrainName, OriginStationID, DestinationStationID) VALUES
(105, 'Duronto Express', 5, 9),
(106, 'Gatimaan Express', 2, 10),
(107, 'Garib Rath Express', 4, 8),
(108, 'Tejas Express', 1, 8),
(109, 'Humsafar Express', 3, 9);

CREATE TABLE TrainSchedules (
    ScheduleID INT PRIMARY KEY,
    TrainID INT,
    DepartureTime TIME,
    ArrivalTime TIME,
    JourneyDate DATE,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO TrainSchedules (ScheduleID, TrainID, DepartureTime, ArrivalTime, JourneyDate) VALUES
(1, 104, '08:00:00', '14:30:00', '2024-04-15'),
(2, 105, '10:30:00', '17:00:00', '2024-04-16'),
(3, 106, '09:00:00', '15:30:00', '2024-04-17');
INSERT INTO TrainSchedules (ScheduleID, TrainID, DepartureTime, ArrivalTime, JourneyDate) VALUES
(4, 107, '14:00:00', '21:30:00', '2024-04-18'),
(5, 108, '06:00:00', '12:00:00', '2024-04-19'),
(6, 109, '19:30:00', '06:00:00', '2024-04-20'),
(7, 101, '11:30:00', '17:30:00', '2024-04-21'),
(8, 102, '16:00:00', '23:30:00', '2024-04-22');
CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY,
    CoachType VARCHAR(50) NOT NULL
);

INSERT INTO Coaches (CoachID, CoachType) VALUES
(1, 'Sleeper'),
(2, 'AC'),
(3, 'General');

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    TrainID INT,
    CoachID INT,
    SeatNumber VARCHAR(10),
    BookingDate DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID)
);

INSERT INTO Bookings (BookingID, PassengerID, TrainID, CoachID, SeatNumber, BookingDate) VALUES
(1, 1, 101, 1, 'A1', '2024-04-10'),
(2, 2, 102, 2, 'B2', '2024-04-11'),
(3, 3, 103, 3, 'C3', '2024-04-12'),
(4, 4, 104, 1, 'D4', '2024-04-13'),
(5, 5, 105, 2, 'E5', '2024-04-14'),
(6, 6, 106, 3, 'F6', '2024-04-15'),
(7, 7, 107, 1, 'G7', '2024-04-16'),
(8, 8, 108, 2, 'H8', '2024-04-17'),
(9, 9, 109, 3, 'I9', '2024-04-18'),
(10, 10, 101, 1, 'J10', '2024-04-19');


CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Passengers (PassengerID, Name, Age, Gender, ContactNumber, Email) VALUES
(1, 'Dhruv Mendiratta', 19, 'Male', '9013669130', 'dhruv.mendiratta4@gmail.com'),
(2, 'Shallu',43, 'Female', '9876543210', 'shallu@gmail.com');
INSERT INTO Passengers (PassengerID, Name, Age, Gender, ContactNumber, Email) VALUES
(3, 'Rajesh Kumar', 35, 'Male', '9876543210', 'rajesh@gmail.com'),
(4, 'Priya Singh', 27, 'Female', '9876543211', 'priya@gmail.com'),
(5, 'Amit Patel', 45, 'Male', '9876543212', 'amit@gmail.com'),
(6, 'Deepika Sharma', 30, 'Female', '9876543213', 'deepika@gmail.com'),
(7, 'Ravi Verma', 50, 'Male', '9876543214', 'ravi@gmail.com'),
(8, 'Sunita Devi', 55, 'Female', '9876543215', 'sunita@gmail.com'),
(9, 'Anil Gupta', 40, 'Male', '9876543216', 'anil@gmail.com'),
(10, 'Neha Kapoor', 25, 'Female', '9876543217', 'neha@gmail.com'),
(11, 'Manoj Singh', 30, 'Male', '9876543218', 'manoj@gmail.com'),
(12, 'Riya Sharma', 22, 'Female', '9876543219', 'riya@gmail.com');

-- Select train schedules for journeys after '2024-04-20':
SELECT * FROM TrainSchedules WHERE JourneyDate > '2024-04-20';

-- Select stations with locations starting with 'M':
SELECT * FROM Stations WHERE Location LIKE 'M%';

-- Select all bookings with passenger details:
SELECT Bookings.BookingID, Passengers.Name AS PassengerName, Passengers.Age, Passengers.Gender, Passengers.ContactNumber, Passengers.Email
FROM Bookings
INNER JOIN Passengers ON Bookings.PassengerID = Passengers.PassengerID;

-- Select all bookings made on journeys after '2024-04-20' with passenger details:
SELECT Bookings.BookingID, Passengers.Name AS PassengerName, Passengers.Age, Passengers.Gender, Passengers.ContactNumber, Passengers.Email
FROM Bookings
INNER JOIN Passengers ON Bookings.PassengerID = Passengers.PassengerID
INNER JOIN TrainSchedules ON Bookings.TrainID = TrainSchedules.TrainID
WHERE TrainSchedules.JourneyDate > '2024-04-20';

-- Count the number of bookings made for each coach type:
SELECT Coaches.CoachType, COUNT(*) AS TotalBookings
FROM Bookings
INNER JOIN Coaches ON Bookings.CoachID = Coaches.CoachID
GROUP BY Coaches.CoachType;

-- Count the number of bookings made for each train:
SELECT Trains.TrainName, COUNT(*) AS TotalBookings
FROM Bookings
INNER JOIN Trains ON Bookings.TrainID = Trains.TrainID
GROUP BY Trains.TrainName;

-- Find the average distance of tracks between stations:
SELECT AVG(Distance) AS AverageDistance FROM Tracks;

-- Select all bookings with train, passenger, and coach details:
SELECT Bookings.BookingID, Trains.TrainName, Passengers.Name AS PassengerName, Coaches.CoachType, Bookings.SeatNumber, Bookings.BookingDate
FROM Bookings
INNER JOIN Trains ON Bookings.TrainID = Trains.TrainID
INNER JOIN Passengers ON Bookings.PassengerID = Passengers.PassengerID
INNER JOIN Coaches ON Bookings.CoachID = Coaches.CoachID;

-- View for TrainScheduleSummary:
CREATE VIEW TrainScheduleSummary AS
SELECT 
    TS.ScheduleID,
    TS.JourneyDate,
    TS.DepartureTime,
    TS.ArrivalTime,
    T.TrainName,
    S1.StationName AS OriginStation,
    S2.StationName AS DestinationStation
FROM 
    TrainSchedules TS
INNER JOIN 
    Trains T ON TS.TrainID = T.TrainID
INNER JOIN 
    Stations S1 ON T.OriginStationID = S1.StationID
INNER JOIN 
    Stations S2 ON T.DestinationStationID = S2.StationID;

SELECT * FROM TrainScheduleSummary;

CREATE TABLE CancelledBooking (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    TrainID INT,
    CoachID INT,
    SeatNumber VARCHAR(10),
    BookingDate DATE
);


DELIMITER //
CREATE TRIGGER CancelledBookingTrigger
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
    INSERT INTO CancelledBooking (BookingID, PassengerID, TrainID, CoachID, SeatNumber, BookingDate)
    VALUES (OLD.BookingID, OLD.PassengerID, OLD.TrainID, OLD.CoachID, OLD.SeatNumber, OLD.BookingDate);
END //

DELIMITER ;
DELETE FROM Bookings WHERE BookingID IN (3, 9);
SELECT * FROM CancelledBooking;
SELECT * FROM Bookings WHERE BookingID>3 and BookingID<9;
SELECT * FROM Bookings inner join Passengers where Passengers.name="Amit Patel";
select * from Stations;
select * from Tracks;
select * from Trains;
select * from TrainSchedules;
select * from Coaches;
select * from Bookings;
select * from Passengers;
select * from CancelledBooking;
