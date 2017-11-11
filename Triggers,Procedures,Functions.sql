-- Inicio de la Practica 7 (Procedures, Fuctions y Triggers)


create procedure PrecioVentas
	(@a float)

	as
	begin

	select p.forma_farmaceutica as Tipo,  SUM(d.precio) as PrecioTotal, SUM(d.cantidad) as CantidadTotal
	from Detalle_Compra d
	join Producto p on d.ID_producto = p.ID_Producto
	Group by p.forma_farmaceutica
	
	end 

	
	exec PrecioVentas 1.3

	--

create procedure FechaOrdCompraProveedor
		(@a date)

		as
		begin

		select PROVEEDOR.NOMBRE, ORDEN_COMPRA.FECHA_ORDEN_COMPRA
		FROM PROVEEDOR

		left join ORDEN_COMPRA ON PROVEEDOR.ID_PROVEEDOR = ORDEN_COMPRA.ID_PROVEEDOR

		
		end

		exec FechaOrdCompraProveedor '2017-08-25'

--

create procedure Nominal
	(@a float)

	as 
	begin

	select e.nombre as Nombre, e.apellidos as Apellidos, p.tipo as Puesto, p.sueldo as Sueldo
	from Empleado e 
	join puesto p on e.id_puesto = p.id_puesto 
	
	end

	exec Nominal 90

--

create procedure proveproduccatid
	(@a varchar)

	as
	begin

	select prod.nombre_producto as Producto, i.cantidad_almacen as Cantidad, prov.nombre as Proveedor
	from producto prod
	join proveedor prov on prod.ID_proveedor = prov.ID_proveedor
	join inventario i on prod.ID_producto = i.ID_producto

	end

	exec proveproduccatid 'Juan'

--

create procedure TotalFacturaTotal
	(@a float)

	as
	begin

	select c.nombre as NombreCliente, c.apellidos as ApellidosClientes, f.fecha as FechaFactura, vt.total as Total
	from factura f 
	inner join cliente c on f.Id_cliente = c.id_cliente
	inner join VentaTotal vt on f.id_venta = vt.id

	end

	exec TotalFacturaTotal 0.0

--

create function Suma_de_Valores(@a float, @b float)

returns float

as
begin

return @a + @b

end 

select dbo.Suma_de_Valores(27.54,3.1416)

--

create trigger VentaAñadida
on Id_venta_empleado
after insert
as
begin
	select ID_venta from inserted
end

--

create trigger TotalDespuesDeAñadirProducto
on Id_venta_producto
after insert 
as
declare @id_venta varchar(255)
select @id_venta = id_venta from inserted
begin
	select * from VentaTotal
	where id = @id_venta
end

-- Fin Practica 7