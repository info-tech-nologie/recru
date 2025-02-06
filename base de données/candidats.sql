-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 31 jan. 2025 à 14:52
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `candidats`
--

-- --------------------------------------------------------

--
-- Structure de la table `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` bigint(20) UNSIGNED NOT NULL,
  `id_candidature` int(11) DEFAULT NULL,
  `date_entretiens` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type_entretiens` enum('téléphonique','en personne','vidéo') NOT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `responsable` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `id_candidature`, `date_entretiens`, `type_entretiens`, `lieu`, `responsable`) VALUES
(1, 1, '2025-01-18 09:00:00', 'téléphonique', 'Tunis, Bureau RH', 'Sami Maazouzi'),
(2, 2, '2025-01-19 13:00:00', 'en personne', 'Sousse, Bureau RH', 'Amine Ben Hmida'),
(3, 3, '2025-01-20 10:00:00', 'téléphonique', 'Sfax, Bureau RH', 'Mouna Aydi');

-- --------------------------------------------------------

--
-- Structure de la table `candidats`
--

CREATE TABLE `candidats` (
  `id_candidat` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `lettre_motivation` varchar(255) DEFAULT NULL,
  `date_candidature` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `candidats`
--

INSERT INTO `candidats` (`id_candidat`, `nom`, `prenom`, `email`, `telephone`, `adresse`, `date_naissance`, `cv`, `lettre_motivation`, `date_candidature`) VALUES
(1, 'Ahmed', 'Ben Ali', 'ahmed.benali@example.com', '21612345678', 'Tunis, Tunisie', '1990-05-15', 'cv_ahmed.pdf', 'lettre_motivation_ahmed.pdf', '2025-01-14 23:00:00'),
(2, 'Sana', 'Chaker', 'sana.chaker@example.com', '21698765432', 'Sousse, Tunisie', '1993-03-22', 'cv_sana.pdf', 'lettre_motivation_sana.pdf', '2025-01-15 23:00:00'),
(3, 'Youssef', 'Baccouche', 'youssef.baccouche@example.com', '21674125896', 'Sfax, Tunisie', '1987-12-10', 'cv_youssef.pdf', 'lettre_motivation_youssef.pdf', '2025-01-16 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `candidatures`
--

CREATE TABLE `candidatures` (
  `id_candidature` bigint(20) UNSIGNED NOT NULL,
  `id_candidat` int(11) DEFAULT NULL,
  `id_poste` int(11) DEFAULT NULL,
  `statut` enum('en attente','en cours','rejetée','interviewée','acceptée') DEFAULT 'en attente',
  `date_candidature` timestamp NOT NULL DEFAULT current_timestamp(),
  `commentaires` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `candidatures`
--

INSERT INTO `candidatures` (`id_candidature`, `id_candidat`, `id_poste`, `statut`, `date_candidature`, `commentaires`) VALUES
(1, 1, 1, 'en attente', '2025-01-14 23:00:00', 'Candidat avec une bonne expérience en développement web.'),
(2, 2, 2, 'en cours', '2025-01-15 23:00:00', 'Expérience dans la gestion de projets, mais besoin de plus de leadership.'),
(3, 3, 3, 'en attente', '2025-01-16 23:00:00', 'Candidat avec un bon background en ressources humaines et analyse des candidatures.');

-- --------------------------------------------------------

--
-- Structure de la table `communications`
--

CREATE TABLE `communications` (
  `id_communication` bigint(20) UNSIGNED NOT NULL,
  `id_candidature` int(11) DEFAULT NULL,
  `type_communication` enum('accusé de réception','invitation entretien','réponse entretien','refus') NOT NULL,
  `date_communication` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `communications`
--

INSERT INTO `communications` (`id_communication`, `id_candidature`, `type_communication`, `date_communication`, `message`) VALUES
(1, 1, 'accusé de réception', '2025-01-14 23:00:00', 'Votre candidature a été reçue avec succès. Nous reviendrons vers vous prochainement.'),
(2, 2, 'invitation entretien', '2025-01-16 23:00:00', 'Félicitations, vous êtes sélectionné pour un entretien en personne le 19 janvier.'),
(3, 3, 'invitation entretien', '2025-01-17 23:00:00', 'Nous vous invitons à un entretien téléphonique le 20 janvier pour discuter de votre candidature.');

-- --------------------------------------------------------

--
-- Structure de la table `etapes_recrutement`
--

CREATE TABLE `etapes_recrutement` (
  `id_etape` bigint(20) UNSIGNED NOT NULL,
  `id_candidature` int(11) DEFAULT NULL,
  `nom_etape` varchar(100) DEFAULT NULL,
  `date_etape` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `commentaires` text DEFAULT NULL,
  `responsable` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etapes_recrutement`
--

