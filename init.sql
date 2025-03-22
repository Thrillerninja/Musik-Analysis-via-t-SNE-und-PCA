-- Erweiterung aktivieren
CREATE EXTENSION IF NOT EXISTS vector;

-- Tabelle fuer Musikdaten entfernen (falls vorhanden)
DROP TABLE IF EXISTS music_vectors;

-- Tabelle fuer Musikdaten erstellen
CREATE TABLE music_vectors (
    id SERIAL PRIMARY KEY,
    features VECTOR(14)  -- 14-dimensionaler Vektor
);

-- IVFFLAT-Index fuer schnelle Nearest-Neighbor-Suchen erstellen
CREATE INDEX music_vector_idx ON music_vectors 
USING ivfflat (features vector_l2_ops) WITH (lists = 100);