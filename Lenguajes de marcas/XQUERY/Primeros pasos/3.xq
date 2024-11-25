for $baile in doc("bailes.xml")//bailes/baile

where $baile/number(precio) > 40

return 

<baile>

  <nombre>{data($baile/nombre/text())}</nombre>

  <precio>{data($baile/precio/text())}</precio>    

</baile>