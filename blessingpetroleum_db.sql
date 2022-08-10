-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 10 août 2022 à 09:01
-- Version du serveur :  10.1.29-MariaDB
-- Version de PHP :  7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `alarmapp`
--
CREATE DATABASE IF NOT EXISTS `alarmapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `alarmapp`;
--
-- Base de données :  `atostest`
--
CREATE DATABASE IF NOT EXISTS `atostest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `atostest`;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `birthdate`, `country`, `gender`, `name`, `phone_number`) VALUES
(1, '1992-05-19', 'france', '', 'Youssouf', '695415451');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK3em7eby2fhyal8qh8i3pfa8rd` (`name`,`phone_number`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de données :  `blessingpetroleum_db`
--
CREATE DATABASE IF NOT EXISTS `blessingpetroleum_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blessingpetroleum_db`;

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`id`, `adresse`, `nom`, `telephone`, `ville`) VALUES
(1, 'Ndokoti', 'Blessing Petroleum', '+237242351682', 'Douala');

-- --------------------------------------------------------

--
-- Structure de la table `carburant`
--

CREATE TABLE `carburant` (
  `id` int(11) NOT NULL,
  `prix_unitaire` double NOT NULL,
  `type_carburant` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `carburant`
--

INSERT INTO `carburant` (`id`, `prix_unitaire`, `type_carburant`) VALUES
(1, 500, 'essence'),
(2, 800, 'gazoil');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `numero_cni` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `email`, `nom`, `numero_cni`, `prenom`, `telephone`) VALUES
(1, 'youssoufalioum@yahoo.fr', 'Youssouf', '12345678', 'Alioum', '+237695415450'),
(2, 'youssoufalioum6@gmail.com', 'Moussa', '123456789', 'Ibrahim', '+237653415450');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `numero_compte` varchar(255) NOT NULL,
  `solde` double NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `numero_compte`, `solde`, `client_id`) VALUES
(1, 'BPQmsGUtA51m', 95000, 1),
(2, 'BPQS2tKI7GDB', 15000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `consommation`
--

CREATE TABLE `consommation` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `mode_paiement` varchar(255) DEFAULT NULL,
  `montant` double NOT NULL,
  `quantite` double NOT NULL,
  `agence_id` int(11) DEFAULT NULL,
  `carburant_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `consommation`
--

INSERT INTO `consommation` (`id`, `date`, `mode_paiement`, `montant`, `quantite`, `agence_id`, `carburant_id`, `client_id`) VALUES
(1, '2022-08-10 07:00:06', 'CASH', 5000, 10, 1, 1, 1),
(2, '2022-08-10 07:00:06', 'OM', 5000, 10, 1, 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `carburant`
--
ALTER TABLE `carburant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_1rxa00yetw8yyqg6eus42k6ig` (`telephone`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_hx2we7gc1i1c5ylusignv31f3` (`numero_compte`),
  ADD KEY `FK5qv5tcfmwu2mli0brm27y13gl` (`client_id`);

--
-- Index pour la table `consommation`
--
ALTER TABLE `consommation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6y227t757g7pk85nad7oa4w9d` (`agence_id`),
  ADD KEY `FKqs8uffpxq7jsueut2m9joi4ta` (`carburant_id`),
  ADD KEY `FK5sw0ndv77m63710yvy4jj1t8y` (`client_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agence`
--
ALTER TABLE `agence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `carburant`
--
ALTER TABLE `carburant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `consommation`
--
ALTER TABLE `consommation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de données :  `dokkani_db`
--
CREATE DATABASE IF NOT EXISTS `dokkani_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dokkani_db`;

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `app_role`
--

CREATE TABLE `app_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `app_role`
--

INSERT INTO `app_role` (`id`, `role_name`) VALUES
(1, 'client'),
(2, 'vendeur');

-- --------------------------------------------------------

--
-- Structure de la table `app_user`
--

CREATE TABLE `app_user` (
  `id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `app_user_roles`
--

CREATE TABLE `app_user_roles` (
  `app_user_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `accepterourefuser` bit(1) NOT NULL,
  `mode_paiement` varchar(255) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `id_acheteur` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte_credit`
--

CREATE TABLE `compte_credit` (
  `id` int(11) NOT NULL,
  `nom_beneficiaire` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE `credit` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `id_compteclient` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `debit`
--

CREATE TABLE `debit` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `id_compteclient` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message_acheteur`
--

CREATE TABLE `message_acheteur` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `id_acheteur` int(11) DEFAULT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message_vendeur`
--

CREATE TABLE `message_vendeur` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `id_acheteur` int(11) DEFAULT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `statut_vendeur`
--

CREATE TABLE `statut_vendeur` (
  `id` int(11) NOT NULL,
  `statut` bit(1) NOT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_o97gn7xedi1oxa1w4cb7mitj7` (`phone`);

--
-- Index pour la table `app_role`
--
ALTER TABLE `app_role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_3k4cplvh82srueuttfkwnylq0` (`username`);

--
-- Index pour la table `app_user_roles`
--
ALTER TABLE `app_user_roles`
  ADD KEY `FK1pfb2loa8so5oi6ak7rh6enva` (`roles_id`),
  ADD KEY `FKkwxexnudtp5gmt82j0qtytnoe` (`app_user_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfjj3l1b2bkb211o0qkulq2e3t` (`id_acheteur`),
  ADD KEY `FKsnyiwmlx81guec4rq7bdkea5i` (`id_produit`),
  ADD KEY `FKq7enda8vm9dh6oy3stjtiex5q` (`id_vendeur`);

--
-- Index pour la table `compte_credit`
--
ALTER TABLE `compte_credit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsrhs3dj4qruyfamnjqc7ht37k` (`id_vendeur`);

--
-- Index pour la table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpcdbrggc4hhnlx3jk0vgv2wcl` (`id_compteclient`);

--
-- Index pour la table `debit`
--
ALTER TABLE `debit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc1nk2qr5ywy49c1tqhw3s2g20` (`id_compteclient`);

--
-- Index pour la table `message_acheteur`
--
ALTER TABLE `message_acheteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcfqq2q76s5ad0blyptcpigg7f` (`id_acheteur`),
  ADD KEY `FK5qnyf3gcb8ca7pxn525p86goj` (`id_vendeur`);

--
-- Index pour la table `message_vendeur`
--
ALTER TABLE `message_vendeur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKab8pu9da2f2hq5a6j17tvi5w7` (`id_acheteur`),
  ADD KEY `FK4u5dfiqcxdng1main9wmeefeh` (`id_vendeur`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi4chsr9etj2dai6jv8el5so76` (`id_vendeur`);

--
-- Index pour la table `statut_vendeur`
--
ALTER TABLE `statut_vendeur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgcjdb2q3nrksxvdhl9aam04mw` (`id_vendeur`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_37w9qnbvx5k2j6dfpqadrnwlg` (`phone`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acheteur`
--
ALTER TABLE `acheteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `app_role`
--
ALTER TABLE `app_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_credit`
--
ALTER TABLE `compte_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `credit`
--
ALTER TABLE `credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `debit`
--
ALTER TABLE `debit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message_acheteur`
--
ALTER TABLE `message_acheteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message_vendeur`
--
ALTER TABLE `message_vendeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `statut_vendeur`
--
ALTER TABLE `statut_vendeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vendeur`
--
ALTER TABLE `vendeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de données :  `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Déchargement des données de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"blessingpetroleum_db\",\"table\":\"agence\"},{\"db\":\"blessingpetroleum_db\",\"table\":\"client\"},{\"db\":\"blessingpetroleum_db\",\"table\":\"consommation\"},{\"db\":\"blessingpetroleum_db\",\"table\":\"compte\"},{\"db\":\"blessingpetroleum_db\",\"table\":\"carburant\"},{\"db\":\"yemabox_db\",\"table\":\"transaction\"},{\"db\":\"yemabox_db\",\"table\":\"all_transactions\"},{\"db\":\"yemabox_db\",\"table\":\"easy_pay_constant\"},{\"db\":\"yemabox_db\",\"table\":\"easy_pay_login\"},{\"db\":\"yemabox_db\",\"table\":\"yema_box_constant\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Déchargement des données de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-05-17 09:16:46', '{\"lang\":\"fr\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de données :  `rexa`
--
CREATE DATABASE IF NOT EXISTS `rexa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rexa`;

-- --------------------------------------------------------

--
-- Structure de la table `abonnes`
--

CREATE TABLE `abonnes` (
  `id_abonne` bigint(20) NOT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleves` bigint(20) NOT NULL,
  `date_naissance` varchar(255) DEFAULT NULL,
  `decision_juge` varchar(255) DEFAULT NULL,
  `lieu_naissance` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleves`, `date_naissance`, `decision_juge`, `lieu_naissance`, `matricule`, `nom_prenom`, `serie`) VALUES
(1, '19/05/1992', 'ADMIS', 'Maroua', '13D221EG', 'Youssoufou Alioum', 'BAC D');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnes`
--
ALTER TABLE `abonnes`
  ADD PRIMARY KEY (`id_abonne`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleves`),
  ADD UNIQUE KEY `UK_tj0b5oabvt2uyys676n2qsmbu` (`matricule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnes`
--
ALTER TABLE `abonnes`
  MODIFY `id_abonne` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleves` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de données :  `taskmangment`
--
CREATE DATABASE IF NOT EXISTS `taskmangment` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `taskmangment`;
--
-- Base de données :  `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de données :  `vaadinbd`
--
CREATE DATABASE IF NOT EXISTS `vaadinbd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vaadinbd`;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` bigint(20) NOT NULL,
  `lieu_naissance` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `lieu_naissance`, `nom`, `prenom`) VALUES
(237, 'Yaounde', 'jean', 'pierre'),
(3, 'Yaoundé', 'Moussa', 'bello'),
(137, 'Garoua', 'Moktar', 'Moussa'),
(216, 'Maroua', 'Youssouf', 'Alioum'),
(134, 'Douala', 'Jean', 'françois'),
(234, 'Yaoundé', 'Moussa', 'bello'),
(15, 'Bertoua', 'Pierre', 'françois'),
(133, 'Yaoundé', 'Moussa', 'bello'),
(18, 'Yaoundé', 'Moussa', 'bello'),
(19, 'Douala', 'Jean', 'françois'),
(20, 'Bertoua', 'Pierre', 'françois'),
(232, 'Maroua', 'Youssouf', 'Alioum'),
(22, 'Garoua', 'Moktar', 'Moussa'),
(228, 'Yaoundé', 'Moussa', 'bello'),
(24, 'Douala', 'Jean', 'françois'),
(25, 'Bertoua', 'Pierre', 'françois'),
(28, 'Yaoundé', 'Moussa', 'bello'),
(29, 'Douala', 'Jean', 'françois'),
(30, 'Bertoua', 'Pierre', 'françois'),
(31, 'Maroua', 'Youssouf', 'Alioum'),
(131, 'Maroua', 'Youssouf', 'Alioum'),
(226, 'Maroua', 'Youssouf', 'Alioum'),
(34, 'Douala', 'Jean', 'françois'),
(35, 'Bertoua', 'Pierre', 'françois'),
(39, 'Douala', 'Jean', 'françois'),
(40, 'Bertoua', 'Pierre', 'françois'),
(41, 'Maroua', 'Youssouf', 'Alioum'),
(42, 'Garoua', 'Moktar', 'Moussa'),
(51, 'Maroua', 'Youssouf', 'Alioum'),
(44, 'Douala', 'Jean', 'françois'),
(45, 'Bertoua', 'Pierre', 'françois'),
(46, 'Maroua', 'Youssouf', 'Alioum'),
(52, 'Garoua', 'Moktar', 'Moussa'),
(48, 'Yaoundé', 'Moussa', 'bello'),
(242, 'Bertoua', 'Pierre', 'françois'),
(57, 'Garoua', 'Moktar', 'Moussa'),
(58, 'Yaoundé', 'Moussa', 'bello'),
(66, 'Maroua', 'Youssouf', 'Alioum'),
(60, 'Bertoua', 'Pierre', 'françois'),
(61, 'Maroua', 'Youssouf', 'Alioum'),
(62, 'Garoua', 'Moktar', 'Moussa'),
(63, 'Yaoundé', 'Moussa', 'bello'),
(64, 'Douala', 'Jean', 'françois'),
(238, 'Maroua', 'Youssouf', 'Alioum'),
(67, 'Garoua', 'Moktar', 'Moussa'),
(68, 'Yaoundé', 'Moussa', 'bello'),
(69, 'Douala', 'Jean', 'françois'),
(70, 'Bertoua', 'Pierre', 'françois'),
(71, 'Maroua', 'Youssouf', 'Alioum'),
(72, 'Garoua', 'Moktar', 'Moussa'),
(73, 'Yaoundé', 'Moussa', 'bello'),
(74, 'Douala', 'Jean', 'françois'),
(75, 'Bertoua', 'Pierre', 'françois'),
(76, 'Maroua', 'Youssouf', 'Alioum'),
(77, 'Garoua', 'Moktar', 'Moussa'),
(78, 'Yaoundé', 'Moussa', 'bello'),
(79, 'Douala', 'Jean', 'françois'),
(80, 'Bertoua', 'Pierre', 'françois'),
(81, 'Maroua', 'Youssouf', 'Alioum'),
(82, 'Garoua', 'Moktar', 'Moussa'),
(83, 'Yaoundé', 'Moussa', 'bello'),
(84, 'Douala', 'Jean', 'françois'),
(85, 'Bertoua', 'Pierre', 'françois'),
(86, 'Maroua', 'Youssouf', 'Alioum'),
(87, 'Garoua', 'Moktar', 'Moussa'),
(88, 'Yaoundé', 'Moussa', 'bello'),
(89, 'Douala', 'Jean', 'françois'),
(90, 'Bertoua', 'Pierre', 'françois'),
(91, 'Maroua', 'Youssouf', 'Alioum'),
(241, 'Douala', 'Jean', 'françois'),
(93, 'Yaoundé', 'Moussa', 'bello'),
(94, 'Douala', 'Jean', 'françois'),
(236, 'Bertoua', 'Pierre', 'françois'),
(240, 'Yaoundé', 'Moussa', 'bello'),
(121, 'Maroua', 'Youssouf', 'Alioum'),
(101, 'Maroua', 'Youssouf', 'Alioum'),
(104, 'Douala', 'Jean', 'françois'),
(105, 'Bertoua', 'Pierre', 'françois'),
(106, 'Maroua', 'Youssouf', 'Alioum'),
(107, 'Garoua', 'Moktar', 'Moussa'),
(108, 'Yaoundé', 'Moussa', 'bello'),
(109, 'Douala', 'Jean', 'françois'),
(110, 'Bertoua', 'Pierre', 'françois'),
(111, 'Maroua', 'Youssouf', 'Alioum'),
(112, 'Garoua', 'Moktar', 'Moussa'),
(113, 'Yaoundé', 'Moussa', 'bello'),
(114, 'Douala', 'Jean', 'françois'),
(235, 'Douala', 'Jean', 'françois'),
(116, 'Maroua', 'Youssouf', 'Alioum'),
(117, 'Garoua', 'Moktar', 'Moussa'),
(118, 'Yaoundé', 'Moussa', 'bello'),
(119, 'Douala', 'Jean', 'françois'),
(120, 'Bertoua', 'Pierre', 'françois'),
(130, 'Bertoua', 'Pierre', 'françois'),
(138, 'Yaoundé', 'Moussa', 'bello'),
(139, 'Douala', 'Jean', 'françois'),
(140, 'Bertoua', 'Pierre', 'françois'),
(141, 'Maroua', 'Youssouf', 'Alioum'),
(142, 'Garoua', 'Moktar', 'Moussa'),
(143, 'Yaoundé', 'Moussa', 'bello'),
(144, 'Douala', 'Jean', 'françois'),
(145, 'Bertoua', 'Pierre', 'françois'),
(146, 'Maroua', 'Youssouf', 'Alioum'),
(147, 'Garoua', 'Moktar', 'Moussa'),
(148, 'Yaoundé', 'Moussa', 'bello'),
(149, 'Douala', 'Jean', 'françois'),
(150, 'Bertoua', 'Pierre', 'françois'),
(151, 'Maroua', 'Youssouf', 'Alioum'),
(152, 'Garoua', 'Moktar', 'Moussa'),
(153, 'Yaoundé', 'Moussa', 'bello'),
(154, 'Douala', 'Jean', 'françois'),
(155, 'Bertoua', 'Pierre', 'françois'),
(156, 'Maroua', 'Youssouf', 'Alioum'),
(157, 'Garoua', 'Moktar', 'Moussa'),
(158, 'Yaoundé', 'Moussa', 'bello'),
(159, 'Douala', 'Jean', 'françois'),
(160, 'Bertoua', 'Pierre', 'françois'),
(161, 'Maroua', 'Youssouf', 'Alioum'),
(162, 'Garoua', 'Moktar', 'Moussa'),
(163, 'Yaoundé', 'Moussa', 'bello'),
(164, 'Douala', 'Jean', 'françois'),
(165, 'Bertoua', 'Pierre', 'françois'),
(231, 'garoua', 'kolo', 'mongo'),
(167, 'Garoua', 'Moktar', 'Moussa'),
(168, 'Yaoundé', 'Moussa', 'bello'),
(170, 'Bertoua', 'Pierre', 'françois'),
(171, 'Maroua', 'Youssouf', 'Alioum'),
(172, 'Garoua', 'Moktar', 'Moussa'),
(173, 'Yaoundé', 'Moussa', 'bello'),
(174, 'Douala', 'Jean', 'françois'),
(175, 'Bertoua', 'Pierre', 'françois'),
(176, 'Maroua', 'Youssouf', 'Alioum'),
(177, 'Garoua', 'Moktar', 'Moussa'),
(178, 'Yaoundé', 'Moussa', 'bello'),
(179, 'Douala', 'Jean', 'françois'),
(180, 'Bertoua', 'Pierre', 'françois'),
(181, 'Maroua', 'Youssouf', 'Alioum'),
(182, 'Garoua', 'Moktar', 'Moussa'),
(221, 'Maroua', 'Youssouf', 'Alioum'),
(184, 'Douala', 'Jean', 'françois'),
(185, 'Bertoua', 'Pierre', 'françois'),
(186, 'Maroua', 'Youssouf', 'Alioum'),
(225, 'Bertoua', 'Pierre', 'françois'),
(189, 'Douala', 'Jean', 'françois'),
(190, 'Bertoua', 'Pierre', 'françois'),
(224, 'Douala', 'Jean', 'françois'),
(223, 'Yaoundé', 'Moussa', 'bello'),
(194, 'Douala', 'Jean', 'françois'),
(222, 'Garoua', 'Moktar', 'Moussa'),
(196, 'Maroua', 'Youssouf', 'Alioum'),
(197, 'Garoua', 'Moktar', 'Moussa'),
(198, 'Yaoundé', 'Moussa', 'bello'),
(200, 'Bertoua', 'Pierre', 'françois'),
(201, 'Maroua', 'Youssouf', 'Alioum'),
(202, 'Garoua', 'Moktar', 'Moussa'),
(203, 'Yaoundé', 'Moussa', 'bello'),
(204, 'Douala', 'Jean', 'françois'),
(205, 'Bertoua', 'Pierre', 'françois'),
(206, 'Maroua', 'Youssouf', 'Alioum'),
(207, 'Garoua', 'Moktar', 'Moussa'),
(208, 'Yaoundé', 'Moussa', 'bello'),
(209, 'Douala', 'Jean', 'françois'),
(210, 'Bertoua', 'Pierre', 'françois'),
(211, 'Maroua', 'Youssouf', 'Alioum'),
(230, 'Bertoua', 'Pierre', 'françois'),
(213, 'Yaoundé', 'Moussa', 'bello'),
(229, 'Douala', 'Jean', 'françois'),
(215, 'Bertoua', 'Pierre', 'françois'),
(218, 'Yaoundé', 'Moussa', 'bello'),
(219, 'Douala', 'Jean', 'françois'),
(220, 'Bertoua', 'Pierre', 'françois');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;
--
-- Base de données :  `yemabox_db`
--
CREATE DATABASE IF NOT EXISTS `yemabox_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yemabox_db`;

-- --------------------------------------------------------

--
-- Structure de la table `all_transactions`
--

CREATE TABLE `all_transactions` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `numero_beneficiaire` varchar(255) DEFAULT NULL,
  `numero_payeur` varchar(255) DEFAULT NULL,
  `operateur` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `all_transactions`
--

INSERT INTO `all_transactions` (`id`, `date`, `montant`, `numero_beneficiaire`, `numero_payeur`, `operateur`, `payment_id`) VALUES
(1, '2022-06-28T22:27:44', 100, '695415450', '695415450', 'ORANGE', '22062820230316656718'),
(2, '2022-07-05T10:29:39', 100, '695415450', '695415450', 'ORANGE', '22070520230316656710'),
(3, '2022-07-05T10:34:55', 100, '695415450', '695415450', 'ORANGE', '22070520230316656711');

-- --------------------------------------------------------

--
-- Structure de la table `customer_bill`
--

CREATE TABLE `customer_bill` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `bill_number` varchar(255) DEFAULT NULL,
  `customer_number` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `pay_item_id` varchar(255) DEFAULT NULL,
  `service_number` varchar(255) DEFAULT NULL,
  `timestamp` varchar(255) DEFAULT NULL,
  `tx_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `easy_pay_constant`
--

CREATE TABLE `easy_pay_constant` (
  `id` int(11) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `easy_pay_constant`
--

INSERT INTO `easy_pay_constant` (`id`, `base_url`, `hash`) VALUES
(1, 'http://gopay.easypay.cm/', 'UitzjJanK8Emubk47L9l');

-- --------------------------------------------------------

--
-- Structure de la table `easy_pay_login`
--

CREATE TABLE `easy_pay_login` (
  `id` int(11) NOT NULL,
  `grant_type` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `easy_pay_login`
--

INSERT INTO `easy_pay_login` (`id`, `grant_type`, `password`, `username`) VALUES
(1, 'password', '99bQDbyfc', 'YEMA_GROUP@ext_app.JjCI');

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `numero_beneficiaire` varchar(255) DEFAULT NULL,
  `numero_payeur` varchar(255) DEFAULT NULL,
  `operateur` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `montant`, `numero_beneficiaire`, `numero_payeur`, `operateur`, `payment_id`, `statut`) VALUES
(1, '2022-01-01T19:45', 100, '695415450', '695415450', 'CAMTEL', '202201011947', 'Success'),
(2, '2022-01-01T19:45', 100, '695415450', '695415450', 'CAMTEL', '202201011947', 'Success'),
(3, '2022-07-05T10:29:39', 100, '695415450', '695415450', 'ORANGE', '22070520230316656710', 'Success');

-- --------------------------------------------------------

--
-- Structure de la table `yema_box_constant`
--

CREATE TABLE `yema_box_constant` (
  `id` int(11) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `all_transactions`
--
ALTER TABLE `all_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_bill`
--
ALTER TABLE `customer_bill`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `easy_pay_constant`
--
ALTER TABLE `easy_pay_constant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `easy_pay_login`
--
ALTER TABLE `easy_pay_login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yema_box_constant`
--
ALTER TABLE `yema_box_constant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `all_transactions`
--
ALTER TABLE `all_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `customer_bill`
--
ALTER TABLE `customer_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `easy_pay_constant`
--
ALTER TABLE `easy_pay_constant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `easy_pay_login`
--
ALTER TABLE `easy_pay_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `yema_box_constant`
--
ALTER TABLE `yema_box_constant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de données :  `yemaprobac`
--
CREATE DATABASE IF NOT EXISTS `yemaprobac` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yemaprobac`;

-- --------------------------------------------------------

--
-- Structure de la table `abonnes`
--

CREATE TABLE `abonnes` (
  `id_abonne` bigint(20) NOT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `abonnes`
--

INSERT INTO `abonnes` (`id_abonne`, `matricule`, `telephone`) VALUES
(1, '13D223EG', '666876063');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleves` bigint(20) NOT NULL,
  `date_naissance` varchar(255) DEFAULT NULL,
  `decision_juge` varchar(255) DEFAULT NULL,
  `lieu_naissance` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom_prenom` varchar(255) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleves`, `date_naissance`, `decision_juge`, `lieu_naissance`, `matricule`, `nom_prenom`, `serie`) VALUES
(1, '19/05/1992', 'ADMIS', 'Maroua', '13D221EG', 'Youssoufou Alioum', 'BAC D'),
(2, '20/04/1995', 'REFUS', 'Garoua', '12E222EG', 'Moussa bello', 'BAC C');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnes`
--
ALTER TABLE `abonnes`
  ADD PRIMARY KEY (`id_abonne`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleves`),
  ADD UNIQUE KEY `UK_tj0b5oabvt2uyys676n2qsmbu` (`matricule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnes`
--
ALTER TABLE `abonnes`
  MODIFY `id_abonne` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleves` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de données :  `yemastream`
--
CREATE DATABASE IF NOT EXISTS `yemastream` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yemastream`;
--
-- Base de données :  `yema_bd`
--
CREATE DATABASE IF NOT EXISTS `yema_bd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yema_bd`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Homme'),
(2, 'Femme'),
(3, 'enfants'),
(21, 'librairie'),
(22, 'Electronique'),
(23, 'librairie'),
(24, 'Electromenager'),
(26, 'livres');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `phone_client` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `prix_total` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `adresse`, `nom_client`, `phone_client`, `quantite`, `id_produit`, `ville`, `prix_total`, `produit_id`) VALUES
(1, 'Camp prison', 'Youssouf', 695415450, 3, NULL, 'Maroua', 4200000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id`, `produit_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `produit_en_solde_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `description`, `image`, `nom`, `prix`, `id_categorie`, `produit_en_solde_id`) VALUES
(1, '128 GB/4G0 Ram bien propre', 'https://www.yema.cm/375-large_default/iphone-7.jpg', 'Iphone 6', 1200000, 1, NULL),
(3, 'Iphone 8 camera ultra sophistiquer 128 G0/4Go Ram\r\nbatterie 6000Mah\r\navec accessoire complet et autres ', 'https://www.yema.cm/375-large_default/iphone-7.jpg', 'Iphone 8', 1500000, 2, NULL),
(8, 'blanche bien propre', 'https://www.yema.cm/2034-large_default/basket-fashion-dior.jpg', 'chaussure', 10000, 1, NULL),
(7, 'cool', 'https://www.yema.cm/375-large_default/iphone-7.jpg', 'chaussure', 20000, 1, NULL),
(9, '32Go', 'https://www.yema.cm/375-large_default/iphone-7.jpg', 'phone 3', 20000, 2, NULL),
(10, '<div style=\"text-align: center;\"><font color=\"#ff0000\" face=\"Arial Black\"><b><span style=\"font-size:24px;\">Youssouf</span></b></font></div>', 'https://www.yema.cm/2034-large_default/basket-fashion-dior.jpg', 'Montre', 1000000, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit_en_solde`
--

CREATE TABLE `produit_en_solde` (
  `id` int(11) NOT NULL,
  `prix_solde` int(11) NOT NULL,
  `produits_id` int(11) DEFAULT NULL,
  `taux_reduction` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `url_image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `url_image`) VALUES
(1, 'https://bit.ly/3bX3NcV'),
(2, 'https://bit.ly/3qm0moE'),
(6, 'https://bit.ly/3bRPbeX'),
(5, 'https://bit.ly/305kxwo');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsnyiwmlx81guec4rq7bdkea5i` (`id_produit`),
  ADD KEY `FK3q11l1e5acu450cqiomkrv5s3` (`produit_id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5a9igv389gcrpe9nea6kmswem` (`produit_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlgcxfrlljt10cdwx730b4tujf` (`id_categorie`),
  ADD KEY `FK9x21v5mwtcnqw16vmo1mrg12j` (`produit_en_solde_id`);

--
-- Index pour la table `produit_en_solde`
--
ALTER TABLE `produit_en_solde`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKewoyi705byiouxn7neqsdrhgy` (`produits_id`);

--
-- Index pour la table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `produit_en_solde`
--
ALTER TABLE `produit_en_solde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
