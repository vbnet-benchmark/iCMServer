DROP DATABASE IF EXISTS iCMServer;

CREATE DATABASE iCMServer;

CREATE TABLE cat_catalogs
(cat_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
cat_parentid INT NULL, 
cat_name VARCHAR(255) NULL, 
cat_description LONGTEXT NULL, 
cat_createddate DATETIME NULL, 
cat_createdby VARCHAR(255) NULL, 
cat_updateddate DATETIME NULL, 
cat_updatedby VARCHAR(255) NULL, 
cat_hidden INT(1) NOT NULL, 
cat_deleted INT(1) NOT NULL, 
cat_ts TIMESTAMP NULL, 
PRIMARY KEY(cat_id));

CREATE TABLE dis_discussion
(dis_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
dis_rollup INT NOT NULL, 
dis_root INT NOT NULL, 
dis_indent VARCHAR(100) NULL, 
dis_title VARCHAR(100) NULL, 
dis_body TEXT NULL, 
dis_createddate DATETIME NULL, 
dis_createdby VARCHAR(255) NULL, 
dis_updateddate DATETIME NULL, 
dis_updatedby VARCHAR(255) NULL, 
dis_hidden INT(1) NOT NULL, 
dis_deleted INT(1) NOT NULL, 
dis_ts TIMESTAMP NULL, 
PRIMARY KEY(dis_id));

CREATE TABLE doc_documents
(doc_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NULL, 
pag_id INT NULL, 
cat_id INT NULL, 
doc_rollup INT NOT NULL, 
doc_revision INT NOT NULL, 
doc_name VARCHAR(255) NULL, 
doc_description LONGTEXT NULL, 
doc_content LONGBLOB NULL, 
doc_contenttype VARCHAR(200) NULL, 
doc_contentsize BIGINT NULL, 
doc_createddate DATETIME NULL, 
doc_createdby VARCHAR(255) NULL, 
doc_updateddate DATETIME NULL, 
doc_updatedby VARCHAR(255) NULL, 
doc_hidden INT(1) NOT NULL, 
doc_deleted INT(1) NOT NULL, 
doc_ts TIMESTAMP NULL, 
PRIMARY KEY(doc_id));

CREATE TABLE eve_events
(eve_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
eve_title VARCHAR(255) NULL, 
eve_description LONGTEXT NULL, 
eve_link VARCHAR(255) NULL, 
eve_showdate DATETIME NULL, 
eve_hidedate DATETIME NULL, 
eve_createddate DATETIME NULL, 
eve_createdby VARCHAR(255) NULL, 
eve_updateddate DATETIME NULL, 
eve_updatedby VARCHAR(255) NULL, 
eve_hidden INT(1) NOT NULL, 
eve_deleted INT(1) NOT NULL, 
eve_ts TIMESTAMP NULL, 
PRIMARY KEY(eve_id));

CREATE TABLE htm_htmltext
(htm_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
htm_desktophtml LONGTEXT NULL, 
htm_mobilesummary LONGTEXT NULL, 
htm_mobiledetails LONGTEXT NULL, 
htm_createddate DATETIME NULL, 
htm_createdby VARCHAR(255) NULL, 
htm_updateddate DATETIME NULL, 
htm_updatedby VARCHAR(255) NULL, 
htm_hidden INT(1) NOT NULL, 
htm_deleted INT(1) NOT NULL, 
htm_ts TIMESTAMP NULL, 
PRIMARY KEY(htm_id));

CREATE TABLE ifr_iframe
(ifr_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
ifr_title VARCHAR(255) NULL, 
ifr_description LONGTEXT NULL, 
ifr_url TEXT NULL, 
ifr_width VARCHAR(50) NULL, 
ifr_height VARCHAR(50) NULL, 
ifr_createddate DATETIME NULL, 
ifr_createdby VARCHAR(255) NULL, 
ifr_updateddate DATETIME NULL, 
ifr_updatedby VARCHAR(255) NULL, 
ifr_hidden INT(1) NOT NULL, 
ifr_deleted INT(1) NOT NULL, 
ifr_ts TIMESTAMP NULL, 
ifr_target VARCHAR(50) NULL, 
PRIMARY KEY(ifr_id));

CREATE TABLE lgt_languagetext
(lgt_id INT NOT NULL AUTO_INCREMENT, 
lng_id INT NOT NULL, 
lgt_location VARCHAR(50) NULL, 
lgt_phrase LONGTEXT NULL, 
lgt_text LONGTEXT NULL, 
lgt_hidden INT(1) NOT NULL, 
lgt_deleted INT(1) NOT NULL, 
lgt_ts TIMESTAMP NULL, 
PRIMARY KEY(lgt_id));

CREATE TABLE lng_language
(lng_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
lng_language VARCHAR(50) NULL, 
lng_hidden INT(1) NOT NULL, 
lng_deleted INT(1) NOT NULL, 
lng_ts TIMESTAMP NULL, 
PRIMARY KEY(lng_id));

CREATE TABLE mde_moduledefinitions
(mde_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mde_name LONGTEXT NULL, 
mde_description LONGTEXT NULL, 
mde_desktopsrc LONGTEXT NULL, 
mde_mobilesrc LONGTEXT NULL, 
mde_createddate DATETIME NULL, 
mde_createdby VARCHAR(255) NULL, 
mde_updateddate DATETIME NULL, 
mde_updatedby VARCHAR(255) NULL, 
mde_hidden INT(1) NOT NULL, 
mde_deleted INT(1) NOT NULL, 
mde_ts TIMESTAMP NULL, 
PRIMARY KEY(mde_id));

CREATE TABLE men_menu
(men_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
men_menualign VARCHAR(50) NULL, 
men_menufade INT(1) NULL, 
men_menufadedurance VARCHAR(8) NULL, 
men_menuoffset INT NULL, 
men_menutop INT NULL, 
men_menuleft INT NULL, 
men_menuforecolor1 VARCHAR(8) NULL, 
men_menubackcolor1 VARCHAR(8) NULL, 
men_menuforecolor2 VARCHAR(8) NULL, 
men_menubackcolor2 VARCHAR(8) NULL, 
men_menuoverforecolor1 VARCHAR(8) NULL, 
men_menuoverbackcolor1 VARCHAR(8) NULL, 
men_menuoverforecolor2 VARCHAR(8) NULL, 
men_menuoverbackcolor2 VARCHAR(8) NULL, 
men_menufont VARCHAR(50) NULL, 
men_menubold1 INT(1) NULL, 
men_menuoverbold1 INT(1) NULL, 
men_menubold2 INT(1) NULL, 
men_menuoverbold2 INT(1) NULL, 
men_placement VARCHAR(50) NULL, 
men_between INT NULL, 
men_wait INT NULL, 
men_menulevel1borderx INT(1) NULL, 
men_menulevel1bordery INT(1) NULL, 
men_menulevel2borderx INT(1) NULL, 
men_menulevel2bordery INT(1) NULL, 
men_menuroundborder INT(1) NULL, 
men_menufontsize1 INT NULL, 
men_menuoverfontsize1 INT NULL, 
men_menufontsize2 INT NULL, 
men_menuoverfontsize2 INT NULL, 
men_menubordercolor1 VARCHAR(8) NULL, 
men_menubordercolor2 VARCHAR(8) NULL, 
men_createddate DATETIME NULL, 
men_createdby VARCHAR(255) NULL, 
men_updateddate DATETIME NULL, 
men_updatedby VARCHAR(255) NULL, 
men_hidden INT(1) NOT NULL, 
men_deleted INT(1) NOT NULL, 
men_ts TIMESTAMP NULL, 
PRIMARY KEY(men_id));

