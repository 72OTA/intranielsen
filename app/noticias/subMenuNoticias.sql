//TABLA DONDE SE ALMACENAN LAS NOTICIAS--------------------------------------
CREATE TABLE `tbl_noticias_blog` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`Fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`titulo` MEDIUMTEXT NOT NULL,
	`dcorta` MEDIUMTEXT NOT NULL,
	`dlarga` LONGTEXT NOT NULL,
	`estatus` VARCHAR(50) NOT NULL DEFAULT 'importante',
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=4
;
//NOTICIAS DE PRUEBA------------------------------------------------------------
INSERT INTO `nielsendb`.`tbl_noticias_blog` (`titulo`, `dcorta`, `dlarga`, `estatus`, `ano`, `mes`, `origen`) VALUES ('Noticia de prueba3', 'Descripcion corta de la noticia', 'Cuerpo de la noticia, notese que debe ingresar la opcion correspondiente al slider donde desea almacenar la noticia, si esta es importante.', 'importante1', '2017', '09', 'ADMINISTRA');
INSERT INTO `nielsendb`.`tbl_noticias_blog` (`titulo`, `dcorta`, `dlarga`, `estatus`, `ano`, `mes`, `origen`) VALUES ('Noticia de prueba2', 'Descripcion corta de la noticia', 'Cuerpo de la noticia, notese que debe ingresar la opcion correspondiente al slider donde desea almacenar la noticia, si esta es importante.', 'importante1', '2017', '09', 'ADMINISTRA');
INSERT INTO `nielsendb`.`tbl_noticias_blog` (`titulo`, `dcorta`, `dlarga`, `estatus`, `ano`, `mes`, `origen`) VALUES ('Noticia de prueba1', 'Descripcion corta de la noticia', 'Cuerpo de la noticia, notese que debe ingresar la opcion correspondiente al slider donde desea almacenar la noticia, si esta es importante.', 'importante1', '2017', '09', 'ADMINISTRA');

//------------------------------------------------------------------------------
//TABLA QUE ALMACENA LOS MENU CORRESPONDIENTES PARA EL BLOG DE NOTICIAS---------
CREATE TABLE `tblnoticias_menu` (
	`idopcion` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`descripcion` VARCHAR(45) NOT NULL,
	`PosI` INT(10) UNSIGNED NOT NULL,
	`glyphicon` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`idopcion`)
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=100
;
//MENUS RESPECTIVOS DEL BLOGNOTICIAS--------------------------------------------
INSERT INTO `nielsendb`.`tblnoticias_menu` (`idopcion`, `descripcion`, `PosI`) VALUES ('1', 'NOTICIAS', '1');
INSERT INTO `nielsendb`.`tblnoticias_menu` (`idopcion`, `descripcion`, `PosI`) VALUES ('2', 'DESCARGAS', '2');
INSERT INTO `nielsendb`.`tblnoticias_menu` (`idopcion`, `descripcion`, `PosI`) VALUES ('3', 'EVALUACIONES', '3');

//------------------------------------------------------------------------------
//TABLA QUE ALMACENA LOS SUBMENU DEL BLOGNOTICIAS-------------------------------
CREATE TABLE `tblnoticias_submenu` (
	`idopcion` INT(10) UNSIGNED NOT NULL,
	`idsubmenu` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`PosS` INT(10) UNSIGNED NOT NULL,
	`url` VARCHAR(100) NOT NULL,
	`descripcion` VARCHAR(45) NOT NULL,
	`estado` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '1',
	`glyphicon` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`idopcion`, `idsubmenu`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
ROW_FORMAT=DYNAMIC
;
//SUBMENUS RESPECTIVOS----------------------------------------------------------
INSERT INTO `nielsendb`.`tblnoticias_submenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('1', '1', '1', 'noticiasfinal/?view=LISTARNOTICIAS', 'Modificar Noticias');
INSERT INTO `nielsendb`.`tblnoticias_submenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('1', '2', '1', 'noticiasfinal/?view=CARGANOTICIAS', 'Subir noticias');
INSERT INTO `nielsendb`.`tblnoticias_submenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('2', '1', '1', 'noticiasfinal/?view=DESCARGAS', 'Descargas');

//------------------------------------------------------------------------------
//SUBMENUS RESPECTIVOS DE LA TABLA tblsubmenu, DONDE SE CREAN LAS URL PARA EL FUNCIONAMIENTO Y ADMINISTRACION DE NOTICIAS.
INSERT INTO `nielsendb`.`tblsubmenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('5', '2', '2', 'app/noticias/adm_noticias.php?op=PREVENCION', 'Noticias Prevencion');
INSERT INTO `nielsendb`.`tblsubmenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('3', '2', '2', 'app/noticias/adm_noticias.php?op=REDES', 'Noticias Redes');
INSERT INTO `nielsendb`.`tblsubmenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('4', '3', '3', 'app/noticias/adm_noticias.php?op=OPERACIONES', 'Noticias Operaciones');
INSERT INTO `nielsendb`.`tblsubmenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('99', '3', '3', 'app/noticias/adm_noticias.php?op=ADMINISTRA', 'Administra Noticias');
INSERT INTO `nielsendb`.`tblsubmenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('1', '6', '6', 'app/noticias/adm_noticias.php?op=PLATAFORMA', 'Noticias Plataforma');
INSERT INTO `nielsendb`.`tblsubmenu` (`idopcion`, `idsubmenu`, `PosS`, `url`, `descripcion`) VALUES ('2', '10', '10', 'app/noticias/adm_noticias.php?op=RRHH', 'Noticias RRHH');
