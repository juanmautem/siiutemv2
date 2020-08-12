create view trabajadoresDatosGrales AS
	select p.personId As cvePersona, 
		cveTrabajador as numeroTrabajador,
		personName as Nombre,
		personLn1 as Apellido_Pat, 
		personLn2 as Apellido_Mat,
		tTName as Tipo_Trabajador, 
		puestoName As Puesto,
		areaName as Area_Adscripcion,
		deptoName as Departamento,
		email as Email_Institucional
		from personas p 
		INNER JOIN trabajadores t on t.personId=p.personId 
		inner join tipoTrabajador tt on t.tipoTrab = tt.tipoTrab
		inner join puestos pt on t.puestoId = pt.puestoId
		inner join areaadscripcion ad on t.areaAdsc = ad.areaId
		inner join departamentos dpto on ad.deptoId = dpto.deptoId
		inner join emails em on em.personId = p.personId WHERE em.mailTipo ="Escolar"

create view personaTelefonos as
	select p.personId as cvePersona,
		p.personName as Nombre,
		p.personLn1 as Apellido_Pat, 
		p.personLn2 as Apellido_Mat,
		t.telNum as Telefono,
		t.telTipo as tipoTelefono,
		t.telExt as Extencion
		from personas p
		inner join telefonos t on p.personId = t.personId

create view personaMails as
	select p.personId as cvePersona,
		personName as Nombre,
		personLn1 as Apellido_Pat, 
		personLn2 as Apellido_Mat,
		email,
		mailTipo as tipoMail
		from personas p
		inner join emails em on p.personId = em.personId

create view personaDirecciones
	select p.personId as cvePersona,
		personName as Nombre,
		personLn1 as Apellido_Pat, 
		personLn2 as Apellido_Mat,
		calleDir as Calle,
		numExtDir as numExterior, 
		numIntDir as numInterior,
		codPostDir as codigoPostal,
		locName as Localidad, 
		locMun as Municipio,
		locEdo as Estado
		from personas p
		inner join direcciones d on p.personId = d.personId
		inner join localidades l on l.codPost = d.codPostDir

create table tipoFamiliares(
	tipoFamId smallint primary key auto_increment,
 	tFamName varchar(30) not null,
 	createdAt datetime default CURRENT_TIMESTAMP
);

create table personasfamiliares(
	familiarId smallint auto_increment primary key,
	famId smallint,
	numPersona smallint,
	tipoFamiliar smallint,
	foreign key(tipoFamiliar) references tipoFamiliares(tipoFamId)
);

select * from personas p 
	inner join personasfamiliares pf on p.personId = pf.numPersona
	inner join personas ppf on pf.famId = ppf.personId
	inner join tipoFamiliar tf on tf.tipoFamId = pf.tipoFamiliar

create view personaFamiliares as
	select p.personId as cvePersona,
		pf.numPersona as cveFamiliar,
		ppf.personName as nombreFamiliar,
		ppf.personLn1 as apePatFamiliar, 
		ppf.personLn2 as apeMatFamiliar,
		tFamName as tipoFamiliar
		from personas p 
		inner join personasfamiliares pf on p.personId = pf.numPersona
		inner join personas ppf on pf.famId = ppf.personId
		inner join tipoFamiliares tf on tf.tipoFamId = pf.tipoFamiliar

create view alumnosListado as
	select p.personId As cvePersona, 
		numCtrl,
		p.personName as Nombre,
		p.personLn1 as Apellido_Pat, 
		p.personLn2 as Apellido_Mat,
		tipoAlumno, 
		fechaReg As FechaIngreso,
		cveGrupo as Grupo,
		cveCarrera,
		carreraName as carrera,
		carreraEsp as area,
		cuatri as Cuatrimestre,
		concat(periodo,periodoY) as Periodo,
		periodoTipo,
		concat(tut.personName," ",tut.personLn1, " ", tut.personLn2) as Tutor, 
		email as Email_Institucional
		from personas p 
		INNER JOIN alumnos a on a.personId = p.personId 
		inner join grupos g on g.grupoId = a.grupoId
		inner join carreras c on c.carreraId = g.carreraId
		inner join periodos pr on pr.periodoId = g.periodoId
		inner join tutores t on t.cveGrupo = g.cveGpo 
		inner join trabajadores tr on t.cveTrabajador = tr.cveTrabajador
		inner join personas tut on tr.personId = tut.personId
		inner join emails em on em.personId = p.personId WHERE em.mailTipo ="Escolar"

