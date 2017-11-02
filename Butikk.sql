CREATE SCHEMA IF NOT EXISTS Butikk;
USE Butikk;

DROP TABLE IF EXISTS VareBeholdning;
DROP TABLE IF EXISTS Butikk;
DROP TABLE IF EXISTS Kunde;
DROP TABLE IF EXISTS Vare;
DROP TABLE IF EXISTS Lager;
DROP TABLE IF EXISTS KundeRegister;




CREATE TABLE Kunde (
  KundeID VARCHAR(10) NOT NULL,
  Navn VARCHAR(20),
  Etternavn VARCHAR(20),
  CONSTRAINT KundePK PRIMARY KEY (KundeID)
) ENGINE=InnoDB;

CREATE TABLE KundeRegister
(
  RegisterID VARCHAR(12) NOT NULL,
  KundeID INT(20) ,
  Historikk VARCHAR(20),
  CONSTRAINT RegisterPK PRIMARY KEY (RegisterID)
) ENGINE=InnoDB;

CREATE TABLE Lager 
(
  LagerID VARCHAR(20) NOT NULL,
  Sted VARCHAR(20),
  HylleKapasitet INT(10),
  CONSTRAINT LagerID PRIMARY KEY (LagerID)
) ENGINE=InnoDB;

CREATE TABLE Vare 
(
  VareID VARCHAR(20) NOT NULL,
  Navn VARCHAR(20),
  EAN VARCHAR(30) NOT NULL,
  Pris INT (10),
  CONSTRAINT VarePK PRIMARY KEY (VareID)
) ENGINE=InnoDB;

CREATE TABLE Butikk
(
	ButikkID VARCHAR(16) NOT NULL,
	Adresse VARCHAR(50),
	Byen  VARCHAR(20),
	RegisterID VARCHAR(12) NOT NULL,
	AntallVarer INT(5),
	LagerID VARCHAR (10) NOT NULL,
	CONSTRAINT ButikkPK PRIMARY KEY (ButikkID),
	CONSTRAINT BRFK FOREIGN KEY (RegisterID) REFERENCES KundeRegister (RegisterID),
	CONSTRAINT BLFK FOREIGN KEY (LagerID) REFERENCES Lager (LagerID)
) ENGINE=InnoDB;

CREATE TABLE VareBeholdning
(
	VareID VARCHAR(20) NOT NULL,
	ButikkID VARCHAR(16) NOT NULL,
	CONSTRAINT VLPK PRIMARY KEY (VareID, ButikkID),
	CONSTRAINT VareFK FOREIGN KEY (VareID) REFERENCES Vare (VareID),
	CONSTRAINT ButikkFK FOREIGN KEY (ButikkID) REFERENCES Butikk (ButikkID)
) ENGINE=InnoDB;

 
INSERT INTO 
	Vare (VareID, Navn, EAN, Pris)
VALUES
	(58012483, "Mattang", 9334084001211, 59),
	(00244449, "Bakebolle", 8711269856506, 199),
	(00245257, "Vaksebolle", 8711269861098, 119),
	(00226442, "Drikkeflaske", 8711269909097, 119),
	(00220473, "Deigfat", 7318141167012, 89);

INSERT INTO 
	Lager (LagerID, Sted, HylleKapasitet)
VALUES
	(34073, "Oslo", 240),
	(61775, "Bergen", 550),
	(01212, "Lillehamer", 870),
	(61840, "Drammen", 250),
	(89558, "Asker", 100);

INSERT INTO 
	Kunde (KundeID, Navn, Etternavn)
VALUES
	(66942056, "Jeramy", "Settles" ),
	(27171330, "Helene","Chausse"),
	(77126302, "Leandra","Foltz"),
	(74788830, "Chad", "Fouts" ),
	(05923155, "Lennie","Luker" );

INSERT INTO 
	KundeRegister (RegisterID, Historikk, KundeID)
VALUES
	(64442, "Drikkeflaske", 66942056),
	(85801, "Bakebolle", 27171330),
	(76641, "Vaksebolle", 77126302),
	(18837, "Pulver", 74788830),
	(71832, "Deigfat", 05923155);
INSERT INTO 
	Butikk (ButikkID, Adresse, Byen, RegisterID, AntallVarer,LagerID)
VALUES
	(6092, "Sagadammen 211", "Oslo", 64442,  2555, 34073),
	(8605, "Søren Jaabæks gate 187", "Drammen", 85801,  679, 61775),
	(5575, "Bilittkroken 231", "Arendal", 76641,1023, 01212),
	(0063, "Seterliveien 18", "Kristiansand", 18837 ,251, 61840),
	(9562, "Pilotveien 36", "Lillestrøm", 71832 ,1334,89558);
INSERT INTO 
	VareBeholdning( VareID, ButikkID)
VALUES
	(58012483, 6092 ),
	(00244449, 8605 ),
	(00245257,  5575),
	(00226442, 5575 ),
	(00220473, 5575);