-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2020 a las 18:07:26
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
-- Base de datos: `tutorias`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambioTutor` (`_contAnteri` INT, `_contNuev` INT)  BEGIN
    	START TRANSACTION;

    	UPDATE tutoriasDocentes SET tipo="Tutor" WHERE numControlD=_contNuev;

    	UPDATE tutoriasDocentes SET tipo="Maestro" WHERE numControlD=_contAnteri;

    	UPDATE alumnos SET idTutoriasDocentes18=_contNuev WHERE idTutoriasDocentes18=_contAnteri;

    	UPDATE tutorias SET idTutoriasDocentes4=_contNuev WHERE idTutoriasDocentes4=_contAnteri;

    	UPDATE canalizacion_alumno SET idTutorDocente4=_contNuev WHERE idTutorDocente4=_contAnteri;

    	UPDATE accion_tutorial SET idTutoriasDocentes6=_contNuev WHERE idTutoriasDocentes6=_contAnteri;

    	UPDATE tutorias_grupales SET idTutoriasDocentes7=_contNuev WHERE idTutoriasDocentes7=_contAnteri;

    	UPDATE tutoria_individual SET idTutoriasDocentes8=_contNuev WHERE idTutoriasDocentes8=_contAnteri;

    	UPDATE alumno_canaliza SET idTutoriasDocentes9=_contNuev WHERE idTutoriasDocentes9=_contAnteri;

    	UPDATE tutorIndiNoProgra SET idTutoriasDocentes10=_contNuev WHERE idTutoriasDocentes10=_contAnteri;

    	UPDATE bajas SET idTutoriasDocentes12=_contNuev WHERE idTutoriasDocentes12=_contAnteri;

    	UPDATE motivo_bajas SET idTutoriasDocentes13=_contNuev WHERE idTutoriasDocentes13=_contAnteri;

    	UPDATE responsable_tutoria SET idTutoriasDocentes11=_contNuev WHERE idTutoriasDocentes11=_contAnteri;

    	UPDATE datos_accion SET idTutoriasDocentes15=_contNuev WHERE idTutoriasDocentes15=_contAnteri;

    	UPDATE sesion_grupal SET idTutoriasDocentes16=_contNuev WHERE idTutoriasDocentes16=_contAnteri;

    	UPDATE atencion_indi SET idTutoriasDocentes17=_contNuev WHERE idTutoriasDocentes17=_contAnteri;

    	COMMIT;
    	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cambioTutorP` (`_contAnteri` INT, `_contNuev` INT)  BEGIN
    	START TRANSACTION;

    	UPDATE tutoriasDocentes SET tipo="Tutor" WHERE numControlD=_contNuev;

    	UPDATE tutoriasDocentes SET tipo="Maestro" WHERE numControlD=_contAnteri;

    	COMMIT;
    	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteISAT` (`idDelete` INT)  BEGIN
    		START TRANSACTION;

    		DELETE FROM accion_tutorial WHERE idAcciTuto = idDelete;

    		DELETE FROM tutorias_grupales WHERE idTutorGrupal = idDelete;
    	
    		DELETE FROM tutoria_individual WHERE idTutorIndi = idDelete;

    		DELETE FROM alumno_canaliza WHERE idAlumCanal = idDelete;

    		DELETE FROM tutorIndiNoProgra WHERE idTutorProgra= idDelete;
    	
    		DELETE FROM bajas WHERE idBajas = idDelete;
    		
    		DELETE FROM motivo_bajas WHERE idMotivoBaja = idDelete;
    		
			DELETE FROM responsable_tutoria WHERE idResponsTutor = idDelete;
    	COMMIT;
    	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePlanAcciTuto` (`_delete` INT)  BEGIN
			START TRANSACTION;

			DELETE FROM datos_accion WHERE idDatosAccion = _delete;

			DELETE FROM sesion_grupal WHERE idSesionGrupal = _delete;

			DELETE FROM atencion_indi WHERE idAtencionIndi = _delete;

			COMMIT;
			END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EntreIniEstu` (`_edadDatos` INT, `_telCasa` CHAR(20), `_celDatos` CHAR(20), `_tutoriasDocentes2` CHAR(30), `_idAlumnos2` INT, `_vivienda` CHAR(30), `_descripSi` CHAR(100), `_huerfano` CHAR(30), `_descripHu` CHAR(100), `_estadoCivil` CHAR(30), `_numHermano` CHAR(20), `_lugarOcupa` CHAR(20), `_idAlumnos3` INT, `_tipoVivi` CHAR(30), `_tenenciaVivi` CHAR(30), `_cuentaCon` CHAR(100), `_numHabitaciones` CHAR(20), `_numVehiculos` CHAR(20), `_manutencion` CHAR(20), `_trabajoPapa` CHAR(30), `_descripTrabajoP` CHAR(100), `_trabajoMama` CHAR(30), `_descripTrabajoM` CHAR(100), `_ingresoFamil` CHAR(30), `_numPersContri` CHAR(20), `_numPersDependen` CHAR(20), `_trabajo` CHAR(20), `_relacionTrabajo` CHAR(30), `_idAlumnos4` INT, `_bachillProce` CHAR(50), `_modalidad` CHAR(30), `_anos` CHAR(20), `_promedioObten` CHAR(20), `_rendiEscolar` CHAR(30), `_materiaFacil` CHAR(50), `_materiaTrabajo` CHAR(50), `_materiaExtra` CHAR(50), `_cualMaterExt` CHAR(100), `_repetiAnoAnter` CHAR(20), `_nivel` CHAR(50), `_obstaculos` CHAR(50), `_idAlumnos5` INT, `_lee` CHAR(20), `_tipoLectu` CHAR(30), `_lugarEstud` CHAR(30), `_descripEstud` CHAR(100), `_horasEstudi` CHAR(20), `_horarioEstud` CHAR(30), `_musicaEstud` CHAR(20), `_idAlumnos6` INT, `_tiempoLibre` CHAR(30), `_tiempoAfici` CHAR(30), `_idAlumnos7` INT, `_tareaHogar` CHAR(50), `_medida` CHAR(50), `_integradoFamili` CHAR(30), `_aspectoPreocupa` CHAR(50), `_comunicarCasa` CHAR(30), `_idAlumnos8` INT, `_rasgos` CHAR(255), `_idAlumnos9` INT, `_saludAlumno` CHAR(30), `_enfermeAlumno` CHAR(50), `_tipoEnferme` CHAR(100), `_padeciEnferme` CHAR(50), `_cualPadeEnfer` CHAR(50), `_operadoAlumno` CHAR(30), `_causaOperado` CHAR(100), `_problemaSalud` CHAR(150), `_problemaFisi` CHAR(50), `_tipoProblema` CHAR(100), `_idAlumnos10` INT, `_sugerencia` CHAR(255), `_idAlumnos11` INT, `idestado` INT)  BEGIN
		START TRANSACTION;
			INSERT INTO datos_identificasion(fechaDatos, edadDatos, telCasa, celDatos, tutoriasDocentes2, idAlumnos2) 
			VALUES(CURDATE(), _edadDatos, _telCasa, _celDatos, _tutoriasDocentes2, _idAlumnos2);	

			INSERT INTO datos_familiares(vivienda, descripSi, huerfano, descripHu, estadoCivil, numHermano, lugarOcupa, idAlumnos3) 
			VALUES(_vivienda, _descripSi, _huerfano, _descripHu, _estadoCivil, _numHermano, _lugarOcupa, _idAlumnos3);

			INSERT INTO datos_socioeconomicos(tipoVivi, tenenciaVivi, cuentaCon, numHabitaciones, numVehiculos, manutencion, trabajoPapa, descripTrabajoP, trabajoMama, descripTrabajoM, ingresoFamil, numPersContri, numPersDependen, trabajo, relacionTrabajo, idAlumnos4) 
			VALUES(_tipoVivi, _tenenciaVivi, _cuentaCon, _numHabitaciones, _numVehiculos,  _manutencion, _trabajoPapa,  _descripTrabajoP, _trabajoMama, _descripTrabajoM, _ingresoFamil, _numPersContri, _numPersDependen, _trabajo, _relacionTrabajo, _idAlumnos4);

			INSERT INTO antecedentes_academicos(bachillProce, modalidad, anos, promedioObten, rendiEscolar, materiaFacil, materiaTrabajo, materiaExtra, cualMaterExt, repetiAnoAnter, nivel, obstaculos, idAlumnos5) 
			VALUES(_bachillProce, _modalidad, _anos, _promedioObten, _rendiEscolar, _materiaFacil, _materiaTrabajo, _materiaExtra, _cualMaterExt, _repetiAnoAnter, _nivel, _obstaculos, _idAlumnos5);

			INSERT INTO habitos_estudio(lee, tipoLectu, lugarEstud, descripEstud, horasEstudi, horarioEstud, musicaEstud, idAlumnos6) 
			VALUES(_lee, _tipoLectu, _lugarEstud, _descripEstud, _horasEstudi, _horarioEstud, _musicaEstud, _idAlumnos6);

			INSERT INTO aficiones(tiempoLibre, tiempoAfici, idAlumnos7) 
			VALUES(_tiempoLibre, _tiempoAfici, _idAlumnos7);

			INSERT INTO personalidad(tareaHogar, medida, integradoFamili, aspectoPreocupa, comunicarCasa, idAlumnos8) 
			VALUES(_tareaHogar, _medida, _integradoFamili, _aspectoPreocupa, _comunicarCasa, _idAlumnos8);

			INSERT INTO rasgos_personalidad(rasgos, idAlumnos9) 
			VALUES(_rasgos, _idAlumnos9);

			INSERT INTO salud(saludAlumno, enfermeAlumno, tipoEnferme, padeciEnferme, cualPadeEnfer, operadoAlumno, causaOperado, problemaSalud, problemaFisi, tipoProblema, idAlumnos10) 
			VALUES(_saludAlumno, _enfermeAlumno, _tipoEnferme, _padeciEnferme, _cualPadeEnfer, _operadoAlumno, _causaOperado, _problemaSalud, _problemaFisi, _tipoProblema, _idAlumnos10);

			INSERT INTO comentarios(sugerencia, idAlumnos11) 
			VALUES(_sugerencia, _idAlumnos11);

			UPDATE estadoButon SET estado='' WHERE idAlumnos15=idestado;
		COMMIT;
		END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluaDocente` (`_cuatrimestre` CHAR(20), `_idAlumnos12` INT, `_pregunta1` INT, `_pregunta2` INT, `_pregunta3` INT, `_pregunta4` INT, `_pregunta5` INT, `_pregunta6` INT, `_pregunta7` INT, `_pregunta8` INT, `_pregunta9` INT, `_pregunta10` INT, `_comentario` CHAR(255), `_idAlumnos13` INT, `_totalPuntos` INT, `_idAlumnos16` INT)  BEGIN
					START TRANSACTION;
						INSERT INTO datos_generales_alumno(cuatrimestre, fechaDatoGene, idAlumnos12)
						  	VALUES(_cuatrimestre, CURDATE(), _idAlumnos12);

						INSERT INTO encuestaT(pregunta1, pregunta2, pregunta3, pregunta4, pregunta5, pregunta6, pregunta7, pregunta8, pregunta9, pregunta10, comentario, totalPuntos, idAlumnos13)
							VALUES(_pregunta1, _pregunta2, _pregunta3, _pregunta4, _pregunta5, _pregunta6, _pregunta7, _pregunta8, _pregunta9, _pregunta10, _comentario, _totalPuntos, _idAlumnos13);

						UPDATE estadoButonEvalua SET estado='' WHERE idAlumnos16 = _idAlumnos16;
					COMMIT;
					END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InfoSeguiAaccTuto` (`_totalGrupo` INT, `_totalTutor` INT, `_periodoCuatri` CHAR(50), `_totalAtendi` INT, `_idTutoriasDocentes6` INT, `_tutorGrupa` INT, `_totalTemas` INT, `_totalTemaVist` INT, `_idTutoriasDocentes7` INT, `_tutorIndi` INT, `_totalPrograma` INT, `_totalRealiza` INT, `_idTutoriasDocentes8` INT, `_psicologo` INT, `_pedagogo` INT, `_enfermeria` INT, `_becas` INT, `_incubadora` INT, `_bolsaTrabajo` INT, `_asesorAcademico` INT, `_idTutoriasDocentes9` INT, `_temaAborda` CHAR(100), `_idTutoriasDocentes10` INT, `_totalIniCuatri` INT, `_totalTermiCuatri` INT, `_idTutoriasDocentes12` INT, `_motivos` CHAR(255), `_idTutoriasDocentes13` INT, `_responsables` CHAR(60), `_comentario` CHAR(255), `_idTutoriasDocentes11` INT)  BEGIN
    		START TRANSACTION;

    		INSERT INTO accion_tutorial(totalGrupo, totalTutor, periodoCuatri, totalAtendi, fechaAT, idTutoriasDocentes6) 
    		VALUES(_totalGrupo, _totalTutor, _periodoCuatri, _totalAtendi, CURDATE(), _idTutoriasDocentes6);

    		INSERT INTO tutorias_grupales(tutorGrupa, totalTemas, totalTemaVist, idTutoriasDocentes7) 
    		VALUES(_tutorGrupa, _totalTemas, _totalTemaVist, _idTutoriasDocentes7);

    		INSERT INTO tutoria_individual(tutorIndi, totalPrograma, totalRealiza, idTutoriasDocentes8) 
    		VALUES(_tutorIndi, _totalPrograma, _totalRealiza, _idTutoriasDocentes8);

    		INSERT INTO alumno_canaliza(psicologo, pedagogo, enfermeria, becas, incubadora, bolsaTrabajo, asesorAcademico, idTutoriasDocentes9) 
    		VALUES(_psicologo, _pedagogo, _enfermeria, _becas, _incubadora, _bolsaTrabajo, _asesorAcademico, _idTutoriasDocentes9);

    		INSERT INTO tutorIndiNoProgra(temaAborda, idTutoriasDocentes10) 
    		VALUES(_temaAborda, _idTutoriasDocentes10);

    		INSERT INTO bajas(totalIniCuatri, totalTermiCuatri, idTutoriasDocentes12) 
    		VALUES(_totalIniCuatri, _totalTermiCuatri, _idTutoriasDocentes12);

    		INSERT INTO motivo_bajas(motivos, idTutoriasDocentes13) 
    		VALUES(_motivos, _idTutoriasDocentes13);

    		INSERT INTO responsable_tutoria(responsables, comentario, idTutoriasDocentes11) 
    		VALUES(_responsables, _comentario, _idTutoriasDocentes11);
    	COMMIT;
    	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `planAccionTutorial` (`_ciclo` CHAR(20), `_idTutoriasDocentes15` INT, `_tema` CHAR(100), `_objetivos` CHAR(100), `_actividades` CHAR(100), `_recursos` CHAR(100), `_evidencias` CHAR(100), `_idTutoriasDocentes16` INT, `_nombreAluAten` CHAR(30), `_asuntoObserva` CHAR(100), `_observaAtenIndi` CHAR(200), `_idTutoriasDocentes17` INT)  BEGIN
    	START TRANSACTION;
    		INSERT INTO datos_accion(ciclo, fechaAatoAcc, idTutoriasDocentes15) 
    		VALUES(_ciclo, CURDATE(), _idTutoriasDocentes15);

    		INSERT INTO sesion_grupal(tema, objetivos, actividades, recursos, evidencias, idTutoriasDocentes16) 
    		VALUES(_tema, _objetivos, _actividades, _recursos, _evidencias, _idTutoriasDocentes16);

    		INSERT INTO atencion_indi(nombreAluAten, asuntoObserva, observaAtenIndi, idTutoriasDocentes17) 
    		VALUES(_nombreAluAten, _asuntoObserva, _observaAtenIndi, _idTutoriasDocentes17);
			COMMIT;
			END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_plan_accion` (`_loPlaneado` CHAR(150), `_loRealizado` CHAR(150), `_idSesionGrupa2` INT)  BEGIN
    	START TRANSACTION;

    	INSERT INTO reporte_plan_accion(loPlaneado, loRealizado, reportFec, idSesionGrupa2)
    	VALUES(_loPlaneado, _loRealizado, CURDATE(), _idSesionGrupa2);

    	COMMIT;
    	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateISAT` (`updateId` INT, `_totalGrupo` INT, `_totalTutor` INT, `_periodoCuatri` CHAR(50), `_totalAtendi` INT, `_tutorGrupa` INT, `_totalTemas` INT, `_totalTemaVist` INT, `_tutorIndi` INT, `_totalPrograma` INT, `_totalRealiza` INT, `_psicologo` INT, `_pedagogo` INT, `_enfermeria` INT, `_becas` INT, `_incubadora` INT, `_bolsaTrabajo` INT, `_asesorAcademico` INT, `_temaAborda` CHAR(100), `_totalIniCuatri` INT, `_totalTermiCuatri` INT, `_motivos` CHAR(255), `_responsables` CHAR(60), `_comentario` CHAR(255))  BEGIN
    		START TRANSACTION;

    		UPDATE accion_tutorial SET totalGrupo=_totalGrupo, totalTutor=_totalTutor, periodoCuatri= _periodoCuatri, totalAtendi=_totalAtendi WHERE idAcciTuto = updateId;

    		UPDATE tutorias_grupales SET tutorGrupa=_tutorGrupa, totalTemas=_totalTemas, totalTemaVist=_totalTemaVist WHERE idTutorGrupal = updateId;
    	
    		UPDATE tutoria_individual SET tutorIndi=_tutorIndi, totalPrograma=_totalPrograma, totalRealiza=_totalRealiza WHERE idTutorIndi = updateId;

    		UPDATE alumno_canaliza SET psicologo=_psicologo, pedagogo=_pedagogo, enfermeria=_enfermeria, becas=_becas, incubadora=_incubadora, bolsaTrabajo=_bolsaTrabajo, asesorAcademico=_asesorAcademico WHERE idAlumCanal = updateId;

    		UPDATE tutorIndiNoProgra SET temaAborda=_temaAborda WHERE idTutorProgra= updateId;
    	
    		UPDATE bajas SET totalIniCuatri=_totalIniCuatri, totalTermiCuatri=_totalTermiCuatri WHERE idBajas = updateId;
    		
    		UPDATE motivo_bajas SET motivos=_motivos WHERE idMotivoBaja = updateId;
    		
			UPDATE responsable_tutoria SET responsables=_responsables, comentario=_comentario WHERE idResponsTutor = updateId;
    	COMMIT;
    	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePlanAcciTuto` (`idupdate` INT, `_ciclo` CHAR(20), `_tema` CHAR(100), `_objetivos` CHAR(100), `_actividades` CHAR(100), `_recursos` CHAR(100), `_evidencias` CHAR(100), `_nombreAluAten` CHAR(30), `_asuntoObserva` CHAR(100), `_observaAtenIndi` CHAR(200))  BEGIN
    	START TRANSACTION;
    		UPDATE datos_accion SET ciclo=_ciclo WHERE idDatosAccion=idupdate;

    		UPDATE sesion_grupal SET tema=_tema, objetivos=_objetivos, actividades=_actividades, recursos=_recursos, evidencias=_evidencias WHERE idSesionGrupal=idupdate;

    		UPDATE atencion_indi SET nombreAluAten=_nombreAluAten, asuntoObserva=_asuntoObserva, observaAtenIndi=_observaAtenIndi WHERE idAtencionIndi=idupdate;
			COMMIT;
			END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion_tutorial`
--

CREATE TABLE `accion_tutorial` (
  `idAcciTuto` int(11) NOT NULL,
  `totalGrupo` int(11) DEFAULT NULL,
  `totalTutor` int(11) DEFAULT NULL,
  `periodoCuatri` varchar(50) DEFAULT NULL,
  `totalAtendi` int(11) DEFAULT NULL,
  `fechaAT` varchar(20) DEFAULT NULL,
  `idTutoriasDocentes6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aficiones`
--

CREATE TABLE `aficiones` (
  `idAficion` int(11) NOT NULL,
  `tiempoLibre` varchar(30) DEFAULT NULL,
  `tiempoAfici` varchar(30) DEFAULT NULL,
  `idAlumnos7` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumnos` int(11) NOT NULL,
  `numControlA` int(11) DEFAULT NULL,
  `nombreAlumno` varchar(30) DEFAULT NULL,
  `apellidoAlumno` varchar(60) DEFAULT NULL,
  `emailAlumno` varchar(50) DEFAULT NULL,
  `passwordAlumno` varchar(100) DEFAULT NULL,
  `idTutoriasDocentes18` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_canaliza`
--

CREATE TABLE `alumno_canaliza` (
  `idAlumCanal` int(11) NOT NULL,
  `psicologo` int(11) DEFAULT NULL,
  `pedagogo` int(11) DEFAULT NULL,
  `enfermeria` int(11) DEFAULT NULL,
  `becas` int(11) DEFAULT NULL,
  `incubadora` int(11) DEFAULT NULL,
  `bolsaTrabajo` int(11) DEFAULT NULL,
  `asesorAcademico` int(11) DEFAULT NULL,
  `idTutoriasDocentes9` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentes_academicos`