/*para buscar las direcciones de un alumno*/

SELECT pd.cvePersona,pd.Calle,pd.numExterior,pd.numInterior,pd.codigoPostal, pd.Localidad, pd.Municipio,pd.Estado FROM alumnosListado al 
	inner join personaDirecciones pd on al.cvePersona = pd.cvePersona

/*Para buscar los familiares de un alumno*/

SELECT pf.cvePersona,pf.cveFamiliar,Concat(pf.nombreFamiliar," ",pf.apePatFamiliar," ", pf.apeMatFamiliar) as Familiar, pf.tipoFamiliar 
FROM alumnosListado al 
	inner join personaFamiliares pf on al.cvePersona = pf.cvePersona

/* buscar numeros de telefono familiar en especifico */

SELECT pf.cvePersona,
	pf.cveFamiliar,
	Concat(pf.nombreFamiliar," ",pf.apePatFamiliar," ", pf.apeMatFamiliar) as Familiar, 
	pf.tipoFamiliar, 
	pt.Telefono,
	pt.tipoTelefono,
	pt.Extencion,
	pm.email,
	pm.tipoMail
	FROM alumnosListado al 
		inner join personaFamiliares pf on al.cvePersona = pf.cvePersona 
		inner join personatelefonos pt on pf.cvePersona = pt.cvePersona


/* buscar mails familiar en especifico */

SELECT pf.cvePersona,
	pf.cveFamiliar,
	Concat(pf.nombreFamiliar," ",pf.apePatFamiliar," ", pf.apeMatFamiliar) as Familiar, 
	pf.tipoFamiliar, 
	pm.email,
	pm.tipoMail
	FROM alumnosListado al 
		inner join personaFamiliares pf on al.cvePersona = pf.cvePersona 
	inner join personamails pm on pf.cvePersona = pm.cvePersona

/* 05/08/2020 parte 2*/

/*Aquí se harán las pruebas para vistas de materias */

CREATE VIEW materiasinfo AS
	SELECT materiaId, cveMateria, materiaName as materia, 
	cuatri as cuatrimestre, objetivoMat as objetivo,
	hrsTeoricas, hrsPractica,hrsSemana,
	areaConName as areaConocimiento, 
	cveCarrera, carreraName as Carrera, carreraEsp as Area,
	programaName as programaEducativo, concat(cvePrograma,programaY) as cvePrograma
	from materias m 
	inner join hojaAsignatura ha on m.hojaAsId = ha.hojaAsId
	inner join carreras ca on ca.carreraId = ha.carreraId
	inner join areasConocimiento ac on m.areaconId = ac.areaConId
	inner join programaaeducativo pe on pe.carreraId = ca.carreraId

CREATE VIEW materiasUnidades As
	select cveMateria,
	unidadId as cveUnidad,unidadName as unidad, concat("Unidad ",unidadNum) as numeroUnidad,
	unidadObj as objetivoUnidad, hrsTUnidad as horasTeoría,
	hrsPUnidad as horasPractica, resultAp as resultadoAprendizaje, secAp as secuenciaAprendizaje,capDesc as capacidad
	from materias m 
	inner join hojaAsignatura h on m.hojaAsId = h.hojaAsId
	inner join unidades u on u.hojaAsId = h.hojaAsId
	inner join capUnidades cu on cu.unidadId = u.unidadId
	inner join capacidades ca on cu.capId = ca.capId

CREATE VIEW unidadesCapacidades As
	select u.unidadId as cveUnidad, 
	capDesc as capacidad
	from unidades u 
	inner join capUnidades cu on cu.unidadId = u.unidadId
	inner join capacidades ca on cu.capId = ca.capId

CREATE VIEW unidadesTemas As
	SELECT u.unidadId as cveUnidad,
	temaName as Tema, saberTema, SerTema, sabSerTema
	from unidades u 
	inner join temaunidad t on u.unidadId=t.unidadId

