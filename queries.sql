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
        WHEN a.Atleta_idEscola IS NOT NULL THEN 'Federado'
        ELSE 'Casual'
    END AS tipoParticipante
FROM 
    Atleta a
LEFT JOIN 
    Atleta_has_Combate ac ON a.idAtleta = ac.AC_idAtleta
LEFT JOIN 
    Combate c ON ac.AC_idCombate = c.idCombate
LEFT JOIN 
    Evento e ON c.Combate_idEvento = e.idEvento
WHERE 
    e.idEvento IS NULL;




