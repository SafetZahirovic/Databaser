DROP SCHEMA IF EXISTS Butikk;
CREATE SCHEMA IF NOT EXISTS Butikk;
USE Butikk;

DROP TABLE IF EXISTS VareBeholdning;
DROP TABLE IF EXISTS Vare;
DROP TABLE IF EXISTS ButikkAnsatt;
DROP TABLE IF EXISTS KundeKundeklubb;
DROP TABLE IF EXISTS Butikk;
DROP TABLE IF EXISTS Lager;


CREATE TABLE Lager 
(
  LagerID INT NOT NULL AUTO_INCREMENT,
  LagerSted VARCHAR(20),
  HylleKapasitet INT,
  CONSTRAINT LagerID PRIMARY KEY (LagerID)
) ENGINE=InnoDB;

CREATE TABLE Butikk
(
  ButikkID INT NOT NULL UNIQUE AUTO_INCREMENT,
  ButikkAdresse VARCHAR(50),
  ButikkSted VARCHAR(20),
  LagerID INT NOT NULL ,
  CONSTRAINT ButikkPK PRIMARY KEY (ButikkID),
  CONSTRAINT LIFK FOREIGN KEY (LagerID) REFERENCES Lager (LagerID)
) ENGINE=InnoDB;


CREATE TABLE KundeKlubb (
  KundeID INT NOT NULL UNIQUE,
  KundeNavn VARCHAR(20),
  KundeEtternavn VARCHAR(20),
  ButikkID INT NOT NULL UNIQUE AUTO_INCREMENT ,
  Tlf INT,
  CONSTRAINT KundePK PRIMARY KEY (KundeID),
  CONSTRAINT BIFK FOREIGN KEY (ButikkID) REFERENCES Butikk(ButikkID)
) ENGINE=InnoDB;

CREATE TABLE ButikkAnsatt
(
  AnsattNummer INT NOT NULL,
  AnsattNavn VARCHAR(16) ,
  AnsattEtternavn VARCHAR(20) ,
  ButikkID INT NOT NULL UNIQUE AUTO_INCREMENT,
  CONSTRAINT AnsattNummer PRIMARY KEY (AnsattNummer),
  CONSTRAINT ButikkIDFK FOREIGN KEY(ButikkID) REFERENCES Butikk(ButikkID)
) ENGINE=InnoDB;


CREATE TABLE Vare 
(
  VareID INT NOT NULL,
  Navn VARCHAR(20),
  EAN VARCHAR(30) NOT NULL,
  Pris DECIMAL (8,2) ,
  CONSTRAINT VarePK PRIMARY KEY (VareID)
) ENGINE=InnoDB;


CREATE TABLE VareBeholdning
(
	ButikkID INT NOT NULL AUTO_INCREMENT,
  VareID INT NOT NULL,
	CONSTRAINT VBPK PRIMARY KEY (VareID, ButikkID),
	CONSTRAINT ButikkFK FOREIGN KEY (ButikkID) REFERENCES Butikk (ButikkID),
  CONSTRAINT VareFK FOREIGN KEY (VareID) REFERENCES Vare (VareID)
	
) ENGINE=InnoDB;

INSERT INTO 
	Lager (LagerID, LagerSted, HylleKapasitet)
VALUES
	(34073, "Oslo", 240),
	(61775, "Bergen", 550),
	(01212, "Lillehamer", 870),
	(61840, "Drammen", 250),
	(89558, "Asker", 100);

INSERT INTO 
	Butikk (ButikkAdresse, ButikkSted, LagerID)
