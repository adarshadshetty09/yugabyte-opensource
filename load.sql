-- ============================================
-- Create Database
-- ============================================
CREATE DATABASE testdb1;

-- Connect to database (psql only)
\c testdb1;

-- ============================================
-- Create Table
-- ============================================
CREATE TABLE big_table (
id SERIAL PRIMARY KEY,
data TEXT
);

-- ============================================
-- Insert ~1GB Data
-- Each row ~1KB → 1,000,000 rows ≈ 1GB
-- ============================================

BEGIN;

INSERT INTO big_table (data)
SELECT repeat(md5(random()::text), 32)
FROM generate_series(1, 1000000);

COMMIT;

-- ============================================
-- Verify Table Size
-- ============================================

SELECT pg_size_pretty(pg_total_relation_size('big_table')) AS table_size;
