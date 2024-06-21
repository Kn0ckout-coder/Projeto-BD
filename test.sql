CREATE SCHEMA IF NOT EXISTS `Projeto`;
USE `Projeto`;

CREATE TABLE IF NOT EXISTS Evento (
    idEvento INT AUTO_INCREMENT PRIMARY KEY,
    nomeEvento VARCHAR(255) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Combate (
    idCombate INT AUTO_INCREMENT PRIMARY KEY,
    nomeCombate VARCHAR(255) NOT NULL,
    atletas VARCHAR(255) NOT NULL,
    data_combate DATE NOT NULL,
    Combate_idEvento INT,
    FOREIGN KEY (Combate_idEvento) REFERENCES Evento(idEvento)
);

CREATE TABLE IF NOT EXISTS Atleta (
    idAtleta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    altura DECIMAL(4,2) NOT NULL,
    Atleta_idCapitao INT,
    Atleta_idEscola INT
);

CREATE TABLE IF NOT EXISTS Atleta_has_Combate (
    AC_idAtleta INT,
    AC_idCombate INT,
    PRIMARY KEY (AC_idAtleta, AC_idCombate),
    FOREIGN KEY (AC_idAtleta) REFERENCES Atleta(idAtleta),
    FOREIGN KEY (AC_idCombate) REFERENCES Combate(idCombate)
);

CREATE TABLE IF NOT EXISTS Estatistica (
    idEstatistica INT AUTO_INCREMENT PRIMARY KEY,
    numVitorias INT,
    numDerrotas INT,
    numCombates INT,
    anosExperiencia INT,
    Estatistica_idAtleta INT,
    Estatistica_idCapitao INT,
    Estatistica_idEscola INT,
    FOREIGN KEY (Estatistica_idAtleta) REFERENCES Atleta(idAtleta)
);

-- Inserção de dados de teste

INSERT INTO Evento (nomeEvento, estado) VALUES
('Campeonato Nacional', 'Ativo'),
('Campeonato de Verão', 'Ativo');

INSERT INTO Atleta (nome, idade, peso, altura, Atleta_idCapitao, Atleta_idEscola) VALUES
('Carlos Santos', 30, 68.2, 1.80, 1, 1),
('Miguel Pereira', 28, 75.3, 1.78, 2, 1),
('Ricardo Martins', 26, 73.0, 1.77, 4, 3),
('André Rodrigues', 27, 74.5, 1.76, 6, 2),
('Fernando Almeida', 29, 76.2, 1.79, 7, 4),
('José Sousa', 20, 67.5, 1.84, 8, 3),
('Manuel Dias', 22, 68.3, 1.80, 9, 2),
('Bruno Gomes', 30, 72.4, 1.82, 11, 5),
('Henrique Pinto', 21, 69.8, 1.81, 12, 6),
('António Marques', 23, 71.9, 1.83, 14, 7),
('Rodrigo Ramos', 20, 67.7, 1.84, 16, 8);

INSERT INTO Combate (nomeCombate, atletas, data_combate, Combate_idEvento) VALUES
('Combate 1', 'Carlos Santos vs Miguel Pereira', '2023-04-15', 1),
('Combate 2', 'Ricardo Martins vs André Rodrigues', '2023-07-28', 1),
('Combate 3', 'Fernando Almeida vs José Sousa', '2023-09-19', 2),
('Combate 4', 'Manuel Dias vs Bruno Gomes', '2023-06-07', 2),
('Combate 5', 'Henrique Pinto vs António Marques', '2023-10-05', 2),
('Combate 6', 'Rodrigo Ramos vs Carlos Santos', '2023-11-12', 1);

INSERT INTO Atleta_has_Combate (AC_idAtleta, AC_idCombate) VALUES
(1, 1), (2, 1),
(3, 2), (4, 2),
(5, 3), (6, 3),
(7, 4), (8, 4),
(9, 5), (10, 5),
(11, 6), (1, 6);

INSERT INTO Estatistica (numVitorias, numDerrotas, numCombates, anosExperiencia, Estatistica_idAtleta, Estatistica_idCapitao, Estatistica_idEscola) VALUES
(3, 1, 4, 5, 1, NULL, NULL),
(4, 2, 6, 3, 2, NULL, NULL),
(5, 1, 6, 7, 3, NULL, NULL),
(2, 2, 4, 4, 4, NULL, NULL),
(6, 0, 6, 8, 5, NULL, NULL),
(1, 3, 4, 2, 6, NULL, NULL),
(2, 2, 4, 3, 7, NULL, NULL),
(0, 4, 4, 1, 8, NULL, NULL),
(3, 1, 4, 4, 9, NULL, NULL),
(1, 3, 4, 2, 10, NULL, NULL),
(2, 2, 4, 3, 11, NULL, NULL);


-- Consulta para mostrar o número de participantes por evento e ano
SELECT
    e.nomeEvento AS Evento,
    YEAR(c.data_combate) AS Ano,
    COUNT(DISTINCT ac.AC_idAtleta) AS Numero_Participantes
FROM
    Evento e
    JOIN Combate c ON e.idEvento = c.Combate_idEvento
    JOIN Atleta_has_Combate ac ON c.idCombate = ac.AC_idCombate
    JOIN Atleta a ON ac.AC_idAtleta = a.idAtleta
WHERE
    e.estado = 'Ativo' 
    AND YEAR(c.data_combate) >= YEAR(CURRENT_DATE) - 2
GROUP BY
    e.nomeEvento, YEAR(c.data_combate)
ORDER BY
    Numero_Participantes DESC
LIMIT 5;

-- Teste de integridade e restrições, tentar inserir um atleta inexistente em um combate

INSERT INTO Atleta_has_Combate (AC_idAtleta, AC_idCombate) VALUES (99, 1);