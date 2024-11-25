(: EJERCICIO 10
Obtener el precio del baile con el precio más caro:)
max (for $baile in doc("bailes.xml")//bailes/baile
return $baile/precio/text()),

(: EJERCICIO 11
Obtener el precio y el nombre del baile con el precio más caro:)
let $max := max(doc("bailes.xml")//bailes/baile/precio)
for $baile in doc("bailes.xml")//bailes/baile
where $baile/precio = $max
return
	<resultado>
		<nombre>{$baile/nombre/text()}</nombre>
		<precio>{$max}</precio>    
	</resultado>,

(: EJERCICIO 12
Obtener el precio del baile con el precio más barato:)
min(doc("bailes.xml")//bailes/baile/precio),

(: EJERCICIO 13
Obtener el precio y el nombre del baile con el precio más barato:)
let $min := min(doc("bailes.xml")//bailes/baile/precio)
for $baile in doc("bailes.xml")//bailes/baile
where $baile/precio = $min
return
	<resultado>
		<nombre>{$baile/nombre/text()}</nombre>
		<precio>{$min}</precio>
	</resultado>