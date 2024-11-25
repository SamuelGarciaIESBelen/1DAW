(:Mostrar el nombre de los bailes donde el apellido del profesor sea Lozano:)

for $baile in doc("bailes.xml")//bailes/baile

where contains($baile/profesor, "Lozano")

return $baile/nombre/text()