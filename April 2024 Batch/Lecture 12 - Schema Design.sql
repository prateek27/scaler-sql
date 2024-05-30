-- AirBNB Database
CREATE DATABASE AirBnbDB;

USE AirBnbDB;

CREATE TABLE Host(
	HostId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PhoneNo VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Property(
	PropertyId INT AUTO_INCREMENT PRIMARY KEY,
    HostId INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    NightlyRate DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(HostId) REFERENCES Host(HostId)
);

-- Todo: GUEST 

CREATE TABLE Booking(
	BookingId INT AUTO_INCREMENT PRIMARY KEY,
    PropertyId INT NOT NULL,
    GuestId INT NOT NULL,
    BookingDate DATE NOT NULL,
	StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status ENUM("CONFIRMED","CANCELLED") NOT NULL,
    FOREIGN KEY(PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY(GuestsId) REFERENCES Guest(GuestId)
);

INSERT INTO Booking (PropertyId, GuestId, BookingDate, StartDate, EndDate, Status)
VALUES (1, 2, '2024-06-01', '2024-06-10', '2024-06-15', 'CONFIRMED');

INSERT INTO Booking (PropertyId, GuestId, BookingDate, StartDate, EndDate, Status)
VALUES (1, 2, '2024-06-01', '2024-06-10', '2024-06-15', 'Something');

-- Todo: REVIEWS 

