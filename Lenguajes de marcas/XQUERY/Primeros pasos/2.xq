for $baile in doc("bailes.xml")//bailes/baile

return 

<baile>

  <nombre>{data($baile/nombre/text())}</nombre>

  <precio>{data($baile/precio/text())}</precio>    

</baile>