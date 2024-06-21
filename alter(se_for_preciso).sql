ALTER TABLE `Atleta`
MODIFY COLUMN `Atleta_idCapitao` INT NULL,
MODIFY COLUMN `Atleta_idEscola` INT NULL,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`idAtleta`);

/*ALTER TABLE `Estatistica`
ADD CONSTRAINT `fk_Estatistica_Capitao`
FOREIGN KEY (`Estatistica_idCapitao`) 
REFERENCES `Atleta` (`Atleta_idCapitao`);*/
