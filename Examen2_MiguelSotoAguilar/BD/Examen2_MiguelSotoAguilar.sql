/*
	Examen Miguel Soto Aguilar

*/

CREATE DATABASE examen2_MiguelSotoAguilar
GO
USE examen2_MiguelSotoAguilar
GO
CREATE TABLE usuarios
(
	usuario_id int identity(1,1) primary key,
	nombre varchar(50) not null,
	correoElectronico varchar(50),
	telefono varchar(15) unique

)

ALTER TABLE USUARIOS
ADD  clave varchar(50);

alter table usuarios
alter column clave varchar(50) not null;
GO
CREATE TABLE tecnicos
(
	tecnico_id int identity(1,1) primary key,
	nombre varchar(50),
	especialidad varchar(50),
	

)

GO
CREATE TABLE equipos
(
	equipo_id int identity(1,1) primary key,
	tipoEquipo varchar(50) not null,
	modelo varchar(50),
	codigoUsuario int,
	CONSTRAINT fk_codigoUsuario foreign key (codigoUsuario) REFERENCES usuarios (usuario_id)

)
GO
CREATE TABLE reparaciones
(
	reparacion_id int identity(1,1) primary key,
	fechaSolicitud date CONSTRAINT df_fecha DEFAULT getdate(),
	estado varchar(50),
	codigoEquipo int,
	CONSTRAINT fk_codigoEquipo foreign key (codigoEquipo) REFERENCES equipos (equipo_id)

)
GO

CREATE TABLE detallesReparacion
(
	detalle_id int identity(1,1) primary key,
	fechaInicio datetime ,
	fechaFin datetime,
	descripcion varchar(50),
	codigoReparacion int,
	CONSTRAINT fk_codigoReparacion foreign key (codigoReparacion) REFERENCES reparaciones (reparacion_id)

)

GO
USE examen2_MiguelSotoAguilar
CREATE TABLE asignaciones
(
	asignacion_id int identity(1,1) primary key,
	fechaasignacion datetime,	
	codigoReparacionTecnico int,
	codigoTecnicoAsignacion int,
	CONSTRAINT fk_codigoReparacionTecnico foreign key (codigoReparacionTecnico) REFERENCES reparaciones (reparacion_id),
	CONSTRAINT fk_codigoTecnicoAsignacion foreign key (codigoTecnicoAsignacion) REFERENCES tecnicos (tecnico_id)

)


USE examen2_MiguelSotoAguilar
insert into usuarios values ('Jorge', 'j@gmail', '8888')
insert into usuarios values ('Lupe', 'l@gmail', '8881')
insert into usuarios values ('Roberto', 'r@gmail', '8882')

USE examen2_MiguelSotoAguilar
insert into equipos values ('televisor', 'lg', 1)
insert into equipos values ('celular', 'huawei', 2)
insert into equipos values ('laptop', 'acer', 3)

USE examen2_MiguelSotoAguilar
insert into tecnicos values ('Juan', 'electronica')
insert into tecnicos values ('Monica', 'electronica')
insert into tecnicos values ('Rogelio', 'electronica')


update usuarios 
set clave = '123'
where usuario_id = 2;
select * from tecnicos

/*Procedimientos almacenados Store procedures SP O PA*/
USE examen2_MiguelSotoAguilar
CREATE PROCEDURE CONSULTARUSUARIO
	AS
		BEGIN
			SELECT * FROM usuarios
		END

	EXEC CONSULTARUSUARIO

CREATE PROCEDURE CONSULTAREQUIPOS
	AS
		BEGIN
			SELECT * FROM equipos
		END

	EXEC CONSULTAREQUIPOS

