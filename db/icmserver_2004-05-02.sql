# MySQL-Front Dump 2.5
#
# Host: localhost   Database: icmserver
# --------------------------------------------------------
# Server version 4.0.15-max-nt


#
# Table structure for table 'cat_catalogs'
#

CREATE TABLE cat_catalogs (
  cat_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  cat_parentid int(11) default NULL,
  cat_name varchar(255) default NULL,
  cat_description longtext,
  cat_createddate datetime default NULL,
  cat_createdby varchar(255) default NULL,
  cat_updateddate datetime default NULL,
  cat_updatedby varchar(255) default NULL,
  cat_hidden int(1) NOT NULL default '0',
  cat_deleted int(1) NOT NULL default '0',
  cat_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (cat_id)
) TYPE=MyISAM;



#
# Dumping data for table 'cat_catalogs'
#



#
# Table structure for table 'dis_discussion'
#

CREATE TABLE dis_discussion (
  dis_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  dis_rollup int(11) NOT NULL default '0',
  dis_root int(11) NOT NULL default '0',
  dis_indent varchar(100) default NULL,
  dis_title varchar(100) default NULL,
  dis_body text,
  dis_createddate datetime default NULL,
  dis_createdby varchar(255) default NULL,
  dis_updateddate datetime default NULL,
  dis_updatedby varchar(255) default NULL,
  dis_hidden int(1) NOT NULL default '0',
  dis_deleted int(1) NOT NULL default '0',
  dis_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (dis_id)
) TYPE=MyISAM;



#
# Dumping data for table 'dis_discussion'
#



#
# Table structure for table 'doc_documents'
#

CREATE TABLE doc_documents (
  doc_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) default NULL,
  pag_id int(11) default NULL,
  cat_id int(11) default NULL,
  doc_rollup int(11) NOT NULL default '0',
  doc_revision int(11) NOT NULL default '0',
  doc_name varchar(255) default NULL,
  doc_description longtext,
  doc_content longblob,
  doc_contenttype varchar(200) default NULL,
  doc_contentsize bigint(20) default NULL,
  doc_createddate datetime default NULL,
  doc_createdby varchar(255) default NULL,
  doc_updateddate datetime default NULL,
  doc_updatedby varchar(255) default NULL,
  doc_hidden int(1) NOT NULL default '0',
  doc_deleted int(1) NOT NULL default '0',
  doc_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (doc_id)
) TYPE=MyISAM;



#
# Dumping data for table 'doc_documents'
#



#
# Table structure for table 'eve_events'
#

CREATE TABLE eve_events (
  eve_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  eve_title varchar(255) default NULL,
  eve_description longtext,
  eve_link varchar(255) default NULL,
  eve_showdate datetime default NULL,
  eve_hidedate datetime default NULL,
  eve_createddate datetime default NULL,
  eve_createdby varchar(255) default NULL,
  eve_updateddate datetime default NULL,
  eve_updatedby varchar(255) default NULL,
  eve_hidden int(1) NOT NULL default '0',
  eve_deleted int(1) NOT NULL default '0',
  eve_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (eve_id)
) TYPE=MyISAM;



#
# Dumping data for table 'eve_events'
#



#
# Table structure for table 'htm_htmltext'
#

CREATE TABLE htm_htmltext (
  htm_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  htm_desktophtml longtext,
  htm_mobilesummary longtext,
  htm_mobiledetails longtext,
  htm_createddate datetime default NULL,
  htm_createdby varchar(255) default NULL,
  htm_updateddate datetime default NULL,
  htm_updatedby varchar(255) default NULL,
  htm_hidden int(1) NOT NULL default '0',
  htm_deleted int(1) NOT NULL default '0',
  htm_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (htm_id)
) TYPE=MyISAM;



#
# Dumping data for table 'htm_htmltext'
#



#
# Table structure for table 'ifr_iframe'
#

CREATE TABLE ifr_iframe (
  ifr_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  ifr_title varchar(255) default NULL,
  ifr_description longtext,
  ifr_url text,
  ifr_width varchar(50) default NULL,
  ifr_height varchar(50) default NULL,
  ifr_createddate datetime default NULL,
  ifr_createdby varchar(255) default NULL,
  ifr_updateddate datetime default NULL,
  ifr_updatedby varchar(255) default NULL,
  ifr_hidden int(1) NOT NULL default '0',
  ifr_deleted int(1) NOT NULL default '0',
  ifr_ts timestamp(14) NOT NULL,
  ifr_target varchar(50) default NULL,
  PRIMARY KEY  (ifr_id)
) TYPE=MyISAM;



#
# Dumping data for table 'ifr_iframe'
#



#
# Table structure for table 'lgt_languagetext'
#

CREATE TABLE lgt_languagetext (
  lgt_id int(11) NOT NULL auto_increment,
  lng_id int(11) NOT NULL default '0',
  lgt_location varchar(50) default NULL,
  lgt_phrase longtext,
  lgt_text longtext,
  lgt_hidden int(1) NOT NULL default '0',
  lgt_deleted int(1) NOT NULL default '0',
  lgt_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (lgt_id)
) TYPE=MyISAM;



#
# Dumping data for table 'lgt_languagetext'
#

