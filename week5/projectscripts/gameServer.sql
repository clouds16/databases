
DROP DATABASE IF EXISTS GameDB;
CREATE DATABASE GameDB

DROP TABLE IF EXISTS UserAccount;
CREATE TABLE UserAccount(
	AccountID INT NOT NULL,
	UserName varchar(255) NOT NULL,
	FName varchar(255) NOT NULL,
	LName varchar(255) NOT NULL ,
	Email varchar(255) NOT NULL,
	UserPassword varchar(255) NOT NULL,
	CharacterID int NOT NULL,
	CharacterName varchar(255),
	ServerRegionID int NOT NULL,
	ServerRegionName varchar(50) NOT NULL,
	PRIMARY KEY (AccountID )
	/*FOREIGN KEY (CharacterID) REFERENCES UserCharacter(PersonID) */
	)


DROP TABLE IF EXISTS UserCharacter;
CREATE TABLE UserCharacter (
	CharacterID int not null ,
  CharacterName varchar(255) NOT NULL, 
  PlayerLevel INT NOT NULL,
  AttackDamage INT NOT NULL,
  Health int NOT NULL,
  Mana int NOT NULL,
  AbilityID INT NOT NULL,
  ItemID INT NOT NUll,


	PRIMARY KEY (CharacterID)
  /*FOREIGN KEY (AbilityID) REFERENCES Abilities,
  FOREIGN KEY (ItemID)  REFERENCES Items*/
	)


DROP TABLE IF EXISTS Enemies ;
CREATE TABLE Enemies(
  
  EnemyID INT NOT NULL,
  EnemyName varchar(255) NOT NULL, 
  EnemyLevel int NOT NULL,
  EnemyAttackDamage int NOT NULL,
  EnemyHealth int NOT NULL,
  EnemyMana int NOT NULL, 
  ItemID int NOT NULL,	
  AbilityID int NOT NULL, 

  PRIMARY KEY (EnemyID),
  /*FOREIGN KEY (ItemID) REFERENCES Items,
  FOREIGN KEY (AbilityID) REFERENCES (Abilities)*/ 
);

DROP TABLE IF EXISTS Items ;
CREATE TABLE Items ( 
  ItemID int NOT NULL,
  ItemName varchar(255) NOT NULL,
  LocationID int NOT Null, 
  Damage int NOT NULL,
  StatusEffect varchar(255) ,
  ItemStrenght int NOT NULL,

  PRIMARY KEY (ItemID), 
  /*FOREIGN KEY (LocationID ) REFERENCES Map*/
)



DROP TABLE IF EXISTS Abilities ;
CREATE TABLE Abilities ( 
  AbilityID int NOT NULL,
  AbilityName varchar(255) NOT NULL,
  Damage int NOT NULL,
  StatusEffect varchar(255) ,
  DamagePerLevel int NOT NULL,

  PRIMARY KEY (AbilityID)
)

