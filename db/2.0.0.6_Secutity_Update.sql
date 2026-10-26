

-- sit_sites --

ALTER TABLE sit_sites ADD 
	sit_sitewidth nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_sitealign nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_containerwidth1 nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_containerwidth2 nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_containerwidth3 nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_metadescription nvarchar (1000) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_metakeywords nvarchar (1000) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_metaauthor nvarchar (100) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_metacopyright nvarchar (100) COLLATE Finnish_Swedish_CI_AS NULL ,
	sit_metarobots nvarchar (100) COLLATE Finnish_Swedish_CI_AS NULL
GO

UPDATE sit_sites SET 
	sit_sitewidth = 'n/a',
	sit_sitealign = 'left',
	sit_containerwidth1 = '170',
	sit_containerwidth2 = '600',
	sit_containerwidth3 = '170',
	sit_metadescription = 'iConsulting iCMServer Pro',
	sit_metakeywords = 'iConsulting,iCMServer',
	sit_metaauthor = 'iConsulting',
	sit_metacopyright = 'Copyright 2004 iConsulting',
	sit_metarobots = 'index,follow'
GO


-- men_menu --

ALTER TABLE men_menu ADD 
	men_multiplicator nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	men_headtextalign nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	men_subtextalign nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	men_headwidth nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	men_subwidth nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	men_headheight nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL ,
	men_subheight nvarchar (10) COLLATE Finnish_Swedish_CI_AS NULL
GO

UPDATE men_menu SET  
	men_multiplicator = '9.5' ,
	men_headtextalign = 'left' ,
	men_subtextalign = 'left' ,
	men_headwidth = 'n/a' ,
	men_subwidth = 'n/a' ,
	men_headheight = '18' ,
	men_subheight = '18'
GO

-- lng_languagetext

INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_sitewidth','Site width:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_sitewidth','Web bredd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_containerwidth1','Left modulefield width:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_containerwidth1','V&auml;nster modulf&auml;lt bredd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_containerwidth2','Center modulefield width:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_containerwidth2','Centrerad modulf&auml;lt bredd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_containerwidth3','Right modulefield width:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_containerwidth3','H&ouml;ger modulf&auml;lt bredd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_metadescription','Meta description:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_metadescription','Meta beskrivning:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_metakeywords','Meta keywords:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_metakeywords','Meta s&ouml;kord:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_metaauthor','Meta author:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_metaauthor','Meta f&ouml;rfattare:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_metacopyright','Meta copyright:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_metacopyright','Meta copyright:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_metarobots','Meta robots:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_metarobots','Meta robots:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_sitealign','Site align:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_sitealign','Web placering:',0,0)

INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_multiplicator','Menu multiplicator:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_multiplicator','Meny multiplikator:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_headtextalign','Headmenu textalign:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_headtextalign','Huvudmeny textplacering:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_subtextalign','Submenu textalign:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_subtextalign','Undermeny textplacering:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_headwidth','Headmenu width:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_headwidth','Huvudmeny bredd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_subwidth','Submenu width:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_subwidth','Undermeny bredd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_headheight','Headmenu height:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_headheight','Huvudmeny h&ouml;jd:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Sites','sites_subheight','Submenu height:',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Sites','sites_subheight','Undermeny h&ouml;jd:',0,0)

INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_okok','  Ok  ',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_okok','  Ok  ',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Users','users_cancelcancel','Cancel',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Users','users_cancelcancel','&Aring;ngra',0,0)

INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Roles','roles_okok','  Ok  ',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Roles','roles_okok','  Ok  ',0,0)

INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pages__ok','  Ok  ',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pages__ok','  Ok  ',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pages__cancel','Cancel',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pages__cancel','&Aring;ngra',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (1,'iConsulting.iCMServer.Modules.Pages','pages__update','Update',0,0)
INSERT INTO lgt_languagetext (lng_id, lgt_location, lgt_phrase, lgt_text, lgt_hidden, lgt_deleted) VALUES (2,'iConsulting.iCMServer.Modules.Pages','pages__update','Uppdatera',0,0)

GO


