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
		personName as Nombre,
		personLn1 as Apellido_Pat, 
		personLn2 as Apellido_Mat,
		telNum as Telefono,
		telTipo as tipoTelefono,
		telExt as Extencion
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
	unidadId as cveUnidad,unidadName as unidad, 
	unidadObj as objetivoUnidad, hrsTUnidad as horasTeoría,
	hrsPUnidad as horasPractica, resultAp as resultadoAprendizaje, secAp as secuenciaAprendizaje
	from materias m 
	inner join hojaAsignatura h on m.hojaAsId = h.hojaAsId
	inner join unidades u on u.hojaAsId = h.hojaAsId

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