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

SELECT 
    c.nomeCombate,
    e.nomeEvento,
    m.nomeModalidade
FROM 
    Combate c
JOIN 
    Evento e ON c.Combate_idEvento = e.idEvento
JOIN 
    Modalidade m ON c.idCombate = m.Modalidade_idCombate
WHERE 
    m.nomeModalidade = 'Jiu-Jitsu';



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
       ROUND(AVG(a.peso), 2) AS peso_medio,
       ROUND(MIN(A.peso), 2) AS peso_minimo, 
       ROUND(MAX(A.peso), 2) AS peso_maximo, 
       ROUND(STDDEV(A.peso), 2) AS desvio_padrao_peso
FROM Atleta A
WHERE A.altura > 1.80 
GROUP BY A.altura;


-- Critério II: Estatísticas de peso para atletas com idade superior a 25 anos

SELECT A.idade,
       ROUND(AVG(A.peso), 2) AS peso_medio, 
       ROUND(MIN(A.peso),2 ) AS peso_minimo, 
       ROUND(MAX(A.peso), 2) AS peso_maximo, 
       ROUND(STDDEV(A.peso), 2) AS desvio_padrao_peso
FROM Atleta A
WHERE A.idade > 25
GROUP BY A.idade;

-- 6

-- Lista de resultados de cada prova/evento com ranking das equipas (e.g., classificação da equipa em cada prova/evento);

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

-- 7

-- Lista de participantes individuais que não participaram em qualquer prova de equipas, diferenciando participantes federados e profissionais, de participantes casuais (e.g., atleta amador sem estar associado
-- a uma entidade, clube ou federação desportiva);

SELECT 
    a.nome,
    a.idade,
    CASE
        WHEN a.Atleta_idEscola IS NOT NULL THEN 'Federado/Profissional'
        ELSE 'Casual'
    END AS tipoParticipante
FROM 
    Atleta a
LEFT JOIN 
    Atleta_has_Combate ac ON a.idAtleta = ac.AC_idAtleta
GROUP BY
    a.idAtleta;


-- 8
-- Lista dos elementos de uma equipa com identificação do role de cada elemento na prova/evento e respetiva características de cada elemento;

SELECT 
    'Capitão' AS Role,
    c.nome AS Nome,
    c.idade AS Idade,
    e.nome AS Escola,
    e.morada AS Morada,
    est.numVitorias AS Vitórias,
    est.numDerrotas AS Derrotas,
    est.numCombates AS Total_Combates,
    est.anosExperiencia AS Anos_Experiencia
FROM 
    Capitaes c
    JOIN Estatistica est ON c.idCapitao = est.Estatistica_idCapitao
    JOIN Escola e ON c.idCapitao = e.idEscola

UNION ALL

SELECT 
    'Treinador' AS Role,
    m.nome AS Nome,
    m.idade AS Idade,
    e.nome AS Escola,
    e.morada AS Morada,
    NULL AS Vitórias,
    NULL AS Derrotas,
    NULL AS Total_Combates,
    NULL AS Anos_Experiencia
FROM 
    Mister m
    JOIN Escola e ON m.Mister_idEscola = e.idEscola

UNION ALL -- Combinar os resultados das três consultas numa única tabela de resultados.

SELECT 
    'Atleta' AS Role,
    a.nome AS Nome,
    a.idade AS Idade,
    e.nome AS Escola,
    e.morada AS Morada,
    est.numVitorias AS Vitórias,
    est.numDerrotas AS Derrotas,
    est.numCombates AS Total_Combates,
    est.anosExperiencia AS Anos_Experiencia
FROM 
    Atleta a
    JOIN Estatistica est ON a.idAtleta = est.Estatistica_idAtleta
    JOIN Escola e ON a.Atleta_idEscola = e.idEscola;

-- 9
-- Top 5 das provas com maior número de participantes, agrupada por ano e tendo como base os últimos três anos bem como restrições relacionadas com 
-- faixa etária e categoria dos participantes (e.g., federado, profissional, amador);

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

-- 10
-- Consulta adicional recorrendo a, pelo menos, 3 tabelas;

SELECT 
    e.nomeEvento AS NomeEvento,
    c.nomeCombate AS NomeCombate,
    j.nomeJuri AS NomeJuri,
    c.data_combate AS DataCombate
FROM 
    Evento e
JOIN 
    Combate c ON e.idEvento = c.Combate_idEvento
JOIN 
    Juri j ON e.idEvento = j.idEvento
WHERE 
    e.estado = 'Ativo'
ORDER BY 
    e.nomeEvento, c.data_combate;
    
-- 11
-- Consulta adicional recorrendo a, pelo menos, 3 tabelas que inclua WHERE e HAVING;

SELECT
    A.nome AS NomeAtleta,
    COUNT(AC.AC_idCombate) AS TotalCombates,
    SUM(E.numVitorias) AS TotalVitorias,
    SUM(E.numDerrotas) AS TotalDerrotas
FROM
    Atleta A
INNER JOIN
    Atleta_has_Combate AC ON A.idAtleta = AC.AC_idAtleta
INNER JOIN
    Estatistica E ON A.idAtleta = E.Estatistica_idAtleta
WHERE
    E.numVitorias IS NOT NULL
GROUP BY
    A.idAtleta, A.nome
HAVING
    TotalCombates > 0
ORDER BY
    TotalCombates DESC;
    
-- 12
-- Consulta adicional usando descrições de dados existentes num relacionamento recursivo;

SELECT
    A.nome AS NomeAtleta,
    E.numVitorias AS TotalVitorias,
    E.numDerrotas AS TotalDerrotas
FROM
    Atleta A
INNER JOIN
    Estatistica E ON A.idAtleta = E.Estatistica_idAtleta
WHERE
    E.numVitorias IS NOT NULL
ORDER BY
    A.nome;
    
    
-- 13
-- Duas consultas adicionais utilizando dois tipos diferentes de subqueries.

-- Subquery Correlacionada -> uma ou mais colunas da consulta externa.

SELECT
    E.nome AS NomeEscola,
    ROUND(AVG(A.altura),2) AS MediaAlturaAtletas
FROM
    Escola E
INNER JOIN
    Atleta A ON E.idEscola = A.Atleta_idEscola
WHERE
    EXISTS (
        SELECT 1
        FROM Estatistica Est
        WHERE Est.Estatistica_idAtleta = A.idAtleta
    )
GROUP BY
    E.nome;

-- Subquery Escalar -> retorna um único valor e pode ser usada em qualquer lugar em que uma expressão escalar seja permitida dentro da consulta principal. 

SELECT
    E.nomeEvento AS NomeEvento,
    (
        SELECT COUNT(*)
        FROM Combate C
        WHERE C.Combate_idEvento = E.idEvento
    ) AS NumCombates
FROM
    Evento E
WHERE
    EXISTS (
        SELECT 1
        FROM Combate C
        WHERE C.Combate_idEvento = E.idEvento
    );


