UPDATE lgt_languagetext SET lgt_text = 'Menu align:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menualign' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Meny l&auml;ge:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menualign' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu forecolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuforecolor1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny teckensf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuforecolor1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu forecolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuforecolor2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny teckensf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuforecolor2' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu backcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubackcolor1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny bakgrundsf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubackcolor1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu backcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubackcolor2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny bakgrundsf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubackcolor2' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Headmenu-highlight forecolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverforecolor1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny-markerad teckensf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverforecolor1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu-highlight forecolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverforecolor2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny-markerad teckensf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverforecolor2' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu-highlight backcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbackcolor1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny-markerad bakgrundsf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbackcolor1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu-highlight backcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbackcolor2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny-markerad bakgrundsf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbackcolor2' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Menu fontfamily:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menufont' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Meny teckensnitt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menufont' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Header fontfamily:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headfamily' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Rubrik teckensnitt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headfamily' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Ingress fontfamily:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadfamily' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Ingress teckensnitt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadfamily' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Text fontfamily:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadfamily' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Text teckensnitt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadfamily' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Normal fontfamily:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalfamily' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Normal teckensnitt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalfamily' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button fontfamily:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonfamily' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp teckensnitt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonfamily' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Header fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headsize' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Rubrik teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headsize' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Header fontweight:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headweight' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Rubrik teckenvikt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headweight' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Header fontcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headcolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Rubrik teckenf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_headcolor' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Ingress fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadsize' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Ingress teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadsize' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Ingress fontweight:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadweight' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Ingress teckenvikt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadweight' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Ingress fontcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadcolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Ingress teckenf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subheadcolor' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Text fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadsize' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Text teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadsize' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Text fontweight:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadweight' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Text teckenvikt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadweight' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Text fontcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadcolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Text teckenf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_subsubheadcolor' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Normal fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalsize' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Normal teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalsize' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Normal fontweight:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalweight' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Normal teckenvikt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalweight' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Normal fontcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalcolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Normal teckenf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_normalcolor' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Button fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonsize' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonsize' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button fontweight:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonweight' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp teckenvikt:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonweight' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button forecolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonforecolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp teckenf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonforecolor' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button backcolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonbackcolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp bakgrundsf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonbackcolor' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button bordersize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonbordersize' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp ramstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonbordersize' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button bordercolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonbordercolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp ramf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttonbordercolor' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Button textalign:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttontextalign' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Knapp textplacering:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_buttontextalign' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Line height:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_hrheight' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Linje h&ouml;jd:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_hrheight' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Line color:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_hrcolor' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Linje f&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_hrcolor' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Line align:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_hralign' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Linje placering:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_hralign' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Menu offset:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoffset' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Meny offset:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoffset' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Headmenu bold:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubold1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny fet text:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubold1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu-highlight bold:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbold1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny-markerad fet text:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbold1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu bold:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubold2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny fet text:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubold2' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu-highlight bold:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbold2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny-markerad fet text:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverbold2' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Menu offset:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoffset' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Meny offset:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoffset' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu space:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_between' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny avst&aring;nd:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_between' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Headmenu x-border:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level1borderx' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny x-ram:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level1borderx' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu y-border:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level1bordery' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny y-ram:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level1bordery' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu x-border:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level2borderx' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny x-ram:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level2borderx' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu y-border:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level2bordery' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny y-ram:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_level2bordery' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Headmenu fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menufontsize1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menufontsize1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Headmenu-highlight fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverfontsize1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny-markerad teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverfontsize1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menufontsize2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menufontsize2' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu-highlight fontsize:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverfontsize2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny-markerad teckenstorlek:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menuoverfontsize2' AND lng_id = 2

UPDATE lgt_languagetext SET lgt_text = 'Headmenu bordercolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubordercolor1' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Huvudmeny ramf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubordercolor1' AND lng_id = 2
UPDATE lgt_languagetext SET lgt_text = 'Submenu bordercolor:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubordercolor2' AND lng_id = 1
UPDATE lgt_languagetext SET lgt_text = 'Undermeny ramf&auml;rg:' WHERE lgt_location LIKE 'iConsulting.iCMServer.Modules.Sites' AND lgt_phrase LIKE 'sites_edit_menubordercolor2' AND lng_id = 2
GO