-- Erweiterung aktivieren
CREATE EXTENSION IF NOT EXISTS vector;

-- Tabelle fuer Musikdaten entfernen (falls vorhanden)
DROP TABLE IF EXISTS music_vectors;

-- Tabelle fuer Musikdaten erstellen
CREATE TABLE music_vectors (
    id SERIAL PRIMARY KEY,
    features VECTOR(14)  -- 14-dimensionaler Vektor
);

-- Beispiel fuer das Einfuegen eines Vektors
-- INSERT INTO music_vectors (features)
-- VALUES (
--     '[0.825, 0.652, -3.183, 0.0802, 0.581, 0.0, 0.0931, 0.931, 95.977]'
-- );

-- IVFFLAT-Index fuer schnelle Nearest-Neighbor-Suchen erstellen
CREATE INDEX music_vector_idx ON music_vectors 
USING ivfflat (features vector_l2_ops) WITH (lists = 100);