CREATE PROCEDURE CONSULTARTECNICOS
	AS
		BEGIN
			SELECT * FROM tecnicos
		END

	EXEC CONSULTARTECNICOS



	/*Consultar con filtros*/

	CREATE PROCEDURE CONSULTARUSUARIO_FILTRO
	
	@CODIGO INT
	
	AS
		BEGIN
			SELECT * FROM usuarios WHERE usuario_id = @CODIGO
		END

	EXEC CONSULTARUSUARIO_FILTRO  1

	CREATE PROCEDURE CONSULTAREQUIPO_FILTRO
	
	@CODIGO INT
	
	AS
		BEGIN
			SELECT * FROM equipos WHERE equipo_id = @CODIGO
		END

	EXEC CONSULTAREQUIPO_FILTRO  3

	CREATE PROCEDURE CONSULTARTECNICO_FILTRO
	
	@CODIGO INT
	
	AS
		BEGIN
			SELECT * FROM tecnicos WHERE tecnico_id = @CODIGO
		END

	EXEC CONSULTARTECNICO_FILTRO  3


	CREATE PROCEDURE ACTUALIZAR_USUARIO
	@CODIGO
	
	AS
		BEGIN
			UPDATE usuarios set 
		END

/*PARA EXAMEN*/

CREATE PROCEDURE INGRESAR_USUARIO

@NOMBRE varchar(50),
@CORREO_ELECTRONICO varchar(50),
@TELEFONO varchar(50)
AS
	BEGIN
		INSERT INTO usuarios (nombre, correoElectronico, telefono) VALUES (@NOMBRE, @CORREO_ELECTRONICO, @TELEFONO)
	END

EXEC INGRESAR_USUARIO Juan, juan@hotmail, 8833

CREATE PROCEDURE INGRESAR_TECNICO

@NOMBRE varchar(50),
@ESPECIALIDAD varchar(50)

AS
	BEGIN
		INSERT INTO tecnicos (nombre, especialidad) VALUES (@NOMBRE, @ESPECIALIDAD)
	END

EXEC INGRESAR_TECNICO Rafael, Telematica

CREATE PROCEDURE INGRESAR_EQUIPO

@TIPO_EQUIPO varchar(50),
@MODELO varchar(50),
@CODIGO_USUARIO INT

AS
	BEGIN
		INSERT INTO equipos (tipoEquipo, modelo, codigoUsuario) VALUES (@TIPO_EQUIPO, @MODELO, @CODIGO_USUARIO)
	END

EXEC INGRESAR_EQUIPO MICROONDAS, PANASONIC, 2

CREATE PROCEDURE BORRAR_USUARIO
@CODIGO int
AS
	BEGIN
		DELETE usuarios WHERE usuario_id = @CODIGO
	END

CREATE PROCEDURE BORRAR_EQUIPO
@CODIGO int
AS
	BEGIN
		DELETE equipos WHERE equipo_id = @CODIGO
	END


CREATE PROCEDURE BORRAR_TECNICO
@CODIGO int
AS
	BEGIN
		DELETE tecnicos WHERE tecnico_id = @CODIGO
	END



	
CREATE PROCEDURE MODIFICAR_USUARIO
@CODIGO int,
@NOMBRE varchar(50),
@CORREO_ELECTRONICO varchar(50),
@TELEFONO varchar(50)
AS
	BEGIN
		UPDATE usuarios SET nombre = @NOMBRE, correoElectronico = @CORREO_ELECTRONICO, telefono = @TELEFONO
		WHERE usuario_id = @CODIGO
	END

ALTER PROCEDURE MODIFICAR_USUARIO
@CODIGO int,
@NOMBRE varchar(50),
@CORREO_ELECTRONICO varchar(50),
@TELEFONO varchar(50)
AS
	BEGIN
		UPDATE usuarios SET nombre = @NOMBRE, correoElectronico = @CORREO_ELECTRONICO, telefono = @TELEFONO
		WHERE usuario_id = @CODIGO
	END

	EXEC MODIFICAR_USUARIO 2, RICARDO, ric@outlook, 83235343

CREATE PROCEDURE MODIFICAR_EQUIPO
@CODIGO int,
@TIPO_EQUIPO varchar(50),
@MODELO varchar(50),
@CODIGO_USUARIO int
AS
	BEGIN
		UPDATE equipos SET tipoEquipo = @TIPO_EQUIPO, modelo = @MODELO, codigoUsuario = @CODIGO_USUARIO
		WHERE equipo_id = @CODIGO
	END

	EXEC MODIFICAR_EQUIPO 4, Desktop, LENOVO, 1

CREATE PROCEDURE MODIFICAR_TECNICO
@CODIGO int,
@NOMBRE varchar(50),
@ESPECIALIDAD varchar(50)