CREATE TABLE mod_modules
(mod_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NULL, 
pag_id INT NOT NULL, 
lng_id INT NULL, 
mde_id INT NOT NULL, 
mod_order INT NOT NULL, 
mod_panename VARCHAR(255) NOT NULL, 
mod_title VARCHAR(255) NULL, 
mod_description VARCHAR(255) NULL, 
mod_authorizededitroles LONGTEXT NULL, 
mod_cachetime INT NOT NULL, 
mod_showmobile INT(1) NOT NULL, 
mod_alignment VARCHAR(50) NULL, 
mod_color VARCHAR(50) NULL, 
mod_border VARCHAR(50) NULL, 
mod_editsrc VARCHAR(255) NULL, 
mod_iconfile VARCHAR(255) NULL, 
mod_editmoduleicon VARCHAR(255) NULL, 
mod_friendlyname VARCHAR(255) NULL, 
mod_secure INT(1) NOT NULL, 
mod_allpages INT(1) NOT NULL, 
mod_showtitle INT(1) NOT NULL, 
mod_personalize INT NULL, 
mod_skinpath VARCHAR(255) NULL, 
mod_createddate DATETIME NULL, 
mod_createdby VARCHAR(255) NULL, 
mod_updateddate DATETIME NULL, 
mod_updatedby VARCHAR(255) NULL, 
mod_hidden INT(1) NOT NULL, 
mod_deleted INT(1) NOT NULL, 
mod_ts TIMESTAMP NULL, 
PRIMARY KEY(mod_id));

CREATE TABLE mse_modulesettings
(mse_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
mse_name VARCHAR(255) NOT NULL, 
mde_id INT NOT NULL, 
mse_value LONGTEXT NULL, 
mse_createddate DATETIME NULL, 
mse_createdby VARCHAR(255) NULL, 
mse_updateddate DATETIME NULL, 
mse_updatedby VARCHAR(255) NULL, 
mse_hidden INT(1) NOT NULL, 
mse_deleted INT(1) NOT NULL, 
mse_ts TIMESTAMP NULL, 
PRIMARY KEY(mse_id));

CREATE TABLE pag_page
(pag_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
lng_id INT NULL, 
pag_order INT NOT NULL, 
pag_pageparentid INT NULL, 
pag_backcolor VARCHAR(50) NULL, 
pag_pictureid VARCHAR(10) NULL, 
pag_picturehref VARCHAR(255) NULL, 
pag_picturehorizontalalign VARCHAR(50) NULL, 
pag_pictureverticalalign VARCHAR(50) NULL, 
pag_picturehorizontaltiling INT(1) NOT NULL, 
pag_pictureverticaltiling INT(1) NOT NULL, 
pag_minimizer INT(1) NOT NULL, 
pag_height VARCHAR(10) NULL, 
pag_top VARCHAR(10) NULL, 
pag_name VARCHAR(255) NOT NULL, 
pag_description LONGTEXT NULL, 
pag_mobilename VARCHAR(255) NULL, 
pag_mobiledescription LONGTEXT NULL, 
pag_authorizedroles LONGTEXT NULL, 
pag_showmobile INT(1) NOT NULL, 
pag_leftmodulefieldwidth VARCHAR(20) NULL, 
pag_contentmodulefieldwidth VARCHAR(20) NULL, 
pag_rightmodulefieldwidth VARCHAR(20) NULL, 
pag_contentalign INT(1) NOT NULL, 
pag_level INT NULL, 
pag_iconfile VARCHAR(255) NULL, 
pag_adminpageicon VARCHAR(255) NULL, 
pag_isvisible INT(1) NOT NULL, 
pag_haschildren INT(1) NOT NULL, 
pag_createddate DATETIME NULL, 
pag_createdby VARCHAR(255) NULL, 
pag_updateddate DATETIME NULL, 
pag_updatedby VARCHAR(255) NULL, 
pag_hidden INT(1) NOT NULL, 
pag_deleted INT(1) NOT NULL, 
pag_ts TIMESTAMP NULL, 
PRIMARY KEY(pag_id));

CREATE TABLE qui_quicklinks
(qui_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
mod_id INT NOT NULL, 
pag_id INT NOT NULL, 
qui_title VARCHAR(255) NULL, 
qui_description LONGTEXT NULL, 
qui_url TEXT NULL, 
qui_order INT NULL, 
qui_createddate DATETIME NULL, 
qui_createdby VARCHAR(255) NULL, 
qui_updateddate DATETIME NULL, 
qui_updatedby VARCHAR(255) NULL, 
qui_hidden INT(1) NOT NULL, 
qui_deleted INT(1) NOT NULL, 
qui_ts TIMESTAMP NULL, 
PRIMARY KEY(qui_id));

CREATE TABLE rol_roles
(rol_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
lng_id INT NULL, 
rol_name VARCHAR(255) NULL, 
rol_description LONGTEXT NULL, 
rol_createddate DATETIME NULL, 
rol_createdby VARCHAR(255) NULL, 
rol_updateddate DATETIME NULL, 
rol_updatedby VARCHAR(255) NULL, 
rol_hidden INT(1) NOT NULL, 
rol_deleted INT(1) NOT NULL, 
rol_ts TIMESTAMP NULL, 
PRIMARY KEY(rol_id));

