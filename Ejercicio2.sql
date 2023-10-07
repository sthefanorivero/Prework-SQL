/*Ejercicios niverl fácil:

1. Crea una base de datos llamada "MiBaseDeDatos".*/

Esto lo cree desde el explorador de objetos. 

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/

CREATE TABLE IF NOT EXISTS usuarios (
  id INT PRIMARY KEY,
  nombre VARCHAR (255),
  edad INT
	)

/*3. Inserta dos registros en la tabla "Usuarios*/
INSERT INTO public.usuarios 
VALUES (1, 'Cristian', 26), (2, 'Sthefano', 30)

/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/

UPDATE public.usuarios
SET edad = 27
WHERE id = 1

/*5. Elimina un usuario de la tabla "Usuarios".*/

DELETE FROM public.usuarios
WHERE id = 2

/* Ejercicios nivel moderado:

1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE IF NOT EXISTS ciudades (
id INT PRIMARY KEY,
nombre VARCHAR (255),
país VARCHAR (255)

)

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/

INSERT INTO public.ciudades 
VALUES (1, 'Paris', 'Francia'), (2, 'Montevideo', 'Uruguay'), (3, 'Valencia', 'España')

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/

ALTER TABLE public.usuarios
ADD COLUMN ciudades_id INT

ALTER TABLE public.usuarios
ADD FOREIGN KEY (ciudades_id) REFERENCES public.ciudades(id)

/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN)*/

SELECT * FROM public.usuarios
LEFT JOIN public.ciudades
ON ciudades.id = usuarios.ciudades_id

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/

SELECT usuarios.nombre FROM public.usuarios 
INNER JOIN public.ciudades
ON ciudades.id = usuarios.ciudades_id
