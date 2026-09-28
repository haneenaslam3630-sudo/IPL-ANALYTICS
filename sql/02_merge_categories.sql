deliveries_.bowler_type
teams.team_name
contains fix 4,5

right-arm Medium fast and rising pune supergiantn are
merging in this fix





DROP VIEW IF EXISTS v_deliveries_typed;
CREATE VIEW v_deliveries_typed AS
SELECT *,
       CASE WHEN bowler_type_clean = 
                'Right-arm fast Medium' 
            THEN 'Right-arm fast medium'
            ELSE bowler_type_clean

       END AS bowler_type_typed
FROM v_deliveries_clean;

DROP VIEW IF EXISTS v_teams_clean;
CREATE VIEW v_teams_clean AS
SELECT *,
       CASE WHEN team_name = 'Rising Pune Supergiant' 
            THEN 'Rising Pune Supergiants'
            ELSE team_name
       END AS team_name_clean
FROM teams;