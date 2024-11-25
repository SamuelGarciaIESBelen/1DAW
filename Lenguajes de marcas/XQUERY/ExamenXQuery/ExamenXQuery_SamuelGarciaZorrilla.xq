(:Recupera el nombre del jugador cuyo entrenador tenga una "X" en su nombre:)
for $equipo in //jugadores/jugador
where contains($equipo/entrenador, 'X')
return <consulta1>{$equipo/nombre/text()}</consulta1>,

(:Recupera aquellos equipos que tienen jugadores que cuestan más de 50 millones de euros (no tienes que mostrar los que cobran en libras):)
for $equipo in //jugadores/jugador
where $equipo/precio > 50000000 and $equipo/precio/@moneda != "libra"
return <consulta2>{$equipo/equipo/text()}</consulta2>,

(:Devuelve una etiqueta xml jugador con el precio y el nombre del jugador con el salario más alto (ignorando euros o libras):)
let $max := max(//jugadores/jugador/precio)
for $equipo in //jugadores/jugador
where $equipo/precio = $max
return <consulta3><jugador>{$equipo/nombre}<salario>{$equipo/precio/text()}</salario></jugador></consulta3>,

(:Realiza la suma de todos los precios de jugadores, teniendo en cuenta la moneda usada (1 libra = 1,17 euros):)
sum(
  (
    for $equipo in //jugadores/jugador
    where $equipo/precio/@moneda = "libra"
    return $equipo/precio * 1.17,
    
    for $equipo in //jugadores/jugador
    where $equipo/precio/@moneda = "euro"
    return $equipo/precio
  )
)