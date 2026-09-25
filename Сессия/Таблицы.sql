CREATE TABLE Positions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Services (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Price MONEY NOT NULL CHECK (Price >= 0),
    DurationMinutes INT NOT NULL CHECK (DurationMinutes > 0)
);
CREATE TABLE Barbers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50) NULL,
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('М', 'Ж')),
    Phone CHAR(11) NOT NULL,
    Email NVARCHAR(100) NULL,
    BirthDate DATE NOT NULL,
    HireDate DATE NOT NULL DEFAULT GETDATE(),
    PositionId INT NOT NULL,
    FOREIGN KEY (PositionId) REFERENCES Positions(Id)
);
CREATE TABLE BarberServices (
    Id INT PRIMARY KEY IDENTITY(1,1),
    BarberId INT NOT NULL,
    ServiceId INT NOT NULL,
    FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
    FOREIGN KEY (ServiceId) REFERENCES Services(Id)
);
CREATE TABLE Clients (
    Id INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Phone CHAR(11) NOT NULL,
    Email NVARCHAR(100) NULL
);
CREATE TABLE Ratings (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(20) NOT NULL UNIQUE
);
CREATE TABLE Feedbacks (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClientId INT NOT NULL,
    BarberId INT NOT NULL,
    RatingId INT NOT NULL,
    Comment NVARCHAR(500) NULL,
    FeedbackDate DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (ClientId) REFERENCES Clients(Id),
    FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
    FOREIGN KEY (RatingId) REFERENCES Ratings(Id)
);
CREATE TABLE Schedules (
    Id INT PRIMARY KEY IDENTITY(1,1),
    BarberId INT NOT NULL,
    WorkDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
    CHECK (EndTime > StartTime)
);
CREATE TABLE Appointments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClientId INT NOT NULL,
    BarberId INT NOT NULL,
    ServiceId INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Ожидает',
    FOREIGN KEY (ClientId) REFERENCES Clients(Id),
    FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
    FOREIGN KEY (ServiceId) REFERENCES Services(Id)
);
CREATE TABLE VisitArchive (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClientId INT NOT NULL,
    BarberId INT NOT NULL,
    ServiceId INT NOT NULL,
    VisitDate DATE NOT NULL,
    TotalCost MONEY NOT NULL,
    RatingId INT NULL,
    Comment NVARCHAR(500) NULL,
    FOREIGN KEY (ClientId) REFERENCES Clients(Id),
    FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
    FOREIGN KEY (ServiceId) REFERENCES Services(Id),
    FOREIGN KEY (RatingId) REFERENCES Ratings(Id)
);