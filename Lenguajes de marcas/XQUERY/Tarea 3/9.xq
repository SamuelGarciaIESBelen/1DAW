(:Mostrar el nombre de los bailes de la sala 1, que se pague con euros y el precio sea menor a 35:)
for $baile in doc("bailes.xml")//bailes/baile

where $baile/sala = 1 and contains($baile/precio/@moneda, "euro") and $baile/precio < 35

return $baile/nombre/text()