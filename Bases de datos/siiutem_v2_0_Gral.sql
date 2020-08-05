-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2020 a las 18:06:38
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siiutem_v2.0`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academias`
--

CREATE TABLE `academias` (
  `academiaId` smallint(6) NOT NULL,
  `academiaName` varchar(30) NOT NULL,
  `academiaDesc` varchar(200) NOT NULL,
  `academiaDate` date DEFAULT curdate(),
  `presidenteAc` smallint(6) DEFAULT NULL,
  `secretarioAc` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `numCtrl` smallint(6) NOT NULL,
  `fechaReg` date DEFAULT curdate(),
  `personId` smallint(6) DEFAULT NULL,
  `grupoId` smallint(6) DEFAULT NULL,
  `tipoAlumno` enum('Nuevo Ingreso','Reingreso','Repetición','Intercambio') DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areaadscripcion`
--

CREATE TABLE `areaadscripcion` (
  `areaId` smallint(6) NOT NULL,
  `areaName` varchar(30) NOT NULL,
  `areaDesc` varchar(200) DEFAULT NULL,
  `deptoId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areasconocimiento`
--

CREATE TABLE `areasconocimiento` (
  `areaConId` smallint(6) NOT NULL,
  `areaConName` varchar(30) NOT NULL,
  `areaConDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asigmateria`
--

CREATE TABLE `asigmateria` (
  `asigId` smallint(6) NOT NULL,
  `docenteId` smallint(6) DEFAULT NULL,
  `materiaId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspirantes`
--

CREATE TABLE `aspirantes` (
  `aspId` smallint(6) NOT NULL,
  `folioMat` varchar(10) NOT NULL,
  `periodoId` smallint(6) DEFAULT NULL,
  `tipoAsp` enum('Alumno','Trabajador') DEFAULT NULL,
  `personId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biblioevpa`
--

CREATE TABLE `biblioevpa` (
  `biblioEvPAId` smallint(6) NOT NULL,
  `evalPAId` smallint(6) DEFAULT NULL,
  `biblioId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bibliografias`
--

CREATE TABLE `bibliografias` (
  `biblioId` smallint(6) NOT NULL,
  `tipoBiblio` varchar(30) DEFAULT NULL,
  `hojaAsId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidades`
--

CREATE TABLE `capacidades` (
  `capId` smallint(6) NOT NULL,
  `capDesc` mediumtext DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capunidades`
--

CREATE TABLE `capunidades` (
  `capUId` smallint(6) NOT NULL,
  `capId` smallint(6) DEFAULT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carraspirante`
--

CREATE TABLE `carraspirante` (
  `carrAspAl` smallint(6) NOT NULL,
  `carreraId` smallint(6) DEFAULT NULL,
  `aspId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `carreraId` smallint(6) NOT NULL,
  `cveCarrera` varchar(5) NOT NULL,
  `carreraName` varchar(40) NOT NULL,
  `carreraEsp` varchar(40) NOT NULL,
  `carreraDesc` varchar(200) NOT NULL,
  `directorId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias`
--

CREATE TABLE `competencias` (
  `compId` smallint(6) NOT NULL,
  `compTipo` varchar(30) NOT NULL,
  `compName` varchar(30) NOT NULL,
  `compDesc` varchar(200) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compmateria`
--

CREATE TABLE `compmateria` (
  `coMatId` smallint(6) NOT NULL,
  `hojaAsId` smallint(6) DEFAULT NULL,
  `compId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `deptoId` smallint(6) NOT NULL,
  `deptoName` varchar(30) NOT NULL,
  `deptoDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dethoragpo`
--

CREATE TABLE `dethoragpo` (
  `detHoraGpo` smallint(6) NOT NULL,
  `materiaId` smallint(6) DEFAULT NULL,
  `horaGpoId` smallint(6) DEFAULT NULL,
  `hrInicio` time DEFAULT NULL,
  `hrFin` time DEFAULT NULL,
  `diaSem` varchar(10) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detmetunipa`
--

CREATE TABLE `detmetunipa` (
  `detMtUPAId` smallint(6) NOT NULL,
  `metEnsId` smallint(6) DEFAULT NULL,
  `dPAcaId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detplanaca`
--

CREATE TABLE `detplanaca` (
  `dPAcaId` smallint(6) NOT NULL,
  `planAcId` smallint(6) DEFAULT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detplanclase`
--

CREATE TABLE `detplanclase` (
  `detPCId` smallint(6) NOT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `planClaseId` smallint(6) DEFAULT NULL,
  `temaId` smallint(6) DEFAULT NULL,
  `detPCSesion` smallint(6) DEFAULT NULL,
  `detPCfechaImp` date DEFAULT NULL,
  `detPCObs` mediumtext DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `dirId` smallint(6) NOT NULL,
  `calleDir` varchar(35) NOT NULL,
  `numExtDir` varchar(10) NOT NULL,
  `numIntDir` varchar(10) DEFAULT NULL,
  `codPostDir` mediumint(9) DEFAULT NULL,
  `personId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directorescarrera`
--

CREATE TABLE `directorescarrera` (
  `directorId` smallint(6) NOT NULL,
  `cveTrabajador` smallint(6) DEFAULT NULL,
  `feInicio` date DEFAULT curdate(),
  `feFin` date DEFAULT curdate(),
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docepaanexos`
--

CREATE TABLE `docepaanexos` (
  `docEPAAneId` smallint(6) NOT NULL,
  `evalPAId` smallint(6) DEFAULT NULL,
  `docEPAAneName` varchar(30) DEFAULT NULL,
  `docEPAAneUrl` varchar(100) DEFAULT NULL,
  `docEPAAneDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docintegrador`
--

CREATE TABLE `docintegrador` (
  `docInt` smallint(6) NOT NULL,
  `docIntUrl` varchar(100) DEFAULT NULL,
  `docIntName` varchar(30) DEFAULT NULL,
  `integradorId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `dctoId` smallint(6) NOT NULL,
  `dctoName` varchar(30) NOT NULL,
  `dctoDesc` mediumtext DEFAULT NULL,
  `dctoUrl` varchar(50) NOT NULL,
  `personId` smallint(6) DEFAULT NULL,
  `tdocId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elabplanac`
--

CREATE TABLE `elabplanac` (
  `elabPADoc` smallint(6) NOT NULL,
  `docenteId` smallint(6) DEFAULT NULL,
  `planAcId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `mailId` smallint(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mailTipo` enum('Personal','Escolar','Trabajo','Otro') DEFAULT NULL,
  `personId` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaprepc`
--

CREATE TABLE `estaprepc` (
  `estAprePCId` smallint(6) NOT NULL,
  `estAPCName` varchar(30) DEFAULT NULL,
  `estAPCDesc` mediumtext DEFAULT NULL,
  `detPCId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evalpa`
--

CREATE TABLE `evalpa` (
  `evalPAId` smallint(6) NOT NULL,
  `evalPAAuto` tinyint(4) DEFAULT NULL,
  `evalPACoe` tinyint(4) DEFAULT NULL,
  `evalPAHete` tinyint(4) DEFAULT NULL,
  `evalPADia` tinyint(4) DEFAULT NULL,
  `evalPAForm` tinyint(4) DEFAULT NULL,
  `evalPASumat` tinyint(4) DEFAULT NULL,
  `dPAcaId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evalpc`
--

CREATE TABLE `evalpc` (
  `evalPCId` smallint(6) NOT NULL,
  `evalPCAuto` tinyint(4) DEFAULT NULL,
  `evalPCCoe` tinyint(4) DEFAULT NULL,
  `evalPCHete` tinyint(4) DEFAULT NULL,
  `planClaseId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidpc`
--

CREATE TABLE `evidpc` (
  `evidPCId` smallint(6) NOT NULL,
  `evidPCName` varchar(30) DEFAULT NULL,
  `evidPCDesc` mediumtext DEFAULT NULL,
  `detPCId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografias`
--

CREATE TABLE `fotografias` (
  `fotoId` smallint(6) NOT NULL,
  `fotoURL` varchar(50) NOT NULL,
  `fotoName` varchar(30) NOT NULL,
  `personId` smallint(6) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuentebiblio`
--

CREATE TABLE `fuentebiblio` (
  `fuenteId` smallint(6) NOT NULL,
  `fuenteName` varchar(100) NOT NULL,
  `fuenteDesc` varchar(200) DEFAULT NULL,
  `fuenteAutor` mediumtext DEFAULT NULL,
  `fuenteCiudad` varchar(30) DEFAULT NULL,
  `fuentePais` varchar(30) DEFAULT NULL,
  `fuenteEditorial` varchar(30) DEFAULT NULL,
  `fuenteTipo` varchar(20) DEFAULT NULL,
  `biblioId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `grupoId` smallint(6) NOT NULL,
  `cuatri` varchar(10) NOT NULL,
  `cveGpo` varchar(10) NOT NULL,
  `aula` varchar(10) DEFAULT NULL,
  `carreraId` smallint(6) DEFAULT NULL,
  `periodoId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hojaasignatura`
--

CREATE TABLE `hojaasignatura` (
  `hojaAsId` smallint(6) NOT NULL,
  `cuatri` varchar(10) NOT NULL,
  `objetivoMat` mediumtext DEFAULT NULL,
  `hrsTeoricas` smallint(6) DEFAULT NULL,
  `hrsPractica` smallint(6) DEFAULT NULL,
  `hrsSemana` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariogrupo`
--

CREATE TABLE `horariogrupo` (
  `horaGpoId` smallint(6) NOT NULL,
  `grupoId` smallint(6) DEFAULT NULL,
  `elaboroId` smallint(6) DEFAULT NULL,
  `autorizoId` smallint(6) DEFAULT NULL,
  `feElabHG` date DEFAULT NULL,
  `feAutHG` date DEFAULT NULL,
  `periodoId` smallint(6) DEFAULT NULL,
  `programaId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insteval`
--

CREATE TABLE `insteval` (
  `instId` smallint(6) NOT NULL,
  `instName` varchar(30) NOT NULL,
  `instDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instevalpc`
--

CREATE TABLE `instevalpc` (
  `instEvalPCId` smallint(6) NOT NULL,
  `instId` smallint(6) DEFAULT NULL,
  `detPCId` smallint(6) DEFAULT NULL,
  `instEvPCPorc` tinyint(4) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instevpa`
--

CREATE TABLE `instevpa` (
  `instEvPAId` smallint(6) NOT NULL,
  `evalPAId` smallint(6) DEFAULT NULL,
  `instId` smallint(6) DEFAULT NULL,
  `instEvPAPor` tinyint(4) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instunidad`
--

CREATE TABLE `instunidad` (
  `insuniId` smallint(6) NOT NULL,
  `instId` smallint(6) DEFAULT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrador`
--

CREATE TABLE `integrador` (
  `integradorId` smallint(6) NOT NULL,
  `inteDesc` mediumtext DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `locId` smallint(6) NOT NULL,
  `locName` varchar(100) NOT NULL,
  `locMun` varchar(30) NOT NULL,
  `locEdo` varchar(50) NOT NULL,
  `codPost` mediumint(9) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matdidactico`
--

CREATE TABLE `matdidactico` (
  `matDId` smallint(6) NOT NULL,
  `matDName` varchar(30) NOT NULL,
  `matDDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `materiaId` smallint(6) NOT NULL,
  `materiaName` varchar(50) NOT NULL,
  `programaId` smallint(6) DEFAULT NULL,
  `hojaAsId` smallint(6) DEFAULT NULL,
  `cveMateria` varchar(10) DEFAULT NULL,
  `areaconId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matunidad`
--

CREATE TABLE `matunidad` (
  `matuniId` smallint(6) NOT NULL,
  `matDId` smallint(6) DEFAULT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metenseñanza`
--

CREATE TABLE `metenseñanza` (
  `metEnsId` smallint(6) NOT NULL,
  `metEnsName` varchar(30) NOT NULL,
  `metEnsDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metunidad`
--

CREATE TABLE `metunidad` (
  `metuniId` smallint(6) NOT NULL,
  `metEnsId` smallint(6) DEFAULT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `passutem`
--

CREATE TABLE `passutem` (
  `passId` smallint(6) NOT NULL,
  `cvePersona` smallint(6) NOT NULL,
  `passPersona` varchar(32) NOT NULL,
  `createAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `periodoId` smallint(6) NOT NULL,
  `periodo` varchar(20) NOT NULL,
  `periodoY` smallint(6) NOT NULL,
  `periodoTipo` varchar(30) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `personId` smallint(6) NOT NULL,
  `personName` varchar(40) NOT NULL,
  `personLn1` varchar(40) DEFAULT NULL,
  `personLn2` varchar(40) DEFAULT NULL,
  `personSexo` enum('Masculino','Femenino') DEFAULT NULL,
  `personEciv` enum('Soltero/a','Comprometido/a','Casado/a','Unión libre','Separado/a','Divorciado/a','Viudo/a') DEFAULT NULL,
  `personFn` date NOT NULL,
  `personLn` smallint(6) DEFAULT NULL,
  `personNac` enum('Mexicana','Extranjera') DEFAULT NULL,
  `personCURP` varchar(25) NOT NULL,
  `personRFC` varchar(15) DEFAULT NULL,
  `personFoto` smallint(6) DEFAULT NULL,
  `personAct` tinyint(4) DEFAULT 0,
  `personCreate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planclase`
--

CREATE TABLE `planclase` (
  `planClaseId` smallint(6) NOT NULL,
  `planClaseName` varchar(30) NOT NULL,
  `planClaseDesc` varchar(200) DEFAULT NULL,
  `cveTrabajador` smallint(6) DEFAULT NULL,
  `materiaId` smallint(6) DEFAULT NULL,
  `deptoId` smallint(6) DEFAULT NULL,
  `academiaId` smallint(6) DEFAULT NULL,
  `grupoId` smallint(6) DEFAULT NULL,
  `periodoId` smallint(6) DEFAULT NULL,
  `compId` smallint(6) DEFAULT NULL,
  `capId` smallint(6) DEFAULT NULL,
  `numTProg` tinyint(4) DEFAULT NULL,
  `numTI` tinyint(4) DEFAULT NULL,
  `feElabPC` date DEFAULT NULL,
  `feAutPC` date DEFAULT NULL,
  `presidenteAc` smallint(6) DEFAULT NULL,
  `directorId` smallint(6) DEFAULT NULL,
  `statusPClase` enum('Borrador','Creado','En revisión','Aprobado con Observaciones','Rechazado con Observaciones','Rechazado','Aceptado') DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeacionacademica`
--

CREATE TABLE `planeacionacademica` (
  `planAcId` smallint(6) NOT NULL,
  `planAcName` varchar(20) NOT NULL,
  `planAcDesc` varchar(200) DEFAULT NULL,
  `academiaId` smallint(6) DEFAULT NULL,
  `materiaId` smallint(6) DEFAULT NULL,
  `tCrusoId` smallint(6) DEFAULT NULL,
  `deptoId` smallint(6) DEFAULT NULL,
  `integradorId` smallint(6) DEFAULT NULL,
  `feElabPA` date DEFAULT NULL,
  `feAutPA` date DEFAULT NULL,
  `statusPAc` enum('Borrador','Creado','En revisión','Aprobado con Observaciones','Rechazado con Observaciones','Rechazado','Aceptado') DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programaaeducativo`
--

CREATE TABLE `programaaeducativo` (
  `programaId` smallint(6) NOT NULL,
  `programaName` varchar(30) NOT NULL,
  `cvePrograma` varchar(30) DEFAULT NULL,
  `programaY` varchar(4) DEFAULT NULL,
  `carreraId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `puestoId` smallint(6) NOT NULL,
  `puestoName` varchar(30) NOT NULL,
  `puestoDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segplanclase`
--

CREATE TABLE `segplanclase` (
  `segPCId` smallint(6) NOT NULL,
  `segPCFecha` date DEFAULT NULL,
  `numCtrl` smallint(6) DEFAULT NULL,
  `tutorId` smallint(6) DEFAULT NULL,
  `planClaseId` smallint(6) DEFAULT NULL,
  `segPCObsA` mediumtext DEFAULT NULL,
  `segPCObsT` mediumtext DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `telId` smallint(6) NOT NULL,
  `telNum` varchar(15) NOT NULL,
  `telTipo` enum('Casa','Celular','Oficina','Otro') DEFAULT NULL,
  `telExt` smallint(6) DEFAULT NULL,
  `personId` smallint(6) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temaunidad`
--

CREATE TABLE `temaunidad` (
  `temaId` smallint(6) NOT NULL,
  `temaName` varchar(30) NOT NULL,
  `saberTema` mediumtext DEFAULT NULL,
  `serTema` mediumtext DEFAULT NULL,
  `sabSerTema` mediumtext DEFAULT NULL,
  `unidadId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocurso`
--

CREATE TABLE `tipocurso` (
  `tCrusoId` smallint(6) NOT NULL,
  `tCursoName` varchar(30) NOT NULL,
  `tCursoDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `tdocId` smallint(6) NOT NULL,
  `tdName` varchar(50) NOT NULL,
  `tdDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotrabajador`
--

CREATE TABLE `tipotrabajador` (
  `tipoTrab` smallint(6) NOT NULL,
  `tTName` varchar(30) NOT NULL,
  `tTDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `cveTrabajador` smallint(6) NOT NULL,
  `personId` smallint(6) DEFAULT NULL,
  `areaAdsc` smallint(6) DEFAULT NULL,
  `puestoId` smallint(6) DEFAULT NULL,
  `tipoTrab` smallint(6) DEFAULT NULL,
  `academiaId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `tutorId` smallint(6) NOT NULL,
  `cveTrabajador` smallint(6) DEFAULT NULL,
  `cveGrupo` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `unidadId` smallint(6) NOT NULL,
  `unidadName` varchar(30) NOT NULL,
  `unidadObj` varchar(200) DEFAULT NULL,
  `hrsTUnidad` smallint(6) DEFAULT NULL,
  `hrsPUnidad` smallint(6) DEFAULT NULL,
  `resultAp` mediumtext DEFAULT NULL,
  `secAp` text DEFAULT NULL,
  `hojaAsId` smallint(6) DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academias`
--
ALTER TABLE `academias`
  ADD PRIMARY KEY (`academiaId`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`numCtrl`),
  ADD KEY `personId` (`personId`);

--
-- Indices de la tabla `areaadscripcion`
--
ALTER TABLE `areaadscripcion`
  ADD PRIMARY KEY (`areaId`),
  ADD KEY `deptoId` (`deptoId`);

--
-- Indices de la tabla `areasconocimiento`
--
ALTER TABLE `areasconocimiento`
  ADD PRIMARY KEY (`areaConId`);

--
-- Indices de la tabla `asigmateria`
--
ALTER TABLE `asigmateria`
  ADD PRIMARY KEY (`asigId`),
  ADD KEY `docenteId` (`docenteId`),
  ADD KEY `materiaId` (`materiaId`);

--
-- Indices de la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD PRIMARY KEY (`aspId`),
  ADD KEY `personId` (`personId`);

--
-- Indices de la tabla `biblioevpa`
--
ALTER TABLE `biblioevpa`
  ADD PRIMARY KEY (`biblioEvPAId`),
  ADD KEY `evalPAId` (`evalPAId`);

--
-- Indices de la tabla `bibliografias`
--
ALTER TABLE `bibliografias`
  ADD PRIMARY KEY (`biblioId`),
  ADD KEY `hojaAsId` (`hojaAsId`);

--
-- Indices de la tabla `capacidades`
--
ALTER TABLE `capacidades`
  ADD PRIMARY KEY (`capId`);

--
-- Indices de la tabla `capunidades`
--
ALTER TABLE `capunidades`
  ADD PRIMARY KEY (`capUId`),
  ADD KEY `capId` (`capId`),
  ADD KEY `unidadId` (`unidadId`);

--
-- Indices de la tabla `carraspirante`
--
ALTER TABLE `carraspirante`
  ADD PRIMARY KEY (`carrAspAl`),
  ADD KEY `aspId` (`aspId`),
  ADD KEY `carreraId` (`carreraId`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`carreraId`),
  ADD KEY `directorId` (`directorId`);

--
-- Indices de la tabla `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`compId`);

--
-- Indices de la tabla `compmateria`
--
ALTER TABLE `compmateria`
  ADD PRIMARY KEY (`coMatId`),
  ADD KEY `hojaAsId` (`hojaAsId`),
  ADD KEY `compId` (`compId`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`deptoId`);

--
-- Indices de la tabla `dethoragpo`
--
ALTER TABLE `dethoragpo`
  ADD PRIMARY KEY (`detHoraGpo`),
  ADD KEY `horaGpoId` (`horaGpoId`);

--
-- Indices de la tabla `detmetunipa`
--
ALTER TABLE `detmetunipa`
  ADD PRIMARY KEY (`detMtUPAId`),
  ADD KEY `metEnsId` (`metEnsId`),
  ADD KEY `dPAcaId` (`dPAcaId`);

--
-- Indices de la tabla `detplanaca`
--
ALTER TABLE `detplanaca`
  ADD PRIMARY KEY (`dPAcaId`),
  ADD KEY `planAcId` (`planAcId`),
  ADD KEY `unidadId` (`unidadId`);

--
-- Indices de la tabla `detplanclase`
--
ALTER TABLE `detplanclase`
  ADD PRIMARY KEY (`detPCId`),
  ADD KEY `planClaseId` (`planClaseId`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`dirId`),
  ADD KEY `personId` (`personId`),
  ADD KEY `codPostDir` (`codPostDir`);

--
-- Indices de la tabla `directorescarrera`
--
ALTER TABLE `directorescarrera`
  ADD PRIMARY KEY (`directorId`),
  ADD KEY `cveTrabajador` (`cveTrabajador`);

--
-- Indices de la tabla `docepaanexos`
--
ALTER TABLE `docepaanexos`
  ADD PRIMARY KEY (`docEPAAneId`),
  ADD KEY `evalPAId` (`evalPAId`);

--
-- Indices de la tabla `docintegrador`
--
ALTER TABLE `docintegrador`
  ADD PRIMARY KEY (`docInt`),
  ADD KEY `integradorId` (`integradorId`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`dctoId`),
  ADD KEY `personId` (`personId`),
  ADD KEY `tdocId` (`tdocId`);

--
-- Indices de la tabla `elabplanac`
--
ALTER TABLE `elabplanac`
  ADD PRIMARY KEY (`elabPADoc`),
  ADD KEY `docenteId` (`docenteId`),
  ADD KEY `planAcId` (`planAcId`);

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`mailId`),
  ADD KEY `personId` (`personId`);

--
-- Indices de la tabla `estaprepc`
--
ALTER TABLE `estaprepc`
  ADD PRIMARY KEY (`estAprePCId`),
  ADD KEY `detPCId` (`detPCId`);

--
-- Indices de la tabla `evalpa`
--
ALTER TABLE `evalpa`
  ADD PRIMARY KEY (`evalPAId`),
  ADD KEY `dPAcaId` (`dPAcaId`);

--
-- Indices de la tabla `evalpc`
--
ALTER TABLE `evalpc`
  ADD PRIMARY KEY (`evalPCId`),
  ADD KEY `planClaseId` (`planClaseId`);

--
-- Indices de la tabla `evidpc`
--
ALTER TABLE `evidpc`
  ADD PRIMARY KEY (`evidPCId`),
  ADD KEY `detPCId` (`detPCId`);

--
-- Indices de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD PRIMARY KEY (`fotoId`),
  ADD KEY `personId` (`personId`);

--
-- Indices de la tabla `fuentebiblio`
--
ALTER TABLE `fuentebiblio`
  ADD PRIMARY KEY (`fuenteId`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`grupoId`);

--
-- Indices de la tabla `hojaasignatura`
--
ALTER TABLE `hojaasignatura`
  ADD PRIMARY KEY (`hojaAsId`);

--
-- Indices de la tabla `horariogrupo`
--
ALTER TABLE `horariogrupo`
  ADD PRIMARY KEY (`horaGpoId`),
  ADD KEY `grupoId` (`grupoId`);

--
-- Indices de la tabla `insteval`
--
ALTER TABLE `insteval`
  ADD PRIMARY KEY (`instId`);

--
-- Indices de la tabla `instevalpc`
--
ALTER TABLE `instevalpc`
  ADD PRIMARY KEY (`instEvalPCId`),
  ADD KEY `detPCId` (`detPCId`);

--
-- Indices de la tabla `instevpa`
--
ALTER TABLE `instevpa`
  ADD PRIMARY KEY (`instEvPAId`),
  ADD KEY `evalPAId` (`evalPAId`);

--
-- Indices de la tabla `instunidad`
--
ALTER TABLE `instunidad`
  ADD PRIMARY KEY (`insuniId`),
  ADD KEY `instId` (`instId`);

--
-- Indices de la tabla `integrador`
--
ALTER TABLE `integrador`
  ADD PRIMARY KEY (`integradorId`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`locId`),
  ADD KEY `CodPost` (`codPost`);

--
-- Indices de la tabla `matdidactico`
--
ALTER TABLE `matdidactico`
  ADD PRIMARY KEY (`matDId`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`materiaId`),
  ADD KEY `hojaAsId` (`hojaAsId`);

--
-- Indices de la tabla `matunidad`
--
ALTER TABLE `matunidad`
  ADD PRIMARY KEY (`matuniId`),
  ADD KEY `matDId` (`matDId`),
  ADD KEY `unidadId` (`unidadId`);

--
-- Indices de la tabla `metenseñanza`
--
ALTER TABLE `metenseñanza`
  ADD PRIMARY KEY (`metEnsId`);

--
-- Indices de la tabla `metunidad`
--
ALTER TABLE `metunidad`
  ADD PRIMARY KEY (`metuniId`),
  ADD KEY `metEnsId` (`metEnsId`),
  ADD KEY `unidadId` (`unidadId`);

--
-- Indices de la tabla `passutem`
--
ALTER TABLE `passutem`
  ADD PRIMARY KEY (`passId`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`periodoId`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `planclase`
--
ALTER TABLE `planclase`
  ADD PRIMARY KEY (`planClaseId`);

--
-- Indices de la tabla `planeacionacademica`
--
ALTER TABLE `planeacionacademica`
  ADD PRIMARY KEY (`planAcId`);

--
-- Indices de la tabla `programaaeducativo`
--
ALTER TABLE `programaaeducativo`
  ADD PRIMARY KEY (`programaId`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`puestoId`);

--
-- Indices de la tabla `segplanclase`
--
ALTER TABLE `segplanclase`
  ADD PRIMARY KEY (`segPCId`),
  ADD KEY `planClaseId` (`planClaseId`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`telId`),
  ADD KEY `personId` (`personId`);

--
-- Indices de la tabla `temaunidad`
--
ALTER TABLE `temaunidad`
  ADD PRIMARY KEY (`temaId`),
  ADD KEY `unidadId` (`unidadId`);

--
-- Indices de la tabla `tipocurso`
--
ALTER TABLE `tipocurso`
  ADD PRIMARY KEY (`tCrusoId`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`tdocId`);

--
-- Indices de la tabla `tipotrabajador`
--
ALTER TABLE `tipotrabajador`
  ADD PRIMARY KEY (`tipoTrab`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`cveTrabajador`),
  ADD KEY `academiaId` (`academiaId`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`tutorId`),
  ADD KEY `cveTrabajador` (`cveTrabajador`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`unidadId`),
  ADD KEY `hojaAsId` (`hojaAsId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academias`
--
ALTER TABLE `academias`
  MODIFY `academiaId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areaadscripcion`
--
ALTER TABLE `areaadscripcion`
  MODIFY `areaId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areasconocimiento`
--
ALTER TABLE `areasconocimiento`
  MODIFY `areaConId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asigmateria`
--
ALTER TABLE `asigmateria`
  MODIFY `asigId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  MODIFY `aspId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `biblioevpa`
--
ALTER TABLE `biblioevpa`
  MODIFY `biblioEvPAId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bibliografias`
--
ALTER TABLE `bibliografias`
  MODIFY `biblioId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capacidades`
--
ALTER TABLE `capacidades`
  MODIFY `capId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capunidades`
--
ALTER TABLE `capunidades`
  MODIFY `capUId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carraspirante`
--
ALTER TABLE `carraspirante`
  MODIFY `carrAspAl` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `carreraId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competencias`
--
ALTER TABLE `competencias`
  MODIFY `compId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compmateria`
--
ALTER TABLE `compmateria`
  MODIFY `coMatId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `deptoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dethoragpo`
--
ALTER TABLE `dethoragpo`
  MODIFY `detHoraGpo` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detmetunipa`
--
ALTER TABLE `detmetunipa`
  MODIFY `detMtUPAId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detplanaca`
--
ALTER TABLE `detplanaca`
  MODIFY `dPAcaId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detplanclase`
--
ALTER TABLE `detplanclase`
  MODIFY `detPCId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `dirId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `directorescarrera`
--
ALTER TABLE `directorescarrera`
  MODIFY `directorId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docepaanexos`
--
ALTER TABLE `docepaanexos`
  MODIFY `docEPAAneId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docintegrador`
--
ALTER TABLE `docintegrador`
  MODIFY `docInt` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `dctoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `elabplanac`
--
ALTER TABLE `elabplanac`
  MODIFY `elabPADoc` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `mailId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estaprepc`
--
ALTER TABLE `estaprepc`
  MODIFY `estAprePCId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evalpa`
--
ALTER TABLE `evalpa`
  MODIFY `evalPAId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evalpc`
--
ALTER TABLE `evalpc`
  MODIFY `evalPCId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evidpc`
--
ALTER TABLE `evidpc`
  MODIFY `evidPCId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  MODIFY `fotoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fuentebiblio`
--
ALTER TABLE `fuentebiblio`
  MODIFY `fuenteId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `grupoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hojaasignatura`
--
ALTER TABLE `hojaasignatura`
  MODIFY `hojaAsId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horariogrupo`
--
ALTER TABLE `horariogrupo`
  MODIFY `horaGpoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insteval`
--
ALTER TABLE `insteval`
  MODIFY `instId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instevalpc`
--
ALTER TABLE `instevalpc`
  MODIFY `instEvalPCId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instevpa`
--
ALTER TABLE `instevpa`
  MODIFY `instEvPAId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instunidad`
--
ALTER TABLE `instunidad`
  MODIFY `insuniId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `integrador`
--
ALTER TABLE `integrador`
  MODIFY `integradorId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `locId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `matdidactico`
--
ALTER TABLE `matdidactico`
  MODIFY `matDId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `materiaId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `matunidad`
--
ALTER TABLE `matunidad`
  MODIFY `matuniId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metenseñanza`
--
ALTER TABLE `metenseñanza`
  MODIFY `metEnsId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metunidad`
--
ALTER TABLE `metunidad`
  MODIFY `metuniId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `passutem`
--
ALTER TABLE `passutem`
  MODIFY `passId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `periodoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `personId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planclase`
--
ALTER TABLE `planclase`
  MODIFY `planClaseId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planeacionacademica`
--
ALTER TABLE `planeacionacademica`
  MODIFY `planAcId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programaaeducativo`
--
ALTER TABLE `programaaeducativo`
  MODIFY `programaId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `puestoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `segplanclase`
--
ALTER TABLE `segplanclase`
  MODIFY `segPCId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `telId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temaunidad`
--
ALTER TABLE `temaunidad`
  MODIFY `temaId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocurso`
--
ALTER TABLE `tipocurso`
  MODIFY `tCrusoId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `tdocId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipotrabajador`
--
ALTER TABLE `tipotrabajador`
  MODIFY `tipoTrab` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `cveTrabajador` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tutores`
--
ALTER TABLE `tutores`
  MODIFY `tutorId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `unidadId` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`);

--
-- Filtros para la tabla `areaadscripcion`
--
ALTER TABLE `areaadscripcion`
  ADD CONSTRAINT `areaadscripcion_ibfk_1` FOREIGN KEY (`deptoId`) REFERENCES `departamentos` (`deptoId`);

--
-- Filtros para la tabla `asigmateria`
--
ALTER TABLE `asigmateria`
  ADD CONSTRAINT `asigmateria_ibfk_1` FOREIGN KEY (`docenteId`) REFERENCES `trabajadores` (`cveTrabajador`),
  ADD CONSTRAINT `asigmateria_ibfk_2` FOREIGN KEY (`materiaId`) REFERENCES `materias` (`materiaId`);

--
-- Filtros para la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD CONSTRAINT `aspirantes_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`);

--
-- Filtros para la tabla `biblioevpa`
--
ALTER TABLE `biblioevpa`
  ADD CONSTRAINT `biblioevpa_ibfk_1` FOREIGN KEY (`evalPAId`) REFERENCES `evalpa` (`evalPAId`);

--
-- Filtros para la tabla `bibliografias`
--
ALTER TABLE `bibliografias`
  ADD CONSTRAINT `bibliografias_ibfk_1` FOREIGN KEY (`hojaAsId`) REFERENCES `hojaasignatura` (`hojaAsId`);

--
-- Filtros para la tabla `capunidades`
--
ALTER TABLE `capunidades`
  ADD CONSTRAINT `capunidades_ibfk_1` FOREIGN KEY (`capId`) REFERENCES `capacidades` (`capId`),
  ADD CONSTRAINT `capunidades_ibfk_2` FOREIGN KEY (`unidadId`) REFERENCES `unidades` (`unidadId`);

--
-- Filtros para la tabla `carraspirante`
--
ALTER TABLE `carraspirante`
  ADD CONSTRAINT `carraspirante_ibfk_1` FOREIGN KEY (`aspId`) REFERENCES `aspirantes` (`aspId`),
  ADD CONSTRAINT `carraspirante_ibfk_2` FOREIGN KEY (`carreraId`) REFERENCES `carreras` (`carreraId`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`directorId`) REFERENCES `directorescarrera` (`directorId`);

--
-- Filtros para la tabla `compmateria`
--
ALTER TABLE `compmateria`
  ADD CONSTRAINT `compmateria_ibfk_1` FOREIGN KEY (`hojaAsId`) REFERENCES `hojaasignatura` (`hojaAsId`),
  ADD CONSTRAINT `compmateria_ibfk_2` FOREIGN KEY (`compId`) REFERENCES `competencias` (`compId`);

--
-- Filtros para la tabla `dethoragpo`
--
ALTER TABLE `dethoragpo`
  ADD CONSTRAINT `dethoragpo_ibfk_1` FOREIGN KEY (`horaGpoId`) REFERENCES `horariogrupo` (`horaGpoId`);

--
-- Filtros para la tabla `detmetunipa`
--
ALTER TABLE `detmetunipa`
  ADD CONSTRAINT `detmetunipa_ibfk_1` FOREIGN KEY (`metEnsId`) REFERENCES `metenseñanza` (`metEnsId`),
  ADD CONSTRAINT `detmetunipa_ibfk_2` FOREIGN KEY (`dPAcaId`) REFERENCES `detplanaca` (`dPAcaId`);

--
-- Filtros para la tabla `detplanaca`
--
ALTER TABLE `detplanaca`
  ADD CONSTRAINT `detplanaca_ibfk_1` FOREIGN KEY (`planAcId`) REFERENCES `planeacionacademica` (`planAcId`),
  ADD CONSTRAINT `detplanaca_ibfk_2` FOREIGN KEY (`unidadId`) REFERENCES `unidades` (`unidadId`);

--
-- Filtros para la tabla `detplanclase`
--
ALTER TABLE `detplanclase`
  ADD CONSTRAINT `detplanclase_ibfk_1` FOREIGN KEY (`planClaseId`) REFERENCES `planclase` (`planClaseId`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`),
  ADD CONSTRAINT `direcciones_ibfk_2` FOREIGN KEY (`codPostDir`) REFERENCES `localidades` (`codPost`);

--
-- Filtros para la tabla `directorescarrera`
--
ALTER TABLE `directorescarrera`
  ADD CONSTRAINT `directorescarrera_ibfk_1` FOREIGN KEY (`cveTrabajador`) REFERENCES `trabajadores` (`cveTrabajador`);

--
-- Filtros para la tabla `docepaanexos`
--
ALTER TABLE `docepaanexos`
  ADD CONSTRAINT `docepaanexos_ibfk_1` FOREIGN KEY (`evalPAId`) REFERENCES `evalpa` (`evalPAId`);

--
-- Filtros para la tabla `docintegrador`
--
ALTER TABLE `docintegrador`
  ADD CONSTRAINT `docintegrador_ibfk_1` FOREIGN KEY (`integradorId`) REFERENCES `integrador` (`integradorId`);

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`),
  ADD CONSTRAINT `documentos_ibfk_2` FOREIGN KEY (`tdocId`) REFERENCES `tipodocumento` (`tdocId`);

--
-- Filtros para la tabla `elabplanac`
--
ALTER TABLE `elabplanac`
  ADD CONSTRAINT `elabplanac_ibfk_1` FOREIGN KEY (`docenteId`) REFERENCES `trabajadores` (`cveTrabajador`),
  ADD CONSTRAINT `elabplanac_ibfk_2` FOREIGN KEY (`planAcId`) REFERENCES `planeacionacademica` (`planAcId`);

--
-- Filtros para la tabla `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`);

--
-- Filtros para la tabla `estaprepc`
--
ALTER TABLE `estaprepc`
  ADD CONSTRAINT `estaprepc_ibfk_1` FOREIGN KEY (`detPCId`) REFERENCES `detplanclase` (`detPCId`);

--
-- Filtros para la tabla `evalpa`
--
ALTER TABLE `evalpa`
  ADD CONSTRAINT `evalpa_ibfk_1` FOREIGN KEY (`dPAcaId`) REFERENCES `detplanaca` (`dPAcaId`);

--
-- Filtros para la tabla `evalpc`
--
ALTER TABLE `evalpc`
  ADD CONSTRAINT `evalpc_ibfk_1` FOREIGN KEY (`planClaseId`) REFERENCES `planclase` (`planClaseId`);

--
-- Filtros para la tabla `evidpc`
--
ALTER TABLE `evidpc`
  ADD CONSTRAINT `evidpc_ibfk_1` FOREIGN KEY (`detPCId`) REFERENCES `detplanclase` (`detPCId`);

--
-- Filtros para la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD CONSTRAINT `fotografias_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`);

--
-- Filtros para la tabla `horariogrupo`
--
ALTER TABLE `horariogrupo`
  ADD CONSTRAINT `horariogrupo_ibfk_1` FOREIGN KEY (`grupoId`) REFERENCES `grupos` (`grupoId`);

--
-- Filtros para la tabla `instevalpc`
--
ALTER TABLE `instevalpc`
  ADD CONSTRAINT `instevalpc_ibfk_1` FOREIGN KEY (`detPCId`) REFERENCES `detplanclase` (`detPCId`);

--
-- Filtros para la tabla `instevpa`
--
ALTER TABLE `instevpa`
  ADD CONSTRAINT `instevpa_ibfk_1` FOREIGN KEY (`evalPAId`) REFERENCES `evalpa` (`evalPAId`);

--
-- Filtros para la tabla `instunidad`
--
ALTER TABLE `instunidad`
  ADD CONSTRAINT `instunidad_ibfk_1` FOREIGN KEY (`instId`) REFERENCES `insteval` (`instId`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`hojaAsId`) REFERENCES `hojaasignatura` (`hojaAsId`);

--
-- Filtros para la tabla `matunidad`
--
ALTER TABLE `matunidad`
  ADD CONSTRAINT `matunidad_ibfk_1` FOREIGN KEY (`matDId`) REFERENCES `matdidactico` (`matDId`),
  ADD CONSTRAINT `matunidad_ibfk_2` FOREIGN KEY (`unidadId`) REFERENCES `unidades` (`unidadId`);

--
-- Filtros para la tabla `metunidad`
--
ALTER TABLE `metunidad`
  ADD CONSTRAINT `metunidad_ibfk_1` FOREIGN KEY (`metEnsId`) REFERENCES `metenseñanza` (`metEnsId`),
  ADD CONSTRAINT `metunidad_ibfk_2` FOREIGN KEY (`unidadId`) REFERENCES `unidades` (`unidadId`);

--
-- Filtros para la tabla `segplanclase`
--
ALTER TABLE `segplanclase`
  ADD CONSTRAINT `segplanclase_ibfk_1` FOREIGN KEY (`planClaseId`) REFERENCES `planclase` (`planClaseId`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `personas` (`personId`);

--
-- Filtros para la tabla `temaunidad`
--
ALTER TABLE `temaunidad`
  ADD CONSTRAINT `temaunidad_ibfk_1` FOREIGN KEY (`unidadId`) REFERENCES `unidades` (`unidadId`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`academiaId`) REFERENCES `academias` (`academiaId`);

--
-- Filtros para la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`cveTrabajador`) REFERENCES `trabajadores` (`cveTrabajador`);

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`hojaAsId`) REFERENCES `hojaasignatura` (`hojaAsId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