CREATE VIEW materiaBibliografia As
	select cveMateria,
	tipoBiblio as tipoBibliografia,
	fuenteId, 
	fuenteName as nombreFuente, 
	fuenteDesc as descripcion,
	fuenteAutor as autor_es,
	fuenteCiudad as ciudad,
	fuentePais as pais, 
	fuenteEditorial as Editorial,
	fuenteTipo as tipoFuente
	from materias m 
	inner join hojaAsignatura h on m.hojaAsId = h.hojaAsId
	inner join bibliografias b on h.hojaAsId = b.hojaAsId
	inner join fuenteBiblio fb on b.biblioId = fb.biblioId

CREATE VIEW materiaCompetencias AS
	select cveMateria,
	compName as competencia,
	compTipo as tipoCompetencia,
	compDesc as descripcion
	from materias m 
	inner join hojaAsignatura h on m.hojaAsId = h.hojaAsId
	inner join compMateria cm on cm.hojaAsId = h.hojaAsId
	inner join competencias c on cm.compId = c.compId

CREATE VIEW metodoEnseñanzaUnidad As
	select u.unidadId as cveUnidad, 
	metEnsName as metodoEnsenanza, metEnsDesc as descripcion
	from unidades u 
	inner join metUnidad mu on mu.unidadId = u.unidadId
	inner join metEnseñanza me on mu.metEnsId = me.metEnsId

/*Aquí se harán las pruebas para vista de tutores de grupo y directores de carrera */

CREATE VIEW tutoresGrupo As
	SELECT t.cveTrabajador,
	p.personName as nombreTutor,
	p.personLn1 as apellidoPatTutor,
	p.personLn2 as apellidoMatTutor,
	g.cveGpo as Grupo,
	carreraName as Carrera
	from personas p
	inner join trabajadores t on p.personId = t.personId
	inner join tutores tut on tut.cveTrabajador = t.cveTrabajador
	inner join grupos g on tut.cveGrupo = g.cveGpo
	inner join carreras c on c.carreraId = g.carreraId

	/* 06/08/2020 avances*/

/* Vistas horarios */

CREATE VIEW horaGrupoMaterias As
	SELECT cveGpo as grupo,
	carreraName as carrera,
	concat(per.periodo," ",per.periodoY) as periodo, per.periodoTipo,
	pr.cvePrograma,
	m.materiaName as materia,
	m.cveMateria,
	dhg.hrInicio, dhg.hrFin, dhg.diaSem,
	am.docenteId,
	hg.elaboroId as cveDirector,
	hg.autorizoId as cveDirAcademico,
	hg.feElabHG as fechaElaboracion,
	hg.feAutHG as fechaAutorizacion
	from grupos g
	inner join horarioGrupo hg on g.grupoId = hg.grupoId
	inner join periodos per on per.periodoId = g.periodoId
	inner join carreras car on car.carreraId = g.carreraId
	inner join programaaeducativo pr on pr.programaId = hg.programaId
	inner join detHoraGpo dhg on dhg.horaGpoId = hg.horaGpoId
	inner join materias m on dhg.materiaId = m.materiaId
	inner join asigmateria am on am.materiaId = m.materiaId

create view materiasdocentes as
	select
	m.cveMateria, 
	m.materiaName as materia,
	p.personId as cvePersona,
	p.personName as nombreDocente,
	p.personLn1 as apellidoPat,
	p.personLn2 as apellidoMat,
	concat(per.periodo," ",per.periodoY) as periodo, per.periodoTipo,
	c.carreraName as carrera,
	c.carreraEsp as area
	from materias m 
	inner join asigmateria am on am.materiaId = m.materiaId
	inner join periodos per on per.periodoId = am.periodoId
	inner join personas p on p.personId = am.docenteId
	inner join carreras c on c.carreraId = am.carreraId

/* 07/08/2020 */

create view FORACA03A_r0_Gral As
	select pa.planAcId As cvePlanAcad,
	pa.planAcName As nombrePlan,
	pa.planAcDesc As descripcionPA,
	dpto.deptoName as departamento,
	ac.academiaName As academiaName,
	m.materiaId as cveMateria,
	m.materiaName as materia,
	pa.feElabPA As fechaElaboracion,
	pa.feAutPA As fechaAutorizacion,
	pa.statusPAc as estado,
	tc.tCursoName as tipoCurso
	FROM planeacionacademica pa 
	inner join materias m on pa.materiaId = m.materiaId
	inner join academias ac on pa.academiaId = ac.academiaId
	inner join departamentos dpto on pa.deptoId = dpto.deptoId
	inner join tipoCurso tc on pa.tCursoId = tc.tCursoId

