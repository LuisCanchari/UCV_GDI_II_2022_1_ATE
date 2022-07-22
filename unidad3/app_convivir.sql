--CREACION DE BASE DE DATOS 
if db_id('db_convivir') is not null
   drop database db_convivir;
go

create database db_convivir;
go

use db_convivir;
go

--CREAR LA TABLA CATEGORIAS
if object_id('categorias') is not null
	drop table categorias;

create table categorias (
  id int not null identity,
  nombre varchar(50) not null,
  descripcion varchar(500),
  constraint PK_categoria Primary key (id)
)
go

--CREAR LA TABLA DOCUMENTOS
if object_id('documentos') is not null
	drop table documentos;

create table documentos(
	id int not null IDENTITY,
	tipo varchar(10) not null,
	numero varchar(9) not null,
	fecha date,
	descripcion varchar(MAX), 
	total decimal(8,2), 
	categoria_id int,
	constraint PK_documento Primary key (id),
	constraint FK_categoria_id Foreign key (categoria_id) references categorias(id)
)
go

--CONFIGURAR FORMATO DE FECHA
set dateformat dmy;
go

--INSERTAR CATEGORIAS
insert into categorias (nombre, descripcion) values 
('Servicios de personal', 'Son gastos relacionado con el pago del personal de portería, limpieza, vigilancia, jardinería.')

insert into categorias (nombre, descripcion) values 
('Servicios generales', 'Son gastos relacionado con el pago de agua, luz, teléfono, gas, recojo de basura u otro similar.')

insert into categorias (nombre, descripcion) values 
('Insumos y materiales', 'Son gatos relacionados con la compra de consumibles como son materiales de limpieza, útiles de escritorio u otro similar')

insert into categorias (nombre, descripcion) values 
('Herramientas y repuestos', 'Son gastos relacionados con la compra de bienes no consumibles como herramientas y repuestos.')

insert into categorias (nombre, descripcion) values 
('Administrativo', 'Son gastos relacionados a la administración como pasajes, sacado de copias, tramites etc.')

--INSERTAR DOCUMENTOS
insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('boleta','001', '24/06/2022','Adquisicion de Materiales de limpieza', 200.00, 3);

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('boleta', '002', '24/06/2022','Pago se servicio de limpieza', 900.00, 1 );

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('factura', '001-200', '24/01/2022','Adquisicion de bomba de agua', 2900.00, 4 );

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('factura', '001-500', '04/02/2022','Adquisicion de 4 camaras de video', 1900.00 , 4);

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('recibo' , '005', '25/03/2022','Pago por se servicio de jardineria', 200.00, 1 );

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('recibo', '006', '01/04/2022','Pago por desechos de escombros', 150.00, 1 );

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('ticket', '000020', '24/05/2022','Compra de desinfectantes', 50.00, 3 );

insert into documentos (tipo, numero, fecha, descripcion, total, categoria_id) values
('ticket', '000022', '25/06/2022','Servicio de fotocopiado', 30.00, 5 );

go


--CREAR PROCEDIMIENTO ALMACENADO
if object_id('usp_documentos_lista') is not null
  drop procedure usp_documentos_lista;

go

CREATE PROCEDURE usp_documentos_lista
AS
BEGIN 
	SELECT id, tipo, numero, fecha, descripcion, total
	FROM documentos;
END 

go


if object_id('usp_documentos_item') is not null
  drop procedure usp_documentos_item;
go

CREATE PROCEDURE usp_documentos_item
@id int
AS
BEGIN 
	SELECT TOP 1 id, tipo, numero, fecha, descripcion, total
	FROM documentos
	WHERE id = @id;
END

go

if object_id('usp_documentos_insert') is not null
  drop procedure usp_documentos_insert;
go

CREATE PROCEDURE usp_documentos_insert
 @tipo nvarchar(10), 
 @numero nvarchar(9), 
 @fecha date, 
 @descripcion nvarchar(MAX), 
 @total decimal 
AS
BEGIN 
	INSERT INTO documentos (tipo, numero, fecha, descripcion, total)
	VALUES (@tipo, @numero, @fecha, @descripcion, @total);
END 
go

if object_id('usp_documentos_edit') is not null
  drop procedure usp_documentos_edit;

go

CREATE PROCEDURE usp_documentos_edit
 @id int,
 @tipo nvarchar(10), 
 @numero nvarchar(9), 
 @fecha date, 
 @descripcion nvarchar(MAX), 
 @total decimal 
AS
BEGIN 
	UPDATE documentos 
	SET 
	tipo = @tipo, 
	numero=@numero, 
	fecha=@fecha, 
	descripcion=@descripcion, 
	total=@total
	WHERE id = @id;
END
go

if object_id('usp_documentos_del') is not null
  drop procedure usp_documentos_del;

go


CREATE PROCEDURE usp_documentos_del
 @id int
 
AS
BEGIN 
	DELETE FROM documentos
	WHERE id = @id;
END
go