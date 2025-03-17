-- Erweiterung aktivieren
CREATE EXTENSION IF NOT EXISTS vector;

-- Tabelle für Musikdaten entferen (falls vorhanden)
DROP TABLE IF EXISTS music_vectors;

-- Tabelle für Musikdaten erstellen
CREATE TABLE music_vectors (
    id SERIAL PRIMARY KEY,
    features VECTOR(14)  -- 14-dimensionaler Vektor
);

-- Beispiel für das Einfügen eines Vektors
-- INSERT INTO music_vectors (features)
-- VALUES (
--     '[0.825, 0.652, -3.183, 0.0802, 0.581, 0.0, 0.0931, 0.931, 95.977]'
-- );

-- IVFFLAT-Index für schnelle Nearest-Neighbor-Suchen erstellen
CREATE INDEX music_vector_idx ON music_vectors 
USING ivfflat (features vector_l2_ops) WITH (lists = 100);