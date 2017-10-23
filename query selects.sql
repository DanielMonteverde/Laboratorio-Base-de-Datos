USE Pharmacy 
GO

-- Group by

select Nombre,Apellidos,Teléfono
from Cliente
group by Nombre,Apellidos,Teléfono

-- Un select con funcion COUNT

select COUNT(Nombre)
from Cliente
WHERE Nombre like 'A%'

select * from Puesto
select * from Empleado

-- Un select con funcion AVG

select AVG(Sueldo)
from Puesto

-- Un select con funcion SUM

select SUM(Sueldo)
from Puesto

-- Un select con funcion COUNT + where

select COUNT(IdEmpleado)
from Empleado
where IdSucursal = 'ACA3AB77-AC42-451B-89C1-FDA008BDE918'

-- Un select con funcion AVG + where

select AVG(Sueldo)
from Puesto
where Tipo = 'Limpiador'

update Puesto
set Tipo = 'Limpiador'
where IdPuesto = '4723A255-EEA3-4D1E-BE3F-4D04AE54E582'

-- Un select con funcion SUM + where

select SUM(Sueldo)
from Puesto
where Tipo = 'Limpiador'

-- Un select con Having

select COUNT(Sueldo), Tipo
from Puesto
Group by Tipo
Having count(Sueldo) < 1000;


-- Otro select con Having 

Select COUNT(Nombre), Apellidos
from Empleado
Group by Apellidos
Having count(Nombre) like ('K%')

-- Select con TOP

select top 3 *
from Empleado
order by Nombre desc;

-- Otro select con TOP

select top 2 *
from Puesto
where Sueldo > 500
order by Tipo asc;

select * from Puesto