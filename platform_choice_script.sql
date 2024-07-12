CREATE DATABASE choice_platform;
#
CREATE TABLE `choice_platform`.`user` (
  `iduser` VARCHAR(5) NOT NULL,
  `lastname` VARCHAR(25) NOT NULL,
  `firstname` VARCHAR(25) NOT NULL,
  `login` VARCHAR(25) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `role` ENUM('user', 'admin') NOT NULL,
  PRIMARY KEY (`iduser`));
#  
  ALTER TABLE `choice_platform`.`user` 
CHANGE COLUMN `iduser` `Iduser` VARCHAR(5) NOT NULL ;
#
CREATE TABLE `choice_platform`.`project` (
  `IdProject` VARCHAR(5) NOT NULL,
  `title` VARCHAR(25) NOT NULL,
  `description` VARCHAR(25) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `starrt_end` DATETIME NOT NULL,
  PRIMARY KEY (`IdProject`));
  
  ALTER TABLE `choice_platform`.`project` 
CHANGE COLUMN `starrt_end` `start_end` DATETIME NOT NULL ;
#
    CREATE TABLE `choice_platform`.`choice` (
  `IdChoice` VARCHAR(5) NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `IdProject` VARCHAR(5) NULL,
  PRIMARY KEY (`IdChoice`),
  INDEX `IdProject_idx` (`IdProject` ASC) VISIBLE,
  CONSTRAINT `IdProject`
    FOREIGN KEY (`IdProject`)
    REFERENCES `choice_platform`.`project` (`IdProject`)
    ON DELETE SET NULL
    ON UPDATE SET NULL);
#
CREATE TABLE `choice_platform`.`group` (
  `IdGroup` INT NOT NULL,
  `IdProject` VARCHAR(5) NULL);

#
ALTER TABLE `choice_platform`.`group` 
CHANGE COLUMN `IdGroup` `IdGroup` VARCHAR(5) NOT NULL ,
ADD PRIMARY KEY (`IdGroup`);
;

#

ALTER TABLE `choice_platform`.`assignment` 
ADD COLUMN `IdChoice` VARCHAR(5) NOT NULL AFTER `IdGroup`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`IdGroup`, `IdChoice`),
ADD INDEX `IdChoice_idx` (`IdChoice` ASC) VISIBLE;
;
ALTER TABLE `choice_platform`.`assignment` 
ADD CONSTRAINT `IdChoice`
  FOREIGN KEY (`IdChoice`)
  REFERENCES `choice_platform`.`choice` (`IdChoice`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#

ALTER TABLE `choice_platform`.`user` 
CHANGE COLUMN `Iduser` `IdUser` VARCHAR(5) NOT NULL ;
