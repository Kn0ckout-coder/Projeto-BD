USE `Projeto`;

-- Functions
SELECT GetNomeEvento(1) AS NomedoEvento;
SELECT GetIdadeAtleta(1) AS IdadedoAtleta;
SELECT GetNumVitorias(2) AS NumeroDeVitorias;
SELECT GetMoradaEscola(1) AS MoradaDaEscola;
SELECT CalculateIMC(1) AS CalculoDoIMC;

-- Stats Functions
SELECT get_points_by_player_combined(2, '2023-01-01', '2023-12-31') AS PontosCombinados;
SELECT get_ranking_by_year(1, 2023) AS RankingPorVitórias;
SELECT get_games_by_player(2) AS CombatesPorAtleta;


-- Stored Procedures
CALL InserirNovoEvento('Campeonato Mundial', 'Ativo');
SELECT * FROM Evento ORDER BY idEvento DESC LIMIT 1;
CALL ListarAtletasPorEscola(1);
-- só dá até às 8 porque ha atletas sem escolas

-- Views
SELECT * FROM Atletas;
SELECT * FROM EventosAtivos;
SELECT * FROM ResultadosProvaRanking;
SELECT * FROM Escolas;
SELECT * FROM AtletasExperientes;
SELECT * FROM AtletasSemEscola;
