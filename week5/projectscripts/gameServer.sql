CREATE DATABASE monster_battle /*!40100 DEFAULT CHARACTER SET latin1 */;

DROP TABLE IF EXISTS monster_battle.monster_data;
CREATE TABLE  monster_battle.monster_data (
  mobid int(10) unsigned NOT NULL AUTO_INCREMENT,
  mob_level int(10) unsigned NOT NULL,
  hp int(10) unsigned NOT NULL,
  mp int(10) unsigned NOT NULL,
  physical_attack int(10) unsigned NOT NULL,
  physical_defense int(10) unsigned NOT NULL,
  magic_attack int(10) unsigned NOT NULL,
  magic_defense int(10) unsigned NOT NULL,
  experience int(10) unsigned NOT NULL,
  accuracy int(10) unsigned NOT NULL,
  avoidability int(10) unsigned NOT NULL,
  speed int(10) NOT NULL,
  ice_resistance int(10) unsigned NOT NULL,
  fire_resistance int(10) unsigned NOT NULL,
  poison_resistance int(10) unsigned NOT NULL,
  lightning_resistance int(10) unsigned NOT NULL,
  holy_resistance int(10) unsigned NOT NULL,
  darkness_resistance int(10) unsigned NOT NULL,
  attack_type varchar(45) NOT NULL,
  special varchar(45) NOT NULL,
  PRIMARY KEY (mobid)
) ENGINE=InnoDB AUTO_INCREMENT=9990082 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS monster_battle.user_data;
CREATE TABLE  monster_battle.user_data (
  userid int(10) unsigned NOT NULL,
  user_level int(10) unsigned NOT NULL,
  user_exp int(10) unsigned NOT NULL,
  power int(10) unsigned NOT NULL,
  PRIMARY KEY (userid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS monster_battle.user_monster_data;
CREATE TABLE  monster_battle.user_monster_data (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL,
  monster_id int(10) unsigned NOT NULL,
  monster_level int(10) unsigned NOT NULL,
  monster_exp int(10) unsigned NOT NULL,
  monster_position int(10) unsigned NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=7851 DEFAULT CHARSET=latin1;
thats my game