AS
	BEGIN
		UPDATE tecnicos SET nombre = @NOMBRE, especialidad = @ESPECIALIDAD
		WHERE tecnico_id = @CODIGO
	END


	/*Reparaciones*/

	USE examen2_MiguelSotoAguilar
	GO
	CREATE PROCEDURE CONSULTAR_REPARACIONES
	AS
		BEGIN
	
			SELECT * FROM reparaciones
		END
	
	
	EXEC CONSULTAR_REPARACIONES

	/*DROP PROCEDURE CONSULTAR_REPARACIONES;*/


	INSERT INTO reparaciones (estado, codigoEquipo) values ('Ingresado', 3)
	
	delete reparaciones where reparacion_id = 1;

	USE examen2_MiguelSotoAguilar
	GO

	alter table reparaciones alter COLUMN estado char(20);

	CREATE PROCEDURE INGRESAR_REPARACION
	@EQUIPO_ID int,
	@FECHA_REPARACION date,
	@ESTADO char

	AS
	BEGIN
		INSERT INTO reparaciones (codigoEquipo, fechaSolicitud, estado) VALUES (@EQUIPO_ID, @FECHA_REPARACION, @ESTADO)
	END

	/*Este procedimiento se hizo antes y por error no lo guarde pero existe*/

	/*PROCEDURE REPARACIONES*/

	use examen2_MiguelSotoAguilar
	GO

	CREATE PROCEDURE BORRAR_REPARACION
@CODIGO int
AS
	BEGIN
		DELETE reparaciones WHERE reparacion_id = @CODIGO
	END

	/*Obligado a ingresar el correo*/
	ALTER TABLE USUARIOS ALTER COLUMN CORREOELECTRONICO VARCHAR(50) NOT NULL

	use examen2_MiguelSotoAguilar
	GO

	CREATE PROCEDURE MODIFICAR_REPARACION
	@CODIGO int,
	@FECHA_SOLICITUD DATETIME,
	@ESTADO char(20),
	@CODIGO_EQUIPO int
	AS
	BEGIN
		UPDATE reparaciones SET fechaSolicitud = @FECHA_SOLICITUD, estado = @ESTADO, codigoEquipo = @CODIGO_EQUIPO
		WHERE reparacion_id = @CODIGO
	END
	
drop procedure MODIFICAR_REPARACION
alter table reparaciones drop constraint df_fecha
alter table reparaciones alter COLUMN fechaSolicitud datetime 

alter table reparaciones
drop constraint codigoEquipo

drop table reparaciones

alter table reparaciones
add constraint fk_codigoEquipo foreign key (codigoEquipo) references equipos (equipo_id)


/*tabla de roles*/

CREATE TABLE roles
(
	codigo INT IDENTITY,
	nombre varchar(40) CONSTRAINT up_nombre UNIQUE,
	CONSTRAINT pk_codigoRol  PRIMARY KEY (codigo)
)

use examen2_MiguelSotoAguilar
GO
INSERT INTO roles (nombre) values ('Técnico'), ('Ingeniero') ,('Administrador'), ('Vendedor')

SELECT * FROM ROLES

CREATE TABLE usuarioRoles
(
	id_Usuario_Rol int,
	id_Rol_Usuario int,
	CONSTRAINT fk_idUsuario_Rol foreign key (id_Usuario_Rol) REFERENCES usuarios (usuario_id),
	CONSTRAINT fk_idRol_Usuario foreign key (id_Rol_Usuario) REFERENCES roles (codigo)
)

ALTER TABLE USUARIOS
DROP COLUMN CLAVE
ALTER TABLE USUARIOS
ADD CLAVE VARCHAR(50);
use examen2_MiguelSotoAguilar
go
CREATE PROCEDURE VALIDARUSUARIO

@CORREO varchar(50),
@CLAVE varchar(50)
AS
	BEGIN
			select correoElectronico as correo, clave as clave from usuarios
			where correoElectronico = @CORREO AND clave = @CLAVE
		
	END
	
