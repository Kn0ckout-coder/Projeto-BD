DELIMITER //

CREATE PROCEDURE InserirAtleta(
    IN p_nome VARCHAR(100),
    IN p_idade INT,
    IN p_peso FLOAT,
    IN p_altura FLOAT,
    IN p_Atleta_idCapitao INT,
    IN p_Atleta_idEscola INT
)
BEGIN
    INSERT INTO Atleta (nome, idade, peso, altura, Atleta_idCapitao, Atleta_idEscola)
    VALUES (p_nome, p_idade, p_peso, p_altura, p_Atleta_idCapitao, p_Atleta_idEscola);
END //

DELIMITER ;

-- Exemplo de chamada do Stored Procedure para inserir um atleta
CALL InserirAtleta('João Silva', 25, 70.5, 1.75, 1, 1);