INSERT INTO lgt_languagetext VALUES("1", "2", "iConsulting.iCMServer", "sys_signin", "Logga in", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("2", "2", "iConsulting.iCMServer", "sys_signout", "Logga ut", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("3", "2", "iConsulting.iCMServer", "sys_username", "Anv&auml;ndare", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("4", "2", "iConsulting.iCMServer", "sys_password", "L&ouml;senord", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("5", "2", "iConsulting.iCMServer", "sys_loginfailed", "Inloggningen misslyckades!", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("6", "2", "iConsulting.iCMServer", "sys_cancel", "Cancel", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("7", "1", "iConsulting.iCMServer", "sys_cookietext1", "If you signin cookies will be used.", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("8", "2", "iConsulting.iCMServer", "sys_cookietext1", "Om du loggar in kommer cookies att anv&auml;ndas.", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("9", "1", "iConsulting.iCMServer", "sys_cookietext2", "Can only be avoid by not signin.", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("10", "2", "iConsulting.iCMServer", "sys_cookietext2", "Kan endast undvikas genom att inte logga in.", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("11", "1", "iConsulting.iCMServer", "sys_errormessage", "Not a valid email address", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("12", "2", "iConsulting.iCMServer", "sys_errormessage", "Ej giltlig epost adress", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("13", "1", "iConsulting.iCMServer.Modules.Users", "users_editheader", "Edit User", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("14", "2", "iConsulting.iCMServer.Modules.Users", "users_editheader", "Editera Anv&auml;ndare", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("15", "1", "iConsulting.iCMServer.Modules.Users", "users_editupdate", "Update", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("16", "2", "iConsulting.iCMServer.Modules.Users", "users_editupdate", "Uppdatera", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("17", "1", "iConsulting.iCMServer.Modules.Users", "users_editcancel", "Cancel", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("18", "2", "iConsulting.iCMServer.Modules.Users", "users_editcancel", "&Aring;ngra", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("19", "1", "iConsulting.iCMServer.Modules.Users", "users_editdelete", "Delete", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("20", "2", "iConsulting.iCMServer.Modules.Users", "users_editdelete", "Radera", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("21", "1", "iConsulting.iCMServer.Modules.Users", "users_confirmpassword", "Conform", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("22", "2", "iConsulting.iCMServer.Modules.Users", "users_confirmpassword", "Bekr&auml;fta", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("23", "1", "iConsulting.iCMServer.Modules.Users", "users_editemailvalidator", "Not a valid email address", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("24", "2", "iConsulting.iCMServer.Modules.Users", "users_editemailvalidator", "Ej giltlig epost adress", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("25", "1", "iConsulting.iCMServer.Modules.Users", "users_editconfirmvalidator", "Password do not match with confirm", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("26", "2", "iConsulting.iCMServer.Modules.Users", "users_editconfirmvalidator", "Lösenordet stämmer inte med bekr&auml;ftning", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("27", "2", "iConsulting.iCMServer.Modules.Users", "users_add", "L&auml;gg till", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("28", "2", "iConsulting.iCMServer.Modules.Users", "users_delete", "Ta bort", "0", "0", "20040502232035");
INSERT INTO lgt_languagetext VALUES("29", "2", "iConsulting.iCMServer.Modules.Users", "users_ok", "Spara", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("30", "2", "iConsulting.iCMServer.Modules.Users", "users_alternate", "Tabort anv&auml;ndaren från denna roll", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("31", "2", "iConsulting.iCMServer.Modules.Users", "users_forename", "F&ouml;rnamn", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("32", "2", "iConsulting.iCMServer.Modules.Users", "users_lastname", "Efternamn", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("33", "2", "iConsulting.iCMServer.Modules.Users", "users_email", "Email", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("34", "2", "iConsulting.iCMServer.Modules.Users", "users_login", "Login", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("35", "2", "iConsulting.iCMServer.Modules.Users", "users_password", "L&ouml;senord", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("36", "2", "iConsulting.iCMServer.Modules.Users", "users_description", "Beskrivning", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("37", "2", "iConsulting.iCMServer.Modules.Users", "users_update", "Spara", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("38", "2", "iConsulting.iCMServer.Modules.Users", "users_edit", "Editera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("39", "2", "iConsulting.iCMServer.Modules.Users", "users_delete2", "Radera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("40", "2", "iConsulting.iCMServer.Modules.Users", "users_cancel2", "Annullera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("41", "2", "iConsulting.iCMServer.Modules.Users", "users_add2", "Ny", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("42", "2", "iConsulting.iCMServer.Modules.Users", "users_confirm", "&Auml;r du s&auml;ker att du vill radera denna anv&auml;ndaren?", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("43", "2", "iConsulting.iCMServer.Modules.Users", "users_linktext", "Koppla anv&auml;ndare till roller", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("44", "2", "iConsulting.iCMServer.Modules.Roles", "roles_name", "Namn", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("45", "2", "iConsulting.iCMServer.Modules.Roles", "roles_description", "Beskrivning", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("46", "2", "iConsulting.iCMServer.Modules.Roles", "roles_update", "Spara", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("47", "2", "iConsulting.iCMServer.Modules.Roles", "roles_edit", "Editera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("48", "2", "iConsulting.iCMServer.Modules.Roles", "roles_delete", "Radera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("49", "2", "iConsulting.iCMServer.Modules.Roles", "roles_cancel", "Annullera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("50", "2", "iConsulting.iCMServer.Modules.Roles", "roles_add", "L&auml;gg till ny", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("51", "2", "iConsulting.iCMServer.Modules.Roles", "roles_confirm", "&Auml;r du s&auml;ker att du vill radera denna rollen?", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("52", "2", "iConsulting.iCMServer.Modules.Roles", "roles_linktext", "Koppla roll till anv&auml;ndare", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("53", "2", "iConsulting.iCMServer.Modules.Users", "users_headertext", "Anv&auml;ndare till roller", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("54", "2", "iConsulting.iCMServer.Modules.Users", "users_subtext1", "Anv&auml;ndare:", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("55", "2", "iConsulting.iCMServer.Modules.Users", "users_subtext2", "Roller:", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("56", "2", "iConsulting.iCMServer.Modules.Roles", "roles_headertext", "Roller till anv&auml;ndare", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("57", "2", "iConsulting.iCMServer.Modules.Roles", "roles_subtext1", "Roll:", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("58", "2", "iConsulting.iCMServer.Modules.Roles", "roles_subtext2", "Anv&auml;ndare:", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("59", "2", "iConsulting.iCMServer.Modules.Roles", "roles_add2", "Ny", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("60", "2", "iConsulting.iCMServer.Modules.Roles", "roles_add3", "L&auml;gg till", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("61", "2", "iConsulting.iCMServer.Modules.Roles", "roles_ok2", "Spara", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("62", "1", "iConsulting.iCMServer.Modules.Roles", "roles_editheader", "Edit Role", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("63", "2", "iConsulting.iCMServer.Modules.Roles", "roles_editheader", "Editera Roll", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("64", "1", "iConsulting.iCMServer.Modules.Roles", "roles_editupdate", "Update", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("65", "2", "iConsulting.iCMServer.Modules.Roles", "roles_editupdate", "Uppdatera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("66", "1", "iConsulting.iCMServer.Modules.Roles", "roles_editcancel", "Cancel", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("67", "2", "iConsulting.iCMServer.Modules.Roles", "roles_editcancel", "&Aring;ngra", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("68", "1", "iConsulting.iCMServer.Modules.Roles", "roles_editdelete", "Delete", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("69", "2", "iConsulting.iCMServer.Modules.Roles", "roles_editdelete", "Radera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("70", "2", "iConsulting.iCMServer.Modules.Language", "lang_name", "Namn", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("71", "2", "iConsulting.iCMServer.Modules.Language", "lang_update", "Spara", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("72", "2", "iConsulting.iCMServer.Modules.Language", "lang_edit", "Editera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("73", "2", "iConsulting.iCMServer.Modules.Language", "lang_delete", "Radera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("74", "2", "iConsulting.iCMServer.Modules.Language", "lang_cancel", "Annullera", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("75", "2", "iConsulting.iCMServer.Modules.Language", "lang_add", "L&auml;gg till ny", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("76", "2", "iConsulting.iCMServer.Modules.Language", "lang_confirm", "&Auml;r du s&auml;ker att du vill radera detta spr&aring;ket?", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("77", "2", "iConsulting.iCMServer.Modules.Sites", "sites_name", "Namn", "0", "0", "20040502232036");
INSERT INTO lgt_languagetext VALUES("78", "2", "iConsulting.iCMServer.Modules.Sites", "sites_alias", "Alias", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("79", "2", "iConsulting.iCMServer.Modules.Sites", "sites_css", "Stylesheet", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("80", "2", "iConsulting.iCMServer.Modules.Sites", "sites_logo", "Logga", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("81", "2", "iConsulting.iCMServer.Modules.Sites", "sites_logohref", "Logga Href", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("82", "2", "iConsulting.iCMServer.Modules.Sites", "sites_startpage", "Startsida", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("83", "2", "iConsulting.iCMServer.Modules.Sites", "sites_alwaysshoweditbutton", "Visa Editera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("84", "2", "iConsulting.iCMServer.Modules.Sites", "sites_showfooter", "Visa Fottext", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("85", "2", "iConsulting.iCMServer.Modules.Sites", "sites_footertextleft", "Fottext V", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("86", "2", "iConsulting.iCMServer.Modules.Sites", "sites_footertextcontent", "Fottext M", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("87", "2", "iConsulting.iCMServer.Modules.Sites", "sites_footertextright", "Fottext H", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("88", "2", "iConsulting.iCMServer.Modules.Sites", "sites_contentadjust", "C Justering", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("89", "2", "iConsulting.iCMServer.Modules.Sites", "sites_update", "Spara", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("90", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit", "Editera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("91", "2", "iConsulting.iCMServer.Modules.Sites", "sites_delete", "Radera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("92", "2", "iConsulting.iCMServer.Modules.Sites", "sites_cancel", "Annullera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("93", "2", "iConsulting.iCMServer.Modules.Sites", "sites_add", "L&auml;gg till ny", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("94", "2", "iConsulting.iCMServer.Modules.Sites", "sites_confirm", "&Auml;r du s&auml;ker att du vill radera denna webben?", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("95", "2", "iConsulting.iCMServer.Modules.Modules", "mod_name", "Namn", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("96", "2", "iConsulting.iCMServer.Modules.Modules", "mod_description", "Beskrivning", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("97", "2", "iConsulting.iCMServer.Modules.Modules", "mod_desktopsrc", "Desktop Src", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("98", "2", "iConsulting.iCMServer.Modules.Modules", "mod_update", "Spara", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("99", "2", "iConsulting.iCMServer.Modules.Modules", "mod_edit", "Editera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("100", "2", "iConsulting.iCMServer.Modules.Modules", "mod_delete", "Radera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("101", "2", "iConsulting.iCMServer.Modules.Modules", "mod_cancel", "Annullera", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("102", "2", "iConsulting.iCMServer.Modules.Modules", "mod_add", "L&auml;gg till ny", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("103", "2", "iConsulting.iCMServer.Modules.Modules", "mod_confirm", "&Auml;r du s&auml;ker att du vill radera denna modulen?", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("104", "1", "iConsulting.iCMServer", "sys_signin", "Signin", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("105", "1", "iConsulting.iCMServer", "sys_signout", "Signout", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("106", "1", "iConsulting.iCMServer", "sys_username", "User", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("107", "1", "iConsulting.iCMServer", "sys_password", "Password", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("108", "1", "iConsulting.iCMServer", "sys_loginfailed", "Signin failed!", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("109", "1", "iConsulting.iCMServer", "sys_cancel", "Cancel", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("110", "1", "iConsulting.iCMServer.Modules.Users", "users_add", "Add", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("111", "1", "iConsulting.iCMServer.Modules.Users", "users_delete", "Delete", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("112", "1", "iConsulting.iCMServer.Modules.Users", "users_ok", "Save", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("113", "1", "iConsulting.iCMServer.Modules.Users", "users_alternate", "Delete the user from this role", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("114", "1", "iConsulting.iCMServer.Modules.Users", "users_forename", "Firstname", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("115", "1", "iConsulting.iCMServer.Modules.Users", "users_lastname", "Lastname", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("116", "1", "iConsulting.iCMServer.Modules.Users", "users_email", "Email", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("117", "1", "iConsulting.iCMServer.Modules.Users", "users_login", "Signin", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("118", "1", "iConsulting.iCMServer.Modules.Users", "users_password", "Password", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("119", "1", "iConsulting.iCMServer.Modules.Users", "users_description", "Description", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("120", "1", "iConsulting.iCMServer.Modules.Users", "users_update", "Save", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("121", "1", "iConsulting.iCMServer.Modules.Users", "users_edit", "Edit", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("122", "1", "iConsulting.iCMServer.Modules.Users", "users_delete2", "Delete", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("123", "1", "iConsulting.iCMServer.Modules.Users", "users_cancel2", "Cancel", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("124", "1", "iConsulting.iCMServer.Modules.Users", "users_add2", "Add", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("125", "1", "iConsulting.iCMServer.Modules.Users", "users_confirm", "Do you want to delete this user?", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("126", "1", "iConsulting.iCMServer.Modules.Users", "users_linktext", "Add user to roles", "0", "0", "20040502232037");
INSERT INTO lgt_languagetext VALUES("127", "1", "iConsulting.iCMServer.Modules.Roles", "roles_name", "Name", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("128", "1", "iConsulting.iCMServer.Modules.Roles", "roles_description", "Description", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("129", "1", "iConsulting.iCMServer.Modules.Roles", "roles_update", "Save", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("130", "1", "iConsulting.iCMServer.Modules.Roles", "roles_edit", "Edit", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("131", "1", "iConsulting.iCMServer.Modules.Roles", "roles_delete", "Delete", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("132", "1", "iConsulting.iCMServer.Modules.Roles", "roles_cancel", "Cancel", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("133", "1", "iConsulting.iCMServer.Modules.Roles", "roles_add", "Add", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("134", "1", "iConsulting.iCMServer.Modules.Roles", "roles_confirm", "Do you want to delete this role?", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("135", "1", "iConsulting.iCMServer.Modules.Roles", "roles_linktext", "Add users to role", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("136", "1", "iConsulting.iCMServer.Modules.Users", "users_headertext", "User to roles", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("137", "1", "iConsulting.iCMServer.Modules.Users", "users_subtext1", "User:", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("138", "1", "iConsulting.iCMServer.Modules.Users", "users_subtext2", "Roles:", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("139", "1", "iConsulting.iCMServer.Modules.Roles", "roles_headertext", "Roles to user", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("140", "1", "iConsulting.iCMServer.Modules.Roles", "roles_subtext1", "Role:", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("141", "1", "iConsulting.iCMServer.Modules.Roles", "roles_subtext2", "User:", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("142", "1", "iConsulting.iCMServer.Modules.Roles", "roles_add2", "Add", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("143", "1", "iConsulting.iCMServer.Modules.Roles", "roles_add3", "Add", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("144", "1", "iConsulting.iCMServer.Modules.Roles", "roles_ok2", "Save", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("145", "1", "iConsulting.iCMServer.Modules.Language", "lang_name", "Name", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("146", "1", "iConsulting.iCMServer.Modules.Language", "lang_update", "Save", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("147", "1", "iConsulting.iCMServer.Modules.Language", "lang_edit", "Edit", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("148", "1", "iConsulting.iCMServer.Modules.Language", "lang_delete", "Delete", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("149", "1", "iConsulting.iCMServer.Modules.Language", "lang_cancel", "Cancel", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("150", "1", "iConsulting.iCMServer.Modules.Language", "lang_add", "Add", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("151", "1", "iConsulting.iCMServer.Modules.Language", "lang_confirm", "Do you want to delete this langauge?", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("152", "1", "iConsulting.iCMServer.Modules.Sites", "sites_name", "Name", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("153", "1", "iConsulting.iCMServer.Modules.Sites", "sites_alias", "Alias", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("154", "1", "iConsulting.iCMServer.Modules.Sites", "sites_css", "Stylesheet", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("155", "1", "iConsulting.iCMServer.Modules.Sites", "sites_logo", "Header", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("156", "1", "iConsulting.iCMServer.Modules.Sites", "sites_logohref", "Header Href", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("157", "1", "iConsulting.iCMServer.Modules.Sites", "sites_startpage", "Startpage", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("158", "1", "iConsulting.iCMServer.Modules.Sites", "sites_alwaysshoweditbutton", "Show edit", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("159", "1", "iConsulting.iCMServer.Modules.Sites", "sites_showfooter", "Show footer text", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("160", "1", "iConsulting.iCMServer.Modules.Sites", "sites_footertextleft", "Footer text L", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("161", "1", "iConsulting.iCMServer.Modules.Sites", "sites_footertextcontent", "Footer text M", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("162", "1", "iConsulting.iCMServer.Modules.Sites", "sites_footertextright", "Footer text R", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("163", "1", "iConsulting.iCMServer.Modules.Sites", "sites_contentadjust", "Content adjust", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("164", "1", "iConsulting.iCMServer.Modules.Sites", "sites_update", "Save", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("165", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit", "Edit", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("166", "1", "iConsulting.iCMServer.Modules.Sites", "sites_delete", "Delete", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("167", "1", "iConsulting.iCMServer.Modules.Sites", "sites_cancel", "Cancel", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("168", "1", "iConsulting.iCMServer.Modules.Sites", "sites_add", "Add", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("169", "1", "iConsulting.iCMServer.Modules.Sites", "sites_confirm", "Do you want to delete this site?", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("170", "1", "iConsulting.iCMServer.Modules.Modules", "mod_name", "Name", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("171", "1", "iConsulting.iCMServer.Modules.Modules", "mod_description", "Description", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("172", "1", "iConsulting.iCMServer.Modules.Modules", "mod_desktopsrc", "Desktop Src", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("173", "1", "iConsulting.iCMServer.Modules.Modules", "mod_update", "Save", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("174", "1", "iConsulting.iCMServer.Modules.Modules", "mod_edit", "Edit", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("175", "1", "iConsulting.iCMServer.Modules.Modules", "mod_delete", "Delete", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("176", "1", "iConsulting.iCMServer.Modules.Modules", "mod_cancel", "Cancel", "0", "0", "20040502232038");
INSERT INTO lgt_languagetext VALUES("177", "1", "iConsulting.iCMServer.Modules.Modules", "mod_add", "Add", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("178", "1", "iConsulting.iCMServer.Modules.Modules", "mod_confirm", "Do you want to delete this module?", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("179", "1", "iConsulting.iCMServer.Modules.Pages", "pag_confirm", "Do you want to delete this page?", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("180", "2", "iConsulting.iCMServer.Modules.Pages", "pag_confirm", "&Auml;r du s&auml;ker att du vill radera denna sidan?", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("181", "1", "iConsulting.iCMServer.Modules.Pages", "pag_addpage", "New page", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("182", "2", "iConsulting.iCMServer.Modules.Pages", "pag_addpage", "Ny sida", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("183", "1", "iConsulting.iCMServer.Modules.Pages", "pag_moveup", "Move page up on step", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("184", "2", "iConsulting.iCMServer.Modules.Pages", "pag_moveup", "Flytta sidan upp ett steg", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("185", "1", "iConsulting.iCMServer.Modules.Pages", "pag_movedown", "Move page down on step", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("186", "2", "iConsulting.iCMServer.Modules.Pages", "pag_movedown", "Flytta sidan ner ett steg", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("187", "1", "iConsulting.iCMServer.Modules.Pages", "pag_moveto", "Move page to?", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("188", "2", "iConsulting.iCMServer.Modules.Pages", "pag_moveto", "Flytta sidan till?", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("189", "1", "iConsulting.iCMServer.Modules.Pages", "pag_edit", "Edit page", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("190", "2", "iConsulting.iCMServer.Modules.Pages", "pag_edit", "Editera sidan", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("191", "1", "iConsulting.iCMServer.Modules.Pages", "pag_delete", "Delete page", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("192", "2", "iConsulting.iCMServer.Modules.Pages", "pag_delete", "Radera sidan", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("193", "1", "iConsulting.iCMServer.Modules.Pages", "pag_selpage", "No page selected...", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("194", "2", "iConsulting.iCMServer.Modules.Pages", "pag_selpage", "Ingen sida markerad...", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("195", "1", "iConsulting.iCMServer.Modules.Pages", "pag_info", "Selected Page:", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("196", "2", "iConsulting.iCMServer.Modules.Pages", "pag_info", "Markerad Sida:", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("197", "1", "iConsulting.iCMServer.Modules.Pages", "pag_labelmoveup", "Up", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("198", "2", "iConsulting.iCMServer.Modules.Pages", "pag_labelmoveup", "Upp", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("199", "1", "iConsulting.iCMServer.Modules.Pages", "pag_labelmovedown", "Down", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("200", "2", "iConsulting.iCMServer.Modules.Pages", "pag_labelmovedown", "Ner", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("201", "1", "iConsulting.iCMServer.Modules.Pages", "pag_labelmoveto", "Move", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("202", "2", "iConsulting.iCMServer.Modules.Pages", "pag_labelmoveto", "Flytta", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("203", "1", "iConsulting.iCMServer.Modules.Pages", "pag_labeledit", "Edit", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("204", "2", "iConsulting.iCMServer.Modules.Pages", "pag_labeledit", "Editera", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("205", "1", "iConsulting.iCMServer.Modules.Pages", "pag_labeldelete", "Delete", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("206", "2", "iConsulting.iCMServer.Modules.Pages", "pag_labeldelete", "Radera", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("207", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_save", " Ok ", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("208", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_save", " Ok ", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("209", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_addmod", "Add module", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("210", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_addmod", "L&auml;gg till modulen", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("211", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_header", "The page title and layout", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("212", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_header", "Sidans titel och layout", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("213", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_name", "Page title", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("214", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_name", "Sidans namn", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("215", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_leftwidth", "Left module field width (px):", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("216", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_leftwidth", "V&auml;nster modul f&auml;lt bredd (px):", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("217", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_contentwidth", "Content module field width (px):", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("218", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_contentwidth", "Centrerad modul f&auml;lt bredd (px):", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("219", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_contentalign", "Center the content module field", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("220", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_contentalign", "Centrera mitten modul f&auml;ltet", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("221", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_rightwidth", "Right module field width (px):", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("222", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_rightwidth", "H&ouml;ger modul f&auml;lt bredd (px):", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("223", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_roles", "Authorized roles:", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("224", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_roles", "Ber&auml;ttigade roller:", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("225", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_addto", "Add module:", "0", "0", "20040502232039");
INSERT INTO lgt_languagetext VALUES("226", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_addto", "L&auml;gg till modul:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("227", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_modtype", "Module type:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("228", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_modtype", "Modul typ:", "0", "0", "20040502232120");
INSERT INTO lgt_languagetext VALUES("229", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_modname", "Module name:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("230", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_modname", "Modul namn:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("231", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_org", "Organize modules:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("232", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_org", "Organisera moduler:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("233", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_leftfield", "Left module field:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("234", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_leftfield", "V&auml;nster modul f&auml;lt:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("235", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_centerfield", "Content module field:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("236", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_centerfield", "Centrerad modul f&auml;lt:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("237", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_rightfield", "Right module field:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("238", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_rightfield", "H&ouml;ger modul f&auml;lt:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("239", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_moveup", "Move module one step up", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("240", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_moveup", "Flytta modulen ett steg upp", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("241", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_movedown", "Move module one step down", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("242", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_movedown", "Flytta modulen ett steg ner", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("243", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_moveleft", "Move module one step to the left", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("244", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_moveleft", "Flytta modulen ett steg &aring;t v&auml;nster", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("245", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_moveright", "Move module one step to the right", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("246", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_moveright", "Flytta modulen ett steg &aring;t h&ouml;ger", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("247", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_edit", "Edit module", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("248", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_edit", "Editera modulen", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("249", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_delete", "Delete module", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("250", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_delete", "Radera modulen", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("251", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_stdheader", "Standard settings", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("252", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_stdheader", "Standard inst&auml;llningar", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("253", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_advheader", "Advanced settings", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("254", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_advheader", "Avancerade inst&auml;llningar", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("255", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_useminimizer", "Use minimizer icons:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("256", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_useminimizer", "Anv&auml;nd minimera iconer:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("257", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_height", "Height:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("258", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_height", "H&ouml;jd:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("259", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_backcolor", "Backcolor:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("260", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_backcolor", "Bakgrundsf&auml;rg:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("261", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpicture", "Backpicture:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("262", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpicture", "Bakgrundsbild:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("263", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpicturehorizontalalign", "Backpicture horizontal align:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("264", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpicturehorizontalalign", "Bakgrundsbild horizontal placering:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("265", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpictureverticalalign", "Backpicture vertical align:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("266", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpictureverticalalign", "Bakgrundsbild vertikal placering:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("267", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpicturehorizontaltiling", "Backpicture horizontal tiling:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("268", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpicturehorizontaltiling", "Bakgrundsbild horizontalt &ouml;verlapp:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("269", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpictureverticaltiling", "Backpicture vertical tiling:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("270", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_backpictureverticaltiling", "Bakgrundsbild vertikalt &ouml;verlapp:", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("271", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_left", "Left", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("272", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_left", "V&auml;nster", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("273", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_top", "Top", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("274", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_top", "Topp", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("275", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_right", "Right", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("276", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_right", "H&ouml;ger", "0", "0", "20040502232040");
INSERT INTO lgt_languagetext VALUES("277", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_bottom", "Bottom", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("278", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_bottom", "Nere", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("279", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_center", "Center", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("280", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_center", "Centrerad", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("281", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_editpicture", " Edit ", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("282", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_editpicture", "Editera", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("283", "1", "iConsulting.iCMServer.Modules.Pages", "pagedit_toppx", "Top:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("284", "2", "iConsulting.iCMServer.Modules.Pages", "pagedit_toppx", "Topp:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("285", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_header", "Module settings", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("286", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_header", "Modul inst&auml;llningar", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("287", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_name", "Module name:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("288", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_name", "Modul namn:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("289", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_cache", "Cache timeout (seconds):", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("290", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_cache", "Cache timeout (sekunder):", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("291", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_showtitle", "Show title:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("292", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_showtitle", "Visa titel:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("293", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_yes", "Yes", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("294", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_yes", "Ja", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("295", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_no", "No", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("296", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_no", "Nej", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("297", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_roles", "Authorized roles:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("298", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_roles", "Roller som kan editera inneh&aring;llet:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("299", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_save", "Save", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("300", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_save", "Spara", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("301", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_visible", "Is visible:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("302", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_visible", "Synlig:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("303", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_align", "Align:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("304", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_align", "L&auml;ge:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("305", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_alignleft", "Left", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("306", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_alignleft", "V&auml;nster", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("307", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_alignmiddle", "Middle", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("308", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_alignmiddle", "Mitten", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("309", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_alignright", "Right", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("310", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_alignright", "H&ouml;ger", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("311", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_border", "Border:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("312", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_border", "Ram:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("313", "1", "iConsulting.iCMServer.Modules.Pages", "modedit_color", "BackColor:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("314", "2", "iConsulting.iCMServer.Modules.Pages", "modedit_color", "Bakgrundsf&auml;rg:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("315", "1", "iConsulting.iCMServer.Modules.Sites", "sites_header", "System specific information and settings, click on the button to the right.", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("316", "2", "iConsulting.iCMServer.Modules.Sites", "sites_header", "System specifik information och inst&auml;llningar, klicka p&aring; knappen till h&ouml;ger.", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("317", "1", "iConsulting.iCMServer.Modules.Sites", "sites_title", "Title:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("318", "2", "iConsulting.iCMServer.Modules.Sites", "sites_title", "Titel:", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("319", "1", "iConsulting.iCMServer.Modules.Sites", "sites_settings", "Settings", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("320", "2", "iConsulting.iCMServer.Modules.Sites", "sites_settings", "Inst&auml;llningar", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("321", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_yes", "Yes", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("322", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_yes", "Ja", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("323", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_no", "No", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("324", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_no", "Nej", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("325", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_header", "Setting", "0", "0", "20040502232041");
INSERT INTO lgt_languagetext VALUES("326", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_header", "Inst&auml;llningar", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("327", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_title", "Title:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("328", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_title", "Titel:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("329", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_showedit", "Always show edit:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("330", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_showedit", "Visa alltid editera:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("331", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_showfooter", "Show footer:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("332", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_showfooter", "Visa sidfot:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("333", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_footerleft", "Left footer text:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("334", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_footerleft", "V&auml;nster sidfot text:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("335", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_footercontent", "Content footer text:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("336", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_footercontent", "Centrerad sidfot text:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("337", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_footerright", "Right footer text:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("338", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_footerright", "H&ouml;ger sidfot text:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("339", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_contentadjust", "Content adjust:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("340", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_contentadjust", "Inneh&aring;lls justering:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("341", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_softdelete", "Log deleted items:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("342", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_softdelete", "Logga raderade rader:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("343", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_color", "Backcolor:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("344", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_color", "Bakgrundsf&auml;rg:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("345", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_picture", "Backpicture:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("346", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_picture", "Bakgrundsbild:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("347", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_picturebutton", "Edit", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("348", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_picturebutton", "Editera", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("349", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign", "Menu align:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("350", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign", "Meny l&auml;ge:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("351", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign1", "Left", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("352", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign1", "V&auml;nster", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("353", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign2", "Top", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("354", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign2", "Topp", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("355", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign3", "Right", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("356", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign3", "H&ouml;ger", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("357", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign4", "Bottom", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("358", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign4", "Ner", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("359", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign5", "Center", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("360", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menualign5", "Centrerad", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("361", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufade", "Menu fade:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("362", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufade", "Meny fade:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("363", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufadedurance", "Menu fade durance:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("364", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufadedurance", "Meny fade tid:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("365", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menutop", "Menu top:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("366", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menutop", "Meny topp:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("367", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuleft", "Menu left:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("368", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuleft", "Meny v&auml;nster:", "0", "0", "20040502232042");
INSERT INTO lgt_languagetext VALUES("369", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuforecolor1", "Headmenu forecolor:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("370", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuforecolor1", "Huvudmeny teckensf&auml;rg:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("371", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuforecolor2", "Submenu forecolor:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("372", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuforecolor2", "Undermeny teckensf&auml;rg:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("373", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubackcolor1", "Headmenu backcolor:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("374", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubackcolor1", "Huvudmeny bakgrundsf&auml;rg:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("375", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubackcolor2", "Submenu backcolor:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("376", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubackcolor2", "Undermeny bakgrundsf&auml;rg:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("377", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverforecolor1", "Headmenu-highlight forecolor:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("378", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverforecolor1", "Huvudmeny-markerad teckensf&auml;rg:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("379", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverforecolor2", "Submenu-highlight forecolor:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("380", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverforecolor2", "Undermeny-markerad teckensf&auml;rg:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("381", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbackcolor1", "Headmenu-highlight backcolor:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("382", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbackcolor1", "Huvudmeny-markerad bakgrundsf&auml;rg:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("383", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbackcolor2", "Submenu-highlight backcolor:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("384", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbackcolor2", "Undermeny-markerad bakgrundsf&auml;rg:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("385", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufont", "Menu fontfamily:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("386", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufont", "Meny teckensnitt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("387", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_save", "Save", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("388", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_save", "Spara", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("389", "1", "iConsulting.iCMServer.Modules.Sites", "sites_upload_save", "Save", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("390", "2", "iConsulting.iCMServer.Modules.Sites", "sites_upload_save", "Spara", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("391", "1", "iConsulting.iCMServer.Modules.Sites", "sites_upload_cancel", "Cancel", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("392", "2", "iConsulting.iCMServer.Modules.Sites", "sites_upload_cancel", "&Aring;ngra", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("393", "1", "iConsulting.iCMServer.Modules.Sites", "sites_upload_delete", "Delete", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("394", "2", "iConsulting.iCMServer.Modules.Sites", "sites_upload_delete", "Radera", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("395", "1", "iConsulting.iCMServer.Modules.Sites", "sites_upload_header", "Upload backpicture", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("396", "2", "iConsulting.iCMServer.Modules.Sites", "sites_upload_header", "Ladda upp bakgrundsbild", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("397", "1", "iConsulting.iCMServer.Modules.Sites", "sites_upload_name", "Name:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("398", "2", "iConsulting.iCMServer.Modules.Sites", "sites_upload_name", "Namn:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("399", "1", "iConsulting.iCMServer.Modules.Sites", "sites_upload_confirm", "Do you want to delete this picture?", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("400", "2", "iConsulting.iCMServer.Modules.Sites", "sites_upload_confirm", "Vill du verkligen radera denna bilden?", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("401", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_placement", "Menu placement:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("402", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_placement", "Meny placering:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("403", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_between", "Headmenu space:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("404", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_between", "Huvudmeny avst&aring;nd:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("405", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_wait", "Menu delay:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("406", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_wait", "Meny delay:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("407", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level1borderx", "Headmenu x-border:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("408", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level1borderx", "Huvudmeny x-ram:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("409", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level1bordery", "Headmenu y-border:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("410", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level1bordery", "Huvudmeny y-ram:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("411", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level2borderx", "Submenu x-border:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("412", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level2borderx", "Undermeny x-ram:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("413", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level2bordery", "Submenu y-border:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("414", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_level2bordery", "Undermeny y-ram:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("415", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_language", "Language:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("416", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_language", "Spr&aring;k:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("417", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_logohorizontalalign", "Backpicture horizontal align:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("418", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_logohorizontalalign", "Bakgrundsbild horizontal placering:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("419", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_logoverticalalign", "Backpicture vertical align:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("420", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_logoverticalalign", "Bakgrundsbild vertikal placering:", "0", "0", "20040502232043");
INSERT INTO lgt_languagetext VALUES("421", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubold1", "Headmenu bold:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("422", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubold1", "Huvudmeny fet text:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("423", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbold1", "Headmenu-highlight bold:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("424", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbold1", "Huvudmeny-markerad fet text:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("425", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubold2", "Submenu bold:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("426", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubold2", "Undermeny fet text:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("427", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbold2", "Submenu-highlight bold:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("428", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverbold2", "Undermeny-markerad fet text:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("429", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufontsize1", "Headmenu fontsize:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("430", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufontsize1", "Huvudmeny teckenstorlek:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("431", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverfontsize1", "Headmenu-highlight fontsize:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("432", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverfontsize1", "Huvudmeny-markerad teckenstorlek:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("433", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufontsize2", "Submenu fontsize:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("434", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menufontsize2", "Undermeny teckenstorlek:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("435", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverfontsize2", "Submenu-highlight fontsize:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("436", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoverfontsize2", "Undermeny-markerad teckenstorlek:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("437", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubordercolor1", "Headmenu bordercolor:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("438", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubordercolor1", "Huvudmeny ramf&auml;rg:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("439", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubordercolor2", "Submenu bordercolor:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("440", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menubordercolor2", "Undermeny ramf&auml;rg:", "0", "0", "20040502232111");
INSERT INTO lgt_languagetext VALUES("441", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuroundborder", "Menu border-round:", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("442", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuroundborder", "Meny ram-kant:", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("443", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoffset", "Menu offset:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("444", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuoffset", "Meny offset:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("445", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_siteheader", "Standard", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("446", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_siteheader", "Standard", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("447", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menustdheader", "Menu Standard", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("448", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menustdheader", "Meny Standard", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("449", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuadvheader", "Menu Advanced", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("450", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_menuadvheader", "Meny Avancerad", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("451", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_cssheader", "Stylesheet", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("452", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_cssheader", "Stilmall", "0", "0", "20040502232044");
INSERT INTO lgt_languagetext VALUES("453", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headfamily", "Header fontfamily:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("454", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headfamily", "Rubrik teckensnitt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("455", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headsize", "Header fontsize:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("456", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headsize", "Rubrik teckenstorlek:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("457", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headweight", "Header fontweight:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("458", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headweight", "Rubrik teckenvikt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("459", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headcolor", "Header fontcolor:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("460", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_headcolor", "Rubrik teckenf&auml;rg:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("461", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadfamily", "Ingress fontfamily:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("462", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadfamily", "Ingress teckensnitt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("463", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadsize", "Ingress fontsize:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("464", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadsize", "Ingress teckenstorlek:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("465", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadweight", "Ingress fontweight:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("466", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadweight", "Ingress teckenvikt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("467", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadcolor", "Ingress fontcolor:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("468", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subheadcolor", "Ingress teckenf&auml;rg:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("469", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadfamily", "Text fontfamily:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("470", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadfamily", "Text teckensnitt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("471", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadsize", "Text fontsize:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("472", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadsize", "Text teckenstorlek:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("473", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadweight", "Text fontweight:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("474", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadweight", "Text teckenvikt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("475", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadcolor", "Text fontcolor:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("476", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_subsubheadcolor", "Text teckenf&auml;rg:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("477", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalfamily", "Normal fontfamily:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("478", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalfamily", "Normal teckensnitt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("479", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalsize", "Normal fontsize:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("480", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalsize", "Normal teckenstorlek:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("481", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalweight", "Normal fontweight:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("482", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalweight", "Normal teckenvikt:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("483", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalcolor", "Normal fontcolor:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("484", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_normalcolor", "Normal teckenf&auml;rg:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("485", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonfamily", "Button fontfamily:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("486", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonfamily", "Knapp teckensnitt:", "0", "0", "20040502232109");
INSERT INTO lgt_languagetext VALUES("487", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonsize", "Button fontsize:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("488", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonsize", "Knapp teckenstorlek:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("489", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonweight", "Button fontweight:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("490", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonweight", "Knapp teckenvikt:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("491", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonforecolor", "Button forecolor:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("492", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonforecolor", "Knapp teckenf&auml;rg:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("493", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonbackcolor", "Button backcolor:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("494", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonbackcolor", "Knapp bakgrundsf&auml;rg:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("495", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonbordersize", "Button bordersize:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("496", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonbordersize", "Knapp ramstorlek:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("497", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonbordercolor", "Button bordercolor:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("498", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttonbordercolor", "Knapp ramf&auml;rg:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("499", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttontextalign", "Button textalign:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("500", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_buttontextalign", "Knapp textplacering:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("501", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_hrheight", "Line height:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("502", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_hrheight", "Linje h&ouml;jd:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("503", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_hrcolor", "Line color:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("504", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_hrcolor", "Linje f&auml;rg:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("505", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_hralign", "Line align:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("506", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_hralign", "Linje placering:", "0", "0", "20040502232110");
INSERT INTO lgt_languagetext VALUES("507", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_weightbold", "Bold", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("508", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_weightbold", "Fet", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("509", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_weightnormal", "Normal", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("510", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_weightnormal", "Normal", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("511", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_ok", "  Ok  ", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("512", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_ok", "  Ok  ", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("513", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_update", "Update", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("514", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_update", "Uppdatera", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("515", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_verticaltiling", "Backpicture horizontal tiling:", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("516", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_verticaltiling", "Bakgrundsbild horizontalt &ouml;verlapp:", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("517", "1", "iConsulting.iCMServer.Modules.Sites", "sites_edit_horizontaltiling", "Backpicture vertical tiling:", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("518", "2", "iConsulting.iCMServer.Modules.Sites", "sites_edit_horizontaltiling", "Bakgrundsbild vertikalt &ouml;verlapp:", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("519", "1", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_delete", "Delete", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("520", "2", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_delete", "Radera", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("521", "1", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_upload", "Upload", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("522", "2", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_upload", "Ladda upp", "0", "0", "20040502232045");
INSERT INTO lgt_languagetext VALUES("523", "1", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_header", "Document Details", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("524", "2", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_header", "Document Detaljer", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("525", "1", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_title", "Name:", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("526", "2", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_title", "Namn:", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("527", "1", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_save", "Save", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("528", "2", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_save", "Spara", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("529", "1", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_cancel", "Cancel", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("530", "2", "iConsulting.iCMServer.Modules.Mediagallery", "mediagallery_cancel", "&Aring;ngra", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("531", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_edit", "Edit", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("532", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_edit", "Editera", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("533", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_designlayout", "Design layout", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("534", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_designlayout", "Design l&auml;ge", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("535", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_htmllayout", "Html layout", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("536", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_htmllayout", "Html l&auml;ge", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("537", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_header", "Header", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("538", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_header", "Rubrik", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("539", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_font", "Font family", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("540", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_font", "Tecken snitt", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("541", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_fontsize", "Font size", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("542", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_fontsize", "Tecken storlek", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("543", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_update", "Update", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("544", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_update", "Uppdatera", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("545", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_cancel", "Cancel", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("546", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_cancel", "&Aring;ngra", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("547", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_defaulttext", "Type here...", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("548", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_defaulttext", "Skriv h&auml;r...", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("549", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_undo", "Undo", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("550", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_undo", "&Aring;ngra", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("551", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_redo", "Redo", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("552", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_redo", "G&ouml;r om", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("553", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_print", "Print", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("554", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_print", "Skriv ut", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("555", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_selectall", "Select all", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("556", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_selectall", "Markera allt", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("557", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_cut", "Cut", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("558", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_cut", "Klipp ut", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("559", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_copy", "Copy", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("560", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_copy", "Kopiera", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("561", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_paste", "Paste", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("562", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_paste", "Klistra in", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("563", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_bold", "Bold", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("564", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_bold", "Fet", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("565", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_italic", "Italic", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("566", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_italic", "Kursiv", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("567", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_underline", "Underline", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("568", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_underline", "Understruken", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("569", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_strikethrou", "Strikethrou", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("570", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_strikethrou", "Genomstruken", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("571", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_left", "Left", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("572", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_left", "V&auml;nster", "0", "0", "20040502232046");
INSERT INTO lgt_languagetext VALUES("573", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_center", "Center", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("574", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_center", "Centrera", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("575", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_right", "Right", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("576", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_right", "H&ouml;ger", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("577", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_orderedlist", "Ordered list", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("578", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_orderedlist", "Numrerad lista", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("579", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_bulletedlist", "Bulleted list", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("580", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_bulletedlist", "Punkt lista", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("581", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_unindent", "Unindent", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("582", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_unindent", "Minska indrag", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("583", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_indent", "Indent", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("584", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_indent", "&Ouml;ka indrag", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("585", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_uppercase", "Uppercase", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("586", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_uppercase", "Versaler", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("587", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_lowercase", "Lowercase", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("588", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_lowercase", "Gemener", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("589", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_superscript", "Superscript", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("590", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_superscript", "Superscipt", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("591", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_subscript", "Subscript", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("592", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_subscript", "Subscript", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("593", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_horizontal", "Horizontal rule", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("594", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_horizontal", "Horizontal linje", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("595", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_textcolor", "Font color", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("596", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_textcolor", "Tecken f&auml;rg", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("597", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_bgcolor", "Highlight", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("598", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_bgcolor", "&Ouml;verstrykning", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("599", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_symbol", "Symbol", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("600", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_symbol", "Symbol", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("601", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_table", "Create table", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("602", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_table", "Tillverka tabell", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("603", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_link", "Add url", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("604", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_link", "Infoga url", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("605", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_image", "Insert image", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("606", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_image", "Infoga bild", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("607", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_preview", "Preview in browser", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("608", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_preview", "F&ouml;rhandsgranska i webbl&auml;sare", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("609", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_delete", "Delete", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("610", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_delete", "Radera", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("611", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_confirmclick", "Click in the document feild before trying to implement a new object.", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("612", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_confirmclick", "Klicka i dokumentet innan implementering av nytt objekt.", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("613", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablewidht", "Width (without %):", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("614", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablewidht", "Bredd (utan %):", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("615", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tableborder", "Border:", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("616", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tableborder", "Ram:", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("617", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablerows", "Rows:", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("618", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablerows", "Rader:", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("619", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablecolumns", "Columns:", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("620", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablecolumns", "Columner:", "0", "0", "20040502232047");
INSERT INTO lgt_languagetext VALUES("621", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablecellpadding", "Cellpadding:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("622", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablecellpadding", "Cellpadding:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("623", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablecellspacing", "Cellspacing:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("624", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablecellspacing", "Cellspacing:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("625", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablebgcolor", "Backcolor:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("626", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablebgcolor", "Bakgrundsf&auml;rg:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("627", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealign", "Align:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("628", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealign", "L&auml;ge:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("629", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablebordercolor", "Bordercolor:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("630", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablebordercolor", "Ramf&auml;rg:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("631", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealignleft", "Left", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("632", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealignleft", "V&auml;nster", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("633", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealigncenter", "Center", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("634", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealigncenter", "Centrerad", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("635", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealignright", "Right", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("636", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_tablealignright", "H&ouml;ger", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("637", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_linktype", "Type:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("638", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_linktype", "Typ:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("639", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_linkshow", "Show:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("640", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_linkshow", "Visa:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("641", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_linkurl", "Url:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("642", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_linkurl", "Url:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("643", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_urlheader", "Upload", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("644", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_urlheader", "Ladda upp", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("645", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_urlborder", "Border:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("646", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_urlborder", "Ram:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("647", "1", "iConsulting.iCMServer.Modules.Publisher", "publisher_urlalt", "Alternative:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("648", "2", "iConsulting.iCMServer.Modules.Publisher", "publisher_urlalt", "Alternativ:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("649", "1", "iConsulting.iCMServer.Modules.Events", "events_edit", "New event", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("650", "2", "iConsulting.iCMServer.Modules.Events", "events_edit", "Ny h&auml;ndelse", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("651", "1", "iConsulting.iCMServer.Modules.Events", "events_header", "Details", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("652", "2", "iConsulting.iCMServer.Modules.Events", "events_header", "Detaljer", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("653", "1", "iConsulting.iCMServer.Modules.Events", "events_title", "Title:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("654", "2", "iConsulting.iCMServer.Modules.Events", "events_title", "Titel:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("655", "1", "iConsulting.iCMServer.Modules.Events", "events_description", "Description:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("656", "2", "iConsulting.iCMServer.Modules.Events", "events_description", "Beskrivning:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("657", "1", "iConsulting.iCMServer.Modules.Events", "events_link", "Link:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("658", "2", "iConsulting.iCMServer.Modules.Events", "events_link", "L&auml;nk:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("659", "1", "iConsulting.iCMServer.Modules.Events", "events_showdate", "Show date:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("660", "2", "iConsulting.iCMServer.Modules.Events", "events_showdate", "Visa datum:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("661", "1", "iConsulting.iCMServer.Modules.Events", "events_hidedate", "Hide date:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("662", "2", "iConsulting.iCMServer.Modules.Events", "events_hidedate", "D&ouml;lj datum:", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("663", "1", "iConsulting.iCMServer.Modules.Events", "events_update", "Update", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("664", "2", "iConsulting.iCMServer.Modules.Events", "events_update", "Uppdatera", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("665", "1", "iConsulting.iCMServer.Modules.Events", "events_cancel", "Cancel", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("666", "2", "iConsulting.iCMServer.Modules.Events", "events_cancel", "&Aring;ngra", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("667", "1", "iConsulting.iCMServer.Modules.Events", "events_delete", "Delete", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("668", "2", "iConsulting.iCMServer.Modules.Events", "events_delete", "Radera", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("669", "1", "iConsulting.iCMServer.Modules.Events", "events_confirm", "Do you want to delete this Event?", "0", "0", "20040502232048");
INSERT INTO lgt_languagetext VALUES("670", "2", "iConsulting.iCMServer.Modules.Events", "events_confirm", "&Auml;r du s&auml;ker att du vill radera denna h&auml;ndelsen?", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("671", "1", "iConsulting.iCMServer.Modules.Events", "events_readmore", "Read more...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("672", "2", "iConsulting.iCMServer.Modules.Events", "events_readmore", "L&auml;s mer...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("673", "1", "iConsulting.iCMServer.Modules.Events", "events_coming", "Comming...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("674", "2", "iConsulting.iCMServer.Modules.Events", "events_coming", "Kommande...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("675", "1", "iConsulting.iCMServer.Modules.Events", "events_used", "Used...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("676", "2", "iConsulting.iCMServer.Modules.Events", "events_used", "F&ouml;rbrukad...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("677", "1", "iConsulting.iCMServer.Modules.Events", "events_icon", "Edit", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("678", "2", "iConsulting.iCMServer.Modules.Events", "events_icon", "Editera", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("679", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_edit", "New link", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("680", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_edit", "Ny l&auml;nk", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("681", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_iconedit", "Edit", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("682", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_iconedit", "Editera", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("683", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_iconnavigate", "Go...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("684", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_iconnavigate", "G&aring;...", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("685", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_header", "Details", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("686", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_header", "Detaljer", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("687", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_title", "Title:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("688", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_title", "Titel:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("689", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_description", "Description:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("690", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_description", "Beskrivning:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("691", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_url", "Url:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("692", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_url", "Url:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("693", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_order", "Order:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("694", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_order", "Order:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("695", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_update", "Update", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("696", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_update", "Uppdatera", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("697", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_cancel", "Cancel", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("698", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_cancel", "&Aring;ngra", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("699", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_delete", "Delete", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("700", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_delete", "Radera", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("701", "1", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_confirm", "Do you want to delete this Link?", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("702", "2", "iConsulting.iCMServer.Modules.Quicklinks", "quicklinks_confirm", "&Auml;r du s&auml;ker att du vill radera denna l&auml;nken?", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("703", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_edit", "Edit", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("704", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_edit", "Editera", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("705", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_header", "Details", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("706", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_header", "Detaljer", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("707", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_title", "Title:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("708", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_title", "Titel:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("709", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_description", "Description:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("710", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_description", "Beskrivning:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("711", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_width", "Width:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("712", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_width", "Bredd:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("713", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_height", "Height:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("714", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_height", "H&ouml;jd:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("715", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_url", "Url:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("716", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_url", "Url:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("717", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_order", "Order:", "0", "0", "20040502232049");
INSERT INTO lgt_languagetext VALUES("718", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_order", "Order:", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("719", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_update", "Update", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("720", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_update", "Uppdatera", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("721", "1", "iConsulting.iCMServer.Modules.iFrame", "iframe_cancel", "Cancel", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("722", "2", "iConsulting.iCMServer.Modules.iFrame", "iframe_cancel", "&Aring;ngra", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("723", "1", "iConsulting.iCMServer.Modules.Documents", "documents_edit", "Edit", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("724", "2", "iConsulting.iCMServer.Modules.Documents", "documents_edit", "Editera", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("725", "1", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderconfirm1", "A new folder will be created in: ", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("726", "2", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderconfirm1", "En ny mapp kommer att skapas i: ", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("727", "1", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderconfirm2", "Give the new folder a title.", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("728", "2", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderconfirm2", "Ge den nya mappen en titel.", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("729", "1", "iConsulting.iCMServer.Modules.Documents", "documents_deletefolderconfirm", "Do you want to delete the folder: ", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("730", "2", "iConsulting.iCMServer.Modules.Documents", "documents_deletefolderconfirm", "Vill du radera mappen: ", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("731", "1", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderalttext", "Add folder", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("732", "2", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderalttext", "Ny mapp", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("733", "1", "iConsulting.iCMServer.Modules.Documents", "documents_editfolderconfirm", "Give the folder a new title.", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("734", "2", "iConsulting.iCMServer.Modules.Documents", "documents_editfolderconfirm", "Ge mappen en ny titel.", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("735", "1", "iConsulting.iCMServer.Modules.Documents", "documents_editfolderalttext", "Edit folder", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("736", "2", "iConsulting.iCMServer.Modules.Documents", "documents_editfolderalttext", "Editera mapp", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("737", "1", "iConsulting.iCMServer.Modules.Documents", "documents_deletefolderalttext", "Delete folder", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("738", "2", "iConsulting.iCMServer.Modules.Documents", "documents_deletefolderalttext", "Radera mapp", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("739", "1", "iConsulting.iCMServer.Modules.Documents", "documents_uploadfilealttext", "Upload new document", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("740", "2", "iConsulting.iCMServer.Modules.Documents", "documents_uploadfilealttext", "Ladda upp nytt dokument", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("741", "1", "iConsulting.iCMServer.Modules.Documents", "documents_refreshalttext", "Refresh", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("742", "2", "iConsulting.iCMServer.Modules.Documents", "documents_refreshalttext", "Uppdatera", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("743", "1", "iConsulting.iCMServer.Modules.Documents", "documents_simpleviewstate", "SimpleView", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("744", "2", "iConsulting.iCMServer.Modules.Documents", "documents_simpleviewstate", "SimpelVy", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("745", "1", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderdefaulttext", "New folder", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("746", "2", "iConsulting.iCMServer.Modules.Documents", "documents_addfolderdefaulttext", "Ny mapp", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("747", "1", "iConsulting.iCMServer.Modules.Documents", "documents_folders", "Folders", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("748", "2", "iConsulting.iCMServer.Modules.Documents", "documents_folders", "Mappar", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("749", "1", "iConsulting.iCMServer.Modules.Documents", "documents_title", "Title", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("750", "2", "iConsulting.iCMServer.Modules.Documents", "documents_title", "Titel", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("751", "1", "iConsulting.iCMServer.Modules.Documents", "documents_size", "Size", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("752", "2", "iConsulting.iCMServer.Modules.Documents", "documents_size", "Storlek", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("753", "1", "iConsulting.iCMServer.Modules.Documents", "documents_modified", "Last Modified", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("754", "2", "iConsulting.iCMServer.Modules.Documents", "documents_modified", "&Auml;ndrad", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("755", "1", "iConsulting.iCMServer.Modules.Documents", "documents_title2", "Title:", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("756", "2", "iConsulting.iCMServer.Modules.Documents", "documents_title2", "Titel:", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("757", "1", "iConsulting.iCMServer.Modules.Documents", "documents_header", "Upload", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("758", "2", "iConsulting.iCMServer.Modules.Documents", "documents_header", "Ladda upp", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("759", "1", "iConsulting.iCMServer.Modules.Documents", "documents_update", "Update", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("760", "2", "iConsulting.iCMServer.Modules.Documents", "documents_update", "Uppdatera", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("761", "1", "iConsulting.iCMServer.Modules.Documents", "documents_cancel", "Cancel", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("762", "2", "iConsulting.iCMServer.Modules.Documents", "documents_cancel", "&Aring;ngra", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("763", "1", "iConsulting.iCMServer.Modules.Documents", "documents_delete", "Delete", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("764", "2", "iConsulting.iCMServer.Modules.Documents", "documents_delete", "Radera", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("765", "1", "iConsulting.iCMServer.Modules.Documents", "documents_revisions", "Revisions", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("766", "2", "iConsulting.iCMServer.Modules.Documents", "documents_revisions", "Revisioner", "0", "0", "20040502232050");
INSERT INTO lgt_languagetext VALUES("767", "1", "iConsulting.iCMServer.Modules.Documents", "documents_deletefileconfirm", "Do you want to delete this document ?", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("768", "2", "iConsulting.iCMServer.Modules.Documents", "documents_deletefileconfirm", "Vill du radera detta dokument ?", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("769", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_new", "New thread", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("770", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_new", "Ny tr&aring;d", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("771", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_header", "Post a New Message", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("772", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_header", "L&auml;gg in Nytt Meddelande", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("773", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_subject", "Subject:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("774", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_subject", "&Auml;mne:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("775", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_message", "Message:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("776", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_message", "Meddelande:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("777", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_update", "Update", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("778", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_update", "Uppdatera", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("779", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_post", "Post", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("780", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_post", "L&auml;gg in", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("781", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_cancel", "Cancel", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("782", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_cancel", "&Aring;ngra", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("783", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_deleted", "Delete", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("784", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_deleted", "Radera", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("785", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_author", "Author:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("786", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_author", "F&ouml;rfattare:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("787", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_created", "Posted:", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("788", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_created", "Inlagd", "0", "0", "20040502232117");
INSERT INTO lgt_languagetext VALUES("789", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_reply", "Reply to this message", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("790", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_reply", "Svara p&aring; detta meddelande", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("791", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_edit", "Edit Message", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("792", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_edit", "Editera Meddelande", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("793", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_fwd", "Next Message", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("794", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_fwd", "N&auml;sta Meddelande", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("795", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_rew", "Previous Message", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("796", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_rew", "F&ouml;reg&aring;ende Meddelade", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("797", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_confirm", "Do you want to delete this message ?", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("798", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_confirm", "Vill du radera detta meddelande ?", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("799", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_posted", "posted", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("800", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_posted", "Inlagd", "0", "0", "20040502232117");
INSERT INTO lgt_languagetext VALUES("801", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_by", "by", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("802", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_by", "av", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("803", "1", "iConsulting.iCMServer.Modules.Discussion", "discussion_unknown", "Unknown", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("804", "2", "iConsulting.iCMServer.Modules.Discussion", "discussion_unknown", "Ok&auml;nd", "0", "0", "20040502232051");
INSERT INTO lgt_languagetext VALUES("805", "1", "iConsulting.iCMServer.Modules.Sites", "sites_sitewidth", "Site width:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("806", "2", "iConsulting.iCMServer.Modules.Sites", "sites_sitewidth", "Web bredd:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("807", "1", "iConsulting.iCMServer.Modules.Sites", "sites_containerwidth1", "Left modulefield width:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("808", "2", "iConsulting.iCMServer.Modules.Sites", "sites_containerwidth1", "V&auml;nster modulf&auml;lt bredd:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("809", "1", "iConsulting.iCMServer.Modules.Sites", "sites_containerwidth2", "Center modulefield width:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("810", "2", "iConsulting.iCMServer.Modules.Sites", "sites_containerwidth2", "Centrerad modulf&auml;lt bredd:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("811", "1", "iConsulting.iCMServer.Modules.Sites", "sites_containerwidth3", "Right modulefield width:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("812", "2", "iConsulting.iCMServer.Modules.Sites", "sites_containerwidth3", "H&ouml;ger modulf&auml;lt bredd:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("813", "1", "iConsulting.iCMServer.Modules.Sites", "sites_metadescription", "Meta description:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("814", "2", "iConsulting.iCMServer.Modules.Sites", "sites_metadescription", "Meta beskrivning:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("815", "1", "iConsulting.iCMServer.Modules.Sites", "sites_metakeywords", "Meta keywords:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("816", "2", "iConsulting.iCMServer.Modules.Sites", "sites_metakeywords", "Meta s&ouml;kord:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("817", "1", "iConsulting.iCMServer.Modules.Sites", "sites_metaauthor", "Meta author:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("818", "2", "iConsulting.iCMServer.Modules.Sites", "sites_metaauthor", "Meta f&ouml;rfattare:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("819", "1", "iConsulting.iCMServer.Modules.Sites", "sites_metacopyright", "Meta copyright:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("820", "2", "iConsulting.iCMServer.Modules.Sites", "sites_metacopyright", "Meta copyright:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("821", "1", "iConsulting.iCMServer.Modules.Sites", "sites_metarobots", "Meta robots:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("822", "2", "iConsulting.iCMServer.Modules.Sites", "sites_metarobots", "Meta robots:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("823", "1", "iConsulting.iCMServer.Modules.Sites", "sites_sitealign", "Site align:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("824", "2", "iConsulting.iCMServer.Modules.Sites", "sites_sitealign", "Web placering:", "0", "0", "20040502232107");
INSERT INTO lgt_languagetext VALUES("825", "1", "iConsulting.iCMServer.Modules.Sites", "sites_multiplicator", "Menu multiplicator:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("826", "2", "iConsulting.iCMServer.Modules.Sites", "sites_multiplicator", "Meny multiplikator:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("827", "1", "iConsulting.iCMServer.Modules.Sites", "sites_headtextalign", "Headmenu textalign:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("828", "2", "iConsulting.iCMServer.Modules.Sites", "sites_headtextalign", "Huvudmeny textplacering:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("829", "1", "iConsulting.iCMServer.Modules.Sites", "sites_subtextalign", "Submenu textalign:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("830", "2", "iConsulting.iCMServer.Modules.Sites", "sites_subtextalign", "Undermeny textplacering:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("831", "1", "iConsulting.iCMServer.Modules.Sites", "sites_headwidth", "Headmenu width:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("832", "2", "iConsulting.iCMServer.Modules.Sites", "sites_headwidth", "Huvudmeny bredd:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("833", "1", "iConsulting.iCMServer.Modules.Sites", "sites_subwidth", "Submenu width:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("834", "2", "iConsulting.iCMServer.Modules.Sites", "sites_subwidth", "Undermeny bredd:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("835", "1", "iConsulting.iCMServer.Modules.Sites", "sites_headheight", "Headmenu height:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("836", "2", "iConsulting.iCMServer.Modules.Sites", "sites_headheight", "Huvudmeny h&ouml;jd:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("837", "1", "iConsulting.iCMServer.Modules.Sites", "sites_subheight", "Submenu height:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("838", "2", "iConsulting.iCMServer.Modules.Sites", "sites_subheight", "Undermeny h&ouml;jd:", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("839", "1", "iConsulting.iCMServer.Modules.Users", "users_okok", "  Ok  ", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("840", "2", "iConsulting.iCMServer.Modules.Users", "users_okok", "  Ok  ", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("841", "1", "iConsulting.iCMServer.Modules.Users", "users_cancelcancel", "Cancel", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("842", "2", "iConsulting.iCMServer.Modules.Users", "users_cancelcancel", "&Aring;ngra", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("843", "1", "iConsulting.iCMServer.Modules.Roles", "roles_okok", "  Ok  ", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("844", "2", "iConsulting.iCMServer.Modules.Roles", "roles_okok", "  Ok  ", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("845", "1", "iConsulting.iCMServer.Modules.Pages", "pages__ok", "  Ok  ", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("846", "2", "iConsulting.iCMServer.Modules.Pages", "pages__ok", "  Ok  ", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("847", "1", "iConsulting.iCMServer.Modules.Pages", "pages__cancel", "Cancel", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("848", "2", "iConsulting.iCMServer.Modules.Pages", "pages__cancel", "&Aring;ngra", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("849", "1", "iConsulting.iCMServer.Modules.Pages", "pages__update", "Update", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("850", "2", "iConsulting.iCMServer.Modules.Pages", "pages__update", "Uppdatera", "0", "0", "20040502232108");
INSERT INTO lgt_languagetext VALUES("851", "1", "iConsulting.iCMServer.Modules.ModuleDefinition", "moduledefinition_header", "Administrate Modules", "0", "0", "20040502232159");
INSERT INTO lgt_languagetext VALUES("852", "2", "iConsulting.iCMServer.Modules.ModuleDefinition", "moduledefinition_header", "Administrera Moduler", "0", "0", "20040502232159");
INSERT INTO lgt_languagetext VALUES("853", "1", "iConsulting.iCMServer.Modules.ModuleDefinition", "moduledefinition_addmodule", "Add New Module Type", "0", "0", "20040502232159");
INSERT INTO lgt_languagetext VALUES("854", "2", "iConsulting.iCMServer.Modules.ModuleDefinition", "moduledefinition_addmodule", "Lägg till ny modultyp", "0", "0", "20040502232159");
INSERT INTO lgt_languagetext VALUES("855", "1", "iConsulting.iCMServer.Modules.ModuleDefinition", "moduledefinition_edittext", "Edit this item", "0", "0", "20040502232159");
INSERT INTO lgt_languagetext VALUES("856", "2", "iConsulting.iCMServer.Modules.ModuleDefinition", "moduledefinition_edittext", "Editera denna modultyp", "0", "0", "20040502232159");


#
# Table structure for table 'lng_language'
#

CREATE TABLE lng_language (
  lng_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  lng_language varchar(50) default NULL,
  lng_hidden int(1) NOT NULL default '0',
  lng_deleted int(1) NOT NULL default '0',
  lng_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (lng_id)
) TYPE=MyISAM;



#
# Dumping data for table 'lng_language'
#

INSERT INTO lng_language VALUES("1", "1", "English", "0", "0", "20040502232034");
INSERT INTO lng_language VALUES("2", "1", "Svenska", "0", "0", "20040502232034");


#
# Table structure for table 'mde_moduledefinitions'
#

CREATE TABLE mde_moduledefinitions (
  mde_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mde_name longtext,
  mde_description longtext,
  mde_desktopsrc longtext,
  mde_mobilesrc longtext,
  mde_createddate datetime default NULL,
  mde_createdby varchar(255) default NULL,
  mde_updateddate datetime default NULL,
  mde_updatedby varchar(255) default NULL,
  mde_hidden int(1) NOT NULL default '0',
  mde_deleted int(1) NOT NULL default '0',
  mde_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (mde_id)
) TYPE=MyISAM;



#
# Dumping data for table 'mde_moduledefinitions'
#

INSERT INTO mde_moduledefinitions VALUES("1", "1", "(System) Manage Sites", "", "Server/Modules/Sites/Sites.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("2", "1", "(System) Manage Pages", "", "Server/Modules/Pages/Pages.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("3", "1", "(System) Manage Menu", "", "Server/Modules/Menu/Menu.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("4", "1", "(System) Manage Languages", "", "Server/Modules/Language/Language.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("5", "1", "(System) Manage Roles", "", "Server/Modules/Roles/Roles.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("6", "1", "(System) Manage Users", "", "Server/Modules/Users/Users.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("7", "1", "Publisher", "", "Desktop/Modules/Publisher/Publisher.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("8", "1", "Documents", "", "Desktop/Modules/Documents/Documents.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("9", "1", "Mediagallery", "", "Desktop/Modules/Mediagallery/Mediagallery.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("10", "1", "Events", "", "Desktop/Modules/Events/Events.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("11", "1", "iFrame", "", "Desktop/Modules/iFrame/iFrame.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("12", "1", "Quicklinks", "", "Desktop/Modules/Quicklinks/Quicklinks.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("13", "1", "Discussion", "", "Desktop/Modules/Discussion/Discussion.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mde_moduledefinitions VALUES("14", "1", "(System) ModuleDefinition", "", "Server/Modules/ModuleDefinition/ModuleDefinition.ascx", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232311");


#
# Table structure for table 'men_menu'
#

CREATE TABLE men_menu (
  men_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  men_menualign varchar(50) default NULL,
  men_menufade int(1) default NULL,
  men_menufadedurance varchar(8) default NULL,
  men_menuoffset int(11) default NULL,
  men_menutop int(11) default NULL,
  men_menuleft int(11) default NULL,
  men_menuforecolor1 varchar(8) default NULL,
  men_menubackcolor1 varchar(8) default NULL,
  men_menuforecolor2 varchar(8) default NULL,
  men_menubackcolor2 varchar(8) default NULL,
  men_menuoverforecolor1 varchar(8) default NULL,
  men_menuoverbackcolor1 varchar(8) default NULL,
  men_menuoverforecolor2 varchar(8) default NULL,
  men_menuoverbackcolor2 varchar(8) default NULL,
  men_menufont varchar(50) default NULL,
  men_menubold1 int(1) default NULL,
  men_menuoverbold1 int(1) default NULL,
  men_menubold2 int(1) default NULL,
  men_menuoverbold2 int(1) default NULL,
  men_placement varchar(50) default NULL,
  men_between int(11) default NULL,
  men_wait int(11) default NULL,
  men_menulevel1borderx int(1) default NULL,
  men_menulevel1bordery int(1) default NULL,
  men_menulevel2borderx int(1) default NULL,
  men_menulevel2bordery int(1) default NULL,
  men_menuroundborder int(1) default NULL,
  men_menufontsize1 int(11) default NULL,
  men_menuoverfontsize1 int(11) default NULL,
  men_menufontsize2 int(11) default NULL,
  men_menuoverfontsize2 int(11) default NULL,
  men_menubordercolor1 varchar(8) default NULL,
  men_menubordercolor2 varchar(8) default NULL,
  men_createddate datetime default NULL,
  men_createdby varchar(255) default NULL,
  men_updateddate datetime default NULL,
  men_updatedby varchar(255) default NULL,
  men_hidden int(1) NOT NULL default '0',
  men_deleted int(1) NOT NULL default '0',
  men_ts timestamp(14) NOT NULL,
  men_multiplicator varchar(10) default NULL,
  men_headtextalign varchar(10) default NULL,
  men_subtextalign varchar(10) default NULL,
  men_headwidth varchar(10) default NULL,
  men_subwidth varchar(10) default NULL,
  men_headheight varchar(10) default NULL,
  men_subheight varchar(10) default NULL,
  PRIMARY KEY  (men_id)
) TYPE=MyISAM;



#
# Dumping data for table 'men_menu'
#

INSERT INTO men_menu VALUES("1", "1", "top", "1", "0.5", "0", "60", "0", "#000000", "#ffffff", "#000000", "#ffffff", "#000000", "#ccffff", "#000000", "#ccffff", "Verdana", "0", "1", "0", "0", "center", "2", "500", "1", "1", "1", "1", "0", "10", "10", "10", "10", "#999999", "#999999", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232107", "9.5", "left", "left", "n/a", "n/a", "18", "18");


#
# Table structure for table 'mod_modules'
#

CREATE TABLE mod_modules (
  mod_id int(11) NOT NULL auto_increment,
  sit_id int(11) default NULL,
  pag_id int(11) NOT NULL default '0',
  lng_id int(11) default NULL,
  mde_id int(11) NOT NULL default '0',
  mod_order int(11) NOT NULL default '0',
  mod_panename varchar(255) NOT NULL default '',
  mod_title varchar(255) default NULL,
  mod_description varchar(255) default NULL,
  mod_authorizededitroles longtext,
  mod_cachetime int(11) NOT NULL default '0',
  mod_showmobile int(1) NOT NULL default '0',
  mod_alignment varchar(50) default NULL,
  mod_color varchar(50) default NULL,
  mod_border varchar(50) default NULL,
  mod_editsrc varchar(255) default NULL,
  mod_iconfile varchar(255) default NULL,
  mod_editmoduleicon varchar(255) default NULL,
  mod_friendlyname varchar(255) default NULL,
  mod_secure int(1) NOT NULL default '0',
  mod_allpages int(1) NOT NULL default '0',
  mod_showtitle int(1) NOT NULL default '0',
  mod_personalize int(11) default NULL,
  mod_skinpath varchar(255) default NULL,
  mod_createddate datetime default NULL,
  mod_createdby varchar(255) default NULL,
  mod_updateddate datetime default NULL,
  mod_updatedby varchar(255) default NULL,
  mod_hidden int(1) NOT NULL default '0',
  mod_deleted int(1) NOT NULL default '0',
  mod_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (mod_id)
) TYPE=MyISAM;



#
# Dumping data for table 'mod_modules'
#

INSERT INTO mod_modules VALUES("1", "1", "2", "1", "1", "1", "ContentModuleField", "Sites", "", "Superadmin;Admins;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mod_modules VALUES("2", "1", "2", "1", "2", "3", "ContentModuleField", "Pages", "", "Superadmin;Admins;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mod_modules VALUES("3", "1", "0", "1", "3", "0", "TopModuleField", "Menu", "", "Superadmin;Admins;", "0", "0", "middle", "", "0", "", "", "", "", "1", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mod_modules VALUES("4", "1", "2", "1", "4", "9", "ContentModuleField", "Languages", "", "Superadmin;Admins;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "1", "20040502232034");
INSERT INTO mod_modules VALUES("5", "1", "2", "1", "5", "7", "ContentModuleField", "Roles", "", "Superadmin;Admins;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mod_modules VALUES("6", "1", "2", "1", "6", "5", "ContentModuleField", "Users", "", "Superadmin;Admins;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO mod_modules VALUES("7", "1", "3", "1", "9", "1", "ContentModuleField", "Mediagallery", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("8", "1", "4", "1", "7", "1", "ContentModuleField", "Publisher", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("9", "1", "5", "1", "10", "1", "ContentModuleField", "Events", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("10", "1", "6", "1", "12", "1", "ContentModuleField", "Quicklinks", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("11", "1", "7", "1", "11", "1", "ContentModuleField", "iFrame", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("12", "1", "8", "1", "8", "1", "ContentModuleField", "Documents", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("13", "1", "9", "1", "13", "1", "ContentModuleField", "Discussion", "", "All Users;", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO mod_modules VALUES("14", "1", "10", "0", "14", "1", "ContentModuleField", "Nytt Modul Namn", "-", "Admins;Superadmin", "0", "0", "middle", "", "0", "", "", "", "", "0", "0", "0", "0", "none", "2004-05-02 00:00:00", "System", "2004-05-02 00:00:00", "System", "0", "0", "20040502232329");


#
# Table structure for table 'mse_modulesettings'
#

CREATE TABLE mse_modulesettings (
  mse_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  mse_name varchar(255) NOT NULL default '',
  mde_id int(11) NOT NULL default '0',
  mse_value longtext,
  mse_createddate datetime default NULL,
  mse_createdby varchar(255) default NULL,
  mse_updateddate datetime default NULL,
  mse_updatedby varchar(255) default NULL,
  mse_hidden int(1) NOT NULL default '0',
  mse_deleted int(1) NOT NULL default '0',
  mse_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (mse_id)
) TYPE=MyISAM;



#
# Dumping data for table 'mse_modulesettings'
#



#
# Table structure for table 'pag_page'
#

CREATE TABLE pag_page (
  pag_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  lng_id int(11) default NULL,
  pag_order int(11) NOT NULL default '0',
  pag_pageparentid int(11) default NULL,
  pag_backcolor varchar(50) default NULL,
  pag_pictureid varchar(10) default NULL,
  pag_picturehref varchar(255) default NULL,
  pag_picturehorizontalalign varchar(50) default NULL,
  pag_pictureverticalalign varchar(50) default NULL,
  pag_picturehorizontaltiling int(1) NOT NULL default '0',
  pag_pictureverticaltiling int(1) NOT NULL default '0',
  pag_minimizer int(1) NOT NULL default '0',
  pag_height varchar(10) default NULL,
  pag_top varchar(10) default NULL,
  pag_name varchar(255) NOT NULL default '',
  pag_description longtext,
  pag_mobilename varchar(255) default NULL,
  pag_mobiledescription longtext,
  pag_authorizedroles longtext,
  pag_showmobile int(1) NOT NULL default '0',
  pag_leftmodulefieldwidth varchar(20) default NULL,
  pag_contentmodulefieldwidth varchar(20) default NULL,
  pag_rightmodulefieldwidth varchar(20) default NULL,
  pag_contentalign int(1) NOT NULL default '0',
  pag_level int(11) default NULL,
  pag_iconfile varchar(255) default NULL,
  pag_adminpageicon varchar(255) default NULL,
  pag_isvisible int(1) NOT NULL default '0',
  pag_haschildren int(1) NOT NULL default '0',
  pag_createddate datetime default NULL,
  pag_createdby varchar(255) default NULL,
  pag_updateddate datetime default NULL,
  pag_updatedby varchar(255) default NULL,
  pag_hidden int(1) NOT NULL default '0',
  pag_deleted int(1) NOT NULL default '0',
  pag_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (pag_id)
) TYPE=MyISAM;



#
# Dumping data for table 'pag_page'
#

INSERT INTO pag_page VALUES("1", "1", "1", "1", "0", "n/a", "0", "", "center", "center", "0", "0", "0", "n/a", "0", "Home", "", "", "", "All Users;", "0", "170", "600", "170", "1", "333", "", "", "1", "0", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232034");
INSERT INTO pag_page VALUES("2", "1", "1", "99999", "0", "n/a", "0", "", "center", "center", "0", "0", "1", "n/a", "0", "Admin", "", "", "", "Superadmin;Admins;", "0", "170", "600", "170", "1", "666", "", "", "1", "0", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232236");
INSERT INTO pag_page VALUES("10", "1", "0", "3", "0", "n/a", "", "", "center", "center", "0", "0", "0", "n/a", "0", "MDE", "", "", "", "Admins;Superadmin;", "0", "170", "600", "170", "1", "0", "", "", "1", "0", "2004-05-02 00:00:00", "System", "2004-05-02 00:00:00", "System", "0", "0", "20040502232331");


#
# Table structure for table 'qui_quicklinks'
#

CREATE TABLE qui_quicklinks (
  qui_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  mod_id int(11) NOT NULL default '0',
  pag_id int(11) NOT NULL default '0',
  qui_title varchar(255) default NULL,
  qui_description longtext,
  qui_url text,
  qui_order int(11) default NULL,
  qui_createddate datetime default NULL,
  qui_createdby varchar(255) default NULL,
  qui_updateddate datetime default NULL,
  qui_updatedby varchar(255) default NULL,
  qui_hidden int(1) NOT NULL default '0',
  qui_deleted int(1) NOT NULL default '0',
  qui_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (qui_id)
) TYPE=MyISAM;



#
# Dumping data for table 'qui_quicklinks'
#



#
# Table structure for table 'rol_roles'
#

CREATE TABLE rol_roles (
  rol_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  lng_id int(11) default NULL,
  rol_name varchar(255) default NULL,
  rol_description longtext,
  rol_createddate datetime default NULL,
  rol_createdby varchar(255) default NULL,
  rol_updateddate datetime default NULL,
  rol_updatedby varchar(255) default NULL,
  rol_hidden int(1) NOT NULL default '0',
  rol_deleted int(1) NOT NULL default '0',
  rol_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (rol_id)
) TYPE=MyISAM;



#
# Dumping data for table 'rol_roles'
#

INSERT INTO rol_roles VALUES("1", "1", "1", "Superadmin", "System Super_Administrator", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232035");
INSERT INTO rol_roles VALUES("2", "1", "1", "Admins", "System Administrator", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO rol_roles VALUES("3", "1", "1", "Users", "System Users", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");


#
# Table structure for table 'sit_sites'
#

CREATE TABLE sit_sites (
  sit_id int(11) NOT NULL auto_increment,
  lng_id int(11) default NULL,
  sit_name varchar(255) default NULL,
  sit_alias varchar(255) default NULL,
  sit_css varchar(255) default NULL,
  sit_cssheadfamily varchar(20) default NULL,
  sit_cssheadsize varchar(10) default NULL,
  sit_cssheadweight varchar(10) default NULL,
  sit_cssheadcolor varchar(20) default NULL,
  sit_csssubheadfamily varchar(20) default NULL,
  sit_csssubheadsize varchar(10) default NULL,
  sit_csssubheadweight varchar(10) default NULL,
  sit_csssubheadcolor varchar(20) default NULL,
  sit_csssubsubheadfamily varchar(20) default NULL,
  sit_csssubsubheadsize varchar(10) default NULL,
  sit_csssubsubheadweight varchar(10) default NULL,
  sit_csssubsubheadcolor varchar(20) default NULL,
  sit_cssnormalfamily varchar(20) default NULL,
  sit_cssnormalsize varchar(10) default NULL,
  sit_cssnormalweight varchar(10) default NULL,
  sit_cssnormalcolor varchar(20) default NULL,
  sit_cssbuttonbordersize varchar(10) default NULL,
  sit_cssbuttonbordercolor varchar(20) default NULL,
  sit_cssbuttonbackcolor varchar(20) default NULL,
  sit_cssbuttonforecolor varchar(20) default NULL,
  sit_cssbuttontextalign varchar(20) default NULL,
  sit_cssbuttonfontfamily varchar(20) default NULL,
  sit_cssbuttonfontsize varchar(10) default NULL,
  sit_cssbuttonfontweight varchar(10) default NULL,
  sit_csshrcolor varchar(20) default NULL,
  sit_csshrheight varchar(10) default NULL,
  sit_csshralign varchar(20) default NULL,
  sit_logo varchar(10) default NULL,
  sit_logohref varchar(255) default NULL,
  sit_logohorizontaltiling int(1) NOT NULL default '0',
  sit_logoverticaltiling int(1) NOT NULL default '0',
  sit_logohorizontalalign varchar(50) default NULL,
  sit_logoverticalalign varchar(50) default NULL,
  sit_startpage int(11) default NULL,
  sit_alwaysshoweditbutton int(1) NOT NULL default '0',
  sit_showfooter int(1) NOT NULL default '0',
  sit_footertextleft varchar(255) default NULL,
  sit_footertextcontent varchar(255) default NULL,
  sit_footertextright varchar(255) default NULL,
  sit_color varchar(8) default NULL,
  sit_contentadjust int(11) default NULL,
  sit_softdelete int(1) default NULL,
  sit_createddate datetime default NULL,
  sit_createdby varchar(255) default NULL,
  sit_updateddate datetime default NULL,
  sit_updatedby varchar(255) default NULL,
  sit_hidden int(1) NOT NULL default '0',
  sit_deleted int(1) NOT NULL default '0',
  sit_ts timestamp(14) NOT NULL,
  sit_sitewidth varchar(10) default NULL,
  sit_sitealign varchar(10) default NULL,
  sit_containerwidth1 varchar(10) default NULL,
  sit_containerwidth2 varchar(10) default NULL,
  sit_containerwidth3 varchar(10) default NULL,
  sit_metadescription text,
  sit_metakeywords text,
  sit_metaauthor varchar(100) default NULL,
  sit_metacopyright varchar(100) default NULL,
  sit_metarobots varchar(100) default NULL,
  PRIMARY KEY  (sit_id)
) TYPE=MyISAM;



#
# Dumping data for table 'sit_sites'
#

INSERT INTO sit_sites VALUES("1", "1", "Default", "Default", "", "Verdana", "15", "bold", "#081F76", "Verdana", "11", "bold", "#081F76", "Verdana", "11", "normal", "#081F76", "Verdana", "11", "normal", "#000000", "1", "#203470", "#ffffff", "#081F76", "center", "Verdana", "10", "normal", "#203470", "1", "left", "", "", "0", "0", "center", "top", "1", "0", "0", "", "", "", "n/a", "1", "0", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232107", "n/a", "left", "170", "600", "170", "iConsulting iCMServer Pro", "iConsulting,iCMServer", "iConsulting", "Copyright 2004 iConsulting", "index,follow");


#
# Table structure for table 'slg_sitelog'
#

CREATE TABLE slg_sitelog (
  slg_id int(11) NOT NULL auto_increment,
  sit_id int(11) NOT NULL default '0',
  slg_logdate datetime default NULL,
  slg_ip varchar(20) default NULL,
  slg_referrer varchar(255) default NULL,
  slg_url varchar(255) default NULL,
  slg_useragent varchar(255) default NULL,
  slg_hostaddress varchar(255) default NULL,
  slg_hostname varchar(255) default NULL,
  slg_hidden int(1) NOT NULL default '0',
  slg_deleted int(1) NOT NULL default '0',
  slg_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (slg_id)
) TYPE=MyISAM;



#
# Dumping data for table 'slg_sitelog'
#

INSERT INTO slg_sitelog VALUES("1", "1", "2004-05-02 23:21:30", "127.0.0.1", NULL, "/Development/iConsulting/iCMServer/wwwroot/iCMServer/icm.aspx", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)", "127.0.0.1", "localhost", "0", "0", "20040502232130");
INSERT INTO slg_sitelog VALUES("2", "1", "2004-05-02 23:25:48", "127.0.0.1", NULL, "/Development/iConsulting/iCMServer/wwwroot/iCMServer/icm.aspx", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)", "127.0.0.1", "localhost", "0", "0", "20040502232548");


#
# Table structure for table 'uro_userroles'
#

CREATE TABLE uro_userroles (
  uro_id int(11) NOT NULL auto_increment,
  usr_id int(11) NOT NULL default '0',
  sit_id int(11) NOT NULL default '0',
  rol_id int(11) NOT NULL default '0',
  uro_createddate datetime default NULL,
  uro_createdby varchar(255) default NULL,
  uro_updateddate datetime default NULL,
  uro_updatedby varchar(255) default NULL,
  uro_hidden int(1) NOT NULL default '0',
  uro_deleted int(1) NOT NULL default '0',
  uro_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (uro_id)
) TYPE=MyISAM;



#
# Dumping data for table 'uro_userroles'
#

INSERT INTO uro_userroles VALUES("1", "1", "1", "1", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
INSERT INTO uro_userroles VALUES("2", "2", "1", "2", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");


#
# Table structure for table 'usr_users'
#

CREATE TABLE usr_users (
  usr_id int(11) NOT NULL auto_increment,
  sit_id int(11) default NULL,
  usr_firstname varchar(255) NOT NULL default '',
  usr_loginname varchar(255) default NULL,
  usr_description longtext,
  usr_password varchar(255) default NULL,
  usr_lastname varchar(255) default NULL,
  usr_email varchar(255) default NULL,
  usr_createddate datetime default NULL,
  usr_createdby varchar(255) default NULL,
  usr_updateddate datetime default NULL,
  usr_updatedby varchar(255) default NULL,
  usr_hidden int(1) NOT NULL default '0',
  usr_deleted int(1) NOT NULL default '0',
  usr_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (usr_id)
) TYPE=MyISAM;



#
# Dumping data for table 'usr_users'
#

INSERT INTO usr_users VALUES("1", "1", "sa", "sa", "", "Fn7mNn0akGCV7gSXvrPVDQ==", "", "sa@default.se", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "1", "0", "20040502232035");
INSERT INTO usr_users VALUES("2", "1", "Admin", "Admin", "", "uAk6H8qLvBrv8wc3N4qUIA==", "", "admin@default.se", "2003-01-01 00:00:00", "autoscript", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");


#
# Table structure for table 'ver_version'
#

CREATE TABLE ver_version (
  ver_id int(11) NOT NULL auto_increment,
  ver_major int(11) NOT NULL default '0',
  ver_minor int(11) NOT NULL default '0',
  ver_build int(11) NOT NULL default '0',
  ver_description longtext,
  ver_createddate datetime default NULL,
  ver_createdby varchar(255) default NULL,
  ver_hidden int(1) NOT NULL default '0',
  ver_deleted int(1) NOT NULL default '0',
  ver_ts timestamp(14) NOT NULL,
  PRIMARY KEY  (ver_id)
) TYPE=MyISAM;



#
# Dumping data for table 'ver_version'
#

INSERT INTO ver_version VALUES("1", "2", "0", "0", "First Version", "2003-01-01 00:00:00", "autoscript", "0", "0", "20040502232035");
