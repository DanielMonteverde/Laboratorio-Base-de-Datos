create view [dbo].[Detalle_Producto_porTipo] as
select p.forma_farmaceutica as Tipo,  SUM(d.precio) as PrecioTotal, SUM(d.cantidad) as CantidadTotal
from Detalle_Compra d
join Producto p on d.ID_producto = p.ID_Producto
Group by p.forma_farmaceutica
GO

select * from Detalle_Producto_porTipo

--

create view [dbo].[FechaOrdenCompraProveedor] as 

select PROVEEDOR.NOMBRE, ORDEN_COMPRA.FECHA_ORDEN_COMPRA
FROM PROVEEDOR

left join ORDEN_COMPRA ON PROVEEDOR.ID_PROVEEDOR = ORDEN_COMPRA.ID_PROVEEDOR

GO

select * from FechaOrdenCompraProveedor

--

create view [dbo].[Nomina] as

select e.nombre as Nombre, e.apellidos as Apellidos, p.tipo as Puesto, p.sueldo as Sueldo
from Empleado e 
join puesto p on e.id_puesto = p.id_puesto 
GO

select * from Nomina

--

create view [dbo].[ProveedorProductoCantidad] as
select prod.nombre_producto as Producto, i.cantidad_almacen as Cantidad, prov.nombre as Proveedor
from producto prod
join proveedor prov on prod.ID_proveedor = prov.ID_proveedor
join inventario i on prod.ID_producto = i.ID_producto
GO

select * from ProveedorProductoCantidad

--

create view [dbo].[TotalFactura] as
select c.nombre as NombreCliente, c.apellidos as ApellidosClientes, f.fecha as FechaFactura, vt.total as Total
from factura f 
inner join cliente c on f.Id_cliente = c.id_cliente
inner join VentaTotal vt on f.id_venta = vt.id

GO

select * from TotalFactura

--

CREATE VIEW [dbo].[USUARIOSADMIN] AS
SELECT usr.ID_EMPLEADO, usr.ID_USUARIO, usr.ADMINISTRADOR, emp.NOMBRE, emp.APELLIDOS, emp.TELEFONO, emp.CORREO
FROM [EMPLEADO] emp
INNER JOIN [USUARIOS] as usr on usr.ID_EMPLEADO = emp.ID_EMPLEADO

GO

select * from USUARIOSADMIN

--

create view [dbo].[VentaTotal] as
select ve.id_venta as ID, e.nombre as NombreEmpleado, e.apellidos as ApellidosEmpleado, vp.fecha as Fecha, SUM(vp.Subtotal) as Total
from id_venta_Empleado ve
inner join id_venta_producto vp on ve.ID_venta = vp.ID_venta
inner join empleado e on ve.id_empleado = e.id_empleado
Group by ve.id_venta, vp.fecha, e.nombre, e.apellidos, vp.fecha
GO

select * from VentaTotal

--