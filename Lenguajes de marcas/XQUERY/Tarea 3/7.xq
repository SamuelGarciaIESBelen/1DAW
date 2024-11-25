(:Mostrar todos los bailes, excepto el 3 y 5:)
for $baile in doc("bailes.xml")//bailes/baile

where $baile/@id != 3 and $baile/@id != 5

return $baile/nombre/text()