create table encuadrePlanAc (
	encuadreId smallint primary key auto_increment,
	planAcId smallint,
	unidadId smallint,
	encSemanas varchar(50),
	encPorUnidad decimal(4,2),
	createdAt datetime default CURRENT_TIMESTAMP,
	foreign key(planAcId) references planeacionacademica(planAcId)
);
create table recuExtraPlanAc (
	rePAId smallint primary key auto_increment,
	planAcId smallint,
	recSemana varchar(50),
	recPor decimal(4,2),
	extSemana varchar(50),
	extPor decimal(4,2),
	createdAt datetime default CURRENT_TIMESTAMP
);

create view FORACA03A_r0_Encuadre As
	select pa.planAcId As cvePlanAcad,
	u.unidadId as cveUnidad,
	u.unidadName as nombreUnidad,
	concat("Unidad ",u.unidadNum) as numeroUnidad,
	e.encSemanas as semanas,
	e.encPorUnidad as porcentajeUnidad,
	re.recSemana, re.recPor, re.extSemana, re.extPor
	from planeacionacademica pa
	inner join encuadrePlanAc e on pa.planAcId = e.planAcId
	inner join recuExtraPlanAc re on pa.planAcId = re.planAcId
	inner join unidades u on e.unidadId = u.unidadId


/*08/08/2020*/
/*Se generaron tablas para metodos de enseñanza, actividad integradora, instrumentos y tipos de reactivos y evaluacion*/
create table metEnsUnPA(
	metEnUPAId smallint primary key auto_increment,
	planAcId smallint,
	unidadId smallint,
	desActividad mediumtext,
	createdAt datetime default CURRENT_TIMESTAMP
);
create table metEnsInPA(
	metEnInPAId smallint primary key auto_increment,
	planAcId smallint,
	unidadId smallint,
	desActInt mediumtext,
	createdAt datetime default CURRENT_TIMESTAMP
);
create table detMetEnsUnPA(	
	detMEUPAId smallint primary key auto_increment,
	metEnsId smallint,
	metEnUPAId smallint,
	createdAt datetime default CURRENT_TIMESTAMP
);

create table recymatPA(
	rymPAId smallint primary key auto_increment,
	planAcId smallint,
	unidadId smallint,
	matDId smallint,
	createdAt datetime default CURRENT_TIMESTAMP
);

/*11/08/2020*/
create view FORACA03A_r0_secDidactica as
	select pa.planAcId As cvePlanAcad,
	u.unidadId as cveUnidad,
	concat("Unidad ",u.unidadNum) as numeroUnidad,
	u.unidadName as unidad,
	u.secAp as secuenciaAprendizaje,
	u.resultAp as resultadoAprendizaje,
	ut.Tema,ut.saberTema as conceptual, ut.SerTema as procedimental, ut.sabSerTema as actitudinal
	from planeacionacademica pa 
	inner join detplanaca dp on dp.planAcId = pa.planAcId
	inner join unidades u on dp.unidadId = u.unidadId
	inner join unidadesTemas ut on ut.cveUnidad = u.unidadId


/*generar otra consulta para obtener el listado de estrategias de Enseñanza aprendizaje por unidad*/
create view listaMetEUPA as
	select pa.planAcId as cvePlanAcad,
	u.unidadId as cveUnidad,
	u.unidadName as unidadNombre,
	met.metEnsName as metodoEnseñanza,
	met.metEnsDesc as metodoEnseDesc
	from planeacionacademica as pa
	inner join metEnsUnPA mu on pa.planAcId = mu.planAcId
	inner join unidades u on mu.unidadId = u.unidadId
	inner join detMetEnsUnPA dmu on dmu.metEnUPAId = mu.metEnUPAId
	inner join metEnseñanza met on met.metEnsId = dmu.metEnsId

