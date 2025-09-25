-- Script pour vérifier la structure actuelle de la table clients
-- À exécuter en premier dans Supabase SQL Editor

-- Afficher toutes les colonnes existantes dans la table clients
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default,
    character_maximum_length
FROM information_schema.columns
WHERE table_name = 'clients'
AND table_schema = 'public'
ORDER BY ordinal_position;

-- Vérifier que la table existe
SELECT EXISTS (
    SELECT FROM information_schema.tables
    WHERE table_schema = 'public'
    AND table_name = 'clients'
) as table_exists;