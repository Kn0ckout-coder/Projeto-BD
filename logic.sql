/*Views **/
-- 1 - Atletas 
USE projeto;

CREATE VIEW Atletas AS

SELECT * FROM Atleta;

/*2- Eventos ativos**/

CREATE VIEW EventosAtivos AS

SELECT * FROM Evento WHERE estado = 'Ativo';

/*3- Lista de resultados de cada prova/evento com ranking das equipas**/

CREATE VIEW ResultadosProvaRanking AS

SELECT 
    e.nomeEvento,
    es.nome AS nomeEscola,
    GREATEST(SUM(st.numVitorias) - SUM(st.numDerrotas), 0) AS pontuacao
FROM 
    Evento e
JOIN 
    Combate c ON e.idEvento = c.Combate_idEvento
JOIN 
    Atleta_has_Combate ac ON c.idCombate = ac.AC_idCombate
JOIN 
    Atleta a ON ac.AC_idAtleta = a.idAtleta
JOIN 
    Escola es ON a.Atleta_idEscola = es.idEscola
JOIN 
    Estatistica st ON a.idAtleta = st.Estatistica_idAtleta
GROUP BY 
    e.nomeEvento, es.nome
ORDER BY 
    e.nomeEvento, pontuacao DESC;

/*3- Escolas**/
CREATE VIEW Escolas AS

SELECT * FROM Escola;

/*4-AteltasExperientes **/

CREATE VIEW AtletasExperientes AS
SELECT 
    a.nome AS NomeAtleta,
    a.idade AS IdadeAtleta,
    e.nome AS NomeEscola,
    c.nome AS NomeCapitao,
    es.numVitorias,
    es.numDerrotas,
    es.numCombates,
    es.anosExperiencia
FROM 
    Atleta a
LEFT JOIN 
    Escola e ON a.Atleta_idEscola = e.idEscola
LEFT JOIN 
    Capitaes c ON a.Atleta_idCapitao = c.idCapitao
LEFT JOIN 
    Estatistica es ON a.idAtleta = es.Estatistica_idAtleta
WHERE 
    es.anosExperiencia > 3;

/*5- Atletas sem escola**/

CREATE VIEW AtletasSemEscola AS
SELECT 
    a.nome AS NomeAtleta,
    a.idade AS IdadeAtleta,
    a.peso,
    a.altura
FROM 
    Atleta a
WHERE 
    a.Atleta_idEscola IS NULL;

/*Funções ---------- **/

/*1- Função para obter o nome de um evento dado o seu ID**/

DELIMITER //

CREATE FUNCTION GetNomeEvento(eventoID INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE nome_evento VARCHAR(255);
    SELECT nomeEvento INTO nome_evento FROM Evento WHERE idEvento = eventoID;
    RETURN nome_evento;
END //

DELIMITER ;

/*2-Função para obter a idade de um atleta dado o seu ID**/

DELIMITER //

CREATE FUNCTION GetIdadeAtleta(atletaID INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE idade_atleta INT;
    SELECT idade INTO idade_atleta FROM Atleta WHERE idAtleta = atletaID;
    RETURN idade_atleta;
END //

DELIMITER ;

/*3- Função para obter o número de vitórias de um atleta dado o seu ID**/

DELIMITER //

CREATE FUNCTION GetNumVitorias(atletaID INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE num_vitorias INT;
    SELECT numVitorias INTO num_vitorias FROM Estatistica WHERE Estatistica_idAtleta = atletaID;
    RETURN num_vitorias;
END //

DELIMITER ;

/*4-4. Função para obter a morada de uma escola dada o seu ID**/

DELIMITER //

CREATE FUNCTION GetMoradaEscola(escolaID INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE morada_escola VARCHAR(255);
    
    SELECT morada INTO morada_escola FROM Escola WHERE escolaID = idEscola;
    
    RETURN morada_escola;
END //

DELIMITER ;

/*5-Função para calcular o IMC de um atleta dado o seu ID**/
DELIMITER //

CREATE FUNCTION CalculateIMC(atletaID INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE peso DECIMAL(5,2);
    DECLARE altura DECIMAL(3,2);
    DECLARE imc DECIMAL(5,2);

    SELECT a.peso, a.altura INTO peso, altura
    FROM Atleta a
    WHERE a.idAtleta = atletaID;
    
    SET imc = peso / (altura * altura);
    RETURN imc;
END //

DELIMITER ;

/*stored procedures ---------- **/

/*1 - Stored Procedure para inserir um novo evento e o seu estado **/
DELIMITER // 

CREATE PROCEDURE InserirNovoEvento(
    IN p_nomeEvento VARCHAR(255),
    IN p_estado VARCHAR(50)
)
BEGIN
    INSERT INTO Evento (nomeEvento, estado)
    VALUES (p_nomeEvento, p_estado);
END //

DELIMITER ;

/*2 - Stored Procedure para listar atletas de uma determinada escola **/

DELIMITER //

CREATE PROCEDURE ListarAtletasPorEscola(
    IN p_idEscola INT
)
BEGIN
    SELECT 
        a.nome AS nomeAtleta,
        a.idade AS idadeAtleta,
        a.peso,
        a.altura
    FROM 
        Atleta a
    WHERE 
        a.Atleta_idEscola = p_idEscola;
END //

DELIMITER ;