INSERT INTO `etapes_recrutement` (`id_etape`, `id_candidature`, `nom_etape`, `date_etape`, `commentaires`, `responsable`) VALUES
(1, 1, 'Entretien Téléphonique', '2025-01-17 23:00:00', 'Entretien sur les compétences techniques et les projets passés.', 'Sami Maazouzi'),
(2, 2, 'Entretien en Personne', '2025-01-18 23:00:00', 'Entretien pour évaluer les compétences en gestion de projet et en leadership.', 'Amine Ben Hmida'),
(3, 3, 'Entretien Téléphonique', '2025-01-19 23:00:00', 'Vérification des compétences en analyse des candidatures et connaissance des processus RH.', 'Mouna Aydi');

-- --------------------------------------------------------

--
-- Structure de la table `ia_filtrage`
--

CREATE TABLE `ia_filtrage` (
  `id_filtrage` bigint(20) UNSIGNED NOT NULL,
  `id_candidature` int(11) DEFAULT NULL,
  `competence_match` tinyint(1) DEFAULT NULL,
  `experience_match` tinyint(1) DEFAULT NULL,
  `mots_cles_match` tinyint(1) DEFAULT NULL,
  `score_total` decimal(5,2) DEFAULT NULL,
  `date_filtrage` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ia_filtrage`
--

INSERT INTO `ia_filtrage` (`id_filtrage`, `id_candidature`, `competence_match`, `experience_match`, `mots_cles_match`, `score_total`, `date_filtrage`) VALUES
(1, 1, 1, 1, 1, 95.50, '2025-01-15 23:00:00'),
(2, 2, 1, 1, 0, 85.00, '2025-01-16 23:00:00'),
(3, 3, 1, 0, 1, 70.00, '2025-01-17 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `postes`
--

CREATE TABLE `postes` (
  `id_poste` bigint(20) UNSIGNED NOT NULL,
  `intitule_poste` varchar(100) NOT NULL,
  `description_poste` text DEFAULT NULL,
  `competences_requises` text DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `postes`
--

INSERT INTO `postes` (`id_poste`, `intitule_poste`, `description_poste`, `competences_requises`, `date_creation`) VALUES
(1, 'Développeur Web', 'Développement d\'applications web et gestion de bases de données.', 'PHP, Laravel, JavaScript, MySQL', '2025-01-09 23:00:00'),
(2, 'Chef de Projet', 'Gestion des projets de développement logiciel et coordination des équipes.', 'Gestion de projet, Leadership, Communication', '2025-01-11 23:00:00'),
(3, 'Analyste RH', 'Analyse des candidatures et gestion des processus de recrutement.', 'Ressources humaines, Analyse de données, Excel', '2025-01-13 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `rapports_recrutement`
--

CREATE TABLE `rapports_recrutement` (
  `id_rapport` bigint(20) UNSIGNED NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `total_candidatures` int(11) DEFAULT NULL,
  `candidatures_acceptees` int(11) DEFAULT NULL,
  `candidatures_rejetees` int(11) DEFAULT NULL,
  `duree_moyenne` int(11) DEFAULT NULL,
  `sources_recrutement` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('recruteur','administrateur','gestionnaire') DEFAULT 'recruteur'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Index pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD PRIMARY KEY (`id_candidat`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `candidatures`
--
ALTER TABLE `candidatures`
  ADD PRIMARY KEY (`id_candidature`);

--
-- Index pour la table `communications`
--
ALTER TABLE `communications`
  ADD PRIMARY KEY (`id_communication`);

--
-- Index pour la table `etapes_recrutement`
--
ALTER TABLE `etapes_recrutement`
  ADD PRIMARY KEY (`id_etape`);

--
-- Index pour la table `ia_filtrage`
--
ALTER TABLE `ia_filtrage`
  ADD PRIMARY KEY (`id_filtrage`);

--
-- Index pour la table `postes`
--
ALTER TABLE `postes`
  ADD PRIMARY KEY (`id_poste`);

--
-- Index pour la table `rapports_recrutement`
--
ALTER TABLE `rapports_recrutement`
  ADD PRIMARY KEY (`id_rapport`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `candidats`
--
ALTER TABLE `candidats`
  MODIFY `id_candidat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `candidatures`
--
ALTER TABLE `candidatures`
  MODIFY `id_candidature` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `communications`
--
ALTER TABLE `communications`
  MODIFY `id_communication` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etapes_recrutement`
--
ALTER TABLE `etapes_recrutement`
  MODIFY `id_etape` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ia_filtrage`
--
ALTER TABLE `ia_filtrage`
  MODIFY `id_filtrage` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `postes`
--
ALTER TABLE `postes`
  MODIFY `id_poste` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rapports_recrutement`
--
ALTER TABLE `rapports_recrutement`
  MODIFY `id_rapport` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
