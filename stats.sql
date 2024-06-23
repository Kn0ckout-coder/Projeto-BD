USE projeto;
/*i. get_points_by_player – Que deve devolver o nº de pontos de um atleta entre duas datas;**/

DELIMITER //

CREATE FUNCTION get_points_by_player_combined(athlete_id INT, start_date DATE, end_date DATE)
RETURNS INT
BEGIN
    DECLARE athlete_points INT;
    SELECT 
        COALESCE(SUM(e.numVitorias), 0) INTO athlete_points
    FROM 
        Estatistica e
    JOIN 
        Atleta_has_Combate ahc ON e.Estatistica_idAtleta = ahc.AC_idAtleta
    JOIN 
        Combate c ON ahc.AC_idCombate = c.idCombate
    WHERE 
        e.Estatistica_idAtleta = athlete_id
        AND c.data_combate BETWEEN start_date AND end_date;

    RETURN athlete_points;
END //

DELIMITER ;

-- get_raking_by_year – Devolve o ranking do atleta que participou num determinado evento, indicando a sua posição baseada no número de vitorias de forma decrescente;

DELIMITER //

CREATE FUNCTION get_ranking_by_year(event_id INT, event_year INT)
RETURNS VARCHAR(1000)
BEGIN
    DECLARE result VARCHAR(1000);
    SET result = '';
    
    -- Temporary table to hold the ranking
    CREATE TEMPORARY TABLE IF NOT EXISTS TempRanking (
        athlete_name VARCHAR(255),
        victories INT,
        ranking INT
    );
    
    -- Populate the temporary table with the ranking data
    INSERT INTO TempRanking (athlete_name, victories, ranking)
    SELECT 
        a.nome AS athlete_name,
        SUM(e.numVitorias) AS victories,
        RANK() OVER (ORDER BY SUM(e.numVitorias) DESC) AS ranking
    FROM 
        Atleta a
    JOIN 
        Atleta_has_Combate ahc ON a.idAtleta = ahc.AC_idAtleta
    JOIN 
        Combate c ON ahc.AC_idCombate = c.idCombate
    JOIN 
        Evento ev ON c.Combate_idEvento = ev.idEvento
    JOIN 
        Estatistica e ON a.idAtleta = e.Estatistica_idAtleta
    WHERE 
        ev.idEvento = event_id
        AND YEAR(c.data_combate) = event_year
    GROUP BY 
        a.idAtleta, a.nome;
    
    -- Concatenate the results into a single string
    SELECT GROUP_CONCAT(CONCAT(ranking, '. ', athlete_name, ' - ', victories, ' vitórias') ORDER BY ranking SEPARATOR '; ') INTO result
    FROM TempRanking;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS TempRanking;

    RETURN result;
END //

DELIMITER ;


/*iii. get_games_by_player – Devolve o número médio de combates em que um atleta participou por evento.*/

DELIMITER //

CREATE FUNCTION get_games_by_player(player_id INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avg_games DECIMAL(10, 2);
    SELECT AVG(num_games) INTO avg_games FROM (SELECT COUNT(DISTINCT c.idCombate) AS num_games FROM Atleta_has_Combate ac 
    INNER JOIN Combate c ON ac.AC_idCombate = c.idCombate
	WHERE ac.AC_idAtleta = player_id
	GROUP BY c.Combate_idEvento)AS games_per_event;
    IF avg_games IS NULL THEN
        SET avg_games = 0.00;
    END IF;
    RETURN avg_games;
END //

DELIMITER ;