/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE IF NOT EXISTS pedidos (
id INT PRIMARY KEY,
id_usuario INT,
id_producto INT,
CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id)
)

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/

INSERT INTO public.pedidos
VALUES (1,1,5), (2,2,2), (3, 3, 4)

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE).*/

SELECT usuarios.nombre, COALESCE (productos.nombre,'No ha realizado ningun pedido.')
FROM public.usuarios
LEFT JOIN public.productos 
ON usuarios.producto_id = productos.id

/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/

SELECT usuarios.nombre FROM public.usuarios
LEFT JOIN public.productos 
ON usuarios.producto_id = productos.id

/*Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

ALTER TABLE public.pedidos
ADD COLUMN cantidad INT 

UPDATE public.pedidos 
SET cantidad = 6
WHERE id = 1

UPDATE public.pedidos 
SET cantidad = 2
WHERE id = 2

UPDATE public.pedidos 
SET cantidad = 8
WHERE id = 3

