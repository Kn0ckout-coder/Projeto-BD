USE `Projeto`;

-- Functions
SELECT GetNomeEvento(1) AS NomedoEvento;
SELECT GetIdadeAtleta(1) AS IdadedoAtleta;
SELECT GetNumVitorias(2) AS NumeroDeVitorias;
SELECT GetMoradaEscola(1) AS MoradaDaEscola;
SELECT CalculateIMC(1) AS CalculoDoIMC;

-- Stored Procedures
CALL InserirNovoEvento('Campeonato Mundial', 'Ativo');
SELECT * FROM Evento ORDER BY idEvento DESC LIMIT 1;
CALL ListarAtletasPorEscola(1);
CALL ListarAtletasPorEscola(2);
CALL ListarAtletasPorEscola(3);
CALL ListarAtletasPorEscola(4);
CALL ListarAtletasPorEscola(5);
CALL ListarAtletasPorEscola(6);
CALL ListarAtletasPorEscola(7);
CALL ListarAtletasPorEscola(8);
-- Existem 9 atletas sem escola e há escolas que têm 2 atletas

-- Views
SELECT * FROM Atletas;
SELECT * FROM EventosAtivos;
SELECT * FROM ResultadosProvaRanking;
SELECT * FROM Escolas;
SELECT * FROM AtletasExperientes;
SELECT * FROM AtletasSemEscola;
