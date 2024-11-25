(:Mostrar los bailes ordenados por nombre:)

for $baile in doc("bailes.xml")//bailes/baile

order by $baile/nombre ascending

return $baile/nombre/text()