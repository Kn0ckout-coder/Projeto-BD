SET FOREIGN_KEY_CHECKS=0;
CREATE SCHEMA IF NOT EXISTS `Projeto`;
USE `Projeto`;

-- -----------------------------------------------------
-- Table `Projeto`.`Capitaes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Capitaes` (
  `idCapitao` INT AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`idCapitao`));


-- -----------------------------------------------------
-- Table `Projeto`.`Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola` (
  `idEscola` INT AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `morada` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEscola`));


-- -----------------------------------------------------
-- Table `Projeto`.`Atleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Atleta` (
  `idAtleta` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `peso` FLOAT NOT NULL,
  `altura` FLOAT NOT NULL,
  `Atleta_idCapitao` INT NULL,
  `Atleta_idEscola` INT NULL,
  PRIMARY KEY (`idAtleta`),
  CONSTRAINT `fk_Atleta_Capitaes`
    FOREIGN KEY (`Atleta_idCapitao`)
    REFERENCES `Capitaes` (`idCapitao`),
    
  CONSTRAINT `fk_Atleta_Escola`
    FOREIGN KEY (`Atleta_idEscola`)
    REFERENCES `Escola` (`idEscola`)
);

describe atleta;


-- -----------------------------------------------------
-- Table `Projeto`.`Mister`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mister` (
  `idTreinador` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `Mister_idEscola` INT NOT NULL,
  PRIMARY KEY (`idTreinador`, `Mister_idEscola`),
  CONSTRAINT `fk_Mister_Escola`
    FOREIGN KEY (`Mister_idEscola`)
    REFERENCES `Escola` (`idEscola`)
);


-- -----------------------------------------------------
-- Table `Projeto`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Evento` (
  `idEvento` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeEvento` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEvento`));


-- -----------------------------------------------------
-- Table `Projeto`.`Combate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Combate` (
  `idCombate` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeCombate` VARCHAR(100) NOT NULL,
  `atletas` VARCHAR(100) NOT NULL,
  `data_combate` date NOT NULL,
  `Combate_idEvento` INT NOT NULL,
  PRIMARY KEY (`idCombate`, `Combate_idEvento`),
  
  CONSTRAINT `fk_Combate_Evento`
    FOREIGN KEY (`Combate_idEvento`)
    REFERENCES `Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `Projeto`.`Modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modalidade` (
  `idModalidade` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeModalidade` VARCHAR(100) NOT NULL,
  `Modalidade_idCombate` INT NOT NULL,
  `Modalidade_idEvento` INT NOT NULL,
  PRIMARY KEY (`idModalidade`),
  CONSTRAINT `fk_Modalidade_Combate`
    FOREIGN KEY (`Modalidade_idCombate`)
    REFERENCES `Combate` (`idCombate`),
    
    CONSTRAINT `fk_Modalidade_Evento`
    FOREIGN KEY (`Modalidade_idEvento`)
    REFERENCES `Evento` (`idEvento`)
   );


-- -----------------------------------------------------
-- Table `Projeto`.`Estatistica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Estatistica` (
  `idEstatistica` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `numVitorias` INT NULL,
  `numDerrotas` INT NULL,
  `numCombates` INT NULL,
  `anosExperiencia` INT NULL,
  `Estatistica_idAtleta` INT NULL,
  `Estatistica_idCapitao` INT NULL,
  `Estatistica_idEscola` INT NULL,
  PRIMARY KEY (`idEstatistica`),
  CONSTRAINT `fk_Estatistica_Atleta`
    FOREIGN KEY (`Estatistica_idAtleta`)
    REFERENCES `Atleta` (`idAtleta`),
    
  CONSTRAINT `fk_Estatistica_Capitao`
    FOREIGN KEY (`Estatistica_idCapitao`)
    REFERENCES `Atleta` (`Atleta_idCapitao`),
    
  CONSTRAINT `fk_Estatistica_Escola`
    FOREIGN KEY (`Estatistica_idEscola`)
    REFERENCES `Atleta` (`Atleta_idEscola`)
);


-- -----------------------------------------------------
-- Table `Projeto`.`Juri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juri` (
  `idJuri` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `nomeJuri` VARCHAR(100) NOT NULL,
  `idEvento` INT NOT NULL,
  PRIMARY KEY (`idJuri`));


-- -----------------------------------------------------
-- Table `Projeto`.`Atleta_has_Combate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Atleta_has_Combate` (
  `id_AC` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `AC_idAtleta` INT NOT NULL,
  `AC_idCombate` INT NOT NULL,
  PRIMARY KEY (`id_AC`, `AC_idAtleta`, `AC_idCombate`),
  
  CONSTRAINT `fk_Atleta_has_Combate_Atleta1`
    FOREIGN KEY (`AC_idAtleta`)
    REFERENCES `Atleta` (`idAtleta`),
  CONSTRAINT `fk_Atleta_has_Combate_Combate`
    FOREIGN KEY (`AC_idCombate`)
    REFERENCES `Combate` (`idCombate`)
);

-- -----------------------------------------------------
-- Table `Projeto`.`Juri_has_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juri_has_Evento` (
  `id_JC` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `JC_idJuri` INT NOT NULL,
  `JC_idEvento` INT NOT NULL,
  PRIMARY KEY (`id_JC`, `JC_idJuri`, `JC_idEvento`),
  CONSTRAINT `fk_Juri_has_Evento_Juri`
    FOREIGN KEY (`JC_idJuri`)
    REFERENCES `Juri` (`idJuri`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Juri_has_Evento_Evento`
    FOREIGN KEY (`JC_idEvento`)
    REFERENCES `Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `Projeto`.`Modalidade_has_Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modalidade_has_Escola` (
  `id_MA` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `MA_idModalidade` INT NOT NULL,
  `MA_idEscola` INT NOT NULL,
  PRIMARY KEY (`id_MA` ,`MA_idModalidade`, `MA_idEscola`),
  CONSTRAINT `fk_Modalidade_has_Escola_Modalidade`
    FOREIGN KEY (`MA_idModalidade`)
    REFERENCES `Modalidade` (`idModalidade`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Modalidade_has_Escola_Escola`
    FOREIGN KEY (`MA_idEscola`)
    REFERENCES `Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
