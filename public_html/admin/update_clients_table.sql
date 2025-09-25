-- Script SQL pour ajouter les nouveaux champs à la table clients existante dans Supabase
-- À exécuter dans l'onglet SQL Editor de Supabase

-- Ajout des champs pour les informations légales
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS siret TEXT,
ADD COLUMN IF NOT EXISTS tva TEXT,
ADD COLUMN IF NOT EXISTS code_ape TEXT,
ADD COLUMN IF NOT EXISTS forme_juridique TEXT;

-- Ajout des champs pour le contact détaillé
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS prenom_contact TEXT,
ADD COLUMN IF NOT EXISTS nom_contact TEXT,
ADD COLUMN IF NOT EXISTS fonction TEXT,
ADD COLUMN IF NOT EXISTS telephone_mobile TEXT,
ADD COLUMN IF NOT EXISTS site_web TEXT;

-- Ajout des champs pour l'adresse complète
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS code_postal TEXT,
ADD COLUMN IF NOT EXISTS ville TEXT,
ADD COLUMN IF NOT EXISTS region TEXT,
ADD COLUMN IF NOT EXISTS pays TEXT DEFAULT 'France';

-- Ajout des champs pour les informations commerciales
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS ca_estime NUMERIC,
ADD COLUMN IF NOT EXISTS budget_marketing NUMERIC,
ADD COLUMN IF NOT EXISTS nb_employes INTEGER,
ADD COLUMN IF NOT EXISTS source_prospection TEXT;

-- Ajout des nouveaux champs pour les réseaux sociaux
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS youtube TEXT,
ADD COLUMN IF NOT EXISTS google_business TEXT,
ADD COLUMN IF NOT EXISTS whatsapp TEXT,
ADD COLUMN IF NOT EXISTS pinterest TEXT,
ADD COLUMN IF NOT EXISTS snapchat TEXT,
ADD COLUMN IF NOT EXISTS twitter TEXT;

-- Ajout des champs pour le suivi et notes
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS objectifs TEXT,
ADD COLUMN IF NOT EXISTS prochaine_action TEXT;

-- Mise à jour du champ type si il n'existe pas
ALTER TABLE clients
ADD COLUMN IF NOT EXISTS type TEXT;

-- Commentaires pour documenter les nouveaux champs
COMMENT ON COLUMN clients.siret IS 'Numéro SIRET de l''entreprise';
COMMENT ON COLUMN clients.tva IS 'Numéro TVA intracommunautaire';
COMMENT ON COLUMN clients.code_ape IS 'Code APE/NAF de l''activité';
COMMENT ON COLUMN clients.forme_juridique IS 'Forme juridique (SARL, SAS, etc.)';

COMMENT ON COLUMN clients.prenom_contact IS 'Prénom du contact principal';
COMMENT ON COLUMN clients.nom_contact IS 'Nom du contact principal';
COMMENT ON COLUMN clients.fonction IS 'Fonction du contact principal';
COMMENT ON COLUMN clients.telephone_mobile IS 'Téléphone mobile du contact';
COMMENT ON COLUMN clients.site_web IS 'URL du site web';

COMMENT ON COLUMN clients.code_postal IS 'Code postal de l''adresse';
COMMENT ON COLUMN clients.ville IS 'Ville de l''adresse';
COMMENT ON COLUMN clients.region IS 'Région de l''adresse';
COMMENT ON COLUMN clients.pays IS 'Pays de l''adresse';

COMMENT ON COLUMN clients.ca_estime IS 'Chiffre d''affaires estimé annuel';
COMMENT ON COLUMN clients.budget_marketing IS 'Budget marketing mensuel';
COMMENT ON COLUMN clients.nb_employes IS 'Nombre d''employés';
COMMENT ON COLUMN clients.source_prospection IS 'Source de prospection du client';

COMMENT ON COLUMN clients.youtube IS 'Chaîne YouTube';
COMMENT ON COLUMN clients.google_business IS 'Lien Google My Business';
COMMENT ON COLUMN clients.whatsapp IS 'Numéro WhatsApp Business';
COMMENT ON COLUMN clients.pinterest IS 'Profil Pinterest';
COMMENT ON COLUMN clients.snapchat IS 'Compte Snapchat';
COMMENT ON COLUMN clients.twitter IS 'Compte Twitter/X';

COMMENT ON COLUMN clients.objectifs IS 'Objectifs marketing du client';
COMMENT ON COLUMN clients.prochaine_action IS 'Prochaine action à effectuer';

COMMENT ON COLUMN clients.type IS 'Type d''activité du client';

-- Vérification des colonnes ajoutées
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'clients'
AND table_schema = 'public'
ORDER BY ordinal_position;