CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL, 
);


CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseDate DATE,
    Description TEXT,
    RuntimeMinutes INT,
    PosterURL VARCHAR(255), 
    TrailerURL VARCHAR(255), 
);


CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL
);


INSERT INTO Genres (GenreName) VALUES ('Action');
INSERT INTO Genres (GenreName) VALUES ('Comedy');
INSERT INTO Genres (GenreName) VALUES ('Drama');



CREATE TABLE Tags (
    TagID INT AUTO_INCREMENT PRIMARY KEY,
    TagName VARCHAR(50) NOT NULL
);


INSERT INTO Tags (TagName) VALUES ('Superhero');
INSERT INTO Tags (TagName) VALUES ('Romantic Comedy');



CREATE TABLE MovieGenres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);


CREATE TABLE MovieTags (
    MovieID INT,
    TagID INT,
    PRIMARY KEY (MovieID, TagID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TagID) REFERENCES Tags(TagID)
);


CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Rating DECIMAL(3, 1) NOT NULL,
    Review TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);


CREATE TABLE Recommendations (
    RecommendationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);


CREATE TABLE CastAndCrew (
    CastAndCrewID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL
    
);


INSERT INTO CastAndCrew (Name, Role) VALUES ('Christopher Nolan', 'Director');
INSERT INTO CastAndCrew (Name, Role) VALUES ('Christian Bale', 'Actor');



CREATE TABLE MovieCastAndCrew (
    MovieID INT,
    CastAndCrewID INT,
    Role VARCHAR(50) NOT NULL,
    PRIMARY KEY (MovieID, CastAndCrewID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (CastAndCrewID) REFERENCES CastAndCrew(CastAndCrewID)
);


CREATE TABLE UserProfiles (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(255),
    DateOfBirth DATE,
    Address VARCHAR(255),
    
);


CREATE TABLE MovieLocations (
    MovieLocationID INT AUTO_INCREMENT PRIMARY KEY,
    MovieID INT,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);


INSERT INTO MovieLocations (MovieID, City, Country) VALUES (1, 'Los Angeles', 'USA');
INSERT INTO MovieLocations (MovieID, City, Country) VALUES (2, 'New York', 'USA');



CREATE TABLE BoxOfficeData (
    MovieID INT PRIMARY KEY,
    OpeningWeekendEarnings DECIMAL(15, 2),
    TotalEarnings DECIMAL(15, 2),
    ReleaseDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);


INSERT INTO BoxOfficeData (MovieID, OpeningWeekendEarnings, TotalEarnings, ReleaseDate)
VALUES (1, 50000000.00, 200000000.00, '2010-07-15');