VALUES
	("Sagadammen 211", "Oslo",   34073),
	("Søren Jaabæks gate 187", "Drammen",  61775),
	("Bilittkroken 231", "Drammen",  01212),
	("Seterliveien 18", "Kristiansand",  61840),
	("Pilotveien 36", "Lillestrøm", 89558),
  ("Bålveien 54", "Oslo",  34073),
  ("Regimentveien 100", "Oslo",  34073),
  ("Brekkelia 58", "Oslo",   34073),
  ("Veslekleiva 38", "Oslo",   34073),
  ("Ribbunggata 38", "Drammen",   34073),
  ("Gøteborggata 75", "Drammen",   34073),
  ("Erlends vei 198", "Drammen",   34073),
  ("Veitvetsvingen 219", "Kristiansand",   34073),
  ("Granhekkveien 84", "Kristiansand",   34073),
  ("Kjeld Stubs gate 74", "Kristiansand",   34073),
  ("Ogmunds vei 231", "Lillestrøm",  34073),
  ("Biermanns gate 196", "Lillestrøm",  34073),
  ("Dalehaugen 58", "Oslo",  34073),
  ("Abbedisvingen 41", "Oslo",  34073),
  ("Colbjørnsens gate 236", "Oslo",   34073),
  ("Høydalsveien 2", "Oslo",  34073);
    
 
 INSERT INTO 
	KundeKlubb (KundeID, KundeNavn, KundeEtternavn, Tlf)
VALUES
	(66942056,"Jeramy", "Settles", 55879061  ),
	(27171330,  "Helene","Chausse", 55699623),
	(77126302, "Leandra","Foltz", 55388471),
	(74788830, "Chad", "Fouts" , 55133200),
	(05923155, "Lennie","Luker", 55942120);

INSERT INTO 
	ButikkAnsatt (AnsattNummer, AnsattNavn, AnsattEtternavn)
VALUES
	(8887, "Helene","Akselsen " ),
	(8658, "Kristen","Strand"),
	(5704,"Edvin","Gulbrandsen"),
	(5581,"Andrea","Lange" ),
	(7348,"Kristin","Dahl"),
  (8794,"Charlotte","Andersen"),
  (6533,"Ketil","Adamsen"),
  (4572,"Emilia", "Sørensen"),
  (1522,"Pernille ","Abramsen"),
  (3482,"Erlend","Dahl");

INSERT INTO 
	Vare (VareID, Navn, EAN, Pris)
VALUES
	(58012483, "Mattang", 9334084001211, 59.59),
	(00244449, "Bakebolle", 8711269856506, 199.59),
	(00245257, "Vaksebolle", 8711269861098, 119.59),
	(00226442, "Drikkeflaske", 8711269909097, 119.99),
	(00220473, "Deigfat", 7318141167012, 89.99),
  (58009127  ,"Slangekoblinger",3394665220352,159.59),
  (58008881, "Kranøkkel", 7024990006081, 149.99),
  (31861200, "Øks", 7024990001758, 239.99 ),
  (58005275 , "Insektsmekker", 8710402289881,99.59),
  (58011288, "Ismelt", 7024110250547, 149.99),
  (15944721 , "Støvkost", 7038511830000, 99.99),
  (58012429, "Wire", 7024990010095, 29.59),
  (58015144, "Sykkellås", 7024990015533, 89.99),
  (58015097, "Drill", 7024990015410, 999.99),
  (31059686, "Sirkelsag", 3165140477789, 799.99 );

INSERT INTO 
	VareBeholdning(ButikkID, VareID)
VALUES
  (1,58012483),
  (1,00244449),
  (1,00245257),
  (1,00226442),
  (2,00220473),
  (2,58009127),
  (2,58008881),
  (2,31861200),
  (3,58005275),
  (3,58011288),
  (3,15944721),
  (4,58012429),
  (4,58015144),
  (4,58015097),   
  (5,31059686),
  (5,58012483),
  (5,00244449),
  (6,00245257),
  (6,00226442),
  (6,00220473),
  (7,58009127),
  (7,58008881),
  (7,31861200),
  (8,58005275),
  (8,58011288),
  (8,15944721),
  (9,58012429),
  (9,58015144),
  (9,58015097),
  (10,31059686),
  (10,58012483),
  (10,00244449),
  (10,00245257),
  (11,00226442),
  (11,00220473),
  (11,58009127),
  (12,58008881),
  (12,31861200 ),
  (13,58005275),
  (13,58011288),
  (13,15944721),
  (13,58012429),
  (14,58015144),
  (14,58015097),
  (14,31059686);

