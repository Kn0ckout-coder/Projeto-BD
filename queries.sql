-- 1
-- Critério I: Atletas com idade menor que 25 anos

SELECT * FROM Atleta WHERE idade < 25;

-- Critério II: Atletas com peso superior a 75 kg

SELECT * FROM Atleta WHERE peso > 75;


-- 2 
-- Critério I: Escolas com atletas a pesar mais do que 70kg

SELECT E.nome AS nome_escola, A.nome AS nome, A.peso AS peso
FROM Escola E
JOIN Atleta A ON E.idEscola = A.Atleta_idEscola
WHERE A.peso > 70
GROUP BY E.nome;


-- Critério II: Escolas com atletas que têm 30 anos ou mais

SELECT E.nome AS nome_escola, A.nome AS nome_atleta, A.idade
FROM Escola E
JOIN Atleta A ON E.idEscola = A.Atleta_idEscola
WHERE A.idade >= 30;


-- 3
-- Critério I: Combates de um evento específico

SELECT * FROM Combate WHERE Combate_idEvento = 1;

-- Critério II: Combates de Eventos de Jiu-Jitsu

SELECT C.nomeCombate, C.ativo, C.atletas AS total_atletas
FROM Combate C
JOIN Atleta_has_Combate AC ON C.idCombate = AC.AC_idCombate
JOIN Atleta A ON AC.AC_idAtleta = A.idAtleta
GROUP BY C.nomeCombate
HAVING COUNT(A.idAtleta) > 2;


-- 4
-- Critério I: Eventos ativos

SELECT * FROM Evento WHERE estado = 'Ativo';

-- Critério II: Eventos com resultados disponíveis

SELECT E.nomeEvento, COUNT(*) AS total_combates
FROM Evento E
JOIN Combate C ON E.idEvento = C.Combate_idEvento
GROUP BY E.nomeEvento;


-- 5
-- Critério I: Estatísticas de peso para atletas com altura superior a um valor específico

SELECT A.altura,
       AVG(A.peso) AS peso_medio, 
       MIN(A.peso) AS peso_minimo, 
       MAX(A.peso) AS peso_maximo, 
       STDDEV(A.peso) AS desvio_padrao_peso
FROM Atleta A
WHERE A.altura > 1.80 
GROUP BY A.altura;


-- Critério II: Estatísticas de peso para atletas com idade superior a 25 anos

SELECT A.idade,
       AVG(A.peso) AS peso_medio, 
       MIN(A.peso) AS peso_minimo, 
       MAX(A.peso) AS peso_maximo, 
       STDDEV(A.peso) AS desvio_padrao_peso
FROM Atleta A
WHERE A.idade > 25
GROUP BY A.idade;

