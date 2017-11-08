DROP SCHEMA IF EXISTS Butikk;
CREATE SCHEMA IF NOT EXISTS Butikk;
USE Butikk;

DROP TABLE IF EXISTS VareBeholdning;
DROP TABLE IF EXISTS Vare;
DROP TABLE IF EXISTS ButikkAnsatt;
DROP TABLE IF EXISTS KundeRegister;
DROP TABLE IF EXISTS Butikk;
DROP TABLE IF EXISTS Lager;


CREATE TABLE Lager 
(
  LagerID INT NOT NULL AUTO_INCREMENT,
  LagerSted VARCHAR(20),
  HylleKapasitet INT(10),
  CONSTRAINT LagerID PRIMARY KEY (LagerID)
) ENGINE=InnoDB;

CREATE TABLE Butikk
(
	ButikkID INT NOT NULL,
	ButikkAdresse VARCHAR(50),
	ButikkSted VARCHAR(20),
	AntallVarer VARCHAR(10),
    LagerID INT NOT NULL,
	CONSTRAINT ButikkPK PRIMARY KEY (ButikkID),
    CONSTRAINT LIFK FOREIGN KEY (LagerID) REFERENCES Lager (LagerID)
) ENGINE=InnoDB;


CREATE TABLE KundeRegister (
  KundeID INT NOT NULL,
  KundeNavn VARCHAR(20),
  KundeEtternavn VARCHAR(20),
  Historikk VARCHAR(20),
  ButikkID INT NOT NULL ,
  CONSTRAINT KundePK PRIMARY KEY (KundeID),
  CONSTRAINT BIFK FOREIGN KEY (ButikkID) REFERENCES Butikk(ButikkID)
) ENGINE=InnoDB;

CREATE TABLE ButikkAnsatt
(
  AnsattNummer INT NOT NULL,
  AnsattNavn VARCHAR(16) ,
  AnsattEtternavn VARCHAR(20) ,
  ButikkID INT NOT NULL,
  CONSTRAINT AnsattNummer PRIMARY KEY (AnsattNummer),
  CONSTRAINT ButikkIDFK FOREIGN KEY(ButikkID) REFERENCES Butikk(ButikkID)
) ENGINE=InnoDB;


CREATE TABLE Vare 
(
  VareID INT NOT NULL,
  Navn VARCHAR(20),
  EAN VARCHAR(30) NOT NULL,
  Pris double ,
  CONSTRAINT VarePK PRIMARY KEY (VareID)
) ENGINE=InnoDB;


CREATE TABLE VareBeholdning
(
	VareID INT NOT NULL,
	ButikkID INT NOT NULL,
    AntallVarer INT,
	CONSTRAINT VBPK PRIMARY KEY (VareID, ButikkID),
	CONSTRAINT VareFK FOREIGN KEY (VareID) REFERENCES Vare (VareID),
	CONSTRAINT ButikkFK FOREIGN KEY (ButikkID) REFERENCES Butikk (ButikkID)
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
	Butikk (ButikkID, ButikkAdresse, ButikkSted, AntallVarer, LagerID)
VALUES
	(6092, "Sagadammen 211", "Oslo",  2555, 34073),
	(8605, "Søren Jaabæks gate 187", "Drammen",  679, 61775),
	(5575, "Bilittkroken 231", "Drammen", 1023, 01212),
	(2263, "Seterliveien 18", "Kristiansand", 251, 61840),
	(9562, "Pilotveien 36", "Lillestrøm", 1334,89558),
	(7143, "Bålveien 54", "Oslo",  2555, 34073),
	(9180, "Regimentveien 100", "Oslo",  2555, 34073),
	(1256, "Brekkelia 58", "Oslo",  2555, 34073),
	(1629, "Veslekleiva 38", "Oslo",  2555, 34073),
	(5935, "Ribbunggata 38", "Drammen",  2555, 34073),
	(6459, "Gøteborggata 75", "Drammen",  2555, 34073),
	(5784, "Erlends vei 198", "Drammen",  2555, 34073),
	(6293, "Veitvetsvingen 219", "Kristiansand",  2555, 34073),
	(3061, "Granhekkveien 84", "Kristiansand",  2555, 34073),
	(7750, "Kjeld Stubs gate 74", "Kristiansand",  2555, 34073),
	(8726, "Ogmunds vei 231", "Lillestrøm",  2555, 34073),
	(4941, "Biermanns gate 196", "Lillestrøm",  2555, 34073),
	(3341, "Dalehaugen 58", "Oslo",  2555, 34073),
	(7904, "Abbedisvingen 41", "Oslo",  2555, 34073),
	(7473, "Colbjørnsens gate 236", "Oslo",  2555, 34073),
	(6029, "Høydalsveien 2", "Oslo",  2555, 34073);

 
 INSERT INTO 
	KundeRegister (KundeID, KundeNavn, KundeEtternavn, Historikk, ButikkID)
VALUES
	(66942056,"Jeramy", "Settles",  "Drikkeflaske", 6092 ),
	(27171330,  "Helene","Chausse",  "Bakebolle", 8605 ),
	(77126302, "Leandra","Foltz", "Vaksebolle",  5575),
	(74788830, "Chad", "Fouts" , "Pulver", 2263),
	(05923155, "Lennie","Luker", "Deigfat", 9562);

INSERT INTO 
	ButikkAnsatt (AnsattNummer, AnsattNavn, AnsattEtternavn, ButikkID)
VALUES
	(8887, "Helene","Akselsen ",6092 ),
	(8658, "Kristen","Strand",6092),
	(5704,"Edvin","Gulbrandsen",8605),
	(5581,"Andrea","Lange",8605 ),
	(7348,"Kristin","Dahl", 5575),
	(8794,"Charlotte","Andersen",5575),
	(6533,"Ketil","Adamsen",2263),
	(4572,"Emilia", "Sørensen", 2263),
	(1522,"Pernille ","Abramsen", 2263),
	(3482,"Erlend","Dahl", 9562);

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
	VareBeholdning( VareID, ButikkID, AntallVarer)
VALUES
	(58012483, 6092, 25),
	(00244449,  6092, 88),
	(00245257,  6029, 199),
	(00226442, 6029, 66),
	(00220473,  6029, 43),
	(58009127 , 6029,87),
	(58008881,  6029, 13),
	(31861200, 6029, 152 ),
	(58005275 , 6029,28),
	(58011288,  6029, 90),
	(15944721 , 6029, 89),
	(58012429,  6029, 56),
	(58015144,  6029, 21),
	(58015097, 6029, 93),
	(31059686,  6029, 92),
	(58012483, 6029, 25),
	(00244449,  6459, 88),
	(00245257,  6459, 199),
	(00226442, 6459, 66),
	(00220473,  6459, 43),
	(58009127 , 6459,87),
	(58008881,  6459, 13),
	(31861200, 6459, 152 ),
	(58005275 , 6459,28),
	(58011288,  6459, 90),
	(15944721 , 6459, 89),
	(58012429,  6459, 56),
	(58015144,  6459, 21),
	(58015097,  6459, 93),
	(31059686,  6459, 92),
	(58012483,6459, 25),
	(00244449,  7143, 88),
	(00245257,  7143, 199),
	(00226442, 7143, 66),
	(00220473,  7143, 43),
	(58009127 , 7143,87),
	(58008881,  7143, 13),
	(31861200, 7143, 152 ),
	(58005275 , 4941,28),
	(58011288,  4941, 90),
	(15944721 , 5784, 89),
	(58012429,  5784, 56),
	(58015144,  2263, 21),
	(58015097,  2263, 93),
	(31059686,  2263, 92);
