DROP VIEW IF EXISTS v_venues_clean;
CREATE VIEW v_venues_clean AS
WITH ranked_venues AS (
    SELECT venue_id,venue,city,
              ROW_NUMBER() OVER (
                PARTITION BY venue
                ORDER BY CASE WHEN city IS NULL OR TRIM(city)=''
                         THEN 1 ELSE 0 END,
                         venue_id) AS rn
    FROM venues)
    SELECT venue_id,venue,city
   FROM ranked_venues WHERE rn = 1;
    