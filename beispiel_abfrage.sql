-- Beispielabfrage: Finde die 5 ähnlichsten Songs zu einem bestimmten Song
SELECT title, artist, genre, 
       features <-> '[0.825, 0.652, -3.183, 0.0802, 0.581, 0.0, 0.0931, 0.931, 95.977]' AS distance
FROM music_vectors
ORDER BY distance
LIMIT 5;