ALTER PROCEDURE VALIDARUSUARIO
@CORREO varchar(50),
@CLAVE varchar(50)
AS
	BEGIN
			select correoElectronico as correo, clave as clave, nombre from usuarios
			where correoElectronico = @CORREO AND clave = @CLAVE
		
	END


	EXEC VALIDARUSUARIO 'j@gmail', '123'

	
select * from usuarios


update usuarios 
set clave = '123'
where usuario_id = 1;


CREATE PROCEDURE BUSCARCONFILTRO
@CODIGO varchar(50),
@CORREO varchar(50)
AS
	BEGIN
			select usuario_id as usuario, correoElectronico as correo, nombre from usuarios
			where usuario_id = @CODIGO AND correoElectronico = @CORREO
		
	END

---inner join | nombre de la tabla.Nombre del campo---

CREATE PROCEDURE consulta_detalle_de_reparacion

@rol VARCHAR(20),
@id_del_tecnico INT=0

AS
BEGIN

IF @rol='Administrador'
BEGIN
SELECT asignaciones.fechaasignacion,tecnicos.nombre,reparaciones.fechaSolicitud,reparaciones.estado,detallesReparacion.*
FROM detallesReparacion

INNER JOIN reparaciones ON detallesReparacion.codigoReparacion=reparaciones.reparacion_id
INNER JOIN asignaciones ON asignaciones.codigoReparacionTecnico=reparaciones.reparacion_id
INNER JOIN tecnicos ON tecnicos.tecnico_id=asignaciones.codigoTecnicoAsignacion
END

ELSE 
BEGIN
SELECT asignaciones.fechaasignacion,tecnicos.nombre,reparaciones.fechaSolicitud,reparaciones.estado,detallesReparacion.*
FROM detallesReparacion

INNER JOIN reparaciones ON detallesReparacion.codigoReparacion=reparaciones.reparacion_id
INNER JOIN asignaciones ON asignaciones.codigoReparacionTecnico=reparaciones.reparacion_id
INNER JOIN tecnicos ON tecnicos.tecnico_id=asignaciones.codigoTecnicoAsignacion

WHERE tecnicos.tecnico_id=@id_del_tecnico
END

END

CREATE PROCEDURE consulta_detalle_de_reparacion_filtrado
@estado VARCHAR(50)

AS
BEGIN
SELECT asignaciones.fechaasignacion,tecnicos.nombre,reparaciones.fechaSolicitud,reparaciones.estado,detallesReparacion.*
FROM detallesReparacion
INNER JOIN reparaciones ON detallesReparacion.codigoReparacion=reparaciones.reparacion_id
INNER JOIN asignaciones ON asignaciones.codigoReparacionTecnico=reparaciones.reparacion_id
INNER JOIN tecnicos ON tecnicos.tecnico_id=asignaciones.codigoTecnicoAsignacion
WHERE reparaciones.estado=@estado

END


--- informacion asignaciones----

CREATE PROCEDURE consulta_detalle_de_asignaciones

@rol VARCHAR(20),
@id_del_tecnico INT=0

AS
BEGIN

IF @rol='Administrador'
BEGIN
SELECT asignaciones.fechaasignacion,tecnicos.nombre,reparaciones.fechaSolicitud,reparaciones.estado,detallesReparacion.*
FROM detallesReparacion

INNER JOIN reparaciones ON detallesReparacion.codigoReparacion=reparaciones.reparacion_id
INNER JOIN asignaciones ON asignaciones.codigoReparacionTecnico=reparaciones.reparacion_id
INNER JOIN tecnicos ON tecnicos.tecnico_id=asignaciones.codigoTecnicoAsignacion
END

ELSE 
BEGIN
SELECT asignaciones.fechaasignacion,tecnicos.nombre,reparaciones.fechaSolicitud,reparaciones.estado,detallesReparacion.*
FROM detallesReparacion

INNER JOIN reparaciones ON detallesReparacion.codigoReparacion=reparaciones.reparacion_id
INNER JOIN asignaciones ON asignaciones.codigoReparacionTecnico=reparaciones.reparacion_id
INNER JOIN tecnicos ON tecnicos.tecnico_id=asignaciones.codigoTecnicoAsignacion

WHERE tecnicos.tecnico_id=@id_del_tecnico
END




