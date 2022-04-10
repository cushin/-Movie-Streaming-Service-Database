/*By: Christian Wall
UWid: Cushin
TCSS 445
Scenario and Analytical Queries at bottom! */

CREATE DATABASE wall_christian_db
GO
/*DROP DATABASE wall_christian_db*/


CREATE TABLE Movie(
	MovieID				CHAR(3),
	ProductionID		CHAR(3),
	GenreID				VARCHAR(15),
	CountryName			VARCHAR(20),
	Title				VARCHAR(30),
	ReleaseDate			NUMERIC(4),
	AverageRating		DECIMAL(2,1),
	Summary				VARCHAR(1000),
	AvailableLanguages	VARCHAR(100),
	CONSTRAINT MoviePK PRIMARY KEY(MovieID),
	CONSTRAINT MovieFK1 FOREIGN KEY(ProductionID)
		REFERENCES ProductionCompany(ProductionID),
	CONSTRAINT MovieFK2 FOREIGN KEY(GenreID)
		REFERENCES Genre(GenreID),
	CONSTRAINT MovieFK3 FOREIGN KEY(CountryName)
		REFERENCES Countries(CountryName)
	);
GO
/*DROP TABLE Movie*/

INSERT INTO Movie VALUES('M01', 'P01', 'Adventure', 'United States', 'Pirates of the Caribbean', 2003, 4.2, 
'Capt. Jack Sparrow (Johnny Depp) arrives at Port Royal in the Caribbean without a ship or crew.', 'English, Spanish, French, German, Chinese(Mandarin)')
INSERT INTO Movie VALUES('M02', 'P02', 'Action', 'United States', 'The Hunger Games', 2012, 3.7, 
'Tributes, to compete in a nationally televised event called the Hunger Games.', 'English, Spanish, French')
INSERT INTO Movie VALUES('M03', 'P03', 'Thriller', 'Korea', 'Train to Busan', 2016, 4.7, 
'Seok-woo and his daughter are on a train to Busan on the latter''s birthday to see his wife. However, the journey turns into a nightmare', 'Korean')
INSERT INTO Movie VALUES('M04', 'P01', 'Adventure', 'United States', 'Brother Bear', 2003, 4.6, 
'Kenai (Joaquin Phoenix) is a young Indian brave with a particular distaste for bears. 
When his brother Sitka (D.B. Sweeney) is killed by one, Kenai in turn kills the bear, 
only to be magically transformed into one himself.', 'English, Spanish, French, German, Chinese(Mandarin)')
GO
	/*DELETE FROM Movie WHERE MovieID='M04';*/

CREATE TABLE Countries(
	CountryName VARCHAR(20),
	CONSTRAINT CountriesPK PRIMARY KEY(CountryName)
	);
GO
/*DROP TABLE Countries*/

INSERT INTO Countries VALUES('United States')
INSERT INTO Countries VALUES('China')
INSERT INTO Countries VALUES('Korea')
GO

CREATE TABLE MovieCountry(
	CountryName VARCHAR(20) REFERENCES Countries(CountryName),
	MovieID CHAR(3) REFERENCES Movie(MovieID),
	CONSTRAINT CountryPK PRIMARY KEY(CountryName, MovieID)
	);
GO
/*DROP TABLE MovieCountry*/

INSERT INTO MovieCountry VALUES('United States',	'M01')
INSERT INTO MovieCountry VALUES('United States',	'M02')
INSERT INTO MovieCountry VALUES('Korea',	'M03')
INSERT INTO MovieCountry VALUES('United States',	'M04')
GO


CREATE TABLE Languages(
	Language VARCHAR(20),
	CONSTRAINT LanguagesPK PRIMARY KEY(Language)
	);
GO
/*DROP TABLE Languages*/

INSERT INTO Languages VALUES('English')
INSERT INTO Languages VALUES('Spanish')
INSERT INTO Languages VALUES('French')
INSERT INTO Languages VALUES('German')
INSERT INTO Languages VALUES('Chinese(Mandarin)')
INSERT INTO Languages VALUES('Korean')
GO

CREATE TABLE MovieLanguages(
	Language VARCHAR(20) REFERENCES Languages(Language),
	MovieID CHAR(3) REFERENCES Movie(MovieID),
	CONSTRAINT MovieLanguagesPK PRIMARY KEY(Language, MovieID)
	);
GO
/*DROP TABLE MovieLanguages*/

INSERT INTO MovieLanguages VALUES('English',	'M01')
INSERT INTO MovieLanguages VALUES('Spanish',	'M01')
INSERT INTO MovieLanguages VALUES('French',		'M01')
INSERT INTO MovieLanguages VALUES('German',		'M01')
INSERT INTO MovieLanguages VALUES('Chinese(Mandarin)', 'M01')
INSERT INTO MovieLanguages VALUES('English',	'M02')
INSERT INTO MovieLanguages VALUES('Spanish',	'M02')
INSERT INTO MovieLanguages VALUES('French',		'M02')
INSERT INTO MovieLanguages VALUES('Korean',		'M03')
INSERT INTO MovieLanguages VALUES('English',	'M04')
INSERT INTO MovieLanguages VALUES('Spanish',	'M04')
INSERT INTO MovieLanguages VALUES('French',		'M04')
INSERT INTO MovieLanguages VALUES('German',		'M04')
INSERT INTO MovieLanguages VALUES('Chinese(Mandarin)', 'M04')
GO



CREATE TABLE Genre(
	GenreID VARCHAR(15),
	GenreDescription VARCHAR(500),
	CONSTRAINT GenrePK PRIMARY KEY(GenreID)
	);
GO
/*DROP TABLE Genre*/

INSERT INTO Genre VALUES('Adventure',	'World travel, difficult quests, voyages of discovery, and other journeys.')
INSERT INTO Genre VALUES('Action',		'Violence, extended fighting, physical feats, rescues, and frantic chases.')
INSERT INTO Genre VALUES('Thriller',	'Suspense, excitement, surprise, anticipation, and anxiety.')
INSERT INTO Genre VALUES('Sitcom',		'Situational comedy, is a genre of comedy centered on a fixed set of characters who carry over from episode to episode.')
INSERT INTO Genre VALUES('Fantasy',		'Fictional universe, often inspired by real world myth and folklore.')
INSERT INTO Genre VALUES('Romance',		'Relationship and romantic love between two people.')
INSERT INTO Genre VALUES('Drama',		'specific mode of fiction represented in performance: a play, 
opera, mime, ballet, etc., performed in a theatre, or on radio or television.')
GO

CREATE TABLE ProductionCompany(
	ProductionID CHAR(3),
	CompanyName VARCHAR(25),
	CONSTRAINT ProductionCompanyPK PRIMARY KEY(ProductionID)
	);
GO
/*DROP TABLE ProductionCompany*/

INSERT INTO ProductionCompany VALUES('P01',	'Disney')
INSERT INTO ProductionCompany VALUES('P02',	'Color Force')
INSERT INTO ProductionCompany VALUES('P03',	'Next Entertainment World')
INSERT INTO ProductionCompany VALUES('P04',	'HBO Entertainment')
INSERT INTO ProductionCompany VALUES('P05',	'Group 8')
INSERT INTO ProductionCompany VALUES('P06',	'MRC')
GO

CREATE TABLE MovieCast(
	MovieID CHAR(3) REFERENCES Movie(MovieID),
	ActorID CHAR(4) REFERENCES Actor(ActorID),
	CharacterName VARCHAR(25),
	CONSTRAINT MovieCastPK PRIMARY KEY(MovieID, ActorID)
	);
GO
/*DROP TABLE MovieCast*/

INSERT INTO MovieCast VALUES('M01',	'JD01', 'Jack Sparrow')
INSERT INTO MovieCast VALUES('M01',	'OB01', 'Will Turner')
INSERT INTO MovieCast VALUES('M01',	'KK01', 'Elizabeth Swann')
INSERT INTO MovieCast VALUES('M02',	'JL01', 'Katniss Everdeen')
INSERT INTO MovieCast VALUES('M02',	'JH01', 'Peeta Melark')
INSERT INTO MovieCast VALUES('M02',	'LH01', 'Gale Hawthorne')
INSERT INTO MovieCast VALUES('M03',	'GY01', 'Seo Seok-woo')
INSERT INTO MovieCast VALUES('M03',	'JY01', 'Seong-kyeong')
INSERT INTO MovieCast VALUES('M03',	'MD01', 'Yoon Sang-hwa')
INSERT INTO MovieCast VALUES('M04',	'JP01', 'Kenai')
INSERT INTO MovieCast VALUES('M04',	'JS01', 'Koda')
INSERT INTO MovieCast VALUES('M04',	'JR01', 'Denahi')
GO


CREATE TABLE Actor(
	ActorID CHAR(4),
	ActorName VARCHAR(25),
	CONSTRAINT ActorPK PRIMARY KEY(ActorID)
	);
GO
/*DROP TABLE Actor*/

INSERT INTO Actor VALUES('JD01',	'Johnny Depp')
INSERT INTO Actor VALUES('OB01',	'Orlando Bloom')
INSERT INTO Actor VALUES('KK01',	'Keira Knightley')
INSERT INTO Actor VALUES('JL01',	'Jennifer Lawrence')
INSERT INTO Actor VALUES('JH01',	'Josh Hutcherson')
INSERT INTO Actor VALUES('LH01',	'Liam Hemsworth')
INSERT INTO Actor VALUES('GY01',	'Gong Yoo')
INSERT INTO Actor VALUES('JY01',	'Jung Yu-mi')
INSERT INTO Actor VALUES('MD01',	'Ma Dong-seok')
INSERT INTO Actor VALUES('MC01',	'Miley Cyrus')
INSERT INTO Actor VALUES('EC01',	'Emilia Clarke')
INSERT INTO Actor VALUES('KH01',	'Ku Hye-sun')
INSERT INTO Actor VALUES('JP01',	'Joaquin Phoenix')
INSERT INTO Actor VALUES('JS01',	'Jeremy Suarez')
INSERT INTO Actor VALUES('JR01',	'Jason Raize')
INSERT INTO Actor VALUES('JB01',	'Jason Bateman')
INSERT INTO Actor VALUES('LL01',	'Laura Linney')
INSERT INTO Actor VALUES('JG01',	'Julia Garner')
GO

CREATE TABLE Show(
	ShowID CHAR(3),
	ProductionID CHAR(3),
	GenreID VARCHAR(15),
	CountryName VARCHAR(20),
	Title VARCHAR(30),
	ReleaseDate NUMERIC(4),
	AverageRating DECIMAL(2,1),
	Summary VARCHAR(1000),
	AvailableLanguages VARCHAR(100),
	NumSeasons Int,
	NumEpisodes Int,
	CONSTRAINT ShowePK PRIMARY KEY(ShowID),
	CONSTRAINT ShowFK1 FOREIGN KEY(ProductionID)
		REFERENCES ProductionCompany(ProductionID),
	CONSTRAINT ShowFK2 FOREIGN KEY(GenreID)
		REFERENCES Genre(GenreID),
	CONSTRAINT ShowFK3 FOREIGN KEY(CountryName)
		REFERENCES Countries(CountryName)
	);
GO
/*DROP TABLE Show*/

INSERT INTO Show VALUES('S01', 'P01', 'Sitcom', 'United States', 'Hannah Montana', 2006, 3.2, 
'Although she appears to be just a typical teenager to most of her classmates and teachers, Miley Stewart lives a double life, transforming herself into famous pop singer Hannah Montana at night.', 
'English, Spanish', 4, 98)
INSERT INTO Show VALUES('S02', 'P04', 'Fantasy', 'United States', 'Game of Thrones', 2011, 4.1, 
'George R.R. Martin''s best-selling book series ''A Song of Ice and Fire'' is brought to the screen as HBO sinks its considerable storytelling teeth into the medieval fantasy epic.', 
'English', 8, 80)
INSERT INTO Show VALUES('S03', 'P05', 'Romance', 'Korea', 'Boys Over Flowers', 2009, 4.8, 
'The story of Geum Jan-di, a normal girl who finds herself attending a prestigious private school after saving a student''s life.', 'Korean', 1, 25)
INSERT INTO Show VALUES('S04', 'P06', 'Drama', 'United States', 'Ozark', 2017, 3.9, 
'After a money laundering scheme for a Mexican drug cartel goes wrong, financial advisor Martin "Marty" 
Byrde proposes to make amends by offering to set up a bigger laundering operation in the Lake of the Ozarks region of central Missouri.', 
'English, Spanish', 3, 30)
GO

CREATE TABLE Season(
	ShowID CHAR(3) REFERENCES Show(ShowID),
	SeasonNum Int,
	NumEpisodes Int,
	CONSTRAINT SeasonPK PRIMARY KEY(ShowID, SeasonNum)
	);
GO
/*DROP TABLE Season*/

INSERT INTO Season VALUES('S01', 1, 26)
INSERT INTO Season VALUES('S01', 2, 29)
INSERT INTO Season VALUES('S01', 3, 30)
INSERT INTO Season VALUES('S01', 4, 13)
INSERT INTO Season VALUES('S02', 1, 10)
INSERT INTO Season VALUES('S02', 2, 10)
INSERT INTO Season VALUES('S02', 3, 10)
INSERT INTO Season VALUES('S02', 4, 10)
INSERT INTO Season VALUES('S02', 5, 10)
INSERT INTO Season VALUES('S02', 6, 10)
INSERT INTO Season VALUES('S02', 7, 10)
INSERT INTO Season VALUES('S02', 8, 10)
INSERT INTO Season VALUES('S03', 1, 25)
INSERT INTO Season VALUES('S04', 1, 10)
INSERT INTO Season VALUES('S04', 2, 10)
INSERT INTO Season VALUES('S04', 3, 10)
GO

CREATE TABLE Episode(
	ShowID CHAR(3) REFERENCES Show(ShowID),
	EpisodeNum Int,
	SeasonNum Int,
	EpisodeTitle VARCHAR(50),
	CONSTRAINT EpisodePK PRIMARY KEY(ShowID, EpisodeNum)
	);
GO
/*DROP TABLE Episode*/

INSERT INTO Episode VALUES('S01', 1,	1, 'Lilly, Do You Want To Know a Secret?')
INSERT INTO Episode VALUES('S01', 65,	3, 'Cheat It')
INSERT INTO Episode VALUES('S02', 7,	1, 'You Win or You Die')
INSERT INTO Episode VALUES('S03', 6,	1, 'Starlight Tear')
INSERT INTO Episode VALUES('S03', 12,	1, 'So Sad')
INSERT INTO Episode VALUES('S04', 2,	1, 'Blue Cat')
INSERT INTO Episode VALUES('S04', 24,	3, 'Boss Fight')
GO

CREATE TABLE ShowCountry(
	CountryName VARCHAR(20) REFERENCES Countries(CountryName),
	ShowID CHAR(3) REFERENCES Show(ShowID),
	CONSTRAINT ShowCountryPK PRIMARY KEY(CountryName, ShowID)
	);
GO
/*DROP TABLE ShowCountry*/

INSERT INTO ShowCountry VALUES('United States',	'S01')
INSERT INTO ShowCountry VALUES('United States',	'S02')
INSERT INTO ShowCountry VALUES('Korea',	'S03')
INSERT INTO ShowCountry VALUES('United States',	'S04')
GO

CREATE TABLE ShowLanguages(
	Language VARCHAR(20) REFERENCES Languages(Language),
	ShowID CHAR(3) REFERENCES Show(ShowID),
	CONSTRAINT ShowLanguagesPK PRIMARY KEY(Language, ShowID)
	);
GO
/*DROP TABLE ShowLanguages*/

INSERT INTO ShowLanguages VALUES('English',	'S01')
INSERT INTO ShowLanguages VALUES('Spanish',	'S01')
INSERT INTO ShowLanguages VALUES('English',	'S02')
INSERT INTO ShowLanguages VALUES('Korean',	'S03')
INSERT INTO ShowLanguages VALUES('English',	'S04')
INSERT INTO ShowLanguages VALUES('Spanish',	'S04')
GO

CREATE TABLE ShowCast(
	ShowID CHAR(3) REFERENCES Show(ShowID),
	ActorID CHAR(4) REFERENCES Actor(ActorID),
	CharacterName VARCHAR(25),
	CONSTRAINT ShowCasttPK PRIMARY KEY(ShowID, ActorID)
	);
GO
/*DROP TABLE ShowCast*/

INSERT INTO ShowCast VALUES('S01',	'MC01',	'Hannah Montana')
INSERT INTO ShowCast VALUES('S02',	'EC01',	'Daenerys Targaryen')
INSERT INTO ShowCast VALUES('S03',	'KH01',	'Geum Jan-di')
INSERT INTO ShowCast VALUES('S04',	'JB01',	'Martin "Marty" Byrde')
INSERT INTO ShowCast VALUES('S04',	'LL01',	'Wendy Byrde')
INSERT INTO ShowCast VALUES('S04',	'JG01',	'Ruth Langmore')
GO


CREATE TABLE Customer(
	CustomerID CHAR(3),
	CustomerName VARCHAR(25),
	NumProfiles NUMERIC(1),
	Email VARCHAR(30) UNIQUE,
	CONSTRAINT CustomerPK PRIMARY KEY(CustomerID)
	);
GO
/*DROP TABLE Customer*/

INSERT INTO Customer VALUES('C01',	'Charles Simmons',	3,	'CSims@yahoo.com')
INSERT INTO Customer VALUES('C02',	'Tim Allen',		2,	'TimmyA@gmail.com')
INSERT INTO Customer VALUES('C03',	'Ashley Kim',		5,	'Ashyyy@hotmail.com')
GO

CREATE TABLE Profiles(
	CustomerID CHAR(3) REFERENCES Customer(CustomerID),
	ProfilesNum NUMERIC(1),
	SettingsID Char(5) REFERENCES Settings(SettingsID),
	ProfileGender VARCHAR(10),
	ProfileName VARCHAR(25),
	CONSTRAINT ProfilesPK PRIMARY KEY(CustomerID, ProfilesNum)
	);
GO
/*DROP TABLE Profiles*/

INSERT INTO Profiles VALUES('C01',	1,	'Set01',	'Male',		'Charley')
INSERT INTO Profiles VALUES('C01',	2,	'Set02',	'Female',	'Brit')
INSERT INTO Profiles VALUES('C02',	1,	'Set03',	'Other',	'Tim')
INSERT INTO Profiles VALUES('C02',	2,	'Set04',	'Male',		'Alex')
INSERT INTO Profiles VALUES('C03',	1,	'Set05',	'Female',	'Ashy')
INSERT INTO Profiles VALUES('C03',	2,	'Set06',	'Male',		'Kev')
INSERT INTO Profiles VALUES('C03',	3,	'Set07',	'Female',	'Susanna')
GO

CREATE TABLE Settings(
	SettingsID Char(5),
	FontID Char(3),
	Language VARCHAR(20) REFERENCES Languages(Language),
	CountryName VARCHAR(20) REFERENCES Countries(CountryName),
	CONSTRAINT SettingsPK PRIMARY KEY(SettingsID)
	);
GO
/*DROP TABLE Settings*/

INSERT INTO Settings VALUES('Set01',	'F01',	'English',	'United States')
INSERT INTO Settings VALUES('Set02',	'F03',	'English',	'United States')
INSERT INTO Settings VALUES('Set03',	'F02',	'English',	'United States')
INSERT INTO Settings VALUES('Set04',	'F03',	'Spanish',	'United States')
INSERT INTO Settings VALUES('Set05',	'F01',	'Korean',	'Korea')
INSERT INTO Settings VALUES('Set06',	'F01',	'English',	'United States')
INSERT INTO Settings VALUES('Set07',	'F01',	'English',	'United States')
GO

CREATE TABLE Font(
	FontID Char(3),
	Language VARCHAR(20) REFERENCES Languages(Language),
	FontName VARCHAR(20),
	CONSTRAINT FontPK PRIMARY KEY(FontID, Language)
	);
GO
/*DROP TABLE Font*/

INSERT INTO Font VALUES('F01',	'English',	'Times New Roman')
INSERT INTO Font VALUES('F01',	'Spanish',	'Times New Roman')
INSERT INTO Font VALUES('F01',	'German',	'Times New Roman')
INSERT INTO Font VALUES('F01',	'French',	'Times New Roman')
INSERT INTO Font VALUES('F02',	'English',	'Arial')
INSERT INTO Font VALUES('F02',	'Spanish',	'Arial')
INSERT INTO Font VALUES('F03',	'Korean',	'Malgun Gothic')
INSERT INTO Font VALUES('F04',	'Chinese(Mandarin)',	'Songti')
GO

/* All Tables */
SELECT *
FROM Movie

SELECT *
FROM Countries

SELECT *
FROM MovieCountry

SELECT *
FROM Languages

SELECT *
FROM MovieLanguages

SELECT *
FROM Genre

SELECT *
FROM ProductionCompany

SELECT *
FROM MovieCast

SELECT *
FROM Actor

SELECT *
FROM Show

SELECT *
FROM Season

SELECT *
FROM Episode

SELECT *
FROM ShowCountry

SELECT *
FROM ShowLanguages

SELECT *
FROM ShowCast

SELECT *
FROM Customer

SELECT *
FROM Profiles

SELECT *
FROM Settings

SELECT *
FROM Font

/* Scenario / Analytical Queries */

/* Scenario 1. Find a Movie*/
/* Find movie with word 'Pirate'*/
SELECT Title 
FROM Movie 
WHERE Title LIKE 'Pirate%';
/* Find movies with actor name Liam*/
SELECT Title 
FROM Movie, Actor, MovieCast
WHERE Movie.MovieID = MovieCast.MovieID
AND
MovieCast.ActorID = Actor.ActorID
And
Actor.ActorName LIKE 'Liam%';
/* Find movies in genre Action*/
SELECT Title
From Movie, Genre
WHERE Movie.GenreID = Genre.GenreID
AND
Genre.GenreID LIKE 'Action';


/* Scenario 2. Find a TV-Show*/
/* Find show with word 'Game'*/
SELECT Title 
FROM Show 
WHERE Title LIKE 'Game%';
/* Find shows with actor name Cyrus*/
SELECT Title 
FROM Show, Actor, ShowCast
WHERE Show.ShowID = ShowCast.ShowID
AND
ShowCast.ActorID = Actor.ActorID
And
Actor.ActorName LIKE '%Cyrus%';
/* Find shows with Country of Origin */
SELECT Title 
FROM Show 
WHERE CountryName LIKE 'United%';


/* Scenario 3. Register for an Account */
/* Cannot add Email if already exists*/
INSERT INTO Customer VALUES('C04',	'Charley Sims',	3,	'CSims@yahoo.com')
/* Add Customer into Databatse after they register*/
INSERT INTO Customer VALUES('C04',	'Charley Sims',	3,	'CSimmy@yahoo.com')


/* Scenario 4. Create Profile after picking settings*/
INSERT INTO Settings VALUES('Set08',	'F01',	'English',	'United States')
INSERT INTO Profiles VALUES('C04',	1,	'Set08',	'Male',	'CHARLEYY')


/* Scenario 5. Find the Roles that an Actor has played in with Part of Actors name*/
/* From Movie */
SELECT ActorName, CharacterName
FROM MovieCast, Actor
WHERE
Actor.ActorID = MovieCast.ActorID
AND
Actor.ActorName LIKE 'J%';
/* From Show */
SELECT ActorName, CharacterName
FROM ShowCast, Actor
WHERE
Actor.ActorID = ShowCast.ActorID
AND
Actor.ActorName LIKE 'E%';


/* Scenario 6. Find the TV-Show by looking up Episode Title */
SELECT Title
From Show, Episode
Where Episode.EpisodeTitle LIKE '%Sad%'
AND
Episode.ShowID = Show.ShowID;


/* Scenario 7. Pick a Language for your profile and show availiable movies*/
/*Change settings of profile*/
UPDATE Settings
Set Language = 'Korean', CountryName = 'Korea'
WHERE SettingsID = 'Set08';
/*Display movies in that Language*/
Select Title
FROM Movie
WHERE AvailableLanguages LIKE '%Korean%'
AND
CountryName = 'Korea'
/*Display shows in that Language*/
Select Title
FROM Show
WHERE AvailableLanguages LIKE '%Korean%'
AND
CountryName = 'Korea'


/* Analytical 1. Find movies that are in a specific genre created in a spefic year */
SELECT Title
From Movie, Genre
WHERE Movie.GenreID = Genre.GenreID
AND
Genre.GenreID LIKE 'Action'
AND
Movie.ReleaseDate = '2012';

/* Analytical 2. Find a Tv show that has these specific actors that are in this specific language. */
SELECT ActorName, Title
FROM ShowCast, Actor, Show
WHERE
Actor.ActorID = ShowCast.ActorID
AND
Show.ShowID = ShowCast.ShowID
AND
Actor.ActorName LIKE 'Ku%'
AND
Show.AvailableLanguages LIKE '%Korean%';

/* Analytical 3. View only movies that are above a certain rating and that are from a specific production company */
Select Title
FROM Movie, ProductionCompany
WHERE
Movie.AverageRating >= 3
AND
ProductionCompany.ProductionID = Movie.ProductionID
AND
ProductionCompany.CompanyName = 'Disney';

/* Analytical 4. Show all the actors from a specific Movie or Show*/
SELECT Title as Movie_Title, ActorName
FROM MovieCast, Actor, Movie 
WHERE
Actor.ActorID = MovieCast.ActorID
AND
Movie.MovieID = MovieCast.MovieID;

SELECT Title as Show_Title, ActorName
FROM ShowCast, Actor, Show
WHERE
Actor.ActorID = ShowCast.ActorID
AND
Show.ShowID = ShowCast.ShowID;

/* Analytical 5. Find a movie a customer is looking for while the customer only knows the release date and country of origin of the movie.*/
SELECT Title
From Movie
WHERE Movie.ReleaseDate = '2003'
AND
Movie.CountryName = 'United States';