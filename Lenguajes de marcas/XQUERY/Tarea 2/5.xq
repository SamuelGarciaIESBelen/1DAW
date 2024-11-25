(:Mostrar los nombres de los bailes que contienen una a:)

for $baile in doc("bailes.xml")//bailes/baile

where contains($baile/nombre, 'a')

return $baile/nombre/text()