CREATE TABLE sit_sites
(sit_id INT NOT NULL AUTO_INCREMENT, 
lng_id INT NULL, 
sit_name VARCHAR(255) NULL, 
sit_alias VARCHAR(255) NULL, 
sit_css VARCHAR(255) NULL, 
sit_cssheadfamily VARCHAR(20) NULL, 
sit_cssheadsize VARCHAR(10) NULL, 
sit_cssheadweight VARCHAR(10) NULL, 
sit_cssheadcolor VARCHAR(20) NULL, 
sit_csssubheadfamily VARCHAR(20) NULL, 
sit_csssubheadsize VARCHAR(10) NULL, 
sit_csssubheadweight VARCHAR(10) NULL, 
sit_csssubheadcolor VARCHAR(20) NULL, 
sit_csssubsubheadfamily VARCHAR(20) NULL, 
sit_csssubsubheadsize VARCHAR(10) NULL, 
sit_csssubsubheadweight VARCHAR(10) NULL, 
sit_csssubsubheadcolor VARCHAR(20) NULL, 
sit_cssnormalfamily VARCHAR(20) NULL, 
sit_cssnormalsize VARCHAR(10) NULL, 
sit_cssnormalweight VARCHAR(10) NULL, 
sit_cssnormalcolor VARCHAR(20) NULL, 
sit_cssbuttonbordersize VARCHAR(10) NULL, 
sit_cssbuttonbordercolor VARCHAR(20) NULL, 
sit_cssbuttonbackcolor VARCHAR(20) NULL, 
sit_cssbuttonforecolor VARCHAR(20) NULL, 
sit_cssbuttontextalign VARCHAR(20) NULL, 
sit_cssbuttonfontfamily VARCHAR(20) NULL, 
sit_cssbuttonfontsize VARCHAR(10) NULL, 
sit_cssbuttonfontweight VARCHAR(10) NULL, 
sit_csshrcolor VARCHAR(20) NULL, 
sit_csshrheight VARCHAR(10) NULL, 
sit_csshralign VARCHAR(20) NULL, 
sit_logo VARCHAR(10) NULL, 
sit_logohref VARCHAR(255) NULL, 
sit_logohorizontaltiling INT(1) NOT NULL, 
sit_logoverticaltiling INT(1) NOT NULL, 
sit_logohorizontalalign VARCHAR(50) NULL, 
sit_logoverticalalign VARCHAR(50) NULL, 
sit_startpage INT NULL, 
sit_alwaysshoweditbutton INT(1) NOT NULL, 
sit_showfooter INT(1) NOT NULL, 
sit_footertextleft VARCHAR(255) NULL, 
sit_footertextcontent VARCHAR(255) NULL, 
sit_footertextright VARCHAR(255) NULL, 
sit_color VARCHAR(8) NULL, 
sit_contentadjust INT NULL, 
sit_softdelete INT(1) NULL, 
sit_createddate DATETIME NULL, 
sit_createdby VARCHAR(255) NULL, 
sit_updateddate DATETIME NULL, 
sit_updatedby VARCHAR(255) NULL, 
sit_hidden INT(1) NOT NULL, 
sit_deleted INT(1) NOT NULL, 
sit_ts TIMESTAMP NULL, 
PRIMARY KEY(sit_id));

CREATE TABLE slg_sitelog
(slg_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NOT NULL, 
slg_logdate DATETIME NULL, 
slg_ip VARCHAR(20) NULL, 
slg_referrer VARCHAR(255) NULL, 
slg_url VARCHAR(255) NULL, 
slg_useragent VARCHAR(255) NULL, 
slg_hostaddress VARCHAR(255) NULL, 
slg_hostname VARCHAR(255) NULL, 
slg_hidden INT(1) NOT NULL, 
slg_deleted INT(1) NOT NULL, 
slg_ts TIMESTAMP NULL, 
PRIMARY KEY(slg_id));

CREATE TABLE uro_userroles
(uro_id INT NOT NULL AUTO_INCREMENT, 
usr_id INT NOT NULL, 
sit_id INT NOT NULL, 
rol_id INT NOT NULL, 
uro_createddate DATETIME NULL, 
uro_createdby VARCHAR(255) NULL, 
uro_updateddate DATETIME NULL, 
uro_updatedby VARCHAR(255) NULL, 
uro_hidden INT(1) NOT NULL, 
uro_deleted INT(1) NOT NULL, 
uro_ts TIMESTAMP NULL, 
PRIMARY KEY(uro_id));

CREATE TABLE usr_users
(usr_id INT NOT NULL AUTO_INCREMENT, 
sit_id INT NULL, 
usr_firstname VARCHAR(255) NOT NULL, 
usr_loginname VARCHAR(255) NULL, 
usr_description LONGTEXT NULL, 
usr_password VARCHAR(255) NULL, 
usr_lastname VARCHAR(255) NULL, 
usr_email VARCHAR(255) NULL, 
usr_createddate DATETIME NULL, 
usr_createdby VARCHAR(255) NULL, 
usr_updateddate DATETIME NULL, 
usr_updatedby VARCHAR(255) NULL, 
usr_hidden INT(1) NOT NULL, 
usr_deleted INT(1) NOT NULL, 
usr_ts TIMESTAMP NULL, 
PRIMARY KEY(usr_id));

CREATE TABLE ver_version
(ver_id INT NOT NULL AUTO_INCREMENT, 
ver_major INT NOT NULL, 
ver_minor INT NOT NULL, 
ver_build INT NOT NULL, 
ver_description LONGTEXT NULL, 
ver_createddate DATETIME NULL, 
ver_createdby VARCHAR(255) NULL, 
ver_hidden INT(1) NOT NULL, 
ver_deleted INT(1) NOT NULL, 
ver_ts TIMESTAMP NULL, 
PRIMARY KEY(ver_id));


DELETE FROM lng_language;
INSERT INTO lng_language (lng_id, sit_id,lng_language, lng_hidden, lng_deleted) VALUES (1,1,'English',0,0);
INSERT INTO lng_language (lng_id, sit_id,lng_language, lng_hidden, lng_deleted) VALUES (2,1,'Svenska',0,0);

DELETE FROM sit_sites;
INSERT INTO sit_sites (sit_id, lng_id, sit_name, sit_alias, sit_css, sit_cssheadfamily,sit_cssheadsize,sit_cssheadweight,sit_cssheadcolor,sit_csssubheadfamily,sit_csssubheadsize,sit_csssubheadweight,sit_csssubheadcolor,sit_csssubsubheadfamily,sit_csssubsubheadsize,sit_csssubsubheadweight,sit_csssubsubheadcolor,sit_cssnormalfamily,sit_cssnormalsize,sit_cssnormalweight,sit_cssnormalcolor,sit_cssbuttonbordersize,sit_cssbuttonbordercolor,sit_cssbuttonbackcolor,sit_cssbuttonforecolor,sit_cssbuttontextalign,sit_cssbuttonfontfamily,sit_cssbuttonfontsize,sit_cssbuttonfontweight,sit_csshrcolor,sit_csshrheight,sit_csshralign,sit_logo, sit_logohref,sit_logohorizontaltiling,sit_logoverticaltiling, sit_logohorizontalalign,sit_logoverticalalign,sit_startpage, sit_alwaysshoweditbutton, sit_showfooter, sit_footertextleft, sit_footertextcontent, sit_footertextright, sit_color, sit_contentadjust, sit_softdelete, sit_createddate, sit_createdby, sit_updateddate, sit_updatedby, sit_hidden, sit_deleted) VALUES (1,1,'Zoltan','Zoltan','','Verdana','15','bold','#081F76','Verdana','11','bold','#081F76','Verdana','11','normal','#081F76','Verdana','11','normal','#000000','1','#203470','#ffffff','#081F76','center','Verdana','10','normal','#203470','1','left','','',0,0,'center','top',1,0,0,'','','','n/a',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);