/*generar otra consulta para obtener el listado de recursos y materiales didácticos por unidad*/
create view listaMatEUPA as
	select pa.planAcId as cvePlanAcad,
		u.unidadId as cveUnidad,
		u.unidadName as unidadNombre,
		mat.matDname as material,
		mat.matDDesc as materialDesc
		from planeacionacademica as pa
		inner join recymatPA rm on pa.planAcId = rm.planAcId
		inner join unidades u on rm.unidadId = u.unidadId
		inner join matDidactico mat on mat.matDId = rm.matDI

/*generar otra consulta para obtener el listado de instrumentos de evaluacion por unidad*/
create view listaInsUPA as
	select pa.planAcId as cvePlanAcad,
		u.unidadId as cveUnidad,
		u.unidadName as unidadNombre,
		ins.instName as instrumento,
		ins.instDesc as instrumentoDesc,
		ins.instCompe as competencia,
		i.instEvPAPor as porcentaje
		from planeacionacademica as pa
		inner join instevpa i on pa.planAcId = i.planAcId
		inner join instEval ins on ins.instId = i.instId
		inner join unidades u on i.unidadId = u.unidadId

/*generar otra consulta para obtener el listado de evaluaciones por unidad*/
create view listaEvalUPA as
	select pa.planAcId as cvePlanAcad,
		u.unidadId as cveUnidad,
		ev.evalPAAuto as autoevaluacion,
		ev.evalPACoe as coevaluacion, 
		ev.evalPAHete as hetereogenea,
		ev.evalPADia as diagnostica,
		ev.evalPAForm as formativa,
		ev.evalPASumat as sumativa	
		from planeacionacademica as pa
		inner join detPlanAca dp on dp.planAcId = pa.planAcId
		inner join unidades u on dp.unidadId = u.unidadId
		inner join evalPA ev on ev.evalPAId = dp.evalPAI

create table anexosPlanAca (
	anePAId smallint primary key auto_increment,
	planAcId smallint,
	dctoId smallint,
	createdAt datetime default CURRENT_TIMESTAMP,
	foreign key(planAcId) references planeacionacademica(planAcId)
);

create table biblioPlanAca(
	biblioPAId smallint primary key,
	planAcId smallint,
	fuenteId smallint,
	createdAt datetime default CURRENT_TIMESTAMP,
	foreign key(planAcId) references planeacionacademica(planAcId)
);

/*generar otra consulta para obtener el listado de bibliografia para cada Plan Academico*/
create view biblioPA as
	select p.planAcId as cvePlanAcad,
		f.fuenteName as tituloFuente,
		f.fuenteAutor as autor_es,
		f.fuenteCiudad as ciudad,
		f.fuentepais as pais,
		f.fuenteEditorial as editorial,
		f.fuenteAnio as anio
		from planeacionacademica p
		inner join biblioPlanAca bp on bp.planAcId = p.planAcId
		inner join fuenteBiblio f on bp.fuenteId = f.fuenteId

/*generar otra consulta para obtener el listado de anexos para cada Plan Academico*/
create view anexosPA as
	select p.planAcId as cvePlanAcad,
		d.dctoName as nombreAnexo,
		d.dctoUrl as ubicacion,
		td.tdName as tipoAnexo
		from planeacionacademica p
		inner join anexosPlanAca a on a.planAcId = p.planAcId
		inner join documentos d on d.dctoId = a.dctoId
		inner join tipoDocumento td on td.tdocId = d.tdoc

/*11/08/2020_TARDE*/

/*Generar una vista para directores de carreras*/
create view directoresCarreras as
	select dir.cvePersona,
	c.carreraId as cveCarrera,
	concat(dir.Nombre," ",dir.Apellido_Pat," ",dir.Apellido_Pat) as director,
	c.carreraName as carrera, c.carreraEsp as area
	from directoresCarrera dc 
	inner join carreras c on c.directorId =dc.directorId
	inner join trabajadoresdatosgrales dir on dc.cveTrabajador = dir.numeroTrabajador

/*12/08/2020 */


