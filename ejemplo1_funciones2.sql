--creacion de tablas
create table empleados2(
  documento char(8) not null,
  nombre varchar(30),
  fechaingreso datetime,
  mail varchar(50),
  telefono varchar(12)
);

insert into empleados2 values('22222222', 'Ana Acosta','1985/10/10','anaacosta@gmail.com','4556677');
insert into empleados2 values('23333333', 'Bernardo Bustos', '1986/02/15',null,'4558877');
insert into empleados2 values('24444444', 'Carlos Caseros','1999/12/02',null,null);
insert into empleados2 values('25555555', 'Diana Dominguez',null,null,'4252525');

-- Eliminamos, si existe, la función "f_fechaCadena":
if object_id('dbo.f_fechaCadena') is not null
  drop function dbo.f_fechaCadena;

create function f_fechaCadena
 (@fecha varchar(25))
  returns varchar(25)
  as
  begin
    declare @nombre varchar(25)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(month,@fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
      end--case
      set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+' de '+@nombre
      set @nombre=@nombre+' de '+ rtrim(cast(datepart(year,@fecha)as char(4)))
    end--si es una fecha válida
    return @nombre
 end;

 --
 select dbo.f_fechaCadena(getdate())
 

 --CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  
 select month(CONVERT(datetime,'01/02/2022',103));

