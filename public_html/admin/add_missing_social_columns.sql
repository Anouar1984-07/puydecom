-- Script pour ajouter les colonnes de réseaux sociaux manquantes
-- À exécuter dans Supabase SQL Editor

-- Ajouter les colonnes de réseaux sociaux essentiels manquantes
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS instagram TEXT,
ADD COLUMN IF NOT EXISTS facebook TEXT,
ADD COLUMN IF NOT EXISTS linkedin TEXT,
ADD COLUMN IF NOT EXISTS tiktok TEXT;

-- Commentaires pour documenter les nouveaux champs
COMMENT ON COLUMN clients.instagram IS 'Compte Instagram (@username)';
COMMENT ON COLUMN clients.facebook IS 'Page Facebook';
COMMENT ON COLUMN clients.linkedin IS 'Profil LinkedIn';
COMMENT ON COLUMN clients.tiktok IS 'Compte TikTok (@username)';

-- Vérification que toutes les colonnes ont été ajoutées
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'clients'
AND table_schema = 'public'
AND column_name IN ('instagram', 'facebook', 'linkedin', 'tiktok', 'youtube', 'google_business', 'whatsapp', 'pinterest', 'snapchat', 'twitter')
ORDER BY column_name;