DELETE FROM men_menu;
INSERT INTO men_menu (men_id,sit_id,men_menualign,men_menufade,men_menufadedurance,men_menuoffset,men_menutop,men_menuleft,men_menuforecolor1,men_menubackcolor1,men_menuforecolor2,men_menubackcolor2,men_menuoverforecolor1,men_menuoverbackcolor1,men_menuoverforecolor2,men_menuoverbackcolor2,men_menufont,men_menubold1,men_menuoverbold1,men_menubold2,men_menuoverbold2,men_placement,men_between,men_wait,men_menulevel1borderx,men_menulevel1bordery,men_menulevel2borderx,men_menulevel2bordery,men_menuroundborder,men_menufontsize1,men_menuoverfontsize1,men_menufontsize2,men_menuoverfontsize2,men_menubordercolor1,men_menubordercolor2,men_createddate,men_createdby,men_updateddate,men_updatedby,men_hidden,men_deleted) VALUES (1,1,'top',1,'0.5',0,60,0,'#000000','#ffffff','#000000','#ffffff','#000000','#ccffff','#000000','#ccffff','Verdana',0,1,0,0,'center',2,500,1,1,1,1,0,10,10,10,10,'#999999','#999999','2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM mde_moduledefinitions;
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (1,1,'(System) Manage Sites','','Server/Modules/Sites/Sites.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (2,1,'(System) Manage Pages','','Server/Modules/Pages/Pages.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (3,1,'(System) Manage Menu','','Server/Modules/Menu/Menu.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (4,1,'(System) Manage Languages','','Server/Modules/Language/Language.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (5,1,'(System) Manage Roles','','Server/Modules/Roles/Roles.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (6,1,'(System) Manage Users','','Server/Modules/Users/Users.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (7,1,'Publisher','','Desktop/Modules/Publisher/Publisher.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (8,1,'Documents','','Desktop/Modules/Documents/Documents.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (9,1,'Mediagallery','','Desktop/Modules/Mediagallery/Mediagallery.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (10,1,'Events','','Desktop/Modules/Events/Events.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (11,1,'iFrame','','Desktop/Modules/iFrame/iFrame.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (12,1,'Quicklinks','','Desktop/Modules/Quicklinks/Quicklinks.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mde_moduledefinitions (mde_id, sit_id, mde_name, mde_description, mde_desktopsrc, mde_mobilesrc, mde_createddate, mde_createdby, mde_updateddate, mde_updatedby, mde_hidden, mde_deleted) VALUES (13,1,'Discussion','','Desktop/Modules/Discussion/Discussion.ascx','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM pag_page;
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (1,1,1,1,0,'n/a','0','','center','center',0,0,0,'n/a','0','Home','','','','All Users;',0,'170','600','170',1,333,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (2,1,1,99999,0,'n/a','0','','center','center',0,0,1,'n/a','0','Admin','','','','Superadmin;Admins;',0,'170','600','170',1,666,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (3,1,1,3,0,'n/a','0','','center','center',0,0,0,'n/a','0','Mediagallery','','','','All Users;',0,'170','600','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (4,1,1,5,0,'n/a','0','','center','center',0,0,0,'n/a','0','Publisher','','','','All Users;',0,'170','600','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (5,1,1,7,0,'n/a','0','','center','center',0,0,0,'n/a','0','Events','','','','All Users;',0,'170','600','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (6,1,1,9,0,'n/a','0','','center','center',0,0,0,'n/a','0','Quicklinks','','','','All Users;',0,'170','600','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (7,1,1,11,0,'n/a','0','','center','center',0,0,0,'n/a','0','iFrame','','','','All Users;',0,'170','600','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (8,1,1,13,0,'n/a','0','','center','center',0,0,0,'n/a','0','Documents','','','','All Users;',0,'170','800','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO pag_page (pag_id, sit_id, lng_id, pag_order, pag_pageparentid, pag_backcolor, pag_pictureid,pag_picturehref,pag_picturehorizontalalign,pag_pictureverticalalign,pag_picturehorizontaltiling,pag_pictureverticaltiling,pag_minimizer,pag_height,pag_top,pag_name, pag_description, pag_mobilename, pag_mobiledescription, pag_authorizedroles, pag_showmobile, pag_leftmodulefieldwidth, pag_contentmodulefieldwidth, pag_rightmodulefieldwidth, pag_contentalign, pag_level, pag_iconfile, pag_adminpageicon, pag_isvisible, pag_haschildren, pag_createddate, pag_createdby, pag_updateddate, pag_updatedby, pag_hidden, pag_deleted) VALUES (9,1,1,15,0,'n/a','0','','center','center',0,0,0,'n/a','0','Discussion','','','','All Users;',0,'170','600','170',1,0,'','',1,0,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM mod_modules;
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (1,1,2,1,1,1,'ContentModuleField','Sites','','Superadmin;Admins;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (2,1,2,1,2,3,'ContentModuleField','Pages','','Superadmin;Admins;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (3,1,0,1,3,0,'TopModuleField','Menu','','Superadmin;Admins;',0,0,'middle','','0','','','','',1,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (4,1,2,1,4,9,'ContentModuleField','Languages','','Superadmin;Admins;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',1,1);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (5,1,2,1,5,7,'ContentModuleField','Roles','','Superadmin;Admins;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (6,1,2,1,6,5,'ContentModuleField','Users','','Superadmin;Admins;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (7,1,3,1,9,1,'ContentModuleField','Mediagallery','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (8,1,4,1,7,1,'ContentModuleField','Publisher','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (9,1,5,1,10,1,'ContentModuleField','Events','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (10,1,6,1,12,1,'ContentModuleField','Quicklinks','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (11,1,7,1,11,1,'ContentModuleField','iFrame','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (12,1,8,1,8,1,'ContentModuleField','Documents','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO mod_modules (mod_id, sit_id, pag_id, lng_id, mde_id, mod_order, mod_panename, mod_title, mod_description, mod_authorizededitroles, mod_cachetime, mod_showmobile, mod_alignment, mod_color, mod_border, mod_editsrc, mod_iconfile, mod_editmoduleicon, mod_friendlyname, mod_secure, mod_allpages, mod_showtitle, mod_personalize, mod_skinpath, mod_createddate, mod_createdby, mod_updateddate, mod_updatedby, mod_hidden, mod_deleted) VALUES (13,1,9,1,13,1,'ContentModuleField','Discussion','','All Users;',0,0,'middle','','0','','','','',0,0,0,'','','2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM rol_roles;
INSERT INTO rol_roles (rol_id, sit_id, lng_id, rol_name, rol_description, rol_createddate, rol_createdby, rol_updateddate, rol_updatedby, rol_hidden, rol_deleted) VALUES (1,1,1,'Superadmin','System Super_Administrator','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO rol_roles (rol_id, sit_id, lng_id, rol_name, rol_description, rol_createddate, rol_createdby, rol_updateddate, rol_updatedby, rol_hidden, rol_deleted) VALUES (2,1,1,'Admins','System Administrator','2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO rol_roles (rol_id, sit_id, lng_id, rol_name, rol_description, rol_createddate, rol_createdby, rol_updateddate, rol_updatedby, rol_hidden, rol_deleted) VALUES (3,1,1,'Users','System Users','2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM usr_users;
INSERT INTO usr_users (usr_id, sit_id, usr_firstname, usr_loginname, usr_description, usr_password, usr_lastname, usr_email, usr_createddate, usr_createdby, usr_updateddate, usr_updatedby, usr_hidden, usr_deleted) VALUES (1,1,'sa','sa','','Fn7mNn0akGCV7gSXvrPVDQ==','','sa@default.se','2003-01-01','autoscript','2003-01-01','autoscript',1,0);
INSERT INTO usr_users (usr_id, sit_id, usr_firstname, usr_loginname, usr_description, usr_password, usr_lastname, usr_email, usr_createddate, usr_createdby, usr_updateddate, usr_updatedby, usr_hidden, usr_deleted) VALUES (2,1,'Admin','Admin','','uAk6H8qLvBrv8wc3N4qUIA==','','admin@default.se','2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM uro_userroles;
INSERT INTO uro_userroles (uro_id, usr_id, sit_id, rol_id, uro_createddate, uro_createdby, uro_updateddate, uro_updatedby, uro_hidden, uro_deleted) VALUES (1,1,1,1,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);
INSERT INTO uro_userroles (uro_id, usr_id, sit_id, rol_id, uro_createddate, uro_createdby, uro_updateddate, uro_updatedby, uro_hidden, uro_deleted) VALUES (2,2,1,2,'2003-01-01','autoscript','2003-01-01','autoscript',0,0);

DELETE FROM ver_version;
INSERT INTO ver_version (ver_id, ver_major, ver_minor, ver_build, ver_description, ver_createddate, ver_createdby, ver_hidden, ver_deleted) VALUES (1,2,0,0,'First Version','2003-01-01','autoscript',0,0);

DELETE FROM lgt_languagetext;
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_signin','Logga in',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_signout','Logga ut',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_username','Anv&auml;ndare',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_password','L&ouml;senord',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_loginfailed','Inloggningen misslyckades!',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_cookietext1','If you signin cookies will be used.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_cookietext1','Om du loggar in kommer cookies att anv&auml;ndas.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_cookietext2','Can only be avoid by not signin.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_cookietext2','Kan endast undvikas genom att inte logga in.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_errormessage','Not a valid email address',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer','sys_errormessage','Ej giltlig epost adress',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_editheader','Edit User',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_editheader','Editera Anv&auml;ndare',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_editupdate','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_editupdate','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_editcancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_editcancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_editdelete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_editdelete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_confirmpassword','Conform',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_confirmpassword','Bekr&auml;fta',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_editemailvalidator','Not a valid email address',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_editemailvalidator','Ej giltlig epost adress',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_editconfirmvalidator','Password do not match with confirm',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_editconfirmvalidator','Lösenordet stämmer inte med bekr&auml;ftning',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_add','L&auml;gg till',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_delete','Ta bort',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_ok','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_alternate','Tabort anv&auml;ndaren från denna roll',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_forename','F&ouml;rnamn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_lastname','Efternamn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_email','Email',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_login','Login',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_password','L&ouml;senord',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_description','Beskrivning',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_update','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_delete2','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_cancel2','Annullera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_add2','Ny',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_confirm','&Auml;r du s&auml;ker att du vill radera denna anv&auml;ndaren?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_linktext','Koppla anv&auml;ndare till roller',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_name','Namn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_description','Beskrivning',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_update','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_cancel','Annullera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_add','L&auml;gg till ny',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_confirm','&Auml;r du s&auml;ker att du vill radera denna rollen?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_linktext','Koppla roll till anv&auml;ndare',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_headertext','Anv&auml;ndare till roller',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_subtext1','Anv&auml;ndare:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_subtext2','Roller:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_headertext','Roller till anv&auml;ndare',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_subtext1','Roll:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_subtext2','Anv&auml;ndare:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_add2','Ny',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_add3','L&auml;gg till',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_ok2','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_editheader','Edit Role',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_editheader','Editera Roll',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_editupdate','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_editupdate','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_editcancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_editcancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_editdelete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_editdelete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_name','Namn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_update','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_cancel','Annullera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_add','L&auml;gg till ny',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Language','lang_confirm','&Auml;r du s&auml;ker att du vill radera detta spr&aring;ket?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_name','Namn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_alias','Alias',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_css','Stylesheet',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_logo','Logga',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_logohref','Logga Href',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_startpage','Startsida',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_alwaysshoweditbutton','Visa Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_showfooter','Visa Fottext',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_footertextleft','Fottext V',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_footertextcontent','Fottext M',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_footertextright','Fottext H',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_contentadjust','C Justering',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_update','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_cancel','Annullera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_add','L&auml;gg till ny',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_confirm','&Auml;r du s&auml;ker att du vill radera denna webben?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_name','Namn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_description','Beskrivning',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_desktopsrc','Desktop Src',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_update','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_cancel','Annullera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_add','L&auml;gg till ny',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Modules','mod_confirm','&Auml;r du s&auml;ker att du vill radera denna modulen?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_signin','Signin',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_signout','Signout',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_username','User',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_password','Password',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_loginfailed','Signin failed!',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer','sys_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_add','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_ok','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_alternate','Delete the user from this role',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_forename','Firstname',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_lastname','Lastname',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_email','Email',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_login','Signin',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_password','Password',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_description','Description',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_update','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_delete2','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_cancel2','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_add2','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_confirm','Do you want to delete this user?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_linktext','Add user to roles',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_name','Name',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_description','Description',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_update','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_add','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_confirm','Do you want to delete this role?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_linktext','Add users to role',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_headertext','User to roles',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_subtext1','User:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_subtext2','Roles:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_headertext','Roles to user',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_subtext1','Role:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_subtext2','User:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_add2','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_add3','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_ok2','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_name','Name',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_update','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_add','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Language','lang_confirm','Do you want to delete this langauge?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_name','Name',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_alias','Alias',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_css','Stylesheet',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_logo','Header',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_logohref','Header Href',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_startpage','Startpage',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_alwaysshoweditbutton','Show edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_showfooter','Show footer text',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_footertextleft','Footer text L',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_footertextcontent','Footer text M',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_footertextright','Footer text R',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_contentadjust','Content adjust',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_update','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_add','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_confirm','Do you want to delete this site?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_name','Name',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_description','Description',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_desktopsrc','Desktop Src',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_update','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_add','Add',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Modules','mod_confirm','Do you want to delete this module?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_confirm','Do you want to delete this page?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_confirm','&Auml;r du s&auml;ker att du vill radera denna sidan?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_addpage','New page',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_addpage','Ny sida',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_moveup','Move page up on step',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_moveup','Flytta sidan upp ett steg',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_movedown','Move page down on step',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_movedown','Flytta sidan ner ett steg',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_moveto','Move page to?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_moveto','Flytta sidan till?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_edit','Edit page',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_edit','Editera sidan',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_delete','Delete page',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_delete','Radera sidan',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_selpage','No page selected...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_selpage','Ingen sida markerad...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_info','Selected Page:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_info','Markerad Sida:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_labelmoveup','Up',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_labelmoveup','Upp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_labelmovedown','Down',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_labelmovedown','Ner',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_labelmoveto','Move',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_labelmoveto','Flytta',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_labeledit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_labeledit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pag_labeldelete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pag_labeldelete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_save',' Ok ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_save',' Ok ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_addmod','Add module',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_addmod','L&auml;gg till modulen',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_header','The page title and layout',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_header','Sidans titel och layout',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_name','Page title',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_name','Sidans namn',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_leftwidth','Left module field width (px):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_leftwidth','V&auml;nster modul f&auml;lt bredd (px):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_contentwidth','Content module field width (px):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_contentwidth','Centrerad modul f&auml;lt bredd (px):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_contentalign','Center the content module field',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_contentalign','Centrera mitten modul f&auml;ltet',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_rightwidth','Right module field width (px):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_rightwidth','H&ouml;ger modul f&auml;lt bredd (px):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_roles','Authorized roles:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_roles','Ber&auml;ttigade roller:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_addto','Add module:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_addto','L&auml;gg till modul:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_modtype','Module type:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_modtype','Mudul typ:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_modname','Module name:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_modname','Modul namn:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_org','Organize modules:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_org','Organisera moduler:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_leftfield','Left module field:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_leftfield','V&auml;nster modul f&auml;lt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_centerfield','Content module field:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_centerfield','Centrerad modul f&auml;lt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_rightfield','Right module field:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_rightfield','H&ouml;ger modul f&auml;lt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_moveup','Move module one step up',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_moveup','Flytta modulen ett steg upp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_movedown','Move module one step down',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_movedown','Flytta modulen ett steg ner',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_moveleft','Move module one step to the left',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_moveleft','Flytta modulen ett steg &aring;t v&auml;nster',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_moveright','Move module one step to the right',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_moveright','Flytta modulen ett steg &aring;t h&ouml;ger',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_edit','Edit module',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_edit','Editera modulen',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_delete','Delete module',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_delete','Radera modulen',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_stdheader','Standard settings',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_stdheader','Standard inst&auml;llningar',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_advheader','Advanced settings',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_advheader','Avancerade inst&auml;llningar',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_useminimizer','Use minimizer icons:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_useminimizer','Anv&auml;nd minimera iconer:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_height','Height:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_height','H&ouml;jd:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_backcolor','Backcolor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_backcolor','Bakgrundsf&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_backpicture','Backpicture:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_backpicture','Bakgrundsbild:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_backpicturehorizontalalign','Backpicture horizontal align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_backpicturehorizontalalign','Bakgrundsbild horizontal placering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_backpictureverticalalign','Backpicture vertical align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_backpictureverticalalign','Bakgrundsbild vertikal placering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_backpicturehorizontaltiling','Backpicture horizontal tiling:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_backpicturehorizontaltiling','Bakgrundsbild horizontalt &ouml;verlapp:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_backpictureverticaltiling','Backpicture vertical tiling:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_backpictureverticaltiling','Bakgrundsbild vertikalt &ouml;verlapp:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_left','Left',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_left','V&auml;nster',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_top','Top',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_top','Topp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_right','Right',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_right','H&ouml;ger',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_bottom','Bottom',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_bottom','Nere',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_center','Center',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_center','Centrerad',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_editpicture',' Edit ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_editpicture','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pagedit_toppx','Top:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pagedit_toppx','Topp:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_header','Module settings',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_header','Modul inst&auml;llningar',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_name','Module name:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_name','Modul namn:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_cache','Cache timeout (seconds):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_cache','Cache timeout (sekunder):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_showtitle','Show title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_showtitle','Visa titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_yes','Yes',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_yes','Ja',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_no','No',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_no','Nej',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_roles','Authorized roles:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_roles','Roller som kan editera inneh&aring;llet:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_save','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_save','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_visible','Is visible:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_visible','Synlig:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_align','Align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_align','L&auml;ge:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_alignleft','Left',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_alignleft','V&auml;nster',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_alignmiddle','Middle',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_alignmiddle','Mitten',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_alignright','Right',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_alignright','H&ouml;ger',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_border','Border:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_border','Ram:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','modedit_color','BackColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','modedit_color','Bakgrundsf&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_header','System specific information and settings, click on the button to the right.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_header','System specifik information och inst&auml;llningar, klicka p&aring; knappen till h&ouml;ger.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_title','Title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_title','Titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_settings','Settings',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_settings','Inst&auml;llningar',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_yes','Yes',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_yes','Ja',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_no','No',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_no','Nej',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_header','Setting',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_header','Inst&auml;llningar',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_title','Title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_title','Titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_showedit','Always show edit:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_showedit','Visa alltid editera:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_showfooter','Show footer:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_showfooter','Visa sidfot:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_footerleft','Left footer text:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_footerleft','V&auml;nster sidfot text:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_footercontent','Content footer text:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_footercontent','Centrerad sidfot text:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_footerright','Right footer text:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_footerright','H&ouml;ger sidfot text:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_contentadjust','Content adjust:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_contentadjust','Inneh&aring;lls justering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_softdelete','Log deleted items:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_softdelete','Logga raderade rader:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_color','Backcolor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_color','Bakgrundsf&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_picture','Backpicture:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_picture','Bakgrundsbild:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_picturebutton','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_picturebutton','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign','Menu align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign','Meny placering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign1','Left',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign1','V&auml;nster',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign2','Top',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign2','Topp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign3','Right',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign3','H&ouml;ger',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign4','Bottom',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign4','Ner',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign5','Center',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menualign5','Centrerad',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufade','Menu fade:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufade','Meny fade:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufadedurance','Menu fade durance:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufadedurance','Meny fade tid:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menutop','Menu top:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menutop','Meny topp:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuleft','Menu left:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuleft','Meny v&auml;nster:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuforecolor1','Menu forecolor 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuforecolor1','Menu textf&auml;rg 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuforecolor2','Menu forecolor 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuforecolor2','Menu textf&auml;rg 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubackcolor1','Menu backcolor 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubackcolor1','Menu bakgrundsf&auml;rg 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubackcolor2','Menu backcolor 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubackcolor2','Menu bakgrundsf&auml;rg 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverforecolor1','Menu Over forecolor 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverforecolor1','Meny &Ouml;ver textf&auml;rg 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverforecolor2','Menu Over forecolor 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverforecolor2','Meny &Ouml;ver textf&auml;rg 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbackcolor1','Menu Over backcolor 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbackcolor1','Meny &Ouml;ver bakgrundsf&auml;rg 1:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbackcolor2','Menu Over backcolor 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbackcolor2','Meny &Ouml;ver bakgrundsf&auml;rg 2:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufont','Menu text font:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufont','Meny text font:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_save','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_save','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_upload_save','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_upload_save','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_upload_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_upload_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_upload_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_upload_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_upload_header','Upload backpicture',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_upload_header','Ladda upp bakgrundsbild',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_upload_name','Name:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_upload_name','Namn:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_upload_confirm','Do you want to delete this picture?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_upload_confirm','Vill du verkligen radera denna bilden?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_placement','Menu placement:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_placement','Meny placering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_between','Menu space:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_between','Meny avst&aring;nd:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_wait','Menu delay:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_wait','Meny delay:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_level1borderx','Menu level1 borderX:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_level1borderx','Meny niv&aring;1 ramX:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_level1bordery','Menu level1 borderY:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_level1bordery','Meny niv&aring;1 ramY:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_level2borderx','Menu level2 borderX:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_level2borderx','Meny niv&aring;2 ramX:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_level2bordery','Menu level2 borderY:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_level2bordery','Meny niv&aring;2 ramY:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_language','Language:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_language','Spr&aring;k:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_logohorizontalalign','Backpicture horizontal align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_logohorizontalalign','Bakgrundsbild horizontal placering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_logoverticalalign','Backpicture vertical align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_logoverticalalign','Bakgrundsbild vertikal placering:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubold1','Menu level1 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubold1','Meny niv&aring;1 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbold1','Menu Over level1 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbold1','Meny &Ouml;ver niv&aring;1 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubold2','Menu level2 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubold2','Meny niv&aring;2 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbold2','Menu Over level2 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverbold2','Meny &Ouml;ver niv&aring;2 bold:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufontsize1','Menu Over level1 fontsize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufontsize1','Meny &Ouml;ver niv&aring;1 fontstorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverfontsize1','Menu Over level1 fontsize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverfontsize1','Meny &Ouml;ver niv&aring;1 fontstorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufontsize2','Menu Over level2 fontsize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menufontsize2','Meny &Ouml;ver niv&aring;2 fontstorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverfontsize2','Menu Over level2 fontsize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoverfontsize2','Meny &Ouml;ver niv&aring;2 fontstorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubordercolor1','Menu level1 border color:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubordercolor1','Meny niv&aring;1 ram f&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubordercolor2','Menu level2 border color:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menubordercolor2','Meny niv&aring;2 ram f&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuroundborder','Menu border-round:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuroundborder','Meny ram-kant:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoffset','Menu Offset:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuoffset','Meny Offset:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_siteheader','Standard',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_siteheader','Standard',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menustdheader','Menu Standard',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menustdheader','Meny Standard',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuadvheader','Menu Advanced',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_menuadvheader','Meny Avancerad',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_cssheader','Stylesheet',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_cssheader','Stilmall',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_headfamily','Header FontFamily:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_headfamily','Rubrik TextFamilj:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_headsize','Header FontSize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_headsize','Rubrik TextStorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_headweight','Header FontWeight:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_headweight','Rubrik TextVikt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_headcolor','Header FontColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_headcolor','Rubrik TextF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadfamily','Ingress FontFamily:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadfamily','Ingress TextFamilj:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadsize','Ingress FontSize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadsize','Ingress TextStorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadweight','Ingress FontWeight:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadweight','Ingress TextVikt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadcolor','Ingress FontColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subheadcolor','Ingress TextF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadfamily','Text FontFamily:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadfamily','Text TextFamilj:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadsize','Text FontSize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadsize','Text TextStorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadweight','Text FontWeight:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadweight','Text TextVikt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadcolor','Text FontColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_subsubheadcolor','Text TextF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalfamily','Normal FontFamily:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalfamily','Normal Familj:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalsize','Normal FontSize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalsize','Normal TextStorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalweight','Normal FontWeight:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalweight','Normal TextVikt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalcolor','Normal FontColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_normalcolor','Normal TextF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonfamily','Button FontFamily:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonfamily','Knapp TextFamilj:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonsize','Button FontSize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonsize','Knapp TextStorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonweight','Button FontWeight:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonweight','Knapp TextVikt:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonforecolor','Button ForeColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonforecolor','Knapp TextF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonbackcolor','Button BackColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonbackcolor','Knapp BakgrundsF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonbordersize','Button BorderSize:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonbordersize','Knapp RamStorlek:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonbordercolor','Button BorderColor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttonbordercolor','Knapp RamF&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttontextalign','Button Text Align',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_buttontextalign','Knapp Text L&auml;ge:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_hrheight','Line Height:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_hrheight','Linje H&ouml;jd:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_hrcolor','Line Color:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_hrcolor','Linje F&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_hralign','Line Align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_hralign','Linje L&auml;ge:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_weightbold','Bold',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_weightbold','Fet',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_weightnormal','Normal',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_weightnormal','Normal',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_ok','  Ok  ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_ok','  Ok  ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_verticaltiling','Backpicture horizontal tiling:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_verticaltiling','Bakgrundsbild horizontalt &ouml;verlapp:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_edit_horizontaltiling','Backpicture vertical tiling:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_edit_horizontaltiling','Bakgrundsbild vertikalt &ouml;verlapp:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_upload','Upload',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_upload','Ladda upp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_header','Document Details',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_header','Document Detaljer',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_title','Name:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_title','Namn:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_save','Save',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_save','Spara',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Mediagallery','mediagallery_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_designlayout','Design layout',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_designlayout','Design l&auml;ge',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_htmllayout','Html layout',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_htmllayout','Html l&auml;ge',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_header','Header',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_header','Rubrik',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_font','Font family',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_font','Tecken snitt',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_fontsize','Font size',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_fontsize','Tecken storlek',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_defaulttext','Type here...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_defaulttext','Skriv h&auml;r...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_undo','Undo',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_undo','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_redo','Redo',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_redo','G&ouml;r om',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_print','Print',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_print','Skriv ut',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_selectall','Select all',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_selectall','Markera allt',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_cut','Cut',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_cut','Klipp ut',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_copy','Copy',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_copy','Kopiera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_paste','Paste',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_paste','Klistra in',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_bold','Bold',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_bold','Fet',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_italic','Italic',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_italic','Kursiv',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_underline','Underline',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_underline','Understruken',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_strikethrou','Strikethrou',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_strikethrou','Genomstruken',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_left','Left',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_left','V&auml;nster',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_center','Center',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_center','Centrera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_right','Right',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_right','H&ouml;ger',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_orderedlist','Ordered list',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_orderedlist','Numrerad lista',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_bulletedlist','Bulleted list',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_bulletedlist','Punkt lista',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_unindent','Unindent',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_unindent','Minska indrag',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_indent','Indent',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_indent','&Ouml;ka indrag',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_uppercase','Uppercase',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_uppercase','Versaler',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_lowercase','Lowercase',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_lowercase','Gemener',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_superscript','Superscript',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_superscript','Superscipt',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_subscript','Subscript',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_subscript','Subscript',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_horizontal','Horizontal rule',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_horizontal','Horizontal linje',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_textcolor','Font color',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_textcolor','Tecken f&auml;rg',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_bgcolor','Highlight',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_bgcolor','&Ouml;verstrykning',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_symbol','Symbol',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_symbol','Symbol',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_table','Create table',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_table','Tillverka tabell',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_link','Add url',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_link','Infoga url',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_image','Insert image',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_image','Infoga bild',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_preview','Preview in browser',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_preview','F&ouml;rhandsgranska i webbl&auml;sare',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_confirmclick','Click in the document feild before trying to implement a new object.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_confirmclick','Klicka i dokumentet innan implementering av nytt objekt.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablewidht','Width (without %):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablewidht','Bredd (utan %):',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tableborder','Border:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tableborder','Ram:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablerows','Rows:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablerows','Rader:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablecolumns','Columns:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablecolumns','Columner:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablecellpadding','Cellpadding:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablecellpadding','Cellpadding:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablecellspacing','Cellspacing:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablecellspacing','Cellspacing:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablebgcolor','Backcolor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablebgcolor','Bakgrundsf&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealign','Align:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealign','L&auml;ge:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablebordercolor','Bordercolor:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablebordercolor','Ramf&auml;rg:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealignleft','Left',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealignleft','V&auml;nster',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealigncenter','Center',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealigncenter','Centrerad',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealignright','Right',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_tablealignright','H&ouml;ger',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_linktype','Type:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_linktype','Typ:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_linkshow','Show:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_linkshow','Visa:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_linkurl','Url:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_linkurl','Url:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_urlheader','Upload',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_urlheader','Ladda upp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_urlborder','Border:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_urlborder','Ram:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Publisher','publisher_urlalt','Alternative:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Publisher','publisher_urlalt','Alternativ:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_edit','New event',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_edit','Ny h&auml;ndelse',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_header','Details',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_header','Detaljer',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_title','Title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_title','Titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_description','Description:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_description','Beskrivning:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_link','Link:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_link','L&auml;nk:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_showdate','Show date:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_showdate','Visa datum:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_hidedate','Hide date:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_hidedate','D&ouml;lj datum:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_confirm','Do you want to delete this Event?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_confirm','&Auml;r du s&auml;ker att du vill radera denna h&auml;ndelsen?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_readmore','Read more...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_readmore','L&auml;s mer...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_coming','Comming...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_coming','Kommande...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_used','Used...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_used','F&ouml;rbrukad...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Events','events_icon','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Events','events_icon','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_edit','New link',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_edit','Ny l&auml;nk',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_iconedit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_iconedit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_iconnavigate','Go...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_iconnavigate','G&aring;...',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_header','Details',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_header','Detaljer',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_title','Title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_title','Titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_description','Description:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_description','Beskrivning:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_url','Url:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_url','Url:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_order','Order:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_order','Order:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_confirm','Do you want to delete this Link?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Quicklinks','quicklinks_confirm','&Auml;r du s&auml;ker att du vill radera denna l&auml;nken?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_header','Details',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_header','Detaljer',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_title','Title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_title','Titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_description','Description:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_description','Beskrivning:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_width','Width:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_width','Bredd:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_height','Height:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_height','H&ouml;jd:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_url','Url:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_url','Url:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_order','Order:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_order','Order:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.iFrame','iframe_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.iFrame','iframe_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_edit','Edit',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_edit','Editera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_addfolderconfirm1','A new folder will be created in: ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_addfolderconfirm1','En ny mapp kommer att skapas i: ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_addfolderconfirm2','Give the new folder a title.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_addfolderconfirm2','Ge den nya mappen en titel.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_deletefolderconfirm','Do you want to delete the folder: ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_deletefolderconfirm','Vill du radera mappen: ',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_addfolderalttext','Add folder',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_addfolderalttext','Ny mapp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_editfolderconfirm','Give the folder a new title.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_editfolderconfirm','Ge mappen en ny titel.',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_editfolderalttext','Edit folder',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_editfolderalttext','Editera mapp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_deletefolderalttext','Delete folder',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_deletefolderalttext','Radera mapp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_uploadfilealttext','Upload new document',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_uploadfilealttext','Ladda upp nytt dokument',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_refreshalttext','Refresh',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_refreshalttext','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_simpleviewstate','SimpleView',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_simpleviewstate','SimpelVy',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_addfolderdefaulttext','New folder',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_addfolderdefaulttext','Ny mapp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_folders','Folders',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_folders','Mappar',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_title','Title',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_title','Titel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_size','Size',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_size','Storlek',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_modified','Last Modified',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_modified','&Auml;ndrad',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_title2','Title:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_title2','Titel:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_header','Upload',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_header','Ladda upp',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_delete','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_delete','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_revisions','Revisions',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_revisions','Revisioner',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Documents','documents_deletefileconfirm','Do you want to delete this document ?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Documents','documents_deletefileconfirm','Vill du radera detta dokument ?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_new','New thread',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_new','Ny tr&aring;d',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_header','Post a New Message',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_header','L&auml;gg in Nytt Meddelande',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_subject','Subject:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_subject','&Auml;mne:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_message','Message:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_message','Meddelande:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_update','Update',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_update','Uppdatera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_post','Post',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_post','L&auml;gg in',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_cancel','Cancel',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_cancel','&Aring;ngra',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_deleted','Delete',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_deleted','Radera',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_author','Author:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_author','F&ouml;rfattare:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_created','Posted:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_created','Inlaggd:',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_reply','Reply to this message',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_reply','Svara p&aring; detta meddelande',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_edit','Edit Message',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_edit','Editera Meddelande',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_fwd','Next Message',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_fwd','N&auml;sta Meddelande',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_rew','Previous Message',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_rew','F&ouml;reg&aring;ende Meddelade',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_confirm','Do you want to delete this message ?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_confirm','Vill du radera detta meddelande ?',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_posted','posted',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_posted','inlaggd',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_by','by',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_by','av',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Discussion','discussion_unknown','Unknown',0,0);
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Discussion','discussion_unknown','Ok&auml;nd',0,0);
