-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: solicitud-prod.csvvfyniv8us.us-east-1.rds.amazonaws.com    Database: vexi_originacion
-- ------------------------------------------------------
-- Server version	10.6.25-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `cat_asentamiento`
--

CREATE TABLE `cat_asentamiento` (
  `id_asentamiento` int(11) NOT NULL AUTO_INCREMENT,
  `asentamiento` varchar(100) NOT NULL,
  `id_tipo_asentamiento` smallint(6) NOT NULL,
  `id_cp` int(11) NOT NULL,
  `id_zona` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_asentamiento`),
  KEY `fk_tipo_asentamiento` (`id_tipo_asentamiento`),
  KEY `fk_zona_asentamiento` (`id_zona`),
  KEY `fk` (`id_cp`,`id_tipo_asentamiento`),
  KEY `idx` (`asentamiento`),
  CONSTRAINT `fk_cp_asentamiento` FOREIGN KEY (`id_cp`) REFERENCES `cat_cp` (`id_cp`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_asentamiento` FOREIGN KEY (`id_tipo_asentamiento`) REFERENCES `cat_tipo_asentamiento` (`id_tipo_asentamiento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_zona_asentamiento` FOREIGN KEY (`id_zona`) REFERENCES `cat_zona` (`id_zona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_autorizacion`
--

CREATE TABLE `cat_autorizacion` (
  `id_autorizacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `activa` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_autorizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_canales_prioritarios`
--

CREATE TABLE `cat_canales_prioritarios` (
  `id_cat_canal` int(11) NOT NULL AUTO_INCREMENT,
  `id_canal` int(11) DEFAULT NULL,
  `desc_canal` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cat_canal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_codigos_ref_vip`
--

CREATE TABLE `cat_codigos_ref_vip` (
  `id_referido` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cod_ref` varchar(10) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `cuenta` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id_referido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_correo_promocion`
--

CREATE TABLE `cat_correo_promocion` (
  `id_cat_promocion` int(11) NOT NULL AUTO_INCREMENT,
  `promocion` varchar(50) NOT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(250) NOT NULL,
  `reglas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_cat_promocion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_cp`
--

CREATE TABLE `cat_cp` (
  `id_cp` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_postal` varchar(10) NOT NULL,
  `id_municipio` smallint(6) NOT NULL,
  PRIMARY KEY (`id_cp`),
  KEY `fk` (`id_municipio`),
  KEY `idx_codigo_postal` (`codigo_postal`),
  CONSTRAINT `fk_cp_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `cat_municipio` (`id_municipio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32542 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='catalogos de codigos postales';

--
-- Table structure for table `cat_de_catalogos`
--

CREATE TABLE `cat_de_catalogos` (
  `id_cat_de_catalogo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_catalogo` tinyint(4) NOT NULL,
  `id_valor` tinyint(4) NOT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `id_accial` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_cat_de_catalogo`),
  KEY `fk_catalogo_ingresos` (`id_catalogo`),
  KEY `fk` (`id_valor`),
  CONSTRAINT `fk_catalogo_ingresos` FOREIGN KEY (`id_catalogo`) REFERENCES `catalogo_ingresos` (`id_catalogo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_email_remarketing`
--

CREATE TABLE `cat_email_remarketing` (
  `id_email_remarketing_cat` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id_email_remarketing_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_entidad_federativa`
--

CREATE TABLE `cat_entidad_federativa` (
  `id_entidad` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_pais` smallint(6) NOT NULL,
  `entidad_federativa` varchar(50) NOT NULL,
  `clave` varchar(5) NOT NULL,
  PRIMARY KEY (`id_entidad`),
  KEY `fk` (`id_pais`),
  CONSTRAINT `fk_pais_entidad_federativa` FOREIGN KEY (`id_pais`) REFERENCES `cat_pais` (`id_pais`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_estado_civil`
--

CREATE TABLE `cat_estado_civil` (
  `id_estado_civil` smallint(6) NOT NULL AUTO_INCREMENT,
  `estado_civil` varchar(50) NOT NULL,
  `id_accial` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_estatus_consulta_BC`
--

CREATE TABLE `cat_estatus_consulta_BC` (
  `id_estatus_consulta` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `activo` varchar(50) DEFAULT NULL,
  KEY `pk` (`id_estatus_consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de estatus BC';

--
-- Table structure for table `cat_estatus_consulta_CC`
--

CREATE TABLE `cat_estatus_consulta_CC` (
  `id_estatus_consulta` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `activo` varchar(50) DEFAULT NULL,
  KEY `pk` (`id_estatus_consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de estatus CC';

--
-- Table structure for table `cat_estatus_curp`
--

CREATE TABLE `cat_estatus_curp` (
  `id_estatus_curp` smallint(6) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `clave` varchar(5) NOT NULL,
  PRIMARY KEY (`id_estatus_curp`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_estatus_proceso_cuentas_canceladas`
--

CREATE TABLE `cat_estatus_proceso_cuentas_canceladas` (
  `id_estatus` int(11) NOT NULL,
  `descripcion` varchar(155) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_estatus_solicitud`
--

CREATE TABLE `cat_estatus_solicitud` (
  `id_estatus` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estatus` varchar(100) NOT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_estatus_val_gobierno`
--

CREATE TABLE `cat_estatus_val_gobierno` (
  `id_estatus` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_eventos_hubspot`
--

CREATE TABLE `cat_eventos_hubspot` (
  `id_cat_eventos_hubspot` int(11) NOT NULL AUTO_INCREMENT,
  `actions` varchar(255) DEFAULT NULL,
  `id_fase` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_cat_eventos_hubspot`),
  KEY `id_fase` (`id_fase`),
  KEY `index_actions_hubspot` (`actions`),
  CONSTRAINT `cat_eventos_hubspot_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_experiments`
--

CREATE TABLE `cat_experiments` (
  `id_experiment` int(11) NOT NULL AUTO_INCREMENT,
  `experiment_description` varchar(30) DEFAULT NULL,
  `created_at` varchar(20) DEFAULT NULL,
  `modified_at` varchar(20) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_experiment`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_fase_evento`
--

CREATE TABLE `cat_fase_evento` (
  `id_fase_evento` int(11) NOT NULL AUTO_INCREMENT,
  `id_fase` tinyint(4) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fase_evento`),
  KEY `id_fase` (`id_fase`),
  CONSTRAINT `cat_fase_evento_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`),
  CONSTRAINT `cat_fase_evento_ibfk_2` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `cat_fase_solicitud`
--

CREATE TABLE `cat_fase_solicitud` (
  `id_fase` tinyint(4) NOT NULL AUTO_INCREMENT,
  `fase` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_fase`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_fase_workflows_solicitud`
--

CREATE TABLE `cat_fase_workflows_solicitud` (
  `id_cat_fase_workflows_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_fase` tinyint(4) NOT NULL,
  `posicion` int(11) NOT NULL,
  `id_cat_workflows_solicitud` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `id_estatus_solicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cat_fase_workflows_solicitud`),
  KEY `id_fase` (`id_fase`),
  KEY `id_cat_workflows_solicitud` (`id_cat_workflows_solicitud`),
  CONSTRAINT `cat_fase_workflows_solicitud_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cat_fase_workflows_solicitud_ibfk_2` FOREIGN KEY (`id_cat_workflows_solicitud`) REFERENCES `cat_workflows_solicitud` (`id_cat_workflows_solicitud`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_flag_fraude`
--

CREATE TABLE `cat_flag_fraude` (
  `id_flag` tinyint(4) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(100) NOT NULL,
  `activo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_flujo`
--

CREATE TABLE `cat_flujo` (
  `id_flujo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `flujo` varchar(20) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_flujo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='catalogos de flujos que se ejecutan en la solicitud';

--
-- Table structure for table `cat_grado_estudios`
--

CREATE TABLE `cat_grado_estudios` (
  `id_grado_estudios` tinyint(4) NOT NULL AUTO_INCREMENT,
  `grado_estudio` varchar(30) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_grado_estudios`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_institucion`
--

CREATE TABLE `cat_institucion` (
  `id_institucion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_marca_tarjeta_vexi`
--

CREATE TABLE `cat_marca_tarjeta_vexi` (
  `id_marca` tinyint(4) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de tarjetas disponibles para los prospectos';

--
-- Table structure for table `cat_medio_envio_codigo`
--

CREATE TABLE `cat_medio_envio_codigo` (
  `id_medio` tinyint(4) NOT NULL AUTO_INCREMENT,
  `medio` varchar(30) NOT NULL,
  PRIMARY KEY (`id_medio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_municipio`
--

CREATE TABLE `cat_municipio` (
  `id_municipio` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_entidad` smallint(6) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `fk` (`id_entidad`),
  CONSTRAINT `fk_municipio_entidad_federativa` FOREIGN KEY (`id_entidad`) REFERENCES `cat_entidad_federativa` (`id_entidad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_nivel_estudios`
--

CREATE TABLE `cat_nivel_estudios` (
  `id_nivel_estudios` smallint(6) NOT NULL AUTO_INCREMENT,
  `nivel_estudio` varchar(50) NOT NULL,
  `id_accial` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_nivel_estudios`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_origen_ingresos`
--

CREATE TABLE `cat_origen_ingresos` (
  `id_ingreso` tinyint(4) NOT NULL AUTO_INCREMENT,
  `origen_ingreso` varchar(255) DEFAULT NULL,
  `id_accial` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_ingreso`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de origen de ingresos, de dónde parte la camtura de la pantalla ';

--
-- Table structure for table `cat_pais`
--

CREATE TABLE `cat_pais` (
  `id_pais` smallint(6) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `clave` varchar(5) NOT NULL,
  `clave_bc` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `clave` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_pantallas_solicitud`
--

CREATE TABLE `cat_pantallas_solicitud` (
  `id_pantalla_sol` smallint(6) NOT NULL AUTO_INCREMENT,
  `pantalla_sol` varchar(50) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_pantalla_sol`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='catlogo de pantalla de la solicitud';

--
-- Table structure for table `cat_pildoras`
--

CREATE TABLE `cat_pildoras` (
  `id_pildora` int(11) NOT NULL AUTO_INCREMENT,
  `id_fase` tinyint(4) NOT NULL,
  `pildora` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_institucion` int(11) DEFAULT 1,
  PRIMARY KEY (`id_pildora`),
  KEY `fk_cat_fase_pildora` (`id_fase`),
  KEY `fk_cat_pildoras_institucion` (`id_institucion`),
  CONSTRAINT `fk_cat_fase_pildora` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cat_pildoras_institucion` FOREIGN KEY (`id_institucion`) REFERENCES `cat_institucion` (`id_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_producto_vexi`
--

CREATE TABLE `cat_producto_vexi` (
  `id_producto` tinyint(4) NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de productos vexi';

--
-- Table structure for table `cat_proveedor_curp`
--

CREATE TABLE `cat_proveedor_curp` (
  `id_proveedor` smallint(6) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_sdk_version_incode`
--

CREATE TABLE `cat_sdk_version_incode` (
  `id_version` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id_version`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Catalogo de versiones sdk incode';

--
-- Table structure for table `cat_sistema`
--

CREATE TABLE `cat_sistema` (
  `id_sistema` tinyint(4) NOT NULL AUTO_INCREMENT,
  `sistema` varchar(50) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_sistema`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de sistemas vexi';

--
-- Table structure for table `cat_tipo_asentamiento`
--

CREATE TABLE `cat_tipo_asentamiento` (
  `id_tipo_asentamiento` smallint(6) NOT NULL AUTO_INCREMENT,
  `asentamiento_largo` varchar(100) NOT NULL,
  `asentamiento_corto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_asentamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_tipo_credito`
--

CREATE TABLE `cat_tipo_credito` (
  `id_tipo_credito` tinyint(4) NOT NULL AUTO_INCREMENT,
  `credito` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_tipo_documento`
--

CREATE TABLE `cat_tipo_documento` (
  `id_tipo_documento` tinyint(4) NOT NULL AUTO_INCREMENT,
  `alias` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo tipos de documento que se pude subiar al sistema';

--
-- Table structure for table `cat_tipo_identificacion`
--

CREATE TABLE `cat_tipo_identificacion` (
  `id_tipo_identificacion` tinyint(4) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(50) NOT NULL,
  `nacionales` tinyint(1) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_tipo_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Catálogo de identificaciones oficiales';

--
-- Table structure for table `cat_tipo_proceso_val_gobierno`
--

CREATE TABLE `cat_tipo_proceso_val_gobierno` (
  `id_tipo_proceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_tipo_proceso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_tipo_referencia`
--

CREATE TABLE `cat_tipo_referencia` (
  `id_tipo_referencia` tinyint(4) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_tipo_telefono`
--

CREATE TABLE `cat_tipo_telefono` (
  `id_tipo_telefono` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_telefono`),
  KEY `fk` (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_tipo_vialidad`
--

CREATE TABLE `cat_tipo_vialidad` (
  `id_tipo_vialidad` smallint(6) NOT NULL AUTO_INCREMENT,
  `tipo_vialidad` varchar(50) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tipo_vialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_tipo_workflow`
--

CREATE TABLE `cat_tipo_workflow` (
  `id_tipo_workflow` tinyint(4) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_workflow`),
  KEY `id_tipo_workflow` (`id_tipo_workflow`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_visitor_key`
--

CREATE TABLE `cat_visitor_key` (
  `id_visitor_key` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_visitor_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_workflows_solicitud`
--

CREATE TABLE `cat_workflows_solicitud` (
  `id_cat_workflows_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `max_random_digit` int(11) DEFAULT NULL,
  `min_random_digit` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `extra_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id_cat_workflows_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `cat_zona`
--

CREATE TABLE `cat_zona` (
  `id_zona` tinyint(4) NOT NULL AUTO_INCREMENT,
  `zona` varchar(50) NOT NULL,
  `id_accial` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `catalogo_ingresos`
--

CREATE TABLE `catalogo_ingresos` (
  `id_catalogo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `catalogo` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `catalogo_solicitud_flags`
--

CREATE TABLE `catalogo_solicitud_flags` (
  `id_catalogo_solicitud_flags` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_catalogo_solicitud_flags`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `ctl_fase_estadisticas_prospecto`
--

CREATE TABLE `ctl_fase_estadisticas_prospecto` (
  `id_estadisticas_fase` int(11) NOT NULL AUTO_INCREMENT,
  `id_fase` tinyint(4) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`id_estadisticas_fase`),
  KEY `fk_solicitud_prospecto_estadisticas` (`id_solicitud`),
  KEY `fk` (`id_fase`),
  CONSTRAINT `fk_fase_solicitud_estadisticas` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_prospecto_estadisticas` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15949493 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `ctl_pantalla_redicta`
--

CREATE TABLE `ctl_pantalla_redicta` (
  `id_ctl_pantalla_redicta` int(11) NOT NULL AUTO_INCREMENT,
  `id_pantalla_sol` smallint(6) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `finalizada` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_ctl_pantalla_redicta`),
  KEY `fk_pantalla_redicta_sol` (`id_solicitud`),
  KEY `fk_pantalla_redicta_pantalla_sol` (`id_pantalla_sol`),
  CONSTRAINT `fk_pantalla_redicta_pantalla_sol` FOREIGN KEY (`id_pantalla_sol`) REFERENCES `cat_pantallas_solicitud` (`id_pantalla_sol`),
  CONSTRAINT `fk_pantalla_redicta_sol` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=237311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `ctl_pantalla_solicitud`
--

CREATE TABLE `ctl_pantalla_solicitud` (
  `id_ctl_pantalla` int(11) NOT NULL AUTO_INCREMENT,
  `id_pantalla_sol` smallint(6) DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `finalizada` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_ctl_pantalla`),
  KEY `fk_pantalla_solicitud` (`id_solicitud`),
  KEY `fk` (`id_pantalla_sol`),
  CONSTRAINT `fk_cat_pantalla` FOREIGN KEY (`id_pantalla_sol`) REFERENCES `cat_pantallas_solicitud` (`id_pantalla_sol`),
  CONSTRAINT `fk_pantalla_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35284068 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='tabla control del pantallas por las que la solicitud ha pasado';

--
-- Table structure for table `tbl_afiliados_presolicitud`
--

CREATE TABLE `tbl_afiliados_presolicitud` (
  `id_afiliados_presol` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_api_presolicitud` char(36) DEFAULT NULL,
  `fecha_hora_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_afiliados_presol`),
  KEY `id_solicitud` (`id_solicitud`),
  KEY `id_api_presolicitud` (`id_api_presolicitud`),
  CONSTRAINT `tbl_afiliados_presolicitud_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=48373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_autorizacion_solicitud`
--

CREATE TABLE `tbl_autorizacion_solicitud` (
  `id_autorizacion_sol` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_autorizacion` int(11) NOT NULL,
  `aceptada` tinyint(1) DEFAULT 0,
  `fecha_hora_autorizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_autorizacion_sol`),
  KEY `fk_cat_autorizacion_solicitud` (`id_autorizacion`),
  KEY `fk` (`id_solicitud`,`id_autorizacion`),
  CONSTRAINT `fk_autorizacion_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cat_autorizacion_solicitud` FOREIGN KEY (`id_autorizacion`) REFERENCES `cat_autorizacion` (`id_autorizacion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050963 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_bc_score`
--

CREATE TABLE `tbl_bc_score` (
  `id_bc_score` int(11) NOT NULL AUTO_INCREMENT,
  `bc_score` int(11) DEFAULT NULL,
  `fecha_hora_consulta` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_estatus_consulta` int(11) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`id_bc_score`),
  KEY `fk_bc_score_estatus_consulta` (`id_estatus_consulta`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_bc_score_estatus_consulta` FOREIGN KEY (`id_estatus_consulta`) REFERENCES `cat_estatus_consulta_BC` (`id_estatus_consulta`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_bc_score` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2889407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_cc_score`
--

CREATE TABLE `tbl_cc_score` (
  `id_cc_score` int(11) NOT NULL AUTO_INCREMENT,
  `FICO` int(11) DEFAULT NULL,
  `fecha_hora_consulta` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_estatus_consulta` int(11) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`id_cc_score`),
  KEY `fk_cc_score_estatus_consulta` (`id_estatus_consulta`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_cc_score_estatus_consulta` FOREIGN KEY (`id_estatus_consulta`) REFERENCES `cat_estatus_consulta_CC` (`id_estatus_consulta`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_cc_score` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=307642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_codigo`
--

CREATE TABLE `tbl_codigo` (
  `id_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `id_email` int(11) NOT NULL,
  `fecha_hora_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_hora_expiracion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_codigo`),
  KEY `fk` (`id_email`),
  CONSTRAINT `fk_email_codigo` FOREIGN KEY (`id_email`) REFERENCES `tbl_email` (`id_email`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6950670 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_codigo_celular`
--

CREATE TABLE `tbl_codigo_celular` (
  `id_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` smallint(6) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_vencimiento` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_telefono` int(11) NOT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_codigo`),
  KEY `fk` (`id_telefono`),
  CONSTRAINT `fk_codigo_celular` FOREIGN KEY (`id_telefono`) REFERENCES `tbl_telefono` (`id_telefono`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2958484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_comparacion_rostro`
--

CREATE TABLE `tbl_comparacion_rostro` (
  `id_comparacion_rostro` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento_base` int(11) NOT NULL,
  `id_documento_comparado` int(11) DEFAULT NULL,
  `porcentaje_similitud` varchar(10) DEFAULT NULL,
  `black_list` tinyint(1) DEFAULT 0,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_comparados` int(11) DEFAULT NULL,
  `total_coincidencias` smallint(6) DEFAULT NULL,
  `link_drive_face` varchar(250) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_comparacion_rostro`),
  KEY `fk_tbl_documento_comparado` (`id_documento_comparado`),
  KEY `fk` (`id_documento_base`),
  CONSTRAINT `fk_tbl_documento_base` FOREIGN KEY (`id_documento_base`) REFERENCES `tbl_documento` (`id_documento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_documento_comparado` FOREIGN KEY (`id_documento_comparado`) REFERENCES `tbl_documento` (`id_documento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1390251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gurda el porcentaje de similitud entre imagenes';

--
-- Table structure for table `tbl_concepto`
--

CREATE TABLE `tbl_concepto` (
  `id_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(100) DEFAULT NULL,
  `id_ingreso` tinyint(4) NOT NULL,
  `id_catalogo` tinyint(4) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_concepto`),
  KEY `fk_conceptos_catalogo` (`id_catalogo`),
  KEY `fk` (`id_ingreso`),
  CONSTRAINT `fk_concepto_origen_ingreso` FOREIGN KEY (`id_ingreso`) REFERENCES `cat_origen_ingresos` (`id_ingreso`),
  CONSTRAINT `fk_conceptos_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `catalogo_ingresos` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `tbl_correo_promocion`
--

CREATE TABLE `tbl_correo_promocion` (
  `id_promocion` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat_promocion` int(11) NOT NULL,
  `fecha_hora_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `vigencia` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_promocion`),
  KEY `fk` (`id_cat_promocion`),
  CONSTRAINT `fk_cat_promocion` FOREIGN KEY (`id_cat_promocion`) REFERENCES `cat_correo_promocion` (`id_cat_promocion`)
) ENGINE=InnoDB AUTO_INCREMENT=1224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_cp_blacklist`
--

CREATE TABLE `tbl_cp_blacklist` (
  `id_cp` int(11) NOT NULL AUTO_INCREMENT,
  `cp` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_cp`),
  KEY `idxCurp` (`cp`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_credito_solicitud`
--

CREATE TABLE `tbl_credito_solicitud` (
  `id_credito_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `tienes_tarjeta_credito` tinyint(1) DEFAULT 0,
  `tarjeta_credito` varchar(5) DEFAULT NULL,
  `credito_hipotecario` tinyint(1) DEFAULT 0,
  `credito_automotriz` tinyint(1) DEFAULT 0,
  `ultimo` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `redicta` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_credito_solicitud`),
  KEY `fk_credito_solicitud_sol` (`id_solicitud`),
  CONSTRAINT `fk_credito_solicitud_sol` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=2003182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_curp_proveedor`
--

CREATE TABLE `tbl_curp_proveedor` (
  `id_curp_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `verificado` tinyint(1) DEFAULT 0,
  `curp` varchar(20) DEFAULT NULL,
  `primer_nombre` varchar(20) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(30) DEFAULT NULL,
  `segundo_apellido` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(10) DEFAULT NULL,
  `id_estatus_curp` smallint(6) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` smallint(6) NOT NULL,
  `id_proveedor` smallint(6) NOT NULL,
  PRIMARY KEY (`id_curp_proveedor`),
  KEY `fk_cat_curp_proveedor` (`id_proveedor`),
  KEY `fk_cat_estatus_curp` (`id_estatus_curp`),
  KEY `fk` (`id_prospecto`),
  KEY `idxCurp` (`curp`),
  CONSTRAINT `fk_cat_curp_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `cat_proveedor_curp` (`id_proveedor`),
  CONSTRAINT `fk_cat_estatus_curp` FOREIGN KEY (`id_estatus_curp`) REFERENCES `cat_estatus_curp` (`id_estatus_curp`),
  CONSTRAINT `fk_curp_proveedor_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`)
) ENGINE=InnoDB AUTO_INCREMENT=2905601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_device`
--

CREATE TABLE `tbl_device` (
  `id_device` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `browser_version` varchar(50) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `public_ip_address` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`id_device`),
  KEY `fk` (`id_solicitud`),
  KEY `idxDireccionIP` (`public_ip_address`),
  CONSTRAINT `fk_dispositivo_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=3960806 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla que guarda la info del dispositivo del cual fue hecha la solicitud ';

--
-- Table structure for table `tbl_direccion`
--

CREATE TABLE `tbl_direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `id_asentamiento` int(11) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `num_int` varchar(15) DEFAULT NULL,
  `num_ext` varchar(15) DEFAULT NULL,
  `lote` varchar(10) DEFAULT NULL,
  `mz` varchar(10) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `id_tipo_vialidad` smallint(6) DEFAULT NULL,
  `colonia_otra` varchar(100) DEFAULT NULL,
  `id_cp` int(11) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_solicitud` (`id_solicitud`),
  KEY `fk_direccion_tipo_vialidad` (`id_tipo_vialidad`),
  KEY `fk_direccion_codigo_postal` (`id_cp`),
  KEY `idxPRospecto` (`id_prospecto`),
  KEY `idCalle` (`calle`),
  KEY `idx_num_ext` (`num_ext`),
  CONSTRAINT `fk_direccion_codigo_postal` FOREIGN KEY (`id_cp`) REFERENCES `cat_cp` (`id_cp`) ON UPDATE CASCADE,
  CONSTRAINT `fk_direccion_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_direccion_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_direccion_tipo_vialidad` FOREIGN KEY (`id_tipo_vialidad`) REFERENCES `cat_tipo_vialidad` (`id_tipo_vialidad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3550200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='direccion del prospecto';

--
-- Table structure for table `tbl_documento`
--

CREATE TABLE `tbl_documento` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` tinyint(4) NOT NULL,
  `id_prospecto` int(11) DEFAULT NULL,
  `id_drive` varchar(450) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  `actualizo` tinyint(4) DEFAULT NULL,
  `decifrado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_documento`),
  KEY `fk_solicitud_documento` (`id_solicitud`),
  KEY `fk_documento_prospecto` (`id_prospecto`),
  KEY `fk_tipo_documento` (`id_tipo_documento`),
  KEY `fk_actualizo_sistema` (`actualizo`),
  CONSTRAINT `fk_actualizo_sistema` FOREIGN KEY (`actualizo`) REFERENCES `cat_sistema` (`id_sistema`),
  CONSTRAINT `fk_documento_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`),
  CONSTRAINT `fk_solicitud_documento` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `cat_tipo_documento` (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=2834767 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `tbl_dominios_temp_blacklist`
--

CREATE TABLE `tbl_dominios_temp_blacklist` (
  `id_dominio` int(11) NOT NULL AUTO_INCREMENT,
  `dominio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dominio`),
  UNIQUE KEY `dominio` (`dominio`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_email`
--

CREATE TABLE `tbl_email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `fbid` varchar(20) DEFAULT NULL,
  `consecutivo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_email`),
  UNIQUE KEY `idx_email` (`email`) USING BTREE,
  KEY `idx` (`fbid`),
  KEY `idx1` (`consecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=3523483 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_email_blacklist`
--

CREATE TABLE `tbl_email_blacklist` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`id_email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_email_remarketing_hist`
--

CREATE TABLE `tbl_email_remarketing_hist` (
  `id_email_remarketing` int(11) NOT NULL AUTO_INCREMENT,
  `id_email_remarketing_cat` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `fecha_hora_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_email_remarketing`),
  KEY `fk_email_remarketing_hist_email_remarketing_cat` (`id_email_remarketing_cat`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_email_remarketing_hist_email_remarketing_cat` FOREIGN KEY (`id_email_remarketing_cat`) REFERENCES `cat_email_remarketing` (`id_email_remarketing_cat`) ON UPDATE CASCADE,
  CONSTRAINT `fk_email_remarketing_hist_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197618 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_emailage`
--

CREATE TABLE `tbl_emailage` (
  `id_emailage` int(11) NOT NULL AUTO_INCREMENT,
  `id_email` int(11) NOT NULL,
  `eariskband` varchar(70) DEFAULT NULL,
  `eascore` smallint(6) DEFAULT NULL,
  `eariskbandid` tinyint(4) DEFAULT NULL,
  `eaadvice` varchar(70) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT current_timestamp(),
  `ultimo` tinyint(1) DEFAULT 1,
  `redicta` tinyint(1) DEFAULT 0,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_emailage`),
  KEY `fk` (`id_email`),
  CONSTRAINT `fk_emailage_email` FOREIGN KEY (`id_email`) REFERENCES `tbl_email` (`id_email`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=889979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='servicio externo emailage';

--
-- Table structure for table `tbl_estadisticas_solicitud`
--

CREATE TABLE `tbl_estadisticas_solicitud` (
  `id_estadistica` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `nombre_campo` varchar(30) NOT NULL,
  `backspace` smallint(6) DEFAULT NULL,
  `focus` smallint(6) DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id_estadistica`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_estadisticas_solicitud_prospecto` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45426907 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_estatus_fase_solicitud_hist`
--

CREATE TABLE `tbl_estatus_fase_solicitud_hist` (
  `id_fase_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_fase` tinyint(4) NOT NULL,
  `fecha_hora_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) DEFAULT 1,
  `id_workflow_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fase_solicitud`),
  KEY `fk_cat_estatus_fase_solicitud` (`id_fase`),
  KEY `fk` (`id_solicitud`),
  KEY `fk_version_workflow` (`id_workflow_version`),
  CONSTRAINT `fk_cat_estatus_fase_solicitud` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estatus_fase_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_version_workflow` FOREIGN KEY (`id_workflow_version`) REFERENCES `tbl_workflow_version` (`id_workflow_version`)
) ENGINE=InnoDB AUTO_INCREMENT=49452474 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_estatus_solicitud_hist`
--

CREATE TABLE `tbl_estatus_solicitud_hist` (
  `id_estatus_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_estatus` tinyint(4) NOT NULL,
  `fecha_hora_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_estatus_solicitud`),
  KEY `fk_motivo_estatus_solicitud` (`id_estatus`),
  KEY `fk` (`id_solicitud`),
  KEY `idx_ultimo` (`ultimo`),
  KEY `idx_tesh_solicitud_ultimo_estatus` (`id_solicitud`,`ultimo`,`id_estatus`),
  CONSTRAINT `fk_cambio_estatus_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_motivo_estatus_solicitud` FOREIGN KEY (`id_estatus`) REFERENCES `cat_estatus_solicitud` (`id_estatus`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7879933 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_eventos_webhook`
--

CREATE TABLE `tbl_eventos_webhook` (
  `id_webhook` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `fecha_hora_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_fase` tinyint(4) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL,
  `id_fase_evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_webhook`),
  KEY `fk_id_fase_solicitud` (`id_fase`),
  KEY `fk` (`id_solicitud`),
  KEY `fk_id_fase_eventos_wh` (`id_fase_evento`),
  KEY `idx_tew_fase_fecha_solicitud` (`id_fase`,`fecha_hora_envio`,`id_solicitud`),
  CONSTRAINT `fk_id_fase_eventos_wh` FOREIGN KEY (`id_fase_evento`) REFERENCES `cat_fase_evento` (`id_fase_evento`),
  CONSTRAINT `fk_id_fase_solicitud` FOREIGN KEY (`id_fase`) REFERENCES `cat_fase_solicitud` (`id_fase`),
  CONSTRAINT `fk_id_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=7693077 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `tbl_facebook`
--

CREATE TABLE `tbl_facebook` (
  `id_facebook` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `fb_id` bigint(20) DEFAULT NULL,
  `fb_email` varchar(150) DEFAULT NULL,
  `fb_name` varchar(150) DEFAULT NULL,
  `fb_nombre` varchar(150) DEFAULT NULL,
  `fb_apellido` varchar(150) DEFAULT NULL,
  `id_fb` varchar(20) DEFAULT NULL,
  `url_fb` varchar(400) DEFAULT NULL,
  `estatus_conexion` varchar(10) DEFAULT NULL,
  `facebook_url` varchar(400) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) DEFAULT 1,
  `redicta` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_facebook`),
  KEY `fk_solicitud_facebook` (`id_solicitud`),
  KEY `idxFb` (`fb_id`),
  KEY `idxFbUrl` (`facebook_url`),
  KEY `idxProspecto` (`id_prospecto`),
  CONSTRAINT `fk_facebook_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`),
  CONSTRAINT `fk_solicitud_facebook` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=456175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guarda los datos enviados por el API de Facebook';

--
-- Table structure for table `tbl_fb_url_blacklist`
--

CREATE TABLE `tbl_fb_url_blacklist` (
  `id_fb_url` smallint(6) NOT NULL AUTO_INCREMENT,
  `fb_url` varchar(400) NOT NULL,
  `fb_name` varchar(250) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_fb_url`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='lista de urlfb fraudulentas';

--
-- Table structure for table `tbl_geolocalizacion`
--

CREATE TABLE `tbl_geolocalizacion` (
  `id_geolocalizacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_solicitud` int(11) NOT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `accuracy` decimal(10,2) DEFAULT NULL,
  `distancia_calculada` decimal(10,2) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_geolocalizacion`),
  KEY `idx_id_solicitud` (`id_solicitud`),
  CONSTRAINT `fk_geolocalizacion_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=11445 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_grado_estudios_prospecto`
--

CREATE TABLE `tbl_grado_estudios_prospecto` (
  `id_grado_estudios_prospecto` int(11) NOT NULL AUTO_INCREMENT,
  `id_grado_estudios` tinyint(4) NOT NULL,
  `id_prospecto` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) NOT NULL DEFAULT 1,
  `redicta` tinyint(1) NOT NULL DEFAULT 0,
  `activo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_grado_estudios_prospecto`),
  KEY `fk_grado_estudio_prospecto_prosp` (`id_prospecto`),
  KEY `fk_grado_estudio_prospecto_cat` (`id_grado_estudios`),
  CONSTRAINT `fk_grado_estudio_prospecto_cat` FOREIGN KEY (`id_grado_estudios`) REFERENCES `cat_grado_estudios` (`id_grado_estudios`),
  CONSTRAINT `fk_grado_estudio_prospecto_prosp` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1688682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_incode_flow`
--

CREATE TABLE `tbl_incode_flow` (
  `id_incode_flow` int(11) NOT NULL AUTO_INCREMENT,
  `ultimo` tinyint(1) DEFAULT 1,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_champion` int(11) NOT NULL,
  `id_challenger` int(11) NOT NULL,
  PRIMARY KEY (`id_incode_flow`),
  KEY `fk_incode_sdk_challenger` (`id_challenger`),
  KEY `fk` (`id_champion`,`id_challenger`),
  CONSTRAINT `fk_incode_sdk_challenger` FOREIGN KEY (`id_challenger`) REFERENCES `cat_sdk_version_incode` (`id_version`) ON UPDATE CASCADE,
  CONSTRAINT `fk_incode_sdk_champion` FOREIGN KEY (`id_champion`) REFERENCES `cat_sdk_version_incode` (`id_version`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Relacion entre sdk incode challenger y champion';

--
-- Table structure for table `tbl_log_experiments`
--

CREATE TABLE `tbl_log_experiments` (
  `id_log_experiment` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `id_experiment` int(11) DEFAULT NULL,
  `segment` varchar(10) DEFAULT NULL,
  `sub_segment` varchar(10) DEFAULT NULL,
  `created_at` varchar(20) DEFAULT NULL,
  `modified_at` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_log_experiment`),
  KEY `fk_tbl_experiments_request` (`application_id`),
  KEY `fk_cat_experiment` (`id_experiment`),
  CONSTRAINT `fk_cat_experiment` FOREIGN KEY (`id_experiment`) REFERENCES `cat_experiments` (`id_experiment`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_experiments_request` FOREIGN KEY (`application_id`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_log_validacion_gobierno`
--

CREATE TABLE `tbl_log_validacion_gobierno` (
  `id_log_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_estatus` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(4) NOT NULL,
  `tipo_proceso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log_solicitud`),
  KEY `id_estatus_fk` (`id_estatus`),
  KEY `id_solicitud_fk` (`id_solicitud`),
  KEY `id_tipo_proceso` (`tipo_proceso`),
  CONSTRAINT `id_estatus_fk` FOREIGN KEY (`id_estatus`) REFERENCES `cat_estatus_val_gobierno` (`id_estatus`),
  CONSTRAINT `id_solicitud_fk` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`),
  CONSTRAINT `id_tipo_proceso` FOREIGN KEY (`tipo_proceso`) REFERENCES `cat_tipo_proceso_val_gobierno` (`id_tipo_proceso`)
) ENGINE=InnoDB AUTO_INCREMENT=29480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_email` int(11) NOT NULL,
  `id_codigo` int(11) NOT NULL,
  `fecha_acceso` datetime DEFAULT current_timestamp(),
  `veces_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_login_codigo` (`id_codigo`),
  KEY `fk` (`id_email`,`id_codigo`),
  CONSTRAINT `fk_login_codigo` FOREIGN KEY (`id_codigo`) REFERENCES `tbl_codigo` (`id_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_login_email` FOREIGN KEY (`id_email`) REFERENCES `tbl_email` (`id_email`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3055410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_medio_envio_codigo_celular`
--

CREATE TABLE `tbl_medio_envio_codigo_celular` (
  `id_envio_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id_codigo` int(11) DEFAULT NULL,
  `id_medio` tinyint(4) NOT NULL,
  `fecha_envio` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_envio_codigo`),
  KEY `fk_envio_codigo_celular` (`id_codigo`),
  KEY `fk` (`id_medio`),
  CONSTRAINT `fk_envio_codigo_celular` FOREIGN KEY (`id_codigo`) REFERENCES `tbl_codigo_celular` (`id_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_medio_envio_codigo` FOREIGN KEY (`id_medio`) REFERENCES `cat_medio_envio_codigo` (`id_medio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2599841 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_monto_ingreso`
--

CREATE TABLE `tbl_monto_ingreso` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `ingreso` double DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_ingreso`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_monto_ingresos_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3241124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='historial monto de ingresos del prospecto por solicitud';

--
-- Table structure for table `tbl_nivel_estudios_prospecto`
--

CREATE TABLE `tbl_nivel_estudios_prospecto` (
  `id_nivel_estudios_prospecto` int(11) NOT NULL AUTO_INCREMENT,
  `id_nivel_estudios` smallint(6) NOT NULL,
  `id_prospecto` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) NOT NULL DEFAULT 1,
  `redicta` tinyint(1) NOT NULL DEFAULT 0,
  `activo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_nivel_estudios_prospecto`),
  KEY `fk_nivel_estudio_prospecto_prosp` (`id_prospecto`),
  KEY `fk_nivel_estudio_prospecto_cat` (`id_nivel_estudios`),
  CONSTRAINT `fk_nivel_estudio_prospecto_cat` FOREIGN KEY (`id_nivel_estudios`) REFERENCES `cat_nivel_estudios` (`id_nivel_estudios`),
  CONSTRAINT `fk_nivel_estudio_prospecto_prosp` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`)
) ENGINE=InnoDB AUTO_INCREMENT=3360389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_origen_ingreso_solicitud`
--

CREATE TABLE `tbl_origen_ingreso_solicitud` (
  `id_origen_ingreso_prospecto` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `id_valor` tinyint(4) DEFAULT NULL,
  `valor` varchar(150) DEFAULT NULL,
  `nombre_empresa` varchar(200) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `redicta` tinyint(1) DEFAULT 0,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_origen_ingreso_prospecto`),
  KEY `fk_concepto_origen_ingreso_solicitud` (`id_concepto`),
  KEY `fk_valor_origen_ingreso_prospecto` (`id_valor`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_concepto_origen_ingreso_solicitud` FOREIGN KEY (`id_concepto`) REFERENCES `tbl_concepto` (`id_concepto`),
  CONSTRAINT `fk_origen_ingresos_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`),
  CONSTRAINT `fk_valor_origen_ingreso_prospecto` FOREIGN KEY (`id_valor`) REFERENCES `cat_de_catalogos` (`id_valor`)
) ENGINE=InnoDB AUTO_INCREMENT=3393480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `tbl_parametros_canales`
--

CREATE TABLE `tbl_parametros_canales` (
  `id_parametro_canal` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `query_params` longtext DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_parametro_canal`),
  KEY `tbl_parametros_canales_tbl_solicitud_FK` (`id_solicitud`),
  CONSTRAINT `tbl_parametros_canales_tbl_solicitud_FK` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=1474734 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_prospecto`
--

CREATE TABLE `tbl_prospecto` (
  `id_prospecto` int(11) NOT NULL AUTO_INCREMENT,
  `id_email` int(11) NOT NULL,
  `CURP` varchar(20) DEFAULT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `homoclave` varchar(5) DEFAULT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `ap_paterno` varchar(50) DEFAULT NULL,
  `ap_materno` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `genero` enum('H','M') DEFAULT NULL,
  `id_nacionalidad` smallint(6) DEFAULT NULL,
  `id_pais_nacimiento` smallint(6) DEFAULT NULL,
  `id_entidad_nac` smallint(6) DEFAULT NULL,
  `id_estado_civil` int(11) DEFAULT NULL,
  `curp_validada_proveedor` tinyint(1) DEFAULT 0,
  `curp_baja_defun` tinyint(1) DEFAULT 0,
  `intentos_curp` tinyint(4) DEFAULT 0,
  `estudia_actualmente` tinyint(1) DEFAULT NULL,
  `id_tipo_identificacion` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_prospecto`),
  KEY `fk_pais_nacimiento` (`id_pais_nacimiento`),
  KEY `fk_nacionalidad` (`id_nacionalidad`),
  KEY `fk_entidad_nacimiento` (`id_entidad_nac`),
  KEY `fk_tipo_identificacion_prospecto` (`id_tipo_identificacion`),
  KEY `fk` (`id_email`),
  KEY `idxCurp` (`CURP`),
  KEY `idxNombre` (`primer_nombre`),
  KEY `idxApPaterno` (`ap_paterno`),
  CONSTRAINT `fk_email_prospecto` FOREIGN KEY (`id_email`) REFERENCES `tbl_email` (`id_email`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entidad_nacimiento` FOREIGN KEY (`id_entidad_nac`) REFERENCES `cat_entidad_federativa` (`id_entidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_nacionalidad` FOREIGN KEY (`id_nacionalidad`) REFERENCES `cat_pais` (`id_pais`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pais_nacimiento` FOREIGN KEY (`id_pais_nacimiento`) REFERENCES `cat_pais` (`id_pais`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_identificacion_prospecto` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `cat_tipo_identificacion` (`id_tipo_identificacion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3522728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_prospecto_credito`
--

CREATE TABLE `tbl_prospecto_credito` (
  `id_credito` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_credito` tinyint(4) NOT NULL,
  `id_prospecto` int(11) NOT NULL,
  PRIMARY KEY (`id_credito`),
  KEY `fk_credito_prospecto` (`id_prospecto`),
  KEY `fk` (`id_tipo_credito`,`id_prospecto`),
  CONSTRAINT `fk_credito_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_prospecto_telefono`
--

CREATE TABLE `tbl_prospecto_telefono` (
  `id_prospecto_tel` int(11) NOT NULL AUTO_INCREMENT,
  `id_telefono` int(11) NOT NULL,
  `id_prospecto` int(11) NOT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `id_solicitud` int(11) NOT NULL,
  `redicta` tinyint(1) DEFAULT 0,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_prospecto_tel`),
  KEY `fk_solicitud_prospecto_telefono` (`id_solicitud`),
  KEY `fk_telefono_prospecto` (`id_prospecto`),
  KEY `idx` (`id_telefono`),
  KEY `idx_ultimo` (`ultimo`),
  CONSTRAINT `fk_info_telefono` FOREIGN KEY (`id_telefono`) REFERENCES `tbl_telefono` (`id_telefono`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_prospecto_telefono` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_telefono_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4400716 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_random_digit`
--

CREATE TABLE `tbl_random_digit` (
  `id_random_digit` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `sdk_incode` int(11) DEFAULT NULL,
  `random1` int(11) DEFAULT NULL,
  `random2` int(11) DEFAULT NULL,
  `random3` int(11) DEFAULT NULL,
  `random4` int(11) DEFAULT NULL,
  `random5` int(11) DEFAULT NULL,
  `random6` int(11) DEFAULT NULL,
  `random7` int(11) DEFAULT NULL,
  `random8` int(11) DEFAULT NULL,
  `random9` int(11) DEFAULT NULL,
  `random10` int(11) DEFAULT NULL,
  `random11` int(11) DEFAULT NULL,
  `random12` int(11) DEFAULT NULL,
  `random13` int(11) DEFAULT NULL,
  `random14` int(11) DEFAULT NULL,
  `random15` int(11) DEFAULT NULL,
  `random16` int(11) DEFAULT NULL,
  `random17` int(11) DEFAULT NULL,
  `random18` int(11) DEFAULT NULL,
  `random19` int(11) DEFAULT NULL,
  `random20` int(11) DEFAULT NULL,
  `random_digit_afiliados` int(11) DEFAULT NULL,
  `email_login` smallint(6) DEFAULT NULL,
  `chatbot` smallint(6) DEFAULT NULL,
  `wf_flujos_solicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_random_digit`),
  KEY `fk` (`id_solicitud`),
  CONSTRAINT `fk_random_digit_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4271972 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Numeros random generados para la solicitud';

--
-- Table structure for table `tbl_rechazados`
--

CREATE TABLE `tbl_rechazados` (
  `id_rechazado` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_email` int(11) DEFAULT NULL,
  `id_rechazo` int(11) DEFAULT NULL,
  `id_estatus` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `codRef` varchar(255) DEFAULT NULL,
  `ultimo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rechazado`),
  KEY `idxmail` (`id_email`)
) ENGINE=InnoDB AUTO_INCREMENT=1442472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_redicta`
--

CREATE TABLE `tbl_redicta` (
  `id_redicta` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `fecha_hora_incio` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_hora_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_flujo` tinyint(4) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_redicta`),
  KEY `fk_flujo_redicta` (`id_flujo`),
  KEY `fk` (`id_solicitud`,`id_flujo`),
  CONSTRAINT `fk_flujo_redicta` FOREIGN KEY (`id_flujo`) REFERENCES `cat_flujo` (`id_flujo`),
  CONSTRAINT `fk_solicitud_redicta` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='flujo redictaminacion';

--
-- Table structure for table `tbl_redicta_sdk_incode`
--

CREATE TABLE `tbl_redicta_sdk_incode` (
  `id_redicta_sdk` int(11) NOT NULL AUTO_INCREMENT,
  `id_redicta` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_version` int(11) NOT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_redicta_sdk`),
  KEY `fk_redicta_incode_sdk_version` (`id_version`),
  KEY `fk_redicta_sdk_version` (`id_redicta`),
  CONSTRAINT `fk_redicta_incode_sdk_version` FOREIGN KEY (`id_version`) REFERENCES `cat_sdk_version_incode` (`id_version`) ON UPDATE CASCADE,
  CONSTRAINT `fk_redicta_sdk_version` FOREIGN KEY (`id_redicta`) REFERENCES `tbl_redicta` (`id_redicta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33558 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que guarda la relacion entre redictaminacion y la version de sdk de incode que se ejecuta, sdk champion';

--
-- Table structure for table `tbl_referencia_prospecto`
--

CREATE TABLE `tbl_referencia_prospecto` (
  `id_referencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `id_telefono` int(11) NOT NULL,
  `id_tipo_referencia` tinyint(4) NOT NULL,
  `contacto` tinyint(4) NOT NULL,
  `ultimo` tinyint(1) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `redicta` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_referencia`),
  KEY `fk_solicitud_referencia` (`id_solicitud`),
  KEY `fk_tipo_referencia_prospecto` (`id_tipo_referencia`),
  KEY `fk_id_telefono` (`id_telefono`),
  KEY `idx` (`id_prospecto`),
  KEY `idx_ultimo` (`ultimo`),
  CONSTRAINT `fk_id_telefono` FOREIGN KEY (`id_telefono`) REFERENCES `tbl_telefono` (`id_telefono`) ON UPDATE CASCADE,
  CONSTRAINT `fk_referencia_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_referencia` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_referencia_prospecto` FOREIGN KEY (`id_tipo_referencia`) REFERENCES `cat_tipo_referencia` (`id_tipo_referencia`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3971266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_referidos_blacklist`
--

CREATE TABLE `tbl_referidos_blacklist` (
  `id_referido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cod_ref` int(11) NOT NULL,
  PRIMARY KEY (`id_referido`),
  KEY `idxCodRef` (`id_cod_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud`
--

CREATE TABLE `tbl_solicitud` (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_prospecto` int(11) NOT NULL,
  `id_cod_ref` int(11) NOT NULL,
  `pubid` varchar(145) DEFAULT NULL,
  `solicitud_larga` tinyint(1) DEFAULT 1,
  `visitor` varchar(1000) DEFAULT NULL,
  `random_digit` int(11) DEFAULT NULL,
  `vip_cod_ref` tinyint(1) DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `cuenta_recuperada` tinyint(1) DEFAULT NULL,
  `id_producto_anterior` tinyint(4) DEFAULT NULL,
  `loc_anterior` int(11) DEFAULT NULL,
  `cancelacion_mayor_mes` tinyint(1) DEFAULT 0,
  `cod_ref` tinyint(1) DEFAULT 0,
  `id_marca_por_asignar` tinyint(4) DEFAULT NULL,
  `marca_elegida` tinyint(4) DEFAULT NULL,
  `id_producto_por_asignar` tinyint(4) DEFAULT NULL,
  `Loc_por_asignar` int(11) DEFAULT NULL,
  `codigo_promocion` int(6) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `id_afiliado` smallint(6) DEFAULT NULL,
  `fecha_termino` timestamp NULL DEFAULT NULL,
  `comparador` tinyint(1) DEFAULT 0,
  `id_promocion` int(11) DEFAULT NULL,
  `SAC` tinyint(1) DEFAULT 0,
  `consecutivo` tinyint(4) DEFAULT NULL,
  `id_bc_score_anterior` int(11) DEFAULT NULL,
  `id_flujo` tinyint(4) DEFAULT NULL,
  `falta_documentacion` tinyint(1) NOT NULL DEFAULT 0,
  `documentos_faltantes` tinyint(1) DEFAULT 0,
  `prospecto_recuperado` tinyint(1) DEFAULT 0,
  `redicta` tinyint(1) DEFAULT 0,
  `id_loc_personalizada` int(11) DEFAULT NULL,
  `id_institucion` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_solicitud`),
  KEY `fk_solicitud_producto_vexi` (`id_producto_por_asignar`),
  KEY `fk_solicitud_marca_tarjeta_vexi` (`id_marca_por_asignar`),
  KEY `fk_solicitud_promocion` (`id_promocion`),
  KEY `idconsecutivo` (`consecutivo`),
  KEY `idxPRospecto` (`id_prospecto`),
  KEY `idxCodRef` (`id_cod_ref`),
  KEY `fk_bc_score_anterior` (`id_bc_score_anterior`),
  KEY `fk_flujo_solicitud` (`id_flujo`),
  KEY `fk_insitucion_soliciutd` (`id_institucion`),
  CONSTRAINT `fk_bc_score_anterior` FOREIGN KEY (`id_bc_score_anterior`) REFERENCES `tbl_bc_score` (`id_bc_score`),
  CONSTRAINT `fk_flujo_solicitud` FOREIGN KEY (`id_flujo`) REFERENCES `cat_flujo` (`id_flujo`),
  CONSTRAINT `fk_insitucion_soliciutd` FOREIGN KEY (`id_institucion`) REFERENCES `cat_institucion` (`id_institucion`),
  CONSTRAINT `fk_solicitud_marca_tarjeta_vexi` FOREIGN KEY (`id_marca_por_asignar`) REFERENCES `cat_marca_tarjeta_vexi` (`id_marca`),
  CONSTRAINT `fk_solicitud_producto_vexi` FOREIGN KEY (`id_producto_por_asignar`) REFERENCES `cat_producto_vexi` (`id_producto`),
  CONSTRAINT `fk_solicitud_promocion` FOREIGN KEY (`id_promocion`) REFERENCES `tbl_correo_promocion` (`id_promocion`),
  CONSTRAINT `fk_solicitud_prospecto` FOREIGN KEY (`id_prospecto`) REFERENCES `tbl_prospecto` (`id_prospecto`)
) ENGINE=InnoDB AUTO_INCREMENT=4275255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud_branding`
--

CREATE TABLE `tbl_solicitud_branding` (
  `id_branding` int(11) NOT NULL AUTO_INCREMENT,
  `id_institucion` int(11) NOT NULL,
  `settings` longtext NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_baja` timestamp NULL DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_branding`),
  KEY `id_institucion_branding_fk` (`id_institucion`),
  CONSTRAINT `id_institucion_branding_fk` FOREIGN KEY (`id_institucion`) REFERENCES `cat_institucion` (`id_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud_fbid`
--

CREATE TABLE `tbl_solicitud_fbid` (
  `id_solicitud_fbid` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `fbid` varchar(20) NOT NULL,
  `nueva_sol` tinyint(1) DEFAULT 1,
  `consecutivo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud_fbid`),
  UNIQUE KEY `uidx_solicitud` (`id_solicitud`),
  KEY `idxFbid` (`fbid`),
  CONSTRAINT `fk_solicitud_fbid` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4242598 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guarda la relacion entre id_solicitud y fbid del sistema vexi';

--
-- Table structure for table `tbl_solicitud_fecha`
--

CREATE TABLE `tbl_solicitud_fecha` (
  `fbid` varchar(20) NOT NULL,
  `consecutivo` tinyint(4) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_termino` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud_flag_fraude`
--

CREATE TABLE `tbl_solicitud_flag_fraude` (
  `id_flag_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `fecha_hora_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_flag` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_flag_solicitud`),
  KEY `fk_cat_flag_fraude` (`id_flag`),
  KEY `fk` (`id_solicitud`,`id_flag`),
  CONSTRAINT `fk_cat_flag_fraude` FOREIGN KEY (`id_flag`) REFERENCES `cat_flag_fraude` (`id_flag`) ON UPDATE CASCADE,
  CONSTRAINT `fk_flag_fraude_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud_flags`
--

CREATE TABLE `tbl_solicitud_flags` (
  `id_flags_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_catalogo_solicitud_flags` int(11) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_flags_solicitud`),
  UNIQUE KEY `unique_flags_solicitud` (`id_solicitud`,`id_catalogo_solicitud_flags`),
  KEY `id_catalogo_solicitud_flags` (`id_catalogo_solicitud_flags`),
  CONSTRAINT `tbl_solicitud_flags_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`),
  CONSTRAINT `tbl_solicitud_flags_ibfk_2` FOREIGN KEY (`id_catalogo_solicitud_flags`) REFERENCES `catalogo_solicitud_flags` (`id_catalogo_solicitud_flags`)
) ENGINE=InnoDB AUTO_INCREMENT=2062488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud_pildora`
--

CREATE TABLE `tbl_solicitud_pildora` (
  `id_solicitud_pildora` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `id_pildora` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultimo` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_solicitud_pildora`),
  KEY `fk_solicitud_pildora_sol` (`id_solicitud`),
  KEY `fk_solicitud_pildora_pil` (`id_pildora`),
  CONSTRAINT `fk_solicitud_pildora_pil` FOREIGN KEY (`id_pildora`) REFERENCES `cat_pildoras` (`id_pildora`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_pildora_sol` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=639843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_solicitud_prospecto`
--

CREATE TABLE `tbl_solicitud_prospecto` (
  `id_solicitud_prospecto` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(100) DEFAULT NULL,
  `ap_paterno` varchar(50) DEFAULT NULL,
  `ap_materno` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `genero` enum('H','M') DEFAULT NULL,
  `CURP` varchar(20) DEFAULT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `homoclave` varchar(5) DEFAULT NULL,
  `ingresos` double DEFAULT NULL,
  `a_que_te_dedicas` varchar(250) DEFAULT NULL,
  `fbid` varchar(20) DEFAULT NULL,
  `fburl` varchar(400) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `marca_por_asignar` tinyint(1) DEFAULT NULL,
  `prod_por_asingar` tinyint(1) DEFAULT NULL,
  `Loc_por_asignar` int(11) DEFAULT NULL,
  `emailage` smallint(6) DEFAULT NULL,
  `bc_score` int(11) DEFAULT NULL,
  `fico` int(11) DEFAULT NULL,
  `estatus` varchar(60) DEFAULT NULL,
  `fecha_hora_actualizacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `pais_origen` varchar(150) DEFAULT NULL,
  `nacionalidad` varchar(150) DEFAULT NULL,
  `entidad_nacimiento` varchar(150) DEFAULT NULL,
  `domicilio_completo` varchar(500) DEFAULT NULL,
  `origen_ingresos` varchar(150) DEFAULT NULL,
  `url_ine_frontal_pasaporte` varchar(500) DEFAULT NULL,
  `url_ine_reverso_fm` varchar(500) DEFAULT NULL,
  `referencia_1` varchar(500) DEFAULT NULL,
  `referencia_2` varchar(500) DEFAULT NULL,
  `redicta` tinyint(1) DEFAULT 0,
  `ultimo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_solicitud_prospecto`),
  KEY `fk` (`id_solicitud`),
  KEY `idxEmail` (`email`),
  KEY `idxEstatus` (`estatus`),
  KEY `idxCURP` (`CURP`),
  CONSTRAINT `fk_solicitud_prospecto_versionado` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3261386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='copia de solicitud';

--
-- Table structure for table `tbl_solicitud_sdk_incode`
--

CREATE TABLE `tbl_solicitud_sdk_incode` (
  `id_solicitud_sdk` int(11) NOT NULL AUTO_INCREMENT,
  `id_version` int(11) NOT NULL,
  `ultimo` tinyint(1) DEFAULT 1,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitud_sdk`),
  KEY `fk_incode_sdk_version` (`id_version`),
  KEY `fk` (`id_solicitud`,`id_version`),
  CONSTRAINT `fk_incode_sdk_version` FOREIGN KEY (`id_version`) REFERENCES `cat_sdk_version_incode` (`id_version`) ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_sdk_version` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1912916 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla que guarda la relacion entre solicitud y la version de sdk de incode que se ejecuta para dicha solicitud';

--
-- Table structure for table `tbl_telefono`
--

CREATE TABLE `tbl_telefono` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `lada` varchar(5) DEFAULT NULL,
  `id_tipo_telefono` tinyint(4) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `validado` tinyint(1) DEFAULT 0,
  `validado_redicta` tinyint(1) DEFAULT 0,
  `redicta` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_telefono`),
  KEY `fk` (`id_tipo_telefono`),
  KEY `idxTelefono` (`numero`),
  CONSTRAINT `fk_tipo_telefono` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `cat_tipo_telefono` (`id_tipo_telefono`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8261798 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_telefono_diri`
--

CREATE TABLE `tbl_telefono_diri` (
  `id_telefono_diri` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(50) DEFAULT NULL,
  `id_solicitud` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_telefono` int(11) NOT NULL,
  `ultimo` tinyint(1) NOT NULL,
  `message` varchar(50) NOT NULL,
  PRIMARY KEY (`id_telefono_diri`),
  KEY `fk_tbl_telefono_diri_solicitud` (`id_solicitud`),
  KEY `fk_tbl_telefono_diri_telefono` (`id_telefono`),
  CONSTRAINT `fk_tbl_telefono_diri_solicitud` FOREIGN KEY (`id_solicitud`) REFERENCES `tbl_solicitud` (`id_solicitud`),
  CONSTRAINT `fk_tbl_telefono_diri_telefono` FOREIGN KEY (`id_telefono`) REFERENCES `tbl_telefono` (`id_telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_workflow`
--

CREATE TABLE `tbl_workflow` (
  `id_workflow` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(100) DEFAULT NULL,
  `id_tipo_workflow` tinyint(4) NOT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `data` longtext /*M!100301 COMPRESSED*/ CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '1.0.0',
  `ultimo` tinyint(4) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_workflow_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_workflow`),
  KEY `fk` (`id_tipo_workflow`),
  KEY `idx_correo` (`correo`),
  KEY `idx_solicitud` (`id_solicitud`),
  KEY `fk_workflow_workflow_version` (`id_workflow_version`),
  CONSTRAINT `fk_tipo_workflow1` FOREIGN KEY (`id_tipo_workflow`) REFERENCES `cat_tipo_workflow` (`id_tipo_workflow`) ON UPDATE CASCADE,
  CONSTRAINT `fk_workflow_workflow_version` FOREIGN KEY (`id_workflow_version`) REFERENCES `tbl_workflow_version` (`id_workflow_version`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9758663 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `tbl_workflow_version`
--

CREATE TABLE `tbl_workflow_version` (
  `id_workflow_version` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_workflow` tinyint(4) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `version` varchar(10) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `detalle` varchar(50) DEFAULT NULL,
  `ultimo` tinyint(1) DEFAULT NULL,
  `id_cat_workflows_solicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_workflow_version`),
  KEY `fk_tipo_workflow_version_fases` (`id_tipo_workflow`),
  KEY `idx_version` (`version`),
  KEY `fk_workflow_version_workflows_solicitud` (`id_cat_workflows_solicitud`),
  CONSTRAINT `fk_tipo_workflow_version_fases` FOREIGN KEY (`id_tipo_workflow`) REFERENCES `cat_tipo_workflow` (`id_tipo_workflow`) ON UPDATE CASCADE,
  CONSTRAINT `fk_workflow_version_workflows_solicitud` FOREIGN KEY (`id_cat_workflows_solicitud`) REFERENCES `cat_workflows_solicitud` (`id_cat_workflows_solicitud`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guarda la secuencia de pantallas por cada version del workflow';

--
-- Dumping routines for database 'vexi_originacion'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_poblar_valores`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE s_id INT;
    DECLARE r_id INT;
    DECLARE id_solicitud INT;
    DECLARE  r_incode INT;
    DECLARE  r_value1 INT;
    DECLARE  r_value2 INT;
    DECLARE  r_value3 INT;
    DECLARE  r_value4 INT;
    DECLARE  r_value5 INT;
    DECLARE  r_value6 INT;
    DECLARE  r_value7 INT;
    DECLARE  r_value8 INT;
    DECLARE  r_value9 INT;
    DECLARE  r_value10 INT;
    DECLARE  r_value11 INT;
    DECLARE  r_value12 INT;
    DECLARE  r_value13 INT;
    DECLARE  r_value14 INT;
    DECLARE  r_value15 INT;
    DECLARE  r_value16 INT;
    DECLARE  r_value17 INT;
    DECLARE  r_value18 INT;
    DECLARE  r_value19 INT;
    DECLARE  r_value20 INT;

    
    
    DECLARE cur_solicitud CURSOR FOR
        SELECT ts.id_solicitud FROM tbl_solicitud ts 
        left join tbl_random_digit r using(id_solicitud)
        where r.id_solicitud is null
        limit 10000;

    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    
    OPEN cur_solicitud;

    
    solicitud_loop: LOOP
        FETCH cur_solicitud INTO s_id;
        IF done THEN
            LEAVE solicitud_loop;
        END IF;
            SET r_incode = FLOOR(RAND() * 9999);
            SET r_value1 = FLOOR(RAND() * 9999); 
            SET r_value2 = FLOOR(RAND() * 9999); 
            SET r_value3 = FLOOR(RAND() * 9999); 
            SET r_value4 = FLOOR(RAND() * 9999); 
            SET r_value5 = FLOOR(RAND() * 9999); 
            SET r_value6 = FLOOR(RAND() * 9999); 
            SET r_value7 = FLOOR(RAND() * 9999); 
            SET r_value8 = FLOOR(RAND() * 9999); 
            SET r_value9 = FLOOR(RAND() * 9999); 
            SET r_value10 = FLOOR(RAND() * 9999); 
            SET r_value11 = FLOOR(RAND() * 9999); 
            SET r_value12 = FLOOR(RAND() * 9999); 
            SET r_value13 = FLOOR(RAND() * 9999); 
            SET r_value14 = FLOOR(RAND() * 9999); 
            SET r_value15 = FLOOR(RAND() * 9999); 
            SET r_value16 = FLOOR(RAND() * 9999); 
            SET r_value17 = FLOOR(RAND() * 9999); 
            SET r_value18 = FLOOR(RAND() * 9999); 
            SET r_value19= FLOOR(RAND() * 9999); 
            SET r_value20 = FLOOR(RAND() * 9999); 

            INSERT INTO tbl_random_digit (id_solicitud, sdk_incode, random1, random2,random3,random4,random5 ,
                random6, random7,random8,random9,random10 , random11, random12,random13,random14,random15 , 
                random16, random17,random18,random19,random20 ) 
                VALUES (s_id, r_incode, r_value1, r_value2,r_value3,r_value4,r_value5,
                    r_value6, r_value7,r_value8,r_value9,r_value10,r_value11, 
                    r_value12,r_value13,r_value14,r_value15,
                    r_value16, r_value17,r_value18,r_value19,r_value20);
    END LOOP;

    
    CLOSE cur_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `tbl_workflow_vw`
--

/*!50001 DROP VIEW IF EXISTS `tbl_workflow_vw`*/;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `tbl_workflow_vw` AS select `tbl_workflow`.`id_workflow` AS `id_workflow`,`tbl_workflow`.`correo` AS `correo`,`tbl_workflow`.`id_tipo_workflow` AS `id_tipo_workflow`,`tbl_workflow`.`id_solicitud` AS `id_solicitud`,`tbl_workflow`.`version` AS `version`,`tbl_workflow`.`ultimo` AS `ultimo`,`tbl_workflow`.`fecha_hora` AS `fecha_hora`,`tbl_workflow`.`id_workflow_version` AS `id_workflow_version` from `tbl_workflow` */;

--
-- Final view structure for view `vw_analisis_diario_finalizadas_estatus`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_finalizadas_estatus`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_finalizadas_estatus` AS select time_format(`tesh`.`fecha_hora_asignacion`,'%p%h') AS `hora`,cast(`tesh`.`fecha_hora_asignacion` as date) AS `dia`,count(distinct `tesh`.`id_solicitud`) AS `conteoFinalizada`,if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0) AS `diasemana`,`ces`.`estatus` AS `estatus` from (`tbl_estatus_solicitud_hist` `tesh` left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tesh`.`id_estatus` in (1,20,21,22,23) and `tesh`.`fecha_hora_asignacion` >= curdate() - interval 8 day group by time_format(`tesh`.`fecha_hora_asignacion`,'%p%h'),cast(`tesh`.`fecha_hora_asignacion` as date),`ces`.`estatus`,if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0) */;

--
-- Final view structure for view `vw_analisis_diario_finalizadas_estatus_promedio`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_finalizadas_estatus_promedio`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_finalizadas_estatus_promedio` AS select `t`.`diasemana` AS `diasemana`,`t`.`hora` AS `hora`,`t`.`estatus` AS `estatus`,avg(`t`.`conteoFinalizada`) AS `PromedioconteoFinalizada` from (select time_format(`tesh`.`fecha_hora_asignacion`,'%p%h') AS `hora`,if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0) AS `diasemana`,cast(`tesh`.`fecha_hora_asignacion` as date) AS `dia`,count(distinct `tesh`.`id_solicitud`) AS `conteoFinalizada`,`ces`.`estatus` AS `estatus` from (`tbl_estatus_solicitud_hist` `tesh` left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tesh`.`id_estatus` in (1,20,21,22,23) and `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week group by time_format(`tesh`.`fecha_hora_asignacion`,'%p%h'),cast(`tesh`.`fecha_hora_asignacion` as date),if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0),`ces`.`estatus`) `t` group by `t`.`diasemana`,`t`.`hora`,`t`.`estatus` */;

--
-- Final view structure for view `vw_analisis_diario_finalizadas_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_finalizadas_estatus_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_finalizadas_estatus_tablero` AS select `t1`.`hora` AS `hora`,`t1`.`diasemana` AS `diasemana`,`t1`.`estatus` AS `estatus`,`t1`.`dia` AS `dia`,`t1`.`conteoFinalizada` AS `conteoFinalizada`,cast(`t2`.`PromedioconteoFinalizada` as signed) AS `PromedioconteoFinalizada` from (`vw_analisis_diario_finalizadas_estatus` `t1` left join `vw_analisis_diario_finalizadas_estatus_promedio` `t2` on(`t1`.`hora` = `t2`.`hora` and `t1`.`diasemana` = `t2`.`diasemana` and `t1`.`estatus` = `t2`.`estatus`)) */;

--
-- Final view structure for view `vw_analisis_diario_finalizadas_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_finalizadas_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_finalizadas_tablero` AS select concat(`t1`.`hora`,' ',`t4`.`dato`) AS `hora`,`t1`.`diasemana` AS `diasemana`,`t1`.`dia` AS `dia`,`t1`.`conteoFinalizada` AS `conteoFinalizada`,`t2`.`PromedioconteoFinalizada` AS `PromedioconteoFinalizada` from (((select `vw_analisis_diario_finalizadas_estatus`.`hora` AS `hora`,`vw_analisis_diario_finalizadas_estatus`.`dia` AS `dia`,`vw_analisis_diario_finalizadas_estatus`.`diasemana` AS `diasemana`,sum(`vw_analisis_diario_finalizadas_estatus`.`conteoFinalizada`) AS `conteoFinalizada` from `vw_analisis_diario_finalizadas_estatus` group by `vw_analisis_diario_finalizadas_estatus`.`hora`,`vw_analisis_diario_finalizadas_estatus`.`dia`,`vw_analisis_diario_finalizadas_estatus`.`diasemana`) `t1` left join (select `vw_analisis_diario_finalizadas_estatus_promedio`.`hora` AS `hora`,`vw_analisis_diario_finalizadas_estatus_promedio`.`diasemana` AS `diasemana`,sum(`vw_analisis_diario_finalizadas_estatus_promedio`.`PromedioconteoFinalizada`) AS `PromedioconteoFinalizada` from `vw_analisis_diario_finalizadas_estatus_promedio` group by `vw_analisis_diario_finalizadas_estatus_promedio`.`hora`,`vw_analisis_diario_finalizadas_estatus_promedio`.`diasemana`) `t2` on(`t1`.`hora` = `t2`.`hora` and `t1`.`diasemana` = `t2`.`diasemana`)) left join (select `t3`.`hora` AS `hora`,group_concat(concat(if(`t3`.`diasemana` = 1,'H: ','F: '),cast(`t3`.`PromedioconteoFinalizada` as signed)) separator ',') AS `dato` from (select `vw_analisis_diario_finalizadas_estatus_promedio`.`hora` AS `hora`,`vw_analisis_diario_finalizadas_estatus_promedio`.`diasemana` AS `diasemana`,sum(`vw_analisis_diario_finalizadas_estatus_promedio`.`PromedioconteoFinalizada`) AS `PromedioconteoFinalizada` from `vw_analisis_diario_finalizadas_estatus_promedio` group by `vw_analisis_diario_finalizadas_estatus_promedio`.`hora`,`vw_analisis_diario_finalizadas_estatus_promedio`.`diasemana`) `t3` group by `t3`.`hora`) `t4` on(`t1`.`hora` = `t4`.`hora`)) */;

--
-- Final view structure for view `vw_analisis_diario_iniciadas_estatus_sol_larga`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_iniciadas_estatus_sol_larga`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_iniciadas_estatus_sol_larga` AS select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,cast(cast(`tew`.`fecha_hora_envio` as date) as date) AS `dia`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0) AS `diasemana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 8 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),cast(cast(`tew`.`fecha_hora_envio` as date) as date),`ces`.`estatus`,`ts`.`solicitud_larga`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0) */;

--
-- Final view structure for view `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio` AS select `t`.`hora` AS `hora`,`t`.`diasemana` AS `diasemana`,`t`.`estatus` AS `estatus`,`t`.`solicitud_larga` AS `solicitud_larga`,avg(`t`.`conteoIniciadas`) AS `PromedioconteoIniciadas` from (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,cast(cast(`tew`.`fecha_hora_envio` as date) as date) AS `dia`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0) AS `diasemana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),cast(cast(`tew`.`fecha_hora_envio` as date) as date),`ces`.`estatus`,`ts`.`solicitud_larga`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0)) `t` group by `t`.`hora`,`t`.`diasemana`,`t`.`estatus`,`t`.`solicitud_larga` */;

--
-- Final view structure for view `vw_analisis_diario_iniciadas_estatus_sol_larga_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_iniciadas_estatus_sol_larga_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_iniciadas_estatus_sol_larga_tablero` AS select concat(substr(`t1`.`hora`,3,2),'',substr(`t1`.`hora`,1,2),' ',`t4`.`dato`) AS `hora`,`t1`.`diasemana` AS `diasemana`,`t1`.`solicitud_larga` AS `solicitud_larga`,`t1`.`dia` AS `dia`,`t1`.`conteoIniciadas` AS `conteoIniciadas`,`t2`.`PromedioconteoIniciadas` AS `PromedioconteoIniciadas` from (((select `vw_analisis_diario_iniciadas_estatus_sol_larga`.`dia` AS `dia`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`diasemana` AS `diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`solicitud_larga` AS `solicitud_larga`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga` group by `vw_analisis_diario_iniciadas_estatus_sol_larga`.`dia`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`solicitud_larga`) `t1` join (select `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana` AS `diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`solicitud_larga` AS `solicitud_larga`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`PromedioconteoIniciadas`) AS `PromedioconteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`solicitud_larga`) `t2` on(`t1`.`hora` = `t2`.`hora` and `t1`.`diasemana` = `t2`.`diasemana` and `t1`.`solicitud_larga` = `t2`.`solicitud_larga`)) left join (select `t3`.`hora` AS `hora`,`t3`.`solicitud_larga` AS `solicitud_larga`,group_concat(concat(if(`t3`.`diasemana` = 1,'H: ','F: '),cast(`t3`.`PromedioconteoIniciadas` as signed)) separator ',') AS `dato` from (select `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana` AS `diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`solicitud_larga` AS `solicitud_larga`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`PromedioconteoIniciadas`) AS `PromedioconteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`solicitud_larga`) `t3` group by `t3`.`hora`,`t3`.`solicitud_larga`) `t4` on(`t1`.`hora` = `t4`.`hora` and `t1`.`solicitud_larga` = `t4`.`solicitud_larga`)) */;

--
-- Final view structure for view `vw_analisis_diario_iniciadas_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_iniciadas_estatus_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_iniciadas_estatus_tablero` AS select concat(substr(`t1`.`hora`,3,2),'',substr(`t1`.`hora`,1,2)) AS `hora`,`t1`.`diasemana` AS `diasemana`,`t1`.`estatus` AS `estatus`,`t1`.`dia` AS `dia`,`t1`.`conteoIniciadas` AS `conteoIniciadas`,cast(`t2`.`PromedioconteoIniciadas` as signed) AS `PromedioconteoIniciadas` from ((select `vw_analisis_diario_iniciadas_estatus_sol_larga`.`dia` AS `dia`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`diasemana` AS `diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`estatus` AS `estatus`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga` group by `vw_analisis_diario_iniciadas_estatus_sol_larga`.`dia`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`estatus`) `t1` join (select `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana` AS `diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`estatus` AS `estatus`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`PromedioconteoIniciadas`) AS `PromedioconteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`estatus`) `t2` on(`t1`.`hora` = `t2`.`hora` and `t1`.`diasemana` = `t2`.`diasemana` and `t1`.`estatus` = `t2`.`estatus`)) */;

--
-- Final view structure for view `vw_analisis_diario_preiniciadas_por_estatus`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_preiniciadas_por_estatus`*/;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_preiniciadas_por_estatus` AS select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,cast(`tew`.`fecha_hora_envio` as date) AS `dia`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0) AS `diasemana`,dayofweek(`tew`.`fecha_hora_envio`) AS `dayofweek_num`,`ts`.`id_cod_ref` AS `id_cod_ref`,`ces`.`estatus` AS `estatus`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` = 1 and `tew`.`fecha_hora_envio` >= curdate() - interval 8 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),cast(`tew`.`fecha_hora_envio` as date),if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0),dayofweek(`tew`.`fecha_hora_envio`),`ts`.`id_cod_ref`,`ces`.`estatus` */;

--
-- Final view structure for view `vw_analisis_diario_preiniciadas_por_estatus_promedio`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_preiniciadas_por_estatus_promedio`*/;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_preiniciadas_por_estatus_promedio` AS select `t`.`hora` AS `hora`,`t`.`diasemana` AS `diasemana`,`t`.`estatus` AS `estatus`,`t`.`id_cod_ref` AS `id_cod_ref`,avg(`t`.`conteoIniciadas`) AS `PromedioconteoIniciadas` from (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,cast(cast(`tew`.`fecha_hora_envio` as date) as date) AS `dia`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0) AS `diasemana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`id_cod_ref` AS `id_cod_ref` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` = 1 and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),cast(cast(`tew`.`fecha_hora_envio` as date) as date),`ces`.`estatus`,`ts`.`id_cod_ref`,if(dayofweek(`tew`.`fecha_hora_envio`) in (2,3,4,5,6),1,0)) `t` group by `t`.`hora`,`t`.`diasemana`,`t`.`id_cod_ref`,`t`.`estatus` */;

--
-- Final view structure for view `vw_analisis_diario_preiniciadas_por_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_preiniciadas_por_estatus_tablero`*/;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_preiniciadas_por_estatus_tablero` AS select concat(substr(`t1`.`hora`,3,2),'',substr(`t1`.`hora`,1,2)) AS `hora`,`t1`.`diasemana` AS `diasemana`,`t1`.`estatus` AS `current_estatus`,`t1`.`id_cod_ref` AS `cod_ref`,`t1`.`dia` AS `dia`,`t1`.`conteoIniciadas` AS `conteoIniciadas`,cast(`t2`.`PromedioconteoIniciadas` as signed) AS `PromedioconteoIniciadas` from ((select `vw_analisis_diario_preiniciadas_por_estatus`.`dia` AS `dia`,`vw_analisis_diario_preiniciadas_por_estatus`.`hora` AS `hora`,`vw_analisis_diario_preiniciadas_por_estatus`.`diasemana` AS `diasemana`,`vw_analisis_diario_preiniciadas_por_estatus`.`estatus` AS `estatus`,`vw_analisis_diario_preiniciadas_por_estatus`.`id_cod_ref` AS `id_cod_ref`,sum(`vw_analisis_diario_preiniciadas_por_estatus`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_diario_preiniciadas_por_estatus` group by `vw_analisis_diario_preiniciadas_por_estatus`.`dia`,`vw_analisis_diario_preiniciadas_por_estatus`.`hora`,`vw_analisis_diario_preiniciadas_por_estatus`.`diasemana`,`vw_analisis_diario_preiniciadas_por_estatus`.`id_cod_ref`,`vw_analisis_diario_preiniciadas_por_estatus`.`estatus`) `t1` join (select `vw_analisis_diario_preiniciadas_por_estatus_promedio`.`hora` AS `hora`,`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`diasemana` AS `diasemana`,`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`estatus` AS `estatus`,`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`id_cod_ref` AS `id_cod_ref`,sum(`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`PromedioconteoIniciadas`) AS `PromedioconteoIniciadas` from `vw_analisis_diario_preiniciadas_por_estatus_promedio` group by `vw_analisis_diario_preiniciadas_por_estatus_promedio`.`hora`,`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`diasemana`,`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`id_cod_ref`,`vw_analisis_diario_preiniciadas_por_estatus_promedio`.`estatus`) `t2` on(`t1`.`hora` = `t2`.`hora` and `t1`.`diasemana` = `t2`.`diasemana` and `t1`.`estatus` = `t2`.`estatus` and `t1`.`id_cod_ref` = `t2`.`id_cod_ref`)) */;

--
-- Final view structure for view `vw_analisis_diario_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_diario_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_diario_tablero` AS select concat(substr(`t1`.`hora`,3,2),'',substr(`t1`.`hora`,1,2),' ',`t4`.`dato`) AS `hora`,`t1`.`diasemana` AS `diasemana`,`t1`.`dia` AS `dia`,`t1`.`conteoIniciadas` AS `conteoIniciadas`,`t2`.`PromedioconteoIniciadas` AS `PromedioconteoIniciadas` from (((select `vw_analisis_diario_iniciadas_estatus_sol_larga`.`dia` AS `dia`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`diasemana` AS `diasemana`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga` group by `vw_analisis_diario_iniciadas_estatus_sol_larga`.`dia`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga`.`diasemana`) `t1` join (select `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana` AS `diasemana`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`PromedioconteoIniciadas`) AS `PromedioconteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana`) `t2` on(`t1`.`hora` = `t2`.`hora` and `t1`.`diasemana` = `t2`.`diasemana`)) left join (select `t3`.`hora` AS `hora`,group_concat(concat(if(`t3`.`diasemana` = 1,'H: ','F: '),cast(`t3`.`PromedioconteoIniciadas` as signed)) separator ',') AS `dato` from (select `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana` AS `diasemana`,sum(`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`PromedioconteoIniciadas`) AS `PromedioconteoIniciadas` from `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_diario_iniciadas_estatus_sol_larga_promedio`.`diasemana`) `t3` group by `t3`.`hora`) `t4` on(`t1`.`hora` = `t4`.`hora`)) */;

--
-- Final view structure for view `vw_analisis_mensual_finalizadas_estatus`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_finalizadas_estatus`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_finalizadas_estatus` AS select time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,month(cast(`tesh`.`fecha_hora_asignacion` as date)) AS `mes`,count(distinct `tesh`.`id_solicitud`) AS `conteoFinalizada`,`ces`.`estatus` AS `estatus` from (`tbl_estatus_solicitud_hist` `tesh` left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tesh`.`id_estatus` in (1,20,21,22,23) and `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 6 month group by time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),month(cast(`tesh`.`fecha_hora_asignacion` as date)),`ces`.`estatus` */;

--
-- Final view structure for view `vw_analisis_mensual_finalizadas_estatus_previo`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_finalizadas_estatus_previo`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_finalizadas_estatus_previo` AS select time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,month(cast(`tesh`.`fecha_hora_asignacion` as date) + interval 1 month) AS `mes`,count(distinct `tesh`.`id_solicitud`) AS `conteoFinalizada`,`ces`.`estatus` AS `estatus` from (`tbl_estatus_solicitud_hist` `tesh` left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tesh`.`id_estatus` in (1,20,21,22,23) and `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month group by time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),month(cast(`tesh`.`fecha_hora_asignacion` as date) + interval 1 month),`ces`.`estatus` */;

--
-- Final view structure for view `vw_analisis_mensual_finalizadas_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_finalizadas_estatus_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_finalizadas_estatus_tablero` AS select `vw1`.`hora` AS `hora`,`vw1`.`estatus` AS `estatus`,`vw1`.`mes` AS `mes`,`vw1`.`conteoFinalizada` AS `conteoFinalizada`,`vw2`.`conteoFinalizada` AS `conteoFinalizadaPromedio` from (`vw_analisis_mensual_finalizadas_estatus` `vw1` left join `vw_analisis_mensual_finalizadas_estatus_previo` `vw2` on(`vw1`.`hora` = `vw2`.`hora` and `vw1`.`mes` = `vw2`.`mes` and `vw1`.`estatus` = `vw2`.`estatus`)) */;

--
-- Final view structure for view `vw_analisis_mensual_finalizadas_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_finalizadas_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_finalizadas_tablero` AS select `t`.`hora` AS `hora`,`t`.`mes` AS `mes`,sum(`t`.`conteoFinalizada`) AS `conteoFinalizada`,sum(`t`.`conteoFinalizadaPromedio`) AS `conteoFinalizadaPromedio` from (select `vw1`.`hora` AS `hora`,`vw1`.`estatus` AS `estatus`,`vw1`.`mes` AS `mes`,`vw1`.`conteoFinalizada` AS `conteoFinalizada`,`vw2`.`conteoFinalizada` AS `conteoFinalizadaPromedio` from (`vw_analisis_mensual_finalizadas_estatus` `vw1` left join `vw_analisis_mensual_finalizadas_estatus_previo` `vw2` on(`vw1`.`hora` = `vw2`.`hora` and `vw1`.`mes` = `vw2`.`mes` and `vw1`.`estatus` = `vw2`.`estatus`))) `t` group by `t`.`hora`,`t`.`mes` */;

--
-- Final view structure for view `vw_analisis_mensual_iniciadas_estatus_sol_larga`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_iniciadas_estatus_sol_larga`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_iniciadas_estatus_sol_larga` AS select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,month(cast(`tew`.`fecha_hora_envio` as date)) AS `mes`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= last_day(curdate()) + interval 1 day - interval 7 month and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),month(cast(`tew`.`fecha_hora_envio` as date)),`ces`.`estatus`,`ts`.`solicitud_larga` */;

--
-- Final view structure for view `vw_analisis_mensual_iniciadas_estatus_sol_larga_mes_anterior`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_iniciadas_estatus_sol_larga_mes_anterior`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_iniciadas_estatus_sol_larga_mes_anterior` AS select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,month(cast(`tew`.`fecha_hora_envio` + interval 1 month as date)) AS `mes`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadasAnterior`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= last_day(curdate()) + interval 1 day - interval 8 month and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),month(cast(`tew`.`fecha_hora_envio` + interval 1 month as date)),`ces`.`estatus`,`ts`.`solicitud_larga` */;

--
-- Final view structure for view `vw_analisis_mensual_iniciadas_estatus_sol_larga_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_iniciadas_estatus_sol_larga_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_iniciadas_estatus_sol_larga_tablero` AS select `T`.`hora` AS `hora`,`T`.`mes` AS `mes`,`T`.`solicitud_larga` AS `solicitud_larga`,sum(`T`.`conteoIniciadas`) AS `conteoIniciadas`,sum(`T`.`conteoIniciadasAnterior`) AS `conteoIniciadasAnterior` from (select concat(`v1`.`hora`,' - ') AS `hora`,`v1`.`mes` AS `mes`,`v1`.`solicitud_larga` AS `solicitud_larga`,`v1`.`conteoIniciadas` AS `conteoIniciadas`,ifnull(`v2`.`conteoIniciadasAnterior`,0) AS `conteoIniciadasAnterior` from (`vw_analisis_mensual_iniciadas_estatus_sol_larga` `v1` left join `vw_analisis_mensual_iniciadas_estatus_sol_larga_mes_anterior` `v2` on(`v1`.`hora` = `v2`.`hora` and `v1`.`mes` = `v2`.`mes` and `v1`.`estatus` = `v2`.`estatus` and `v1`.`solicitud_larga` = `v2`.`solicitud_larga`))) `T` group by `T`.`hora`,`T`.`mes`,`T`.`solicitud_larga` */;

--
-- Final view structure for view `vw_analisis_mensual_iniciadas_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_iniciadas_estatus_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_iniciadas_estatus_tablero` AS select `T`.`hora` AS `hora`,`T`.`mes` AS `mes`,`T`.`estatus` AS `estatus`,sum(`T`.`conteoIniciadas`) AS `conteoIniciadas`,sum(`T`.`conteoIniciadasAnterior`) AS `conteoIniciadasAnterior` from (select concat(`v1`.`hora`,' - ') AS `hora`,`v1`.`mes` AS `mes`,`v1`.`estatus` AS `estatus`,`v1`.`conteoIniciadas` AS `conteoIniciadas`,ifnull(`v2`.`conteoIniciadasAnterior`,0) AS `conteoIniciadasAnterior` from (`vw_analisis_mensual_iniciadas_estatus_sol_larga` `v1` left join `vw_analisis_mensual_iniciadas_estatus_sol_larga_mes_anterior` `v2` on(`v1`.`hora` = `v2`.`hora` and `v1`.`mes` = `v2`.`mes` and `v1`.`estatus` = `v2`.`estatus` and `v1`.`solicitud_larga` = `v2`.`solicitud_larga`))) `T` group by `T`.`hora`,`T`.`mes`,`T`.`estatus` */;

--
-- Final view structure for view `vw_analisis_mensual_iniciadas_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_mensual_iniciadas_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_mensual_iniciadas_tablero` AS select `T`.`hora` AS `hora`,`T`.`mes` AS `mes`,sum(`T`.`conteoIniciadas`) AS `conteoIniciadas`,sum(`T`.`conteoIniciadasAnterior`) AS `conteoIniciadasAnterior` from (select concat(`v1`.`hora`,' - ') AS `hora`,`v1`.`mes` AS `mes`,`v1`.`conteoIniciadas` AS `conteoIniciadas`,ifnull(`v2`.`conteoIniciadasAnterior`,0) AS `conteoIniciadasAnterior` from (`vw_analisis_mensual_iniciadas_estatus_sol_larga` `v1` left join `vw_analisis_mensual_iniciadas_estatus_sol_larga_mes_anterior` `v2` on(`v1`.`hora` = `v2`.`hora` and `v1`.`mes` = `v2`.`mes` and `v1`.`estatus` = `v2`.`estatus` and `v1`.`solicitud_larga` = `v2`.`solicitud_larga`))) `T` group by `T`.`hora`,`T`.`mes` */;

--
-- Final view structure for view `vw_analisis_promedio_semanal_iniciadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_promedio_semanal_iniciadas`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_promedio_semanal_iniciadas` AS select `PromediosSemanal`.`hora` AS `hora`,avg(`PromediosSemanal`.`conteoIniciadas`) AS `PromedioConteoIniciadas` from (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas` from `tbl_eventos_webhook` `tew` where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),week(cast(`tew`.`fecha_hora_envio` as date),3)) `PromediosSemanal` group by `PromediosSemanal`.`hora` */;

--
-- Final view structure for view `vw_analisis_semanal_finalizadas_estatus`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_finalizadas_estatus`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_finalizadas_estatus` AS select time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,week(cast(`tesh`.`fecha_hora_asignacion` as date),3) AS `semana`,count(distinct `tesh`.`id_solicitud`) AS `conteoFinalizada`,`ces`.`estatus` AS `estatus` from (`tbl_estatus_solicitud_hist` `tesh` left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tesh`.`id_estatus` in (1,20,21,22,23) and `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day group by time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),week(cast(`tesh`.`fecha_hora_asignacion` as date),3),`ces`.`estatus` */;

--
-- Final view structure for view `vw_analisis_semanal_finalizadas_estatus_promedio`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_finalizadas_estatus_promedio`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_finalizadas_estatus_promedio` AS select `t`.`hora` AS `hora`,`t`.`estatus` AS `estatus`,avg(`t`.`conteoFinalizada`) AS `conteoFinalizadaPromedio` from (select time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,week(cast(`tesh`.`fecha_hora_asignacion` as date),3) AS `semana`,count(distinct `tesh`.`id_solicitud`) AS `conteoFinalizada`,`ces`.`estatus` AS `estatus` from (`tbl_estatus_solicitud_hist` `tesh` left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tesh`.`id_estatus` in (1,20,21,22,23) and `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day group by time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),week(cast(`tesh`.`fecha_hora_asignacion` as date),3),`ces`.`estatus`) `t` group by `t`.`hora`,`t`.`estatus` */;

--
-- Final view structure for view `vw_analisis_semanal_iniciadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_iniciadas`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_iniciadas` AS select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),week(cast(`tew`.`fecha_hora_envio` as date),3),`ces`.`estatus`,`ts`.`solicitud_larga` */;

--
-- Final view structure for view `vw_analisis_semanal_iniciadas_estatus_sol_larga`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_iniciadas_estatus_sol_larga`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_iniciadas_estatus_sol_larga` AS select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),week(cast(`tew`.`fecha_hora_envio` as date),3),`ces`.`estatus`,`ts`.`solicitud_larga` */;

--
-- Final view structure for view `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio` AS select `tt`.`hora` AS `hora`,`tt`.`solicitud_larga` AS `solicitud_larga`,`tt`.`estatus` AS `estatus`,avg(`tt`.`conteoIniciadas`) AS `conteoIniciadasPromedio` from (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas`,`ces`.`estatus` AS `estatus`,`ts`.`solicitud_larga` AS `solicitud_larga` from (((`tbl_eventos_webhook` `tew` left join `tbl_estatus_solicitud_hist` `tesh` on(`tew`.`id_solicitud` = `tesh`.`id_solicitud` and `tesh`.`ultimo` = 1)) left join `tbl_solicitud` `ts` on(`ts`.`id_solicitud` = `tesh`.`id_solicitud`)) left join `cat_estatus_solicitud` `ces` on(`ces`.`id_estatus` = `tesh`.`id_estatus`)) where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),week(cast(`tew`.`fecha_hora_envio` as date),3),`ces`.`estatus`,`ts`.`solicitud_larga`) `tt` group by `tt`.`hora`,`tt`.`solicitud_larga`,`tt`.`estatus` */;

--
-- Final view structure for view `vw_semanal_dia_inicial`
--

/*!50001 DROP VIEW IF EXISTS `vw_semanal_dia_inicial`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_semanal_dia_inicial` AS select week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,min(cast(`tew`.`fecha_hora_envio` as date)) AS `FechaInicio` from `tbl_eventos_webhook` `tew` where `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day group by week(cast(`tew`.`fecha_hora_envio` as date),3) */;

--
-- Final view structure for view `vw_analisis_semanal_finalizadas_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_finalizadas_estatus_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_finalizadas_estatus_tablero` AS select `vw1`.`hora` AS `hora`,`vw1`.`estatus` AS `estatus`,`vw`.`semana` AS `semana`,`vw`.`FechaInicio` AS `FechaInicio`,`vw1`.`conteoFinalizada` AS `conteoFinalizada`,`vw2`.`conteoFinalizadaPromedio` AS `conteoFinalizadaPromedio` from ((`vw_semanal_dia_inicial` `vw` left join `vw_analisis_semanal_finalizadas_estatus` `vw1` on(`vw`.`semana` = `vw1`.`semana`)) left join `vw_analisis_semanal_finalizadas_estatus_promedio` `vw2` on(`vw1`.`hora` = `vw2`.`hora` and `vw1`.`estatus` = `vw2`.`estatus`)) */;

--
-- Final view structure for view `vw_analisis_semanal_finalizadas_estatus_tablero_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_finalizadas_estatus_tablero_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_finalizadas_estatus_tablero_totales` AS select concat(`vw1`.`hora`,' - ',cast(`vw2`.`conteoFinalizadaPromedio` as signed)) AS `hora`,`vw`.`semana` AS `semana`,`vw`.`FechaInicio` AS `FechaInicio`,`vw1`.`conteoFinalizada` AS `conteoFinalizada`,`vw2`.`conteoFinalizadaPromedio` AS `conteoFinalizadaPromedio` from ((`vw_semanal_dia_inicial` `vw` left join (select `vw_analisis_semanal_finalizadas_estatus`.`hora` AS `hora`,`vw_analisis_semanal_finalizadas_estatus`.`semana` AS `semana`,sum(`vw_analisis_semanal_finalizadas_estatus`.`conteoFinalizada`) AS `conteoFinalizada` from `vw_analisis_semanal_finalizadas_estatus` group by `vw_analisis_semanal_finalizadas_estatus`.`hora`,`vw_analisis_semanal_finalizadas_estatus`.`semana`) `vw1` on(`vw`.`semana` = `vw1`.`semana`)) left join (select `vw_analisis_semanal_finalizadas_estatus_promedio`.`hora` AS `hora`,sum(`vw_analisis_semanal_finalizadas_estatus_promedio`.`conteoFinalizadaPromedio`) AS `conteoFinalizadaPromedio` from `vw_analisis_semanal_finalizadas_estatus_promedio` group by `vw_analisis_semanal_finalizadas_estatus_promedio`.`hora`) `vw2` on(`vw1`.`hora` = `vw2`.`hora`)) */;

--
-- Final view structure for view `vw_analisis_semanal_iniciadas_estatus_sol_larga_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_iniciadas_estatus_sol_larga_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_iniciadas_estatus_sol_larga_tablero` AS select concat(`vw1`.`hora`,' - ',cast(`wv2`.`conteoIniciadasPromedio` as signed)) AS `hora`,`vw1`.`solicitud_larga` AS `solicitud_larga`,`vw`.`semana` AS `semana`,`vw`.`FechaInicio` AS `FechaInicio`,`vw1`.`conteoIniciadas` AS `conteoIniciadas`,`wv2`.`conteoIniciadasPromedio` AS `conteoIniciadasPromedio` from ((`vw_semanal_dia_inicial` `vw` left join (select `vw_analisis_semanal_iniciadas_estatus_sol_larga`.`hora` AS `hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`semana` AS `semana`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`solicitud_larga` AS `solicitud_larga`,sum(`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_semanal_iniciadas_estatus_sol_larga` group by `vw_analisis_semanal_iniciadas_estatus_sol_larga`.`hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`semana`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`solicitud_larga`) `vw1` on(`vw`.`semana` = `vw1`.`semana`)) left join (select `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`solicitud_larga` AS `solicitud_larga`,sum(`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`conteoIniciadasPromedio`) AS `conteoIniciadasPromedio` from `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`solicitud_larga`) `wv2` on(`vw1`.`hora` = `wv2`.`hora` and `vw1`.`solicitud_larga` = `wv2`.`solicitud_larga`)) */;

--
-- Final view structure for view `vw_analisis_semanal_iniciadas_estatus_tablero`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_iniciadas_estatus_tablero`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_iniciadas_estatus_tablero` AS select `vw1`.`hora` AS `hora`,`vw1`.`estatus` AS `estatus`,`vw`.`semana` AS `semana`,`vw`.`FechaInicio` AS `FechaInicio`,`vw1`.`conteoIniciadas` AS `conteoIniciadas`,`wv2`.`conteoIniciadasPromedio` AS `conteoIniciadasPromedio` from ((`vw_semanal_dia_inicial` `vw` left join (select `vw_analisis_semanal_iniciadas_estatus_sol_larga`.`hora` AS `hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`semana` AS `semana`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`estatus` AS `estatus`,sum(`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_semanal_iniciadas_estatus_sol_larga` group by `vw_analisis_semanal_iniciadas_estatus_sol_larga`.`hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`semana`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`estatus`) `vw1` on(`vw`.`semana` = `vw1`.`semana`)) left join (select `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`estatus` AS `estatus`,sum(`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`conteoIniciadasPromedio`) AS `conteoIniciadasPromedio` from `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`estatus`) `wv2` on(`vw1`.`hora` = `wv2`.`hora` and `vw1`.`estatus` = `wv2`.`estatus`)) */;

--
-- Final view structure for view `vw_analisis_semanal_iniciadas_estatus_tablero_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_analisis_semanal_iniciadas_estatus_tablero_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_analisis_semanal_iniciadas_estatus_tablero_totales` AS select concat(`vw1`.`hora`,' - ',cast(`wv2`.`conteoIniciadasPromedio` as signed)) AS `hora`,`vw`.`semana` AS `semana`,`vw`.`FechaInicio` AS `FechaInicio`,`vw1`.`conteoIniciadas` AS `conteoIniciadas`,`wv2`.`conteoIniciadasPromedio` AS `conteoIniciadasPromedio` from ((`vw_semanal_dia_inicial` `vw` left join (select `vw_analisis_semanal_iniciadas_estatus_sol_larga`.`hora` AS `hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`semana` AS `semana`,sum(`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`conteoIniciadas`) AS `conteoIniciadas` from `vw_analisis_semanal_iniciadas_estatus_sol_larga` group by `vw_analisis_semanal_iniciadas_estatus_sol_larga`.`hora`,`vw_analisis_semanal_iniciadas_estatus_sol_larga`.`semana`) `vw1` on(`vw`.`semana` = `vw1`.`semana`)) left join (select `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`hora` AS `hora`,sum(`vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`conteoIniciadasPromedio`) AS `conteoIniciadasPromedio` from `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio` group by `vw_analisis_semanal_iniciadas_estatus_sol_larga_promedio`.`hora`) `wv2` on(`vw1`.`hora` = `wv2`.`hora`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas_mensual`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas_mensual`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas_mensual` AS select `fechas`.`Mes` AS `Mes`,`fechas`.`FechaInicio` AS `FechaInicio`,concat(substr(`Mensual`.`hora`,3,2),' - ',substr(`Mensual`.`hora`,1,2),' - ',`PromedioMensual`.`PromedioConteoIniciadas`) AS `hora`,`Mensual`.`conteoIniciadas` AS `conteoIniciadas`,`PromedioMensual`.`PromedioConteoIniciadas` AS `PromedioConteoIniciadas` from (((select month(cast(`tew`.`fecha_hora_envio` as date)) AS `Mes`,min(cast(`tew`.`fecha_hora_envio` as date)) AS `FechaInicio` from `tbl_eventos_webhook` `tew` where `tew`.`fecha_hora_envio` >= last_day(curdate()) + interval 1 day - interval 7 month group by month(cast(`tew`.`fecha_hora_envio` as date))) `fechas` left join (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,month(cast(`tew`.`fecha_hora_envio` as date)) AS `Mes`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas` from `tbl_eventos_webhook` `tew` where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= last_day(curdate()) + interval 1 day - interval 7 month and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),month(cast(`tew`.`fecha_hora_envio` as date))) `Mensual` on(`Mensual`.`Mes` = `fechas`.`Mes`)) left join (select `PromediosMensual`.`hora` AS `hora`,avg(`PromediosMensual`.`conteoIniciadas`) AS `PromedioConteoIniciadas` from (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,month(cast(`tew`.`fecha_hora_envio` as date)) AS `Mes`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas` from `tbl_eventos_webhook` `tew` where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= last_day(curdate()) + interval 1 day - interval 7 month and `tew`.`fecha_hora_envio` < last_day(curdate()) + interval 1 day - interval 1 month and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),month(cast(`tew`.`fecha_hora_envio` as date))) `PromediosMensual` group by `PromediosMensual`.`hora`) `PromedioMensual` on(`PromedioMensual`.`hora` = `Mensual`.`hora`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas_semanal`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas_semanal`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas_semanal` AS select `fechas`.`semana` AS `semana`,`fechas`.`FechaInicio` AS `FechaInicio`,concat(substr(`Semanal`.`hora`,3,2),' - ',substr(`Semanal`.`hora`,1,2),' - ',`PromedioSemanal`.`PromedioConteoIniciadas`) AS `hora`,`Semanal`.`conteoIniciadas` AS `conteoIniciadas`,`PromedioSemanal`.`PromedioConteoIniciadas` AS `PromedioConteoIniciadas` from (((select week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,min(cast(`tew`.`fecha_hora_envio` as date)) AS `FechaInicio` from `tbl_eventos_webhook` `tew` where `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day group by week(cast(`tew`.`fecha_hora_envio` as date),3)) `fechas` left join (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas` from `tbl_eventos_webhook` `tew` where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),week(cast(`tew`.`fecha_hora_envio` as date),3)) `Semanal` on(`Semanal`.`semana` = `fechas`.`semana`)) left join (select `PromediosSemanal`.`hora` AS `hora`,avg(`PromediosSemanal`.`conteoIniciadas`) AS `PromedioConteoIniciadas` from (select time_format(`tew`.`fecha_hora_envio`,'%h%p') AS `hora`,week(cast(`tew`.`fecha_hora_envio` as date),3) AS `semana`,count(distinct `tew`.`id_solicitud`) AS `conteoIniciadas` from `tbl_eventos_webhook` `tew` where `tew`.`id_fase` in (3,4) and `tew`.`fecha_hora_envio` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tew`.`id_solicitud` is not null group by time_format(`tew`.`fecha_hora_envio`,'%h%p'),week(cast(`tew`.`fecha_hora_envio` as date),3)) `PromediosSemanal` group by `PromediosSemanal`.`hora`) `PromedioSemanal` on(`PromedioSemanal`.`hora` = `Semanal`.`hora`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_terminadas_mensual`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_terminadas_mensual`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_terminadas_mensual` AS select `Semanas`.`mes` AS `mes`,`Semanas`.`FechaInicioMes` AS `FechaInicioMes`,concat(substr(`AnalisisMensual`.`hora`,3,2),' - ',substr(`AnalisisMensual`.`hora`,1,2),' - ',format(`PromedioMensual`.`conteoPromedioFinalizadas`,0)) AS `hora`,`AnalisisMensual`.`id_estatus` AS `id_estatus`,`AnalisisMensual`.`conteoFinalizadas` AS `conteoFinalizadas`,`PromedioMensual`.`conteoPromedioFinalizadas` AS `conteoPromedioFinalizadas` from (((select month(`tesh`.`fecha_hora_asignacion`) AS `mes`,min(cast(`tesh`.`fecha_hora_asignacion` as date)) AS `FechaInicioMes` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month group by month(`tesh`.`fecha_hora_asignacion`)) `Semanas` left join (select month(`tesh`.`fecha_hora_asignacion`) AS `mes`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,`tesh`.`id_estatus` AS `id_estatus`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month and `tesh`.`id_estatus` in (1,20,22,23) group by month(`tesh`.`fecha_hora_asignacion`),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),`tesh`.`id_estatus`) `AnalisisMensual` on(`AnalisisMensual`.`mes` = `Semanas`.`mes`)) left join (select `Promedio`.`hora` AS `hora`,`Promedio`.`id_estatus` AS `id_estatus`,avg(`Promedio`.`conteoPromedioFinalizadas`) AS `conteoPromedioFinalizadas` from (select month(`tesh`.`fecha_hora_asignacion`) AS `mes`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,`tesh`.`id_estatus` AS `id_estatus`,count(0) AS `conteoPromedioFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month and `tesh`.`fecha_hora_asignacion` < last_day(curdate()) + interval 1 day - interval 1 month and `tesh`.`id_estatus` in (1,20,22,23) group by month(`tesh`.`fecha_hora_asignacion`),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),`tesh`.`id_estatus`) `Promedio` group by `Promedio`.`hora`,`Promedio`.`id_estatus`) `PromedioMensual` on(`AnalisisMensual`.`hora` = `PromedioMensual`.`hora` and `AnalisisMensual`.`id_estatus` = `PromedioMensual`.`id_estatus`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_terminadas_mensual_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_terminadas_mensual_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_terminadas_mensual_totales` AS select `Semanas`.`mes` AS `mes`,`Semanas`.`FechaInicioMes` AS `FechaInicioMes`,concat(substr(`AnalisisMensual`.`hora`,3,2),' - ',substr(`AnalisisMensual`.`hora`,1,2),' - ',format(`PromedioMensual`.`conteoPromedioFinalizadas`,0)) AS `hora`,`AnalisisMensual`.`conteoFinalizadas` AS `conteoFinalizadas`,`PromedioMensual`.`conteoPromedioFinalizadas` AS `conteoPromedioFinalizadas` from (((select month(`tesh`.`fecha_hora_asignacion`) AS `mes`,min(cast(`tesh`.`fecha_hora_asignacion` as date)) AS `FechaInicioMes` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month group by month(`tesh`.`fecha_hora_asignacion`)) `Semanas` left join (select month(`tesh`.`fecha_hora_asignacion`) AS `mes`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month and `tesh`.`id_estatus` in (1,20,22,23) group by month(`tesh`.`fecha_hora_asignacion`),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p')) `AnalisisMensual` on(`AnalisisMensual`.`mes` = `Semanas`.`mes`)) left join (select `Promedio`.`hora` AS `hora`,avg(`Promedio`.`conteoPromedioFinalizadas`) AS `conteoPromedioFinalizadas` from (select month(`tesh`.`fecha_hora_asignacion`) AS `mes`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,count(0) AS `conteoPromedioFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= last_day(curdate()) + interval 1 day - interval 7 month and `tesh`.`fecha_hora_asignacion` < last_day(curdate()) + interval 1 day - interval 1 month and `tesh`.`id_estatus` in (1,20,22,23) group by month(`tesh`.`fecha_hora_asignacion`),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p')) `Promedio` group by `Promedio`.`hora`) `PromedioMensual` on(`AnalisisMensual`.`hora` = `PromedioMensual`.`hora`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_terminadas_semanal`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_terminadas_semanal`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_terminadas_semanal` AS select `Semanas`.`semana` AS `semana`,`Semanas`.`FechaInicioSemana` AS `FechaInicioSemana`,concat(substr(`AnalisisSemanal`.`hora`,3,2),' - ',substr(`AnalisisSemanal`.`hora`,1,2),' - ',format(`PromedioSemanal`.`conteoPromedioFinalizadas`,0)) AS `hora`,`AnalisisSemanal`.`id_estatus` AS `id_estatus`,`AnalisisSemanal`.`conteoFinalizadas` AS `conteoFinalizadas`,`PromedioSemanal`.`conteoPromedioFinalizadas` AS `conteoPromedioFinalizadas` from (((select week(`tesh`.`fecha_hora_asignacion`,3) AS `semana`,min(cast(`tesh`.`fecha_hora_asignacion` as date)) AS `FechaInicioSemana` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day group by week(`tesh`.`fecha_hora_asignacion`,3)) `Semanas` left join (select week(`tesh`.`fecha_hora_asignacion`,3) AS `semana`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,`tesh`.`id_estatus` AS `id_estatus`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tesh`.`id_estatus` in (1,20,22,23) group by week(`tesh`.`fecha_hora_asignacion`,3),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),`tesh`.`id_estatus`) `AnalisisSemanal` on(`AnalisisSemanal`.`semana` = `Semanas`.`semana`)) left join (select `Promedio`.`hora` AS `hora`,`Promedio`.`id_estatus` AS `id_estatus`,avg(`Promedio`.`conteoPromedioFinalizadas`) AS `conteoPromedioFinalizadas` from (select week(`tesh`.`fecha_hora_asignacion`,3) AS `semana`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,`tesh`.`id_estatus` AS `id_estatus`,count(0) AS `conteoPromedioFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tesh`.`id_estatus` in (1,20,22,23) group by week(`tesh`.`fecha_hora_asignacion`,3),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),`tesh`.`id_estatus`) `Promedio` group by `Promedio`.`hora`,`Promedio`.`id_estatus`) `PromedioSemanal` on(`AnalisisSemanal`.`hora` = `PromedioSemanal`.`hora` and `AnalisisSemanal`.`id_estatus` = `PromedioSemanal`.`id_estatus`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_terminadas_semanal_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_terminadas_semanal_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_terminadas_semanal_totales` AS select `Semanas`.`semana` AS `semana`,`Semanas`.`FechaInicioSemana` AS `FechaInicioSemana`,concat(substr(`AnalisisSemanal`.`hora`,3,2),' - ',substr(`AnalisisSemanal`.`hora`,1,2),' - ',format(`PromedioSemanal`.`conteoPromedioFinalizadas`,0)) AS `hora`,`AnalisisSemanal`.`conteoFinalizadas` AS `conteoFinalizadas`,format(`PromedioSemanal`.`conteoPromedioFinalizadas`,2) AS `conteoPromedioFinalizadas` from (((select week(`tesh`.`fecha_hora_asignacion`,3) AS `semana`,min(cast(`tesh`.`fecha_hora_asignacion` as date)) AS `FechaInicioSemana` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day group by week(`tesh`.`fecha_hora_asignacion`,3)) `Semanas` left join (select week(`tesh`.`fecha_hora_asignacion`,3) AS `semana`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tesh`.`id_estatus` in (1,20,22,23) group by week(`tesh`.`fecha_hora_asignacion`,3),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p')) `AnalisisSemanal` on(`AnalisisSemanal`.`semana` = `Semanas`.`semana`)) left join (select `Promedio`.`hora` AS `hora`,avg(`Promedio`.`conteoPromedioFinalizadas`) AS `conteoPromedioFinalizadas` from (select week(`tesh`.`fecha_hora_asignacion`,3) AS `semana`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,count(0) AS `conteoPromedioFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week - interval dayofweek(curdate()) - 2 day and `tesh`.`id_estatus` in (1,20,22,23) group by week(`tesh`.`fecha_hora_asignacion`,3),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p')) `Promedio` group by `Promedio`.`hora`) `PromedioSemanal` on(`AnalisisSemanal`.`hora` = `PromedioSemanal`.`hora`)) */;

--
-- Final view structure for view `vw_vista_dias_semana_hora`
--

/*!50001 DROP VIEW IF EXISTS `vw_vista_dias_semana_hora`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vista_dias_semana_hora` AS select `fechas`.`fecha` AS `fecha`,`fechas`.`diaHora` AS `diaHora`,`fechas`.`diasemana` AS `diasemana`,`fechas`.`hora` AS `hora`,`fechas`.`horas` AS `horas` from (select `dias`.`fecha` AS `fecha`,`dias`.`diaHora` AS `diaHora`,`dias`.`diasemana` AS `diasemana`,`horas`.`hora` AS `hora`,`horas`.`horas` AS `horas` from ((select curdate() AS `fecha`,cast(curdate() as datetime) AS `diaHora`,dayofweek(cast(curdate() as datetime)) AS `diasemana` union select curdate() - interval 1 day AS `CURRENT_DATE() - INTERVAL  1 day`,cast(curdate() - interval 1 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 1 day as datetime)) AS `diasemana` union select curdate() - interval 2 day AS `CURRENT_DATE() - INTERVAL  2 day`,cast(curdate() - interval 2 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 2 day as datetime)) AS `diasemana` union select curdate() - interval 3 day AS `CURRENT_DATE() - INTERVAL  3 day`,cast(curdate() - interval 3 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 3 day as datetime)) AS `diasemana` union select curdate() - interval 4 day AS `CURRENT_DATE() - INTERVAL  4 day`,cast(curdate() - interval 4 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 4 day as datetime)) AS `diasemana` union select curdate() - interval 5 day AS `CURRENT_DATE() - INTERVAL  5 day`,cast(curdate() - interval 5 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 5 day as datetime)) AS `diasemana` union select curdate() - interval 6 day AS `CURRENT_DATE() - INTERVAL  6 day`,cast(curdate() - interval 6 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 6 day as datetime)) AS `diasemana` union select curdate() - interval 7 day AS `CURRENT_DATE() - INTERVAL  7 day`,cast(curdate() - interval 7 day as datetime) AS `diaHora`,dayofweek(cast(curdate() - interval 7 day as datetime)) AS `diasemana`) `dias` join (select time_format(cast(curdate() as datetime),'%h%p') AS `hora`,0 AS `horas` union select time_format(cast(curdate() as datetime) + interval 1 hour,'%h%p') AS `hora`,1 AS `horas` union select time_format(cast(curdate() as datetime) + interval 2 hour,'%h%p') AS `hora`,2 AS `horas` union select time_format(cast(curdate() as datetime) + interval 3 hour,'%h%p') AS `hora`,3 AS `horas` union select time_format(cast(curdate() as datetime) + interval 4 hour,'%h%p') AS `hora`,4 AS `horas` union select time_format(cast(curdate() as datetime) + interval 5 hour,'%h%p') AS `hora`,5 AS `horas` union select time_format(cast(curdate() as datetime) + interval 6 hour,'%h%p') AS `hora`,6 AS `horas` union select time_format(cast(curdate() as datetime) + interval 7 hour,'%h%p') AS `hora`,7 AS `horas` union select time_format(cast(curdate() as datetime) + interval 8 hour,'%h%p') AS `hora`,8 AS `horas` union select time_format(cast(curdate() as datetime) + interval 9 hour,'%h%p') AS `hora`,9 AS `horas` union select time_format(cast(curdate() as datetime) + interval 10 hour,'%h%p') AS `hora`,10 AS `horas` union select time_format(cast(curdate() as datetime) + interval 11 hour,'%h%p') AS `hora`,11 AS `horas` union select time_format(cast(curdate() as datetime) + interval 12 hour,'%h%p') AS `hora`,12 AS `horas` union select time_format(cast(curdate() as datetime) + interval 13 hour,'%h%p') AS `hora`,13 AS `horas` union select time_format(cast(curdate() as datetime) + interval 14 hour,'%h%p') AS `hora`,14 AS `horas` union select time_format(cast(curdate() as datetime) + interval 15 hour,'%h%p') AS `hora`,15 AS `horas` union select time_format(cast(curdate() as datetime) + interval 16 hour,'%h%p') AS `hora`,16 AS `horas` union select time_format(cast(curdate() as datetime) + interval 17 hour,'%h%p') AS `hora`,17 AS `horas` union select time_format(cast(curdate() as datetime) + interval 18 hour,'%h%p') AS `hora`,18 AS `horas` union select time_format(cast(curdate() as datetime) + interval 19 hour,'%h%p') AS `hora`,19 AS `horas` union select time_format(cast(curdate() as datetime) + interval 20 hour,'%h%p') AS `hora`,20 AS `horas` union select time_format(cast(curdate() as datetime) + interval 21 hour,'%h%p') AS `hora`,21 AS `horas` union select time_format(cast(curdate() as datetime) + interval 22 hour,'%h%p') AS `hora`,22 AS `horas` union select time_format(cast(curdate() as datetime) + interval 23 hour,'%h%p') AS `hora`,23 AS `horas`) `horas`)) `fechas` */;

--
-- Final view structure for view `vw_tablero_solicitud_VLSD`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitud_VLSD`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitud_VLSD` AS select `vvdsh`.`fecha` AS `fecha`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`analisisSemanal`.`conteoFinalizadas`,0)) AS `conteoFinalizadas`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Analaisis12Semanas`.`PromedioFinalizadas`,0)) AS `PromedioFinalizadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()` from ((`vw_vista_dias_semana_hora` `vvdsh` left join (select `t`.`hora` AS `hora`,`t`.`diasemana` AS `diasemana`,avg(`t`.`conteoFinalizadas`) AS `PromedioFinalizadas` from (select cast(`tesh`.`fecha_hora_asignacion` as date) AS `fecha`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0) AS `diasemana`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week and `tesh`.`id_estatus` = 20 group by cast(`tesh`.`fecha_hora_asignacion` as date),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0)) `t` group by `t`.`hora`,`t`.`diasemana`) `Analaisis12Semanas` on(`vvdsh`.`hora` = `Analaisis12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `Analaisis12Semanas`.`diasemana`)) left join (select cast(`tesh`.`fecha_hora_asignacion` as date) AS `fecha`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,dayofweek(`tesh`.`fecha_hora_asignacion`) AS `diasemana`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 7 day and `tesh`.`id_estatus` = 20 group by cast(`tesh`.`fecha_hora_asignacion` as date),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),dayofweek(`tesh`.`fecha_hora_asignacion`)) `analisisSemanal` on(`vvdsh`.`fecha` = `analisisSemanal`.`fecha` and `vvdsh`.`hora` = `analisisSemanal`.`hora` and `vvdsh`.`diasemana` = `analisisSemanal`.`diasemana`)) */;

--
-- Final view structure for view `vw_tablero_solicitud_terminada_exitosamente`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitud_terminada_exitosamente`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitud_terminada_exitosamente` AS select `vvdsh`.`fecha` AS `fecha`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`analisisSemanal`.`conteoFinalizadas`,0)) AS `conteoFinalizadas`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Analaisis12Semanas`.`PromedioFinalizadas`,0)) AS `PromedioFinalizadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()` from ((`vw_vista_dias_semana_hora` `vvdsh` left join (select `t`.`hora` AS `hora`,`t`.`diasemana` AS `diasemana`,avg(`t`.`conteoFinalizadas`) AS `PromedioFinalizadas` from (select cast(`tesh`.`fecha_hora_asignacion` as date) AS `fecha`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0) AS `diasemana`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week and `tesh`.`id_estatus` = 1 group by cast(`tesh`.`fecha_hora_asignacion` as date),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0)) `t` group by `t`.`hora`,`t`.`diasemana`) `Analaisis12Semanas` on(`vvdsh`.`hora` = `Analaisis12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `Analaisis12Semanas`.`diasemana`)) left join (select cast(`tesh`.`fecha_hora_asignacion` as date) AS `fecha`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,dayofweek(`tesh`.`fecha_hora_asignacion`) AS `diasemana`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 7 day and `tesh`.`id_estatus` = 1 group by cast(`tesh`.`fecha_hora_asignacion` as date),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),dayofweek(`tesh`.`fecha_hora_asignacion`)) `analisisSemanal` on(`vvdsh`.`fecha` = `analisisSemanal`.`fecha` and `vvdsh`.`hora` = `analisisSemanal`.`hora` and `vvdsh`.`diasemana` = `analisisSemanal`.`diasemana`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas` AS select if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Iniciadas7Dias`.`conteoIniciadas`,0)) AS `conteoIniciadas`,`vvdsh`.`fecha` AS `fechaInicio`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`PromedioIniciadas12Semanas`.`PromedioIniciadas`,0)) AS `PromedioIniciadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()` from ((`vw_vista_dias_semana_hora` `vvdsh` left join (select `Iniciadas12Semanas`.`hora` AS `hora`,`Iniciadas12Semanas`.`diasemana` AS `diasemana`,avg(`Iniciadas12Semanas`.`conteoIniciadas`) AS `PromedioIniciadas` from (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0) AS `diasemana` from ((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) where `ts`.`fecha_creacion` >= curdate() - interval 12 week and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0)) `Iniciadas12Semanas` group by `Iniciadas12Semanas`.`hora`,`Iniciadas12Semanas`.`diasemana`) `PromedioIniciadas12Semanas` on(`vvdsh`.`hora` = `PromedioIniciadas12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `PromedioIniciadas12Semanas`.`diasemana`)) left join (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) AS `diasemana` from ((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) where `ts`.`fecha_creacion` >= curdate() - interval 7 day and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)))) `Iniciadas7Dias` on(`vvdsh`.`fecha` = `Iniciadas7Dias`.`fechaInicio` and `vvdsh`.`hora` = `Iniciadas7Dias`.`hora` and `vvdsh`.`diasemana` = `Iniciadas7Dias`.`diasemana`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas_cortas_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas_cortas_status`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas_cortas_status` AS select `PromedioIniciadas12Semanas`.`solicitud_larga` AS `solicitud_larga`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Iniciadas7Dias`.`conteoIniciadas`,0)) AS `conteoIniciadas`,`vvdsh`.`fecha` AS `fechaInicio`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`PromedioIniciadas12Semanas`.`PromedioIniciadas`,0)) AS `PromedioIniciadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()`,`PromedioIniciadas12Semanas`.`id_estatus` AS `id_estatus`,`ces`.`estatus` AS `estatus` from (((`vw_vista_dias_semana_hora` `vvdsh` left join (select `Iniciadas12Semanas`.`solicitud_larga` AS `solicitud_larga`,`Iniciadas12Semanas`.`id_estatus` AS `id_estatus`,`Iniciadas12Semanas`.`hora` AS `hora`,`Iniciadas12Semanas`.`diasemana` AS `diasemana`,avg(`Iniciadas12Semanas`.`conteoIniciadas`) AS `PromedioIniciadas` from (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,`ts`.`solicitud_larga` AS `solicitud_larga`,`tesh`.`id_estatus` AS `id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 12 week and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by `ts`.`solicitud_larga`,`tesh`.`id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0)) `Iniciadas12Semanas` group by `Iniciadas12Semanas`.`solicitud_larga`,`Iniciadas12Semanas`.`id_estatus`,`Iniciadas12Semanas`.`hora`,`Iniciadas12Semanas`.`diasemana`) `PromedioIniciadas12Semanas` on(`vvdsh`.`hora` = `PromedioIniciadas12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `PromedioIniciadas12Semanas`.`diasemana`)) left join (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,`ts`.`solicitud_larga` AS `solicitud_larga`,`tesh`.`id_estatus` AS `id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 7 day and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by `ts`.`solicitud_larga`,`tesh`.`id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)))) `Iniciadas7Dias` on(`vvdsh`.`fecha` = `Iniciadas7Dias`.`fechaInicio` and `vvdsh`.`hora` = `Iniciadas7Dias`.`hora` and `vvdsh`.`diasemana` = `Iniciadas7Dias`.`diasemana` and `PromedioIniciadas12Semanas`.`solicitud_larga` = `Iniciadas7Dias`.`solicitud_larga` and `PromedioIniciadas12Semanas`.`id_estatus` = `Iniciadas7Dias`.`id_estatus`)) left join `cat_estatus_solicitud` `ces` on(`PromedioIniciadas12Semanas`.`id_estatus` = `ces`.`id_estatus`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas_cortas_status_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas_cortas_status_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas_cortas_status_totales` AS select if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Iniciadas7Dias`.`conteoIniciadas`,0)) AS `conteoIniciadas`,`vvdsh`.`fecha` AS `fechaInicio`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`PromedioIniciadas12Semanas`.`PromedioIniciadas`,0)) AS `PromedioIniciadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()`,`PromedioIniciadas12Semanas`.`id_estatus` AS `id_estatus`,`ces`.`estatus` AS `estatus` from (((`vw_vista_dias_semana_hora` `vvdsh` left join (select `Iniciadas12Semanas`.`id_estatus` AS `id_estatus`,`Iniciadas12Semanas`.`hora` AS `hora`,`Iniciadas12Semanas`.`diasemana` AS `diasemana`,avg(`Iniciadas12Semanas`.`conteoIniciadas`) AS `PromedioIniciadas` from (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,`tesh`.`id_estatus` AS `id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 12 week and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by `tesh`.`id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0)) `Iniciadas12Semanas` group by `Iniciadas12Semanas`.`id_estatus`,`Iniciadas12Semanas`.`hora`,`Iniciadas12Semanas`.`diasemana`) `PromedioIniciadas12Semanas` on(`vvdsh`.`hora` = `PromedioIniciadas12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `PromedioIniciadas12Semanas`.`diasemana`)) left join (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,`tesh`.`id_estatus` AS `id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 7 day and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by `tesh`.`id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)))) `Iniciadas7Dias` on(`vvdsh`.`fecha` = `Iniciadas7Dias`.`fechaInicio` and `vvdsh`.`hora` = `Iniciadas7Dias`.`hora` and `vvdsh`.`diasemana` = `Iniciadas7Dias`.`diasemana` and `PromedioIniciadas12Semanas`.`id_estatus` = `Iniciadas7Dias`.`id_estatus`)) left join `cat_estatus_solicitud` `ces` on(`PromedioIniciadas12Semanas`.`id_estatus` = `ces`.`id_estatus`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas_status_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas_status_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas_status_totales` AS select if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Iniciadas7Dias`.`conteoIniciadas`,0)) AS `conteoIniciadas`,`vvdsh`.`fecha` AS `fechaInicio`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`PromedioIniciadas12Semanas`.`PromedioIniciadas`,0)) AS `PromedioIniciadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()`,`PromedioIniciadas12Semanas`.`id_estatus` AS `id_estatus`,`ces`.`estatus` AS `estatus` from (((`vw_vista_dias_semana_hora` `vvdsh` left join (select `Iniciadas12Semanas`.`id_estatus` AS `id_estatus`,`Iniciadas12Semanas`.`hora` AS `hora`,`Iniciadas12Semanas`.`diasemana` AS `diasemana`,avg(`Iniciadas12Semanas`.`conteoIniciadas`) AS `PromedioIniciadas` from (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,`tesh`.`id_estatus` AS `id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 12 week and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by `tesh`.`id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0)) `Iniciadas12Semanas` group by `Iniciadas12Semanas`.`id_estatus`,`Iniciadas12Semanas`.`hora`,`Iniciadas12Semanas`.`diasemana`) `PromedioIniciadas12Semanas` on(`vvdsh`.`hora` = `PromedioIniciadas12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `PromedioIniciadas12Semanas`.`diasemana`)) left join (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,`tesh`.`id_estatus` AS `id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 7 day and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by `tesh`.`id_estatus`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)))) `Iniciadas7Dias` on(`vvdsh`.`fecha` = `Iniciadas7Dias`.`fechaInicio` and `vvdsh`.`hora` = `Iniciadas7Dias`.`hora` and `vvdsh`.`diasemana` = `Iniciadas7Dias`.`diasemana` and `PromedioIniciadas12Semanas`.`id_estatus` = `Iniciadas7Dias`.`id_estatus`)) left join `cat_estatus_solicitud` `ces` on(`PromedioIniciadas12Semanas`.`id_estatus` = `ces`.`id_estatus`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_iniciadas_totales`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_iniciadas_totales`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_iniciadas_totales` AS select if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Iniciadas7Dias`.`conteoIniciadas`,0)) AS `conteoIniciadas`,`vvdsh`.`fecha` AS `fechaInicio`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2),' - ',cast(ifnull(`PromedioIniciadas12Semanas`.`PromedioIniciadas`,0) as signed)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`PromedioIniciadas12Semanas`.`PromedioIniciadas`,0)) AS `PromedioIniciadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()` from ((`vw_vista_dias_semana_hora` `vvdsh` left join (select `Iniciadas12Semanas`.`hora` AS `hora`,`Iniciadas12Semanas`.`diasemana` AS `diasemana`,avg(`Iniciadas12Semanas`.`conteoIniciadas`) AS `PromedioIniciadas` from (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 12 week and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),if(dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) in (2,3,4,5,6),1,0)) `Iniciadas12Semanas` group by `Iniciadas12Semanas`.`hora`,`Iniciadas12Semanas`.`diasemana`) `PromedioIniciadas12Semanas` on(`vvdsh`.`hora` = `PromedioIniciadas12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `PromedioIniciadas12Semanas`.`diasemana`)) left join (select count(distinct `ts`.`id_solicitud`) AS `conteoIniciadas`,ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)) AS `fechaInicio`,ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')) AS `hora`,dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date))) AS `diasemana` from (((`tbl_solicitud` `ts` left join `tbl_eventos_webhook` `tew` on(`ts`.`id_solicitud` = `tew`.`id_solicitud` and `tew`.`id_fase` = 3)) left join `tbl_eventos_webhook` `tew1` on(`ts`.`id_solicitud` = `tew1`.`id_solicitud` and `tew1`.`id_fase` = 4)) left join `tbl_estatus_solicitud_hist` `tesh` on(`tesh`.`id_solicitud` = `ts`.`id_solicitud` and `tesh`.`ultimo` = 1)) where `ts`.`fecha_creacion` >= curdate() - interval 7 day and (`tew`.`id_solicitud` is not null or `tew1`.`id_solicitud` is not null) group by ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)),ifnull(time_format(`tew`.`fecha_hora_envio`,'%h%p'),time_format(`tew1`.`fecha_hora_envio`,'%h%p')),dayofweek(ifnull(cast(`tew`.`fecha_hora_envio` as date),cast(`tew1`.`fecha_hora_envio` as date)))) `Iniciadas7Dias` on(`vvdsh`.`fecha` = `Iniciadas7Dias`.`fechaInicio` and `vvdsh`.`hora` = `Iniciadas7Dias`.`hora` and `vvdsh`.`diasemana` = `Iniciadas7Dias`.`diasemana`)) */;

--
-- Final view structure for view `vw_tablero_solicitudes_terminadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_tablero_solicitudes_terminadas`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tablero_solicitudes_terminadas` AS select `vvdsh`.`fecha` AS `fecha`,concat(substr(`vvdsh`.`hora`,3,2),' - ',substr(`vvdsh`.`hora`,1,2)) AS `hora`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`analisisSemanal`.`conteoFinalizadas`,0)) AS `conteoFinalizadas`,if(`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour > current_timestamp(),NULL,ifnull(`Analaisis12Semanas`.`PromedioFinalizadas`,0)) AS `PromedioFinalizadas`,`vvdsh`.`diaHora` + interval `vvdsh`.`horas` hour AS `diaHora + interval horas hour`,current_timestamp() AS `CURRENT_TIMESTAMP()` from ((`vw_vista_dias_semana_hora` `vvdsh` left join (select `t`.`hora` AS `hora`,`t`.`diasemana` AS `diasemana`,avg(`t`.`conteoFinalizadas`) AS `PromedioFinalizadas` from (select cast(`tesh`.`fecha_hora_asignacion` as date) AS `fecha`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0) AS `diasemana`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 12 week and `tesh`.`id_estatus` in (1,20) group by cast(`tesh`.`fecha_hora_asignacion` as date),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),if(dayofweek(`tesh`.`fecha_hora_asignacion`) in (2,3,4,5,6),1,0)) `t` group by `t`.`hora`,`t`.`diasemana`) `Analaisis12Semanas` on(`vvdsh`.`hora` = `Analaisis12Semanas`.`hora` and if(`vvdsh`.`diasemana` in (2,3,4,5,6),1,0) = `Analaisis12Semanas`.`diasemana`)) left join (select cast(`tesh`.`fecha_hora_asignacion` as date) AS `fecha`,time_format(`tesh`.`fecha_hora_asignacion`,'%h%p') AS `hora`,dayofweek(`tesh`.`fecha_hora_asignacion`) AS `diasemana`,count(0) AS `conteoFinalizadas` from `tbl_estatus_solicitud_hist` `tesh` where `tesh`.`fecha_hora_asignacion` >= curdate() - interval 7 day and `tesh`.`id_estatus` in (1,20) group by cast(`tesh`.`fecha_hora_asignacion` as date),time_format(`tesh`.`fecha_hora_asignacion`,'%h%p'),dayofweek(`tesh`.`fecha_hora_asignacion`)) `analisisSemanal` on(`vvdsh`.`fecha` = `analisisSemanal`.`fecha` and `vvdsh`.`hora` = `analisisSemanal`.`hora` and `vvdsh`.`diasemana` = `analisisSemanal`.`diasemana`)) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-17 15:57:30

