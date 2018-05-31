CREATE TABLE MovieStaff (
	StaffId SERIAL,
	FullName VARCHAR(128),
	PRIMARY KEY (StaffId)
);

CREATE TABLE Biographies (
	StaffId INT, 
	Name VARCHAR(128),
	Realname TEXT,
	DateAndPlaceOfBirth TEXT,
	Height VARCHAR(16),
	Biography TEXT,
	Biographer VARCHAR(128),
	DateAndCauseOfDeath TEXT,
	Trivia TEXT,
	PersonalQuotes TEXT,
	Trademark TEXT,
	WhereAreTheyNow TEXT,
	PRIMARY KEY (StaffId, Name),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE
);

CREATE TABLE Nicknames (
	StaffId INT,
	Nickname VARCHAR(128),
	PRIMARY KEY (StaffId, Nickname),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE
);	

CREATE TABLE Salaries (
	StaffId INT,
	Salary INT,
	Employer VARCHAR(128),
	PRIMARY KEY (StaffId, Salary),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE
);
	
CREATE TABLE Books (
	StaffId INT,
	Book TEXT,
	PRIMARY KEY (StaffId, Book),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE
);

CREATE TABLE Spouses (
	StaffId INT,
	Spouse TEXT,
	PRIMARY KEY (StaffId, Spouse),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE
);

CREATE TABLE Clips (
	ClipId INT,
	ClipTitle TEXT,
	ClipYear INT,
	ClipType VARCHAR(64),
	PRIMARY KEY (ClipId)
);

CREATE TABLE Writes (
	StaffId INT,
	ClipId INT,
	AddInfos VARCHAR(128),
	Role TEXT,
	WorkType TEXT,
	PRIMARY KEY (StaffId, ClipId),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE Produces (
	StaffId INT,
	ClipId INT,
	AddInfos VARCHAR(128),
	Role TEXT,
	PRIMARY KEY (StaffId, ClipId),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE Directs (
	StaffId INT,
	ClipId INT,
	AddInfos VARCHAR(128),
	Role TEXT,
	PRIMARY KEY (StaffId, ClipId),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE Acts (
	StaffId INT,
	ClipId INT,
	Char TEXT,
	OrdersCredit INT,
	AddInfos TEXT,
	PRIMARY KEY (StaffId, ClipId),
	FOREIGN KEY (StaffId) REFERENCES MovieStaff ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE ClipLinks(
	ClipFrom INT,
	ClipTo INT,
	LinkType VARCHAR(32),
	PRIMARY KEY (ClipFrom, ClipTo, LinkType),
	FOREIGN KEY (ClipFrom) REFERENCES Clips ON DELETE CASCADE,
	FOREIGN KEY (ClipTo) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE Ratings (
	ClipId INT,
	Votes INT,
	Rank REAL,
	PRIMARY KEY (ClipId, Rank),
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE Languages (
	LanguageId INT,
	Language VARCHAR(64),
	PRIMARY KEY (LanguageId)
);

CREATE TABLE Speaks (
	ClipId INT,
	LanguageId INT,
	PRIMARY KEY (ClipId, LanguageId),
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE,
	FOREIGN KEY (LanguageId) REFERENCES Languages ON DELETE CASCADE
);

CREATE TABLE Genres (
	GenreId INT,
	Genre VARCHAR(32),
	PRIMARY KEY (GenreId)
);

CREATE TABLE Classified (
	ClipId INT,
	GenreId INT,
	PRIMARY KEY (ClipId, GenreId),
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE,
	FOREIGN KEY (GenreId) REFERENCES Genres ON DELETE CASCADE
);

CREATE TABLE Country (
	CountryId INT,
	CountryName VARCHAR(64),
	PRIMARY KEY (CountryId)
);

CREATE TABLE ReleasedIn (
	CountryId INT,
	ClipId INT,
	ReleaseDate TEXT,
	PRIMARY KEY (CountryId, ClipId),
	FOREIGN KEY (CountryId) REFERENCES Country ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE Associated (
	CountryId INT,
	ClipId INT,
	PRIMARY KEY (CountryId, ClipId),
	FOREIGN KEY (CountryId) REFERENCES Country ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);

CREATE TABLE PlayedFor (
	CountryId INT,
	ClipId INT,
	RunningTime INT,
	PRIMARY KEY (CountryId, ClipId),
	FOREIGN KEY (CountryId) REFERENCES Country ON DELETE CASCADE,
	FOREIGN KEY (ClipId) REFERENCES Clips ON DELETE CASCADE
);
