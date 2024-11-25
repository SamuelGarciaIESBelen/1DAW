(:14.- Obtener la suma del precio de todas las clases:)
sum (for $baile in /bailes/baile
return $baile/precio),

(:15.- Obtener la suma del precio de todas las clases, teniendo en cuenta la moneda usada:)
sum (
  (for $baile in /bailes/baile
  where $baile/precio/@moneda = "euro"
  return $baile/precio,
  
  for $baile in /bailes/baile
  where $baile/precio/@moneda = "dolares"
  return $baile/precio * 0.91
  )
)