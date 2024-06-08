CREATE SCHEMA IF NOT EXISTS `Projeto` ;
USE `Projeto`;

-- -----------------------------------------------------
-- Table `Projeto`.`Capitaes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Capitaes` (
  `idCapitao` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`idCapitao`));


-- -----------------------------------------------------
-- Table `Projeto`.`Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Escola` (
  `idEscola` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `morada` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEscola`));


-- -----------------------------------------------------
-- Table `Projeto`.`Atleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Atleta` (
  `idAtleta` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `peso` FLOAT NOT NULL,
  `altura` FLOAT NOT NULL,
  `Atleta_idCapitao` INT NOT NULL,
  `Atleta_idEscola` INT NOT NULL,
  PRIMARY KEY (`idAtleta`, `Capitaes_idCapitao`, `Escola_idEscola`),
  CONSTRAINT `fk_Atleta_Capitaes1`
    FOREIGN KEY (`Atleta_idCapitao`)
    REFERENCES `Projeto`.`Capitaes` (`idCapitao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_Escola1`
    FOREIGN KEY (`Atleta_idEscola`)
    REFERENCES `Projeto`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Projeto`.`Mister`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Mister` (
  `idTreinador` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `Mister_idEscola` INT NOT NULL,
  PRIMARY KEY (`idTreinador`, `Mister_idEscola`),
  CONSTRAINT `fk_Mister_Escola1`
    FOREIGN KEY (`Mister_idEscola`)
    REFERENCES `Projeto`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Projeto`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Evento` (
  `idEvento` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeEvento` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEvento`));


-- -----------------------------------------------------
-- Table `Projeto`.`Combate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Combate` (
  `idCombate` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeCombate` VARCHAR(100) NOT NULL,
  `atletas` VARCHAR(100) NOT NULL,
  `Combate_idEvento` INT NOT NULL,
  PRIMARY KEY (`idCombate`, `Combate_idEvento`),
  CONSTRAINT `fk_Combate_Evento1`
    FOREIGN KEY (`Combate_idEvento`)
    REFERENCES `Projeto`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Projeto`.`Modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Modalidade` (
  `idModalidade` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeModalidade` VARCHAR(100) NOT NULL,
  `Modalidade_idCombate` INT NOT NULL,
  `Modalidade_idEvento` INT NOT NULL,
  PRIMARY KEY (`idModalidade`),
  CONSTRAINT `fk_Modalidade_Combate1`
    FOREIGN KEY (`Modalidade_idCombate`)
    REFERENCES `Combate` (`idCombate`),
    
    CONSTRAINT `fk_Modalidade_Evento`
    FOREIGN KEY (`Modalidade_idEvento`)
    REFERENCES `Evento` (`idEvento`)
   );


-- -----------------------------------------------------
-- Table `Projeto`.`Estatistica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Estatistica` (
  `idEstatistica` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `numVitorias` INT NOT NULL,
  `numDerrotas` INT NOT NULL,
  `numCombates` INT NOT NULL,
  `anosExperiencia` INT NOT NULL,
  `Estatistica_idAtleta` INT NOT NULL,
  `Estatistica_idCapitao` INT NOT NULL,
  `Estatistica_idEscola` INT NOT NULL,
  PRIMARY KEY (`idEstatistica`),
  CONSTRAINT `fk_Estatistica_Atleta1`
    FOREIGN KEY (`Estatistica_idAtleta` , `Estatistica_idCapitao` , `Estatistica_idEscola`)
    REFERENCES `Projeto`.`Atleta` (`idAtleta` , `Capitaes_idCapitao` , `Escola_idEscola`),
    
    CONSTRAINT `fk_Estatistica_Atleta1`
    FOREIGN KEY (`Estatistica_idAtleta` , `Estatistica_idCapitao` , `Estatistica_idEscola`)
    REFERENCES `Projeto`.`Atleta` (`idAtleta` , `Capitaes_idCapitao` , `Escola_idEscola`),
    
    CONSTRAINT `fk_Estatistica_Atleta1`
    FOREIGN KEY (`Estatistica_idAtleta` , `Estatistica_idCapitao` , `Estatistica_idEscola`)
    REFERENCES `Projeto`.`Atleta` (`idAtleta` , `Capitaes_idCapitao` , `Escola_idEscola`)
    
    

);


-- -----------------------------------------------------
-- Table `Projeto`.`Juri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Juri` (
  `idJuri` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeJuri` VARCHAR(100) NOT NULL,
  `idEvento` INT NOT NULL,
  PRIMARY KEY (`idJuri`));


-- -----------------------------------------------------
-- Table `Projeto`.`Atleta_has_Combate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Atleta_has_Combate` (
  `AC_idAtleta` INT NOT NULL,
  `AC_idCombate` INT NOT NULL,
  PRIMARY KEY (`AC_idAtleta`, `AC_idCombate`),
  CONSTRAINT `fk_Atleta_has_Combate_Atleta1`
    FOREIGN KEY (`AC_idAtleta`)
    REFERENCES `Projeto`.`Atleta` (`idAtleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_has_Combate_Combate1`
    FOREIGN KEY (`AC_idCombate`)
    REFERENCES `Projeto`.`Combate` (`idCombate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- acrescentar ID da tabela

-- -----------------------------------------------------
-- Table `Projeto`.`Juri_has_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Juri_has_Evento` (
  `Juri_idJuri` INT NOT NULL,
  `Evento_idEvento` INT NOT NULL,
  PRIMARY KEY (`Juri_idJuri`, `Evento_idEvento`),
  CONSTRAINT `fk_Juri_has_Evento_Juri1`
    FOREIGN KEY (`Juri_idJuri`)
    REFERENCES `Projeto`.`Juri` (`idJuri`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Juri_has_Evento_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `Projeto`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Projeto`.`Modalidade_has_Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto`.`Modalidade_has_Escola` (
  `Modalidade_idModalidade` INT NOT NULL,
  `Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`Modalidade_idModalidade`, `Escola_idEscola`),
  CONSTRAINT `fk_Modalidade_has_Escola_Modalidade1`
    FOREIGN KEY (`Modalidade_idModalidade`)
    REFERENCES `Projeto`.`Modalidade` (`idModalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modalidade_has_Escola_Escola1`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `Projeto`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
