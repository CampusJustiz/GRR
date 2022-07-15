DROP TABLE IF EXISTS grr_calendrier_feries;
CREATE TABLE grr_calendrier_feries (  `DAY` int(11) NOT NULL DEFAULT '0');
DROP TABLE IF EXISTS grr_calendrier_vacances;
CREATE TABLE grr_calendrier_vacances (  `DAY` int(11) NOT NULL DEFAULT '0');
DROP TABLE IF EXISTS grr_j_mailuser_room;
CREATE TABLE grr_j_mailuser_room (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', id_room int(11) NOT NULL default '0', PRIMARY KEY  (login,id_room) );
DROP TABLE IF EXISTS grr_j_user_area;
CREATE TABLE grr_j_user_area (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', id_area int(11) NOT NULL default '0', PRIMARY KEY  (login,id_area) );
DROP TABLE IF EXISTS grr_j_user_room;
CREATE TABLE grr_j_user_room (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', id_room int(11) NOT NULL default '0', PRIMARY KEY  (login,id_room) );
DROP TABLE IF EXISTS grr_j_userbook_room;
CREATE TABLE grr_j_userbook_room (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', id_room int(11) NOT NULL default '0', PRIMARY KEY  (login,id_room) );
DROP TABLE IF EXISTS grr_j_useradmin_area;
CREATE TABLE grr_j_useradmin_area (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', id_area int(11) NOT NULL default '0', PRIMARY KEY  (login,id_area) );
DROP TABLE IF EXISTS grr_log;
CREATE TABLE grr_log (LOGIN varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', `START` datetime NOT NULL default '1970-01-01 00:00:00', SESSION_ID varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', REMOTE_ADDR varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', USER_AGENT varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', REFERER varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', AUTOCLOSE enum('0','1') NOT NULL default '0', `END` datetime NOT NULL default '1970-01-01 00:00:00', PRIMARY KEY  (SESSION_ID,`START`));
DROP TABLE IF EXISTS grr_area;
CREATE TABLE grr_area (id int(11) NOT NULL auto_increment, area_name varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', access char(1) NOT NULL default '', order_display smallint(6) NOT NULL default '0', ip_adr varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',   morningstarts_area smallint(6) NOT NULL default '0', eveningends_area smallint(6) NOT NULL default '0', duree_max_resa_area INT NOT NULL default '-1', resolution_area INT NOT NULL default '0', eveningends_minutes_area smallint(6) NOT NULL default '0', weekstarts_area smallint(6) NOT NULL default '0', twentyfourhour_format_area smallint(6) NOT NULL default '0', calendar_default_values char(1) NOT NULL default 'y', enable_periods char(1) NOT NULL default 'n', display_days varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default 'yyyyyyy', id_type_par_defaut int(11) NOT NULL default '-1', duree_par_defaut_reservation_area INT NOT NULL DEFAULT '0', max_booking smallint(6) NOT NULL default '-1', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_entry;
CREATE TABLE grr_entry (id int(11) NOT NULL auto_increment, start_time int(11) NOT NULL default '0', end_time int(11) NOT NULL default '0', entry_type int(11) NOT NULL default '0', repeat_id int(11) NOT NULL default '0', room_id int(11) NOT NULL default '1',timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, create_by varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', beneficiaire_ext varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', beneficiaire varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', name varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', type char(2) NOT NULL default 'A', description text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, statut_entry char(1) NOT NULL default '-', option_reservation int(11) NOT NULL default '0',overload_desc text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, moderate tinyint(1) default '0', jours int(2) NOT NULL default '0', clef int(2) NOT NULL default '0', courrier int(2) NOT NULL default '0', nbparticipantmax int(11) NOT NULL default '0', PRIMARY KEY (id), KEY idxStartTime (start_time), KEY idxEndTime (end_time), KEY room_id (room_id) );
DROP TABLE IF EXISTS grr_repeat;
CREATE TABLE grr_repeat ( id int(11) NOT NULL auto_increment, start_time int(11) NOT NULL default '0', end_time int(11) NOT NULL default '0', rep_type int(11) NOT NULL default '0', end_date int(11) NOT NULL default '0', rep_opt varchar(32) NOT NULL default '', room_id int(11) NOT NULL default '1', timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, create_by varchar(100) NOT NULL default '', beneficiaire_ext varchar(200) NOT NULL default '', beneficiaire varchar(100) NOT NULL default '', name varchar(80) NOT NULL default '', type char(2) NOT NULL default 'A', description text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, rep_num_weeks tinyint(4) default '0',overload_desc text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, jours tinyint(2) NOT NULL default '0', courrier int(2) NOT NULL default '0', nbparticipantmax int(11) NOT NULL default '0', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_room;
CREATE TABLE grr_room ( id int(11) NOT NULL auto_increment,  area_id int(11) NOT NULL default '0',  room_name varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',  description varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',  capacity int(11) NOT NULL default '0',  max_booking smallint(6) NOT NULL default '-1', statut_room char(1) NOT NULL default '1', show_fic_room char(1) NOT NULL default 'n', picture_room varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', comment_room text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, show_comment CHAR(1) NOT NULL DEFAULT 'n', delais_max_resa_room smallint(6) NOT NULL default '-1', delais_min_resa_room mediumint NOT NULL default '0', allow_action_in_past char(1) NOT NULL default 'n', dont_allow_modify char(1) NOT NULL default 'n', order_display smallint(6) NOT NULL default '0', delais_option_reservation smallint(6) NOT NULL default '0', type_affichage_reser smallint(6) DEFAULT '0' NOT NULL, moderate tinyint(1) default '0', qui_peut_reserver_pour char(1) NOT NULL default '5', active_ressource_empruntee char(1) NOT NULL default 'y', active_cle char(1) NOT NULL default 'y', `active_participant` tinyint(1) NOT NULL DEFAULT 0, who_can_see SMALLINT DEFAULT '0' NOT NULL, booking_range SMALLINT(6) NOT NULL DEFAULT '-1', `who_can_book` tinyint(1) NOT NULL DEFAULT '1', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_utilisateurs;
CREATE TABLE grr_utilisateurs (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', nom varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', prenom varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', password varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', changepwd tinyint(1) NOT NULL DEFAULT '0', email varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', statut varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', etat varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', default_site smallint(6) NOT NULL default '0', default_area smallint(6) NOT NULL default '0', default_room smallint(6) NOT NULL default '0', default_style varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', default_list_type varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', default_language char(3) NOT NULL default '', source varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default 'local', PRIMARY KEY  (login) );
DROP TABLE IF EXISTS grr_setting;
CREATE TABLE grr_setting (  NAME varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',  VALUE text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,  PRIMARY KEY  (NAME));
DROP TABLE IF EXISTS grr_area_periodes;
CREATE TABLE grr_area_periodes (id_area int(11) NOT NULL default '0', num_periode smallint(6) NOT NULL default '0', nom_periode varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', PRIMARY KEY  (`id_area`,`num_periode`));
DROP TABLE IF EXISTS grr_type_area;
CREATE TABLE grr_type_area (id int(11) NOT NULL auto_increment, type_name varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',order_display smallint(6) NOT NULL default '0',couleur smallint(6) NOT NULL default '0',couleurhexa varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, couleurtexte varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '#000000', type_letter char(2) NOT NULL default '',disponible VARCHAR(1) NOT NULL DEFAULT '2', PRIMARY KEY  (id));
DROP TABLE IF EXISTS grr_j_type_area;
CREATE TABLE grr_j_type_area (id_type int(11) NOT NULL default '0', id_area int(11) NOT NULL default '0');
DROP TABLE IF EXISTS grr_calendar;
CREATE TABLE grr_calendar (DAY int(11) NOT NULL default '0');
DROP TABLE IF EXISTS grr_calendrier_jours_cycle;
CREATE TABLE grr_calendrier_jours_cycle (DAY int(11) NOT NULL default '0', Jours varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '');
DROP TABLE IF EXISTS grr_overload;
CREATE TABLE grr_overload (id int(11) NOT NULL auto_increment, id_area INT NOT NULL, fieldname VARCHAR(55) NOT NULL default '', fieldtype VARCHAR(25) NOT NULL default '', fieldlist text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, obligatoire CHAR( 1 ) DEFAULT 'n' NOT NULL, affichage CHAR( 1 ) DEFAULT 'n' NOT NULL, confidentiel CHAR( 1 ) DEFAULT 'n' NOT NULL, overload_mail CHAR( 1 ) DEFAULT 'n' NOT NULL, mail_spec text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, PRIMARY KEY (id_area,fieldname), UNIQUE KEY (id));
DROP TABLE IF EXISTS grr_entry_moderate;
CREATE TABLE grr_entry_moderate (id int(11) NOT NULL auto_increment, login_moderateur varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',motivation_moderation text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,start_time int(11) NOT NULL default '0',end_time int(11) NOT NULL default '0',entry_type int(11) NOT NULL default '0', repeat_id int(11) NOT NULL default '0',room_id int(11) NOT NULL default '1',timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, create_by varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', beneficiaire_ext varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', beneficiaire varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', name varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '',type char(2) default NULL,description text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,statut_entry char(1) NOT NULL default '-',option_reservation int(11) NOT NULL default '0',overload_desc text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, moderate tinyint(1) default '0', PRIMARY KEY  (id), KEY idxStartTime (start_time), KEY idxEndTime (end_time));
DROP TABLE IF EXISTS grr_site;
CREATE TABLE grr_site ( id int(11) NOT NULL AUTO_INCREMENT, sitecode varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, sitename varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', adresse_ligne1 varchar(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, adresse_ligne2 varchar(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, adresse_ligne3 varchar(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, cp varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, ville varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, pays varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, tel varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, fax varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL, PRIMARY KEY (id), UNIQUE KEY name (sitename), UNIQUE KEY code (sitecode));
DROP TABLE IF EXISTS grr_j_site_area;
CREATE TABLE grr_j_site_area ( id_site int(11) NOT NULL default '0', id_area int(11) NOT NULL default '0', PRIMARY KEY  (`id_site`,`id_area`));
DROP TABLE IF EXISTS grr_j_useradmin_site;
CREATE TABLE grr_j_useradmin_site (login varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL default '', id_site int(11) NOT NULL default '0', PRIMARY KEY  (login,id_site) );
DROP TABLE IF EXISTS grr_correspondance_statut;
CREATE TABLE grr_correspondance_statut (id int(11) NOT NULL auto_increment, code_fonction varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, libelle_fonction varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, statut_grr varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,  PRIMARY KEY (id));
DROP TABLE IF EXISTS grr_page;
CREATE TABLE grr_page ( nom varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, valeur longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, PRIMARY KEY  (`nom`));
INSERT INTO grr_page VALUES ('CGU', 'Les CGU');
DROP TABLE IF EXISTS grr_modulesext;
CREATE TABLE grr_modulesext ( nom varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, actif tinyint(1) NOT NULL DEFAULT '0', version INT(11) NOT NULL, PRIMARY KEY  (`nom`));
DROP TABLE IF EXISTS grr_participants;
CREATE TABLE grr_participants (idresa int(11) NOT NULL, participant varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, PRIMARY KEY (idresa,participant));
INSERT INTO grr_area VALUES (NULL, 'Domaine 1', 'a', 0, '', 8, 19, -1, 1800, 0, 1, 1, 'n', 'n', 'yyyyyyy', -1, 1800, -1);
INSERT INTO grr_room VALUES (NULL, '1', 'Ressource 1', '', '0', '-1', '1', 'n', '', '', 'n', '-1', '0', 'n', 'n', '0', '0', '0', '0', '5', 'y', 'y', '0', '0', '-1', 1);
INSERT INTO grr_type_area VALUES (1, 'Cours', 1, 1, '#1abc9c', '#000', 'A', 2);
INSERT INTO grr_type_area VALUES (2, 'Réunion', 2, 2, '#C03000', '#FFF', 'B', 2);
INSERT INTO grr_type_area VALUES (3, 'Autre', 3, 3, '#4BB5C1', '#000', 'C', 2);
INSERT INTO grr_utilisateurs VALUES ('ADMINISTRATEUR', 'Administrateur', 'grr', 'ab4f63f9ac65152575886860dde480a1', 0, 'admin@labas.fr', 'administrateur', 'actif', 0, 0, 0, 'default', 'item', 'fr','local');
INSERT INTO grr_setting VALUES ('sessionMaxLength', '30');
INSERT INTO grr_setting VALUES ('automatic_mail', 'yes');
INSERT INTO grr_setting VALUES ('company', 'Nom de l\'établissement');
INSERT INTO grr_setting VALUES ('webmaster_name', 'Webmestre de GRR');
INSERT INTO grr_setting VALUES ('webmaster_email', 'admin@mon.site.fr');
INSERT INTO grr_setting VALUES ('technical_support_email', 'support.technique@mon.site.fr');
INSERT INTO grr_setting VALUES ('grr_url', 'http://mon.site.fr/grr/');
INSERT INTO grr_setting VALUES ('disable_login', 'no');
INSERT INTO grr_setting VALUES ('ip_autorise', '');
INSERT INTO grr_setting VALUES ('begin_bookings', '1577833200');
INSERT INTO grr_setting VALUES ('end_bookings', '1672527599');
INSERT INTO grr_setting VALUES ('title_home_page', 'Gestion et Réservation de Ressources');
INSERT INTO grr_setting VALUES ('message_home_page', 'En raison du caractère personnel du contenu, ce site est soumis à des restrictions utilisateurs. Pour accéder aux outils de réservation, identifiez-vous :');
INSERT INTO grr_setting VALUES ('version', '3.5.0');
INSERT INTO grr_setting VALUES ('versionRC', '1');
INSERT INTO grr_setting VALUES ('default_language', 'fr');
INSERT INTO grr_setting VALUES ('url_disconnect', '');
INSERT INTO grr_setting VALUES ('allow_users_modify_profil', '2');
INSERT INTO grr_setting VALUES ('allow_users_modify_email', '2');
INSERT INTO grr_setting VALUES ('allow_users_modify_mdp', '2');
INSERT INTO grr_setting VALUES ('maj194_champs_additionnels', '1');
INSERT INTO grr_setting VALUES ('maj195_champ_rep_type_grr_repeat', '1');
INSERT INTO grr_setting VALUES ('display_info_bulle', '1');
INSERT INTO grr_setting VALUES ('display_full_description', '1');
INSERT INTO grr_setting VALUES ('pview_new_windows', '1');
INSERT INTO grr_setting VALUES ('default_report_days', '30');
INSERT INTO grr_setting VALUES ('authentification_obli', '0');
INSERT INTO grr_setting VALUES ('use_fckeditor', '1');
INSERT INTO grr_setting VALUES ('visu_fiche_description', '0');
INSERT INTO grr_setting VALUES ('allow_search_level', '1');
INSERT INTO grr_setting VALUES ('allow_user_delete_after_begin', '0');
INSERT INTO grr_setting VALUES ('allow_gestionnaire_modify_del', '1');
INSERT INTO grr_setting VALUES ('javascript_info_disabled', '0');
INSERT INTO grr_setting VALUES ('javascript_info_admin_disabled', '0');
INSERT INTO grr_setting VALUES ('pass_leng', '8');
INSERT INTO grr_setting VALUES ('jour_debut_Jours_Cycles', '1');
INSERT INTO grr_setting VALUES ('nombre_jours_Jours_Cycles', '1');
INSERT INTO grr_setting VALUES ('UserAllRoomsMaxBooking', '-1');
INSERT INTO grr_setting VALUES ('jours_cycles_actif', 'Non');
INSERT INTO grr_setting VALUES ('area_list_format', 'item');
INSERT INTO grr_setting VALUES ('longueur_liste_ressources_max', '20');
INSERT INTO grr_setting VALUES ('grr_mail_Password', '');
INSERT INTO grr_setting VALUES ('grr_mail_method', 'mail');
INSERT INTO grr_setting VALUES ('grr_mail_smtp', '');
INSERT INTO grr_setting VALUES ('grr_mail_Bcc', 'n');
INSERT INTO grr_setting VALUES ('grr_mail_Username', '');
INSERT INTO grr_setting VALUES ('verif_reservation_auto', '0');
INSERT INTO grr_setting VALUES ('ConvertLdapUtf8toIso', 'y');
INSERT INTO grr_setting VALUES ('ActiveModeDiagnostic', 'n');
INSERT INTO grr_setting VALUES ('ldap_champ_recherche', 'uid');
INSERT INTO grr_setting VALUES ('ldap_champ_nom', 'sn');
INSERT INTO grr_setting VALUES ('ldap_champ_prenom', 'givenname');
INSERT INTO grr_setting VALUES ('ldap_champ_email', 'mail');
INSERT INTO grr_setting VALUES ('gestion_lien_aide', 'ext');
INSERT INTO grr_setting VALUES ('lien_aide', '');
INSERT INTO grr_setting VALUES ('display_short_description', '1');
INSERT INTO grr_setting VALUES ('remplissage_description_breve', '1');
INSERT INTO grr_setting VALUES ('acces_fiche_reservation', '0');
INSERT INTO grr_setting VALUES ('display_level_email', '0');
INSERT INTO grr_setting VALUES ('nb_calendar', '1');
INSERT INTO grr_setting VALUES ('maj196_qui_peut_reserver_pour', '1');
INSERT INTO grr_setting VALUES ('default_site', '-1');
INSERT INTO grr_setting VALUES ('default_room', '-1');
INSERT INTO grr_setting VALUES ('default_css', 'default');
INSERT INTO grr_setting VALUES ('envoyer_email_avec_formulaire', 'no');
INSERT INTO grr_setting VALUES ('mail_destinataire', 'test@test.fr');
INSERT INTO grr_setting VALUES ('mail_etat_destinataire', '0');
INSERT INTO grr_setting VALUES ('menu_gauche', '1');
INSERT INTO grr_setting VALUES ('file', '1');
INSERT INTO grr_setting VALUES ('smtp_secure', '');
INSERT INTO grr_setting VALUES ('smtp_port', '25');
INSERT INTO grr_setting VALUES ('periodicite', 'y');
INSERT INTO grr_setting VALUES ('cas_port', '');
INSERT INTO grr_setting VALUES ('cas_racine', '');
INSERT INTO grr_setting VALUES ('cas_serveur', '');
INSERT INTO grr_setting VALUES ('remplissage_description_complete', '0');
INSERT INTO grr_setting (`NAME`, `VALUE`) VALUES ('cell_day', 'FVVVVFV'),('cell_month', 'VVVFFFV'),('cell_month_all', 'VVVFFFV'),('cell_month_all2', 'VFFFFFF'),('cell_week', 'FVVVVFV'),('cell_week_all', 'VVVFFFV'),('cell_year', 'VFFFFFF'),('cell_year_all', 'VFFFFFF'),('popup_day', 'VVFFFVV'),('popup_month', 'VVVVVFV'),('popup_month_all', 'VVVVVFV'),('popup_month_all2', 'VVVVVFV'),('popup_week', 'VFFFVFF'),('popup_week_all', 'VVVVVFV'),('popup_year', 'VVVVVFV'),('popup_year_all', 'VVVVVFV');
INSERT INTO grr_setting VALUES ('message_accueil', '');