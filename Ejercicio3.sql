/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS productos(
id INT PRIMARY KEY,
nombre VARCHAR (255),
precio NUMERIC
)

/*2. Inserta al menos cinco registros en la tabla "Productos".*/

INSERT INTO public.productos
VALUES (1, 'Mochila', 20), (2, 'Gorra de lana', 15), (3, 'Abrigo con capucha', 25),
(4, 'Camiseta', 12), (5, 'Pantalón corto', 16), (6, 'Pantalón largo',25)

/*3. Actualiza el precio de un producto en la tabla "Productos".*/

UPDATE public.productos
SET precio = 30
WHERE id = 6

/*4. Elimina un producto de la tabla "Productos".*/

DELETE FROM public.productos
WHERE id = 6

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/

ALTER TABLE public.usuarios 
ADD COLUMN producto_id INT 
VALUES (5,2,4)


ALTER TABLE public.usuarios 
ADD CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES public.productos(id) 

SELECT usuarios.nombre, productos.nombre FROM public.usuarios
INNER JOIN public.productos ON usuarios.producto_id = productos.id



