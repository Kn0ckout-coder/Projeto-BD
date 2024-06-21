use projeto;

INSERT INTO `Capitaes` (`nome`, `idade`) VALUES
('João Silva', 35),
('Carlos Santos', 30),
('Miguel Pereira', 32),
('Pedro Costa', 29),
('Ricardo Martins', 34),
('Luís Oliveira', 31),
('André Rodrigues', 28),
('Tiago Fernandes', 33),
('Fernando Almeida', 36),
('José Sousa', 30),
('Paulo Ribeiro', 27),
('Manuel Dias', 32),
('Rui Lopes', 29),
('Bruno Gomes', 34),
('Guilherme Lima', 31),
('Henrique Pinto', 28),
('Fábio Monteiro', 35),
('António Marques', 30),
('Eduardo Carvalho', 32),
('Rodrigo Ramos', 29);

INSERT INTO `Escola` (`nome`, `morada`) VALUES
('Academia de Luta Dragão', 'Rua da Rotunda Nº19'),
('Centro de Artes Marciais Phoenix', 'Avenida das Flores Nº22'),
('Escola de Boxe Gladiador', 'Rua do Sol Nº5'),
('Academia de Jiu-Jitsu Samurai', 'Travessa do Mercado Nº3'),
('Centro de Treinamento Spartacus', 'Largo da Praça Nº7'),
('Academia de Muay Thai Leão', 'Rua do Parque Nº12'),
('Escola de Karate Tigre', 'Rua das Palmeiras Nº21'),
('Academia de Taekwondo Águia', 'Avenida da Liberdade Nº45'),
('Centro de Capoeira Capoeira Brasil', 'Rua da Esperança Nº10'),
('Escola de Judô Seikou', 'Rua do Comércio Nº8'),
('Academia de Kickboxing Fênix', 'Rua das Acácias Nº14'),
('Centro de MMA Guerreiro', 'Rua do Limoeiro Nº17'),
('Escola de Wrestling Tormenta', 'Rua das Laranjeiras Nº2'),
('Academia de Kung Fu Dragão Negro', 'Rua dos Pescadores Nº13'),
('Centro de Treinamento Gracie', 'Rua do Mar Nº9'),
('Escola de Sambo Estrela', 'Avenida dos Campos Nº6'),
('Academia de Krav Maga Defender', 'Rua da Ponte Nº23'),
('Centro de Luta Livre Impacto', 'Rua da Várzea Nº11'),
('Escola de Hapkido Tigre Branco', 'Rua das Fontes Nº4'),
('Academia de Boxe Ferro', 'Rua da Estação Nº18');

INSERT INTO `Mister` (`nome`, `idade`, `Mister_idEscola`) VALUES
('José Mourinho', 57, 1),
('Pep Guardiola', 49, 2),
('Jurgen Klopp', 53, 3),
('Zinedine Zidane', 48, 4),
('Diego Simeone', 50, 5),
('Carlo Ancelotti', 61, 6),
('Mauricio Pochettino', 48, 7),
('Antonio Conte', 51, 8),
('Thomas Tuchel', 47, 9),
('Mikel Arteta', 38, 10),
('Brendan Rodgers', 48, 11),
('Ralph Hasenhüttl', 53, 12),
('Nuno Espírito Santo', 46, 13),
('Marcelo Bielsa', 65, 14),
('Julian Nagelsmann', 33, 15),
('Ole Gunnar Solskjaer', 47, 16),
('Steven Gerrard', 40, 17),
('Frank Lampard', 42, 18),
('Paulo Fonseca', 47, 19),
('David Moyes', 57, 20);

INSERT INTO `Atleta` (`nome`, `idade`, `peso`, `altura`, `Atleta_idCapitao`, `Atleta_idEscola`) VALUES
('João Silva', 25, 70.5, 1.75, NULL, NULL), 
('Carlos Santos', 30, 68.2, 1.80, 1, 1), 
('Miguel Pereira', 28, 75.3, 1.78, 2, 1), 
('Pedro Costa', 24, 72.1, 1.82, NULL, NULL), 
('Ricardo Martins', 26, 73.0, 1.77, 4, 3), 
('Luís Oliveira', 21, 69.4, 1.81, NULL, NULL), 
('André Rodrigues', 27, 74.5, 1.76, 6, 2), 
('Tiago Fernandes', 23, 71.8, 1.83, NULL, NULL), 
('Fernando Almeida', 29, 76.2, 1.79, 7, 4), 
('José Sousa', 20, 67.5, 1.84, 8, 3), 
('Paulo Ribeiro', 25, 70.9, 1.75, NULL, NULL), 
('Manuel Dias', 22, 68.3, 1.80, 9, 2), 
('Rui Lopes', 28, 75.1, 1.78, NULL, NULL), 
('Bruno Gomes', 30, 72.4, 1.82, 11, 5), 
('Guilherme Lima', 26, 73.5, 1.77, NULL, NULL), 
('Henrique Pinto', 21, 69.8, 1.81, 12, 6), 
('Fábio Monteiro', 27, 74.6, 1.76, NULL, NULL), 
('António Marques', 23, 71.9, 1.83, 14, 7), 
('Eduardo Carvalho', 29, 76.3, 1.79, NULL, NULL), 
('Rodrigo Ramos', 20, 67.7, 1.84, 16, 8); 

INSERT INTO `Evento` (`nomeEvento`, `estado`) VALUES
('Campeonato Nacional', 'Ativo'),
('Torneio de Verão', 'Ativo'),
('Copa Primavera', 'Inativo'),
('Campeonato Regional', 'Ativo'),
('Taça de Inverno', 'Inativo'),
('Festival de Artes Marciais', 'Ativo'),
('Torneio de Outono', 'Inativo'),
('Desafio de Campeões', 'Ativo'),
('Copa de Verão', 'Inativo'),
('Torneio Internacional', 'Ativo'),
('Liga dos Campeões', 'Inativo'),
('Taça dos Campeões', 'Inativo'),
('Desafio de Inverno', 'Inativo'),
('Campeonato de Verão', 'Ativo'),
('Torneio de Artes Marciais', 'Inativo'),
('Copa de Outono', 'Ativo'),
('Campeonato Internacional', 'Inativo'),
('Festival de Verão', 'Ativo'),
('Taça Primavera', 'Inativo'),
('Copa dos Campeões', 'Ativo');

INSERT INTO `Combate` (`nomeCombate`, `atletas`, `data_combate`, `Combate_idEvento`) VALUES
('Combate 1', 'Carlos Santos vs Miguel Pereira', '2023-04-15', 1),
('Combate 2', 'Ricardo Martins vs André Rodrigues', '2022-07-28', 1),
('Combate 3', 'Fernando Almeida vs José Sousa', '2022-11-03', 2),
('Combate 4', 'Manuel Dias vs Bruno Gomes', '2023-09-19', 2),
('Combate 5', 'Henrique Pinto vs António Marques', '2022-12-30', 4),
('Combate 6', 'Rodrigo Ramos vs José Sousa', '2023-06-07', 4),
('Combate 7', 'Carlos Santos vs Ricardo Martins', '2022-08-21', 4),
('Combate 8', 'Fernando Almeida vs Manuel Dias', '2022-10-11', 6),
('Combate 9', 'Henrique Pinto vs Rodrigo Ramos', '2023-01-25', 8),
('Combate 10', 'Miguel Pereira vs André Rodrigues', '2023-05-14', 8),
('Combate 11', 'José Sousa vs Bruno Gomes', '2022-09-07', 10),
('Combate 12', 'António Marques vs Carlos Santos', '2023-02-18', 10),
('Combate 13', 'Rodrigo Ramos vs Fernando Almeida', '2023-07-03', 14),
('Combate 14', 'Henrique Pinto vs Miguel Pereira', '2022-12-10', 14),
('Combate 15', 'José Sousa vs Manuel Dias', '2023-04-22', 16),
('Combate 16', 'Bruno Gomes vs António Marques', '2023-08-02', 16),
('Combate 17', 'Ricardo Martins vs Henrique Pinto', '2023-01-14', 6),
('Combate 18', 'André Rodrigues vs Miguel Pereira', '2023-06-29', 14),
('Combate 19', 'Carlos Santos vs José Sousa', '2022-10-05', 20),
('Combate 20', 'António Marques vs Ricardo Martins', '2023-03-11', 1);

INSERT INTO `Modalidade` (`nomeModalidade`, `Modalidade_idCombate`, `Modalidade_idEvento`) VALUES
('Boxe', 1, 1),
('Jiu-Jitsu', 2, 1),
('Muay Thai', 3, 2),
('Karate', 4, 2),
('Taekwondo', 5, 4),
('Capoeira', 6, 4),
('Judô', 7, 6),
('Kickboxing', 8, 6),
('MMA', 9, 8),
('Wrestling', 10, 8),
('Kung Fu', 11, 10),
('Sambo', 12, 10),
('Krav Maga', 13, 14),
('Luta Livre', 14, 14),
('Hapkido', 15, 16),
('Boxe', 16, 16),
('Jiu-Jitsu', 17, 18),
('Muay Thai', 18, 18),
('Karate', 19, 20),
('Taekwondo', 20, 20);

