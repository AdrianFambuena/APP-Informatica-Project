USE mydb;

/* CONSULTA1 */
SELECT nombre, stock FROM producto ORDER BY stock ASC;
/* CONSULTA2 */
SELECT nombre, precio, stock FROM producto WHERE stock < 20 ORDER BY stock ASC;
/* CONSULTA3 */
SELECT m.nombre AS marca, COUNT(p.id_producto) AS total_productos FROM marca m LEFT JOIN producto p ON m.id_marca = p.id_marca GROUP BY m.nombre ORDER BY total_productos DESC;
/* CONSULTA4 */
SELECT t.nombre, t.apellido, e.nombre AS especialidad FROM tecnico t LEFT JOIN especialidad e ON t.id_especialidad = e.id_especialidad ORDER BY t.nombre;
/* CONSULTA5 */
SELECT r.nombre AS rol, COUNT(ru.id_usuario) AS total_usuarios FROM rol r LEFT JOIN rol_usuario ru  ON r.id_rol = ru.id_rol GROUP BY r.nombre ORDER BY total_usuarios DESC;