/*Generar una vista para el formato FOR-ACA-03-B_r0 correspondiente al Plan de Clase del Docente*/
create view FORACA03B_r0_gral as
	select pc.planClaseId as cvePlanClase,
	pc.planClaseName as nombrePlanClase,
	pc.feElabPC as fechaElaboracion, 
	pc.feAutPC as fechaAutorizacion,
	dc.director, 
	ac.academiaId as cveAcademia,
	ac.academiaName as academia,
	dep.deptoName as departamento,
	tut.cveTrabajador as cveTutor,
	concat(tut.nombreTutor," ",tut.apellidoPatTutor," ",tut.apellidoMatTutor) as Tutor,
	g.cveGpo as grupo,
	md.cveMateria, 
	md.materia as asignatura,
	concat(md.nombreDocente," ",md.apellidoPat," ",md.apellidoMat) as docente,
	md.periodo, md.carrera, md.area,
	cmp.competencia, cmp.descripcion as descripcionCompetencia,
	cmp.tipoCompetencia,
	mu.capacidad
	from planclase pc
	inner join directoresCarreras dc on pc.directorId = dc.cvePersona
	inner join materiasDocentes md on pc.cveMateria = md.cveMateria
	inner join materiacompetencias cmp on pc.cveMateria = cmp.cveMateria
	inner join materiasUnidades mu on pc.cveMateria = mu.cveMateria
	inner join academias ac on pc.academiaId = ac.academiaId
	inner join grupos g on g.grupoId = pc.grupoId
	inner join tutoresGrupo tut on tut.Grupo = g.cveGpo
	inner join departamentos dep on pc.deptoId = dep.deptoId

/*generar tabla para docentes y academias*/
create table personasAcademias(
	perAcaId smallint primary key auto_increment,
	personaId smallint,
	academiaId smallint,
	createdAt datetime default CURRENT_TIMESTAMP
);

/*generar una vista para saber las personas que pertenecen a la academia*/
create view academiaMiembros as 
	select a.academiaId as cveAcademia, a.academiaName as academia, 
	pt.cvePersona, 
	concat(pt.Nombre," ",pt.Apellido_Pat," ",pt.Apellido_Mat) as nombreCompleto, 
	pt.Email_Institucional as Email_InstitucionalPte 
	from academias a 
	inner join personasacademias pa on a.academiaId = pa.academiaId
	inner join trabajadoresDatosGrales pt on pa.personaId = pt.cvePersona

/*generar una vista para cada presidente de academia y la academia a la que pertenece*/
create view academiaPresidente as 
	select a.academiaId as cveAcademia, a.academiaName as academia, 
	pt.cvePersona as cvePresidente, 
	concat(pt.Nombre," ",pt.Apellido_Pat," ",pt.Apellido_Mat) as presidente, 
	pt.Email_Institucional as Email_InstitucionalPte, 
	sc.cvePersona as cveSecretario, 
	concat(sc.Nombre," ",sc.Apellido_Pat," ",sc.Apellido_Mat) as secretario, 
	sc.Email_Institucional 
	from academias a 
	inner join trabajadoresdatosgrales pt on a.presidenteAc = pt.cvePersona 
	inner join trabajadoresdatosgrales sc on a.secretarioAc = sc.cvePersona

/*generar detalle por unidad de cada FOR-ACA-03-B_r0*/
create view FORACA03B_r0_evalUnidades as
	select pc.cvePlanClase,
	mu.cveUnidad, mu.numeroUnidad, mu.unidad,
	mu.resultadoAprendizaje, mu.secuenciaAprendizaje,
	te.Tema,dpc.detPCSesion as sesion,dpc.detPCfechaImp as fechaTema,
	te.saberTema,te.SerTema,te.sabSerTema,
	i.instName as instrumento,ins.instEvPCPorc as instrumentoPorcentaje,
	ins.instEvPCDesc as instrumDescripcion,
	evid.evidPCName as evidencia,
	evid.evidPCDesc as evidenciaDescripcion,
	dpc.detPCObs as observaciones
	from FORACA03B_r0_gral pc
	inner join materiasunidades mu on pc.cveMateria = mu.cveMateria
	inner join unidadesTemas te on mu.cveUnidad =te.cveUnidad
	inner join detplanClase dpc on dpc.planClaseId = pc.cvePlanClase
	inner join evidPc evid on evid.detPCId = dpc.detPCId
	inner join instevalpc ins on ins.detPCId = dpc.detPCId
	inner join insteval i on i.instId = ins.instId