INSERT INTO `Estatistica` (`numVitorias`, `numDerrotas`, `numCombates`, `anosExperiencia`, `Estatistica_idAtleta`, `Estatistica_idCapitao`, `Estatistica_idEscola`) VALUES
(NULL, NULL, NULL, 3, 1, NULL, NULL),
(3, 3, 6, 2, 2, 2, 2),
(6, 1, 7, 4, 3, 3, 3),
(NULL, NULL, NULL, 3, 4, NULL, NULL),
(5, 3, 8, 5, 5, 5, 5),
(NULL, NULL, NULL, 1, 6, NULL, NULL),
(6, 2, 8, 4, 7, 7, 7),
(NULL, NULL, NULL, 2, 8, NULL, NULL),
(5, 2, 7, 3, 9, 9, 9),
(3, 3, 6, 2, 10, 10, 10),
(NULL, NULL, NULL, 4, 11, NULL, NULL),
(4, 2, 6, 3, 12, 12, 12),
(NULL, NULL, NULL, 5, 13, NULL, NULL),
(2, 4, 6, 1, 14, 14, 14),
(NULL, NULL, NULL, 4, 15, NULL, NULL),
(4, 3, 7, 2, 16, 16, 16),
(NULL, NULL, NULL, 3, 17, NULL, NULL),
(3, 3, 6, 2, 18, 18, 18),
(NULL, NULL, NULL, 4, 19, NULL, NULL),
(4, 2, 6, 3, 20, 20, 20);

INSERT INTO `Juri` (`nomeJuri`, `idEvento`) VALUES
('Álvaro Mendes', 1),
('Beatriz Oliveira', 2),
('Carlos Fernandes', 4),
('Daniela Costa', 6),
('Eduardo Almeida', 1),
('Fernanda Ribeiro', 2),
('Gustavo Martins', 8),
('Helena Silva', 10),
('Isabel Santos',14),
('João Pereira', 6),
('Katia Lopes', 4),
('Leonardo Carvalho', 2),
('Mariana Dias', 16),
('Nuno Rodrigues', 18),
('Olívia Monteiro', 10),
('Pedro Nunes', 20),
('Quintino Sousa', 1),
('Rafaela Cunha', 6),
('Sérgio Castro', 4),
('Tatiana Ramos', 16);

INSERT INTO `Atleta_has_Combate` (`AC_idAtleta`, `AC_idCombate`)
SELECT AC1.idAtleta, C.idCombate
FROM (
    SELECT 'Carlos Santos vs Miguel Pereira' AS combate, 1 AS idCombate
    UNION ALL SELECT 'Ricardo Martins vs André Rodrigues', 2
    UNION ALL SELECT 'Fernando Almeida vs José Sousa', 3
    UNION ALL SELECT 'Manuel Dias vs Bruno Gomes', 4
    UNION ALL SELECT 'Henrique Pinto vs António Marques', 5
    UNION ALL SELECT 'Rodrigo Ramos vs José Sousa', 6
    UNION ALL SELECT 'Carlos Santos vs Ricardo Martins', 7
    UNION ALL SELECT 'Fernando Almeida vs Manuel Dias', 8
    UNION ALL SELECT 'Henrique Pinto vs Rodrigo Ramos', 9
    UNION ALL SELECT 'Miguel Pereira vs André Rodrigues', 10
    UNION ALL SELECT 'José Sousa vs Bruno Gomes', 11
    UNION ALL SELECT 'António Marques vs Carlos Santos', 12
    UNION ALL SELECT 'Rodrigo Ramos vs Fernando Almeida', 13
    UNION ALL SELECT 'Henrique Pinto vs Miguel Pereira', 14
    UNION ALL SELECT 'José Sousa vs Manuel Dias', 15
    UNION ALL SELECT 'Bruno Gomes vs António Marques', 16
    UNION ALL SELECT 'Ricardo Martins vs Henrique Pinto', 17
    UNION ALL SELECT 'André Rodrigues vs Miguel Pereira', 18
    UNION ALL SELECT 'Carlos Santos vs José Sousa', 19
    UNION ALL SELECT 'António Marques vs Ricardo Martins', 20
) AS C
JOIN `Atleta` AS AC1 ON AC1.nome = SUBSTRING_INDEX(C.combate, ' vs ', 1)
JOIN `Atleta` AS AC2 ON AC2.nome = SUBSTRING_INDEX(C.combate, ' vs ', -1)
WHERE AC1.idAtleta <> AC2.idAtleta; -- Atletas Diferentes

INSERT INTO `Juri_has_Evento` (`JC_idJuri`, `JC_idEvento`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 6),
(5, 1),
(6, 2),
(7, 8),
(8, 10),
(9, 14),
(10, 6),
(11, 4),
(12, 2),
(13, 16),
(14, 18),
(15, 10),
(16, 20),
(17, 1),
(18, 6),
(19, 4),
(20, 16);

INSERT INTO `Modalidade_has_Escola` (`MA_idModalidade`, `MA_idEscola`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);