--

CREATE TABLE `antecedentes_academicos` (
  `idAnteceAcade` int(11) NOT NULL,
  `bachillProce` varchar(50) DEFAULT NULL,
  `modalidad` varchar(30) DEFAULT NULL,
  `anos` varchar(20) DEFAULT NULL,
  `promedioObten` varchar(20) DEFAULT NULL,
  `rendiEscolar` varchar(30) DEFAULT NULL,
  `materiaFacil` varchar(50) DEFAULT NULL,
  `materiaTrabajo` varchar(50) DEFAULT NULL,
  `materiaExtra` varchar(50) DEFAULT NULL,
  `cualMaterExt` varchar(100) DEFAULT NULL,
  `repetiAnoAnter` varchar(20) DEFAULT NULL,
  `nivel` varchar(20) DEFAULT NULL,
  `obstaculos` varchar(50) DEFAULT NULL,
  `idAlumnos5` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion_indi`
--

CREATE TABLE `atencion_indi` (
  `idAtencionIndi` int(11) NOT NULL,
  `nombreAluAten` varchar(60) DEFAULT NULL,
  `asuntoObserva` varchar(100) DEFAULT NULL,
  `observaAtenIndi` varchar(200) DEFAULT NULL,
  `idTutoriasDocentes17` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajas`
--

CREATE TABLE `bajas` (
  `idBajas` int(11) NOT NULL,
  `totalIniCuatri` int(11) DEFAULT NULL,
  `totalTermiCuatri` int(11) DEFAULT NULL,
  `idTutoriasDocentes12` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canalizacion_alumno`
--

CREATE TABLE `canalizacion_alumno` (
  `idCanaliAlum` int(11) NOT NULL,
  `fechaCanalAlu` varchar(20) DEFAULT NULL,
  `areaCanalAlu` varchar(50) DEFAULT NULL,
  `motiCanalAlu` varchar(30) DEFAULT NULL,
  `atenCanaAlu` varchar(50) DEFAULT NULL,
  `fechaAtenCana` varchar(20) DEFAULT NULL,
  `obserCanalAlu` varchar(300) DEFAULT NULL,
  `idTutorDocente4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL,
  `sugerencia` varchar(255) DEFAULT NULL,
  `idAlumnos11` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_accion`
--

CREATE TABLE `datos_accion` (
  `idDatosAccion` int(11) NOT NULL,
  `ciclo` varchar(20) DEFAULT NULL,
  `fechaAatoAcc` varchar(20) DEFAULT NULL,
  `idTutoriasDocentes15` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_familiares`
--

CREATE TABLE `datos_familiares` (
  `idDatosFamil` int(11) NOT NULL,
  `vivienda` varchar(30) DEFAULT NULL,
  `descripSi` varchar(100) DEFAULT NULL,
  `huerfano` varchar(30) DEFAULT NULL,
  `descripHu` varchar(100) DEFAULT NULL,
  `estadoCivil` varchar(30) DEFAULT NULL,
  `numHermano` varchar(20) DEFAULT NULL,
  `lugarOcupa` varchar(20) DEFAULT NULL,
  `idAlumnos3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_generales_alumno`
--

CREATE TABLE `datos_generales_alumno` (
  `idDatoGeneral` int(11) NOT NULL,
  `cuatrimestre` varchar(20) DEFAULT NULL,
  `fechaDatoGene` varchar(20) DEFAULT NULL,
  `idAlumnos12` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_identificasion`
--

CREATE TABLE `datos_identificasion` (
  `idDatosIdent` int(11) NOT NULL,
  `fechaDatos` varchar(20) DEFAULT NULL,
  `edadDatos` int(11) DEFAULT NULL,
  `telCasa` varchar(20) DEFAULT NULL,
  `celDatos` varchar(20) DEFAULT NULL,
  `tutoriasDocentes2` varchar(30) DEFAULT NULL,
  `idAlumnos2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_socioeconomicos`
--

CREATE TABLE `datos_socioeconomicos` (
  `idSocioe` int(11) NOT NULL,
  `tipoVivi` varchar(30) DEFAULT NULL,
  `tenenciaVivi` varchar(30) DEFAULT NULL,
  `cuentaCon` varchar(100) DEFAULT NULL,
  `numHabitaciones` varchar(20) DEFAULT NULL,
  `numVehiculos` varchar(20) DEFAULT NULL,
  `manutencion` varchar(20) DEFAULT NULL,
  `trabajoPapa` varchar(30) DEFAULT NULL,
  `descripTrabajoP` varchar(100) DEFAULT NULL,
  `trabajoMama` varchar(30) DEFAULT NULL,
  `descripTrabajoM` varchar(100) DEFAULT NULL,
  `ingresoFamil` varchar(30) DEFAULT NULL,
  `numPersContri` varchar(20) DEFAULT NULL,
  `numPersDependen` varchar(20) DEFAULT NULL,
  `trabajo` varchar(20) DEFAULT NULL,
  `relacionTrabajo` varchar(30) DEFAULT NULL,
  `idAlumnos4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestat`
--

CREATE TABLE `encuestat` (
  `idEncuesta` int(11) NOT NULL,
  `pregunta1` int(11) DEFAULT NULL,
  `pregunta2` int(11) DEFAULT NULL,
  `pregunta3` int(11) DEFAULT NULL,
  `pregunta4` int(11) DEFAULT NULL,
  `pregunta5` int(11) DEFAULT NULL,
  `pregunta6` int(11) DEFAULT NULL,
  `pregunta7` int(11) DEFAULT NULL,
  `pregunta8` int(11) DEFAULT NULL,
  `pregunta9` int(11) DEFAULT NULL,
  `pregunta10` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `totalPuntos` int(11) DEFAULT NULL,
  `idAlumnos13` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadobuton`
--

CREATE TABLE `estadobuton` (
  `idestadoButon` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `idnumControlD20` int(11) DEFAULT NULL,
  `idAlumnos15` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadobutonevalua`
--

CREATE TABLE `estadobutonevalua` (
  `idestadoButonEva` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `idAlumnos16` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitos_estudio`
--

CREATE TABLE `habitos_estudio` (
  `idHabitEstu` int(11) NOT NULL,
  `lee` varchar(20) DEFAULT NULL,
  `tipoLectu` varchar(30) DEFAULT NULL,
  `lugarEstud` varchar(30) DEFAULT NULL,
  `descripEstud` varchar(100) DEFAULT NULL,
  `horasEstudi` varchar(20) DEFAULT NULL,
  `horarioEstud` varchar(30) DEFAULT NULL,
  `musicaEstud` varchar(20) DEFAULT NULL,
  `idAlumnos6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_bajas`
--

CREATE TABLE `motivo_bajas` (
  `idMotivoBaja` int(11) NOT NULL,
  `motivos` varchar(255) DEFAULT NULL,
  `idTutoriasDocentes13` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalidad`
--

CREATE TABLE `personalidad` (
  `idPersonali` int(11) NOT NULL,
  `tareaHogar` varchar(50) DEFAULT NULL,
  `medida` varchar(50) DEFAULT NULL,
  `integradoFamili` varchar(30) DEFAULT NULL,
  `aspectoPreocupa` varchar(50) DEFAULT NULL,
  `comunicarCasa` varchar(30) DEFAULT NULL,
  `idAlumnos8` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos_personalidad`
--

CREATE TABLE `rasgos_personalidad` (
  `idRasgoPersonali` int(11) NOT NULL,
  `rasgos` varchar(255) DEFAULT NULL,
  `idAlumnos9` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_plan_accion`
--

CREATE TABLE `reporte_plan_accion` (
  `idPlanAccion` int(11) NOT NULL,
  `loPlaneado` varchar(150) DEFAULT NULL,
  `loRealizado` varchar(150) DEFAULT NULL,
  `reportFec` varchar(20) DEFAULT NULL,
  `idSesionGrupa2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable_tutoria`
--

CREATE TABLE `responsable_tutoria` (
  `idResponsTutor` int(11) NOT NULL,
  `responsables` varchar(100) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `idTutoriasDocentes11` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultexamenll`
--

CREATE TABLE `resultexamenll` (
  `IdResultExamen` int(11) NOT NULL,
  `resultado` int(11) DEFAULT NULL,
  `fechaResult` varchar(20) DEFAULT NULL,
  `idtutoriasDo` int(11) DEFAULT NULL,
  `idAlumnos14` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud`
--

CREATE TABLE `salud` (
  `idSalud` int(11) NOT NULL,
  `saludAlumno` varchar(30) DEFAULT NULL,
  `enfermeAlumno` varchar(50) DEFAULT NULL,
  `tipoEnferme` varchar(100) DEFAULT NULL,
  `padeciEnferme` varchar(50) DEFAULT NULL,
  `cualPadeEnfer` varchar(50) DEFAULT NULL,
  `operadoAlumno` varchar(30) DEFAULT NULL,
  `causaOperado` varchar(100) DEFAULT NULL,
  `problemaSalud` varchar(150) DEFAULT NULL,
  `problemaFisi` varchar(50) DEFAULT NULL,
  `tipoProblema` varchar(100) DEFAULT NULL,
  `idAlumnos10` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion_grupal`
--

CREATE TABLE `sesion_grupal` (
  `idSesionGrupal` int(11) NOT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `objetivos` varchar(100) DEFAULT NULL,
  `actividades` varchar(100) DEFAULT NULL,
  `recursos` varchar(100) DEFAULT NULL,
  `evidencias` varchar(100) DEFAULT NULL,
  `idTutoriasDocentes16` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutorias`
--

CREATE TABLE `tutorias` (
  `idTutores` int(11) NOT NULL,
  `grupoTutores` varchar(20) DEFAULT NULL,
  `gradoTutores` varchar(20) DEFAULT NULL,
  `carreTutores` varchar(100) DEFAULT NULL,
  `idTutoriasDocentes4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutoriasdocentes`
--

CREATE TABLE `tutoriasdocentes` (
  `nombreDocente` varchar(30) DEFAULT NULL,
  `apellidoDocente` varchar(60) DEFAULT NULL,
  `numControlD` int(11) NOT NULL,
  `passwordDocente` varchar(100) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutorias_grupales`
--

CREATE TABLE `tutorias_grupales` (
  `idTutorGrupal` int(11) NOT NULL,
  `tutorGrupa` int(11) DEFAULT NULL,
  `totalTemas` int(11) DEFAULT NULL,
  `totalTemaVist` int(11) DEFAULT NULL,
  `idTutoriasDocentes7` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutoria_individual`
--

CREATE TABLE `tutoria_individual` (
  `idTutorIndi` int(11) NOT NULL,
  `tutorIndi` int(11) DEFAULT NULL,
  `totalPrograma` int(11) DEFAULT NULL,
  `totalRealiza` int(11) DEFAULT NULL,
  `idTutoriasDocentes8` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutorindinoprogra`
--

CREATE TABLE `tutorindinoprogra` (
  `idTutorProgra` int(11) NOT NULL,
  `temaAborda` varchar(200) DEFAULT NULL,
  `idTutoriasDocentes10` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion_tutorial`
--
ALTER TABLE `accion_tutorial`
  ADD PRIMARY KEY (`idAcciTuto`),
  ADD KEY `idTutoriasDocentes6` (`idTutoriasDocentes6`);

--
-- Indices de la tabla `aficiones`
--
ALTER TABLE `aficiones`
  ADD PRIMARY KEY (`idAficion`),
  ADD KEY `idAlumnos7` (`idAlumnos7`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumnos`),
  ADD KEY `idTutoriasDocentes18` (`idTutoriasDocentes18`);

--
-- Indices de la tabla `alumno_canaliza`
--
ALTER TABLE `alumno_canaliza`
  ADD PRIMARY KEY (`idAlumCanal`),
  ADD KEY `idTutoriasDocentes9` (`idTutoriasDocentes9`);

--
-- Indices de la tabla `antecedentes_academicos`
--
ALTER TABLE `antecedentes_academicos`
  ADD PRIMARY KEY (`idAnteceAcade`),
  ADD KEY `idAlumnos5` (`idAlumnos5`);

--
-- Indices de la tabla `atencion_indi`
--
ALTER TABLE `atencion_indi`
  ADD PRIMARY KEY (`idAtencionIndi`),
  ADD KEY `idTutoriasDocentes17` (`idTutoriasDocentes17`);

--
-- Indices de la tabla `bajas`
--
ALTER TABLE `bajas`
  ADD PRIMARY KEY (`idBajas`),
  ADD KEY `idTutoriasDocentes12` (`idTutoriasDocentes12`);

--
-- Indices de la tabla `canalizacion_alumno`
--
ALTER TABLE `canalizacion_alumno`
  ADD PRIMARY KEY (`idCanaliAlum`),
  ADD KEY `idTutorDocente4` (`idTutorDocente4`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `idAlumnos11` (`idAlumnos11`);

--
-- Indices de la tabla `datos_accion`
--
ALTER TABLE `datos_accion`
  ADD PRIMARY KEY (`idDatosAccion`),
  ADD KEY `idTutoriasDocentes15` (`idTutoriasDocentes15`);

--
-- Indices de la tabla `datos_familiares`
--
ALTER TABLE `datos_familiares`
  ADD PRIMARY KEY (`idDatosFamil`),
  ADD KEY `idAlumnos3` (`idAlumnos3`);

--
-- Indices de la tabla `datos_generales_alumno`
--
ALTER TABLE `datos_generales_alumno`
  ADD PRIMARY KEY (`idDatoGeneral`),
  ADD KEY `idAlumnos12` (`idAlumnos12`);

--
-- Indices de la tabla `datos_identificasion`
--
ALTER TABLE `datos_identificasion`
  ADD PRIMARY KEY (`idDatosIdent`),
  ADD KEY `idAlumnos2` (`idAlumnos2`);

--
-- Indices de la tabla `datos_socioeconomicos`
--
ALTER TABLE `datos_socioeconomicos`
  ADD PRIMARY KEY (`idSocioe`),
  ADD KEY `idAlumnos4` (`idAlumnos4`);

--
-- Indices de la tabla `encuestat`
--
ALTER TABLE `encuestat`
  ADD PRIMARY KEY (`idEncuesta`),
  ADD KEY `idAlumnos13` (`idAlumnos13`);

--
-- Indices de la tabla `estadobuton`
--
ALTER TABLE `estadobuton`
  ADD PRIMARY KEY (`idestadoButon`),
  ADD KEY `idAlumnos15` (`idAlumnos15`),
  ADD KEY `idnumControlD20` (`idnumControlD20`);

--
-- Indices de la tabla `estadobutonevalua`
--
ALTER TABLE `estadobutonevalua`
  ADD PRIMARY KEY (`idestadoButonEva`),
  ADD KEY `idAlumnos16` (`idAlumnos16`);

--
-- Indices de la tabla `habitos_estudio`
--
ALTER TABLE `habitos_estudio`
  ADD PRIMARY KEY (`idHabitEstu`),
  ADD KEY `idAlumnos6` (`idAlumnos6`);

--
-- Indices de la tabla `motivo_bajas`
--
ALTER TABLE `motivo_bajas`
  ADD PRIMARY KEY (`idMotivoBaja`),
  ADD KEY `idTutoriasDocentes13` (`idTutoriasDocentes13`);

--
-- Indices de la tabla `personalidad`
--
ALTER TABLE `personalidad`
  ADD PRIMARY KEY (`idPersonali`),
  ADD KEY `idAlumnos8` (`idAlumnos8`);

--
-- Indices de la tabla `rasgos_personalidad`
--
ALTER TABLE `rasgos_personalidad`
  ADD PRIMARY KEY (`idRasgoPersonali`),
  ADD KEY `idAlumnos9` (`idAlumnos9`);

--
-- Indices de la tabla `reporte_plan_accion`
--
ALTER TABLE `reporte_plan_accion`
  ADD PRIMARY KEY (`idPlanAccion`),
  ADD KEY `idSesionGrupa2` (`idSesionGrupa2`);

--
-- Indices de la tabla `responsable_tutoria`
--
ALTER TABLE `responsable_tutoria`
  ADD PRIMARY KEY (`idResponsTutor`),
  ADD KEY `idTutoriasDocentes11` (`idTutoriasDocentes11`);

--
-- Indices de la tabla `resultexamenll`
--
ALTER TABLE `resultexamenll`
  ADD PRIMARY KEY (`IdResultExamen`),
  ADD KEY `idAlumnos14` (`idAlumnos14`),
  ADD KEY `idtutoriasDo` (`idtutoriasDo`);

--
-- Indices de la tabla `salud`
--
ALTER TABLE `salud`
  ADD PRIMARY KEY (`idSalud`),
  ADD KEY `idAlumnos10` (`idAlumnos10`);

--
-- Indices de la tabla `sesion_grupal`
--
ALTER TABLE `sesion_grupal`
  ADD PRIMARY KEY (`idSesionGrupal`),
  ADD KEY `idTutoriasDocentes16` (`idTutoriasDocentes16`);

--
-- Indices de la tabla `tutorias`
--
ALTER TABLE `tutorias`
  ADD PRIMARY KEY (`idTutores`),
  ADD KEY `idTutoriasDocentes4` (`idTutoriasDocentes4`);

--
-- Indices de la tabla `tutoriasdocentes`
--
ALTER TABLE `tutoriasdocentes`
  ADD PRIMARY KEY (`numControlD`);

--
-- Indices de la tabla `tutorias_grupales`
--
ALTER TABLE `tutorias_grupales`
  ADD PRIMARY KEY (`idTutorGrupal`),
  ADD KEY `idTutoriasDocentes7` (`idTutoriasDocentes7`);

--
-- Indices de la tabla `tutoria_individual`
--
ALTER TABLE `tutoria_individual`
  ADD PRIMARY KEY (`idTutorIndi`),
  ADD KEY `idTutoriasDocentes8` (`idTutoriasDocentes8`);

--
-- Indices de la tabla `tutorindinoprogra`
--
ALTER TABLE `tutorindinoprogra`
  ADD PRIMARY KEY (`idTutorProgra`),
  ADD KEY `idTutoriasDocentes10` (`idTutoriasDocentes10`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accion_tutorial`
--
ALTER TABLE `accion_tutorial`
  MODIFY `idAcciTuto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aficiones`
--
ALTER TABLE `aficiones`
  MODIFY `idAficion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumnos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumno_canaliza`
--
ALTER TABLE `alumno_canaliza`
  MODIFY `idAlumCanal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `antecedentes_academicos`
--
ALTER TABLE `antecedentes_academicos`
  MODIFY `idAnteceAcade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `atencion_indi`
--
ALTER TABLE `atencion_indi`
  MODIFY `idAtencionIndi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bajas`
--
ALTER TABLE `bajas`
  MODIFY `idBajas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canalizacion_alumno`
--
ALTER TABLE `canalizacion_alumno`
  MODIFY `idCanaliAlum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_accion`
--
ALTER TABLE `datos_accion`
  MODIFY `idDatosAccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_familiares`
--
ALTER TABLE `datos_familiares`
  MODIFY `idDatosFamil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_generales_alumno`
--
ALTER TABLE `datos_generales_alumno`
  MODIFY `idDatoGeneral` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_identificasion`
--
ALTER TABLE `datos_identificasion`
  MODIFY `idDatosIdent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_socioeconomicos`
--
ALTER TABLE `datos_socioeconomicos`
  MODIFY `idSocioe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `encuestat`
--
ALTER TABLE `encuestat`
  MODIFY `idEncuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadobuton`
--
ALTER TABLE `estadobuton`
  MODIFY `idestadoButon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadobutonevalua`
--
ALTER TABLE `estadobutonevalua`
  MODIFY `idestadoButonEva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitos_estudio`
--
ALTER TABLE `habitos_estudio`
  MODIFY `idHabitEstu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `motivo_bajas`
--
ALTER TABLE `motivo_bajas`
  MODIFY `idMotivoBaja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personalidad`
--
ALTER TABLE `personalidad`
  MODIFY `idPersonali` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rasgos_personalidad`
--
ALTER TABLE `rasgos_personalidad`
  MODIFY `idRasgoPersonali` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_plan_accion`
--
ALTER TABLE `reporte_plan_accion`
  MODIFY `idPlanAccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsable_tutoria`
--
ALTER TABLE `responsable_tutoria`
  MODIFY `idResponsTutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultexamenll`
--
ALTER TABLE `resultexamenll`
  MODIFY `IdResultExamen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salud`
--
ALTER TABLE `salud`
  MODIFY `idSalud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesion_grupal`
--
ALTER TABLE `sesion_grupal`
  MODIFY `idSesionGrupal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tutorias`
--
ALTER TABLE `tutorias`
  MODIFY `idTutores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tutorias_grupales`
--
ALTER TABLE `tutorias_grupales`
  MODIFY `idTutorGrupal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tutoria_individual`
--
ALTER TABLE `tutoria_individual`
  MODIFY `idTutorIndi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tutorindinoprogra`
--
ALTER TABLE `tutorindinoprogra`
  MODIFY `idTutorProgra` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accion_tutorial`
--
ALTER TABLE `accion_tutorial`
  ADD CONSTRAINT `accion_tutorial_ibfk_1` FOREIGN KEY (`idTutoriasDocentes6`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `aficiones`
--
ALTER TABLE `aficiones`
  ADD CONSTRAINT `aficiones_ibfk_1` FOREIGN KEY (`idAlumnos7`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`idTutoriasDocentes18`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumno_canaliza`
--
ALTER TABLE `alumno_canaliza`
  ADD CONSTRAINT `alumno_canaliza_ibfk_1` FOREIGN KEY (`idTutoriasDocentes9`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `antecedentes_academicos`
--
ALTER TABLE `antecedentes_academicos`
  ADD CONSTRAINT `antecedentes_academicos_ibfk_1` FOREIGN KEY (`idAlumnos5`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `atencion_indi`
--
ALTER TABLE `atencion_indi`
  ADD CONSTRAINT `atencion_indi_ibfk_1` FOREIGN KEY (`idTutoriasDocentes17`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `bajas`
--
ALTER TABLE `bajas`
  ADD CONSTRAINT `bajas_ibfk_1` FOREIGN KEY (`idTutoriasDocentes12`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `canalizacion_alumno`
--
ALTER TABLE `canalizacion_alumno`
  ADD CONSTRAINT `canalizacion_alumno_ibfk_1` FOREIGN KEY (`idTutorDocente4`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idAlumnos11`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `datos_accion`
--
ALTER TABLE `datos_accion`
  ADD CONSTRAINT `datos_accion_ibfk_1` FOREIGN KEY (`idTutoriasDocentes15`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_familiares`
--
ALTER TABLE `datos_familiares`
  ADD CONSTRAINT `datos_familiares_ibfk_1` FOREIGN KEY (`idAlumnos3`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `datos_generales_alumno`
--
ALTER TABLE `datos_generales_alumno`
  ADD CONSTRAINT `datos_generales_alumno_ibfk_1` FOREIGN KEY (`idAlumnos12`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `datos_identificasion`
--
ALTER TABLE `datos_identificasion`
  ADD CONSTRAINT `datos_identificasion_ibfk_1` FOREIGN KEY (`idAlumnos2`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `datos_socioeconomicos`
--
ALTER TABLE `datos_socioeconomicos`
  ADD CONSTRAINT `datos_socioeconomicos_ibfk_1` FOREIGN KEY (`idAlumnos4`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `encuestat`
--
ALTER TABLE `encuestat`
  ADD CONSTRAINT `encuestat_ibfk_1` FOREIGN KEY (`idAlumnos13`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `estadobuton`
--
ALTER TABLE `estadobuton`
  ADD CONSTRAINT `estadobuton_ibfk_1` FOREIGN KEY (`idAlumnos15`) REFERENCES `alumnos` (`idAlumnos`),
  ADD CONSTRAINT `estadobuton_ibfk_2` FOREIGN KEY (`idnumControlD20`) REFERENCES `tutoriasdocentes` (`numControlD`);

--
-- Filtros para la tabla `estadobutonevalua`
--
ALTER TABLE `estadobutonevalua`
  ADD CONSTRAINT `estadobutonevalua_ibfk_1` FOREIGN KEY (`idAlumnos16`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `habitos_estudio`
--
ALTER TABLE `habitos_estudio`
  ADD CONSTRAINT `habitos_estudio_ibfk_1` FOREIGN KEY (`idAlumnos6`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `motivo_bajas`
--
ALTER TABLE `motivo_bajas`
  ADD CONSTRAINT `motivo_bajas_ibfk_1` FOREIGN KEY (`idTutoriasDocentes13`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personalidad`
--
ALTER TABLE `personalidad`
  ADD CONSTRAINT `personalidad_ibfk_1` FOREIGN KEY (`idAlumnos8`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `rasgos_personalidad`
--
ALTER TABLE `rasgos_personalidad`
  ADD CONSTRAINT `rasgos_personalidad_ibfk_1` FOREIGN KEY (`idAlumnos9`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `reporte_plan_accion`
--
ALTER TABLE `reporte_plan_accion`
  ADD CONSTRAINT `reporte_plan_accion_ibfk_1` FOREIGN KEY (`idSesionGrupa2`) REFERENCES `sesion_grupal` (`idSesionGrupal`);

--
-- Filtros para la tabla `responsable_tutoria`
--
ALTER TABLE `responsable_tutoria`
  ADD CONSTRAINT `responsable_tutoria_ibfk_1` FOREIGN KEY (`idTutoriasDocentes11`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `resultexamenll`
--
ALTER TABLE `resultexamenll`
  ADD CONSTRAINT `resultexamenll_ibfk_1` FOREIGN KEY (`idAlumnos14`) REFERENCES `alumnos` (`idAlumnos`),
  ADD CONSTRAINT `resultexamenll_ibfk_2` FOREIGN KEY (`idtutoriasDo`) REFERENCES `tutoriasdocentes` (`numControlD`);

--
-- Filtros para la tabla `salud`
--
ALTER TABLE `salud`
  ADD CONSTRAINT `salud_ibfk_1` FOREIGN KEY (`idAlumnos10`) REFERENCES `alumnos` (`idAlumnos`);

--
-- Filtros para la tabla `sesion_grupal`
--
ALTER TABLE `sesion_grupal`
  ADD CONSTRAINT `sesion_grupal_ibfk_1` FOREIGN KEY (`idTutoriasDocentes16`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutorias`
--
ALTER TABLE `tutorias`
  ADD CONSTRAINT `tutorias_ibfk_1` FOREIGN KEY (`idTutoriasDocentes4`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutorias_grupales`
--
ALTER TABLE `tutorias_grupales`
  ADD CONSTRAINT `tutorias_grupales_ibfk_1` FOREIGN KEY (`idTutoriasDocentes7`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutoria_individual`
--
ALTER TABLE `tutoria_individual`
  ADD CONSTRAINT `tutoria_individual_ibfk_1` FOREIGN KEY (`idTutoriasDocentes8`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutorindinoprogra`
--
ALTER TABLE `tutorindinoprogra`
  ADD CONSTRAINT `tutorindinoprogra_ibfk_1` FOREIGN KEY (`idTutoriasDocentes10`) REFERENCES `tutoriasdocentes` (`numControlD`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
