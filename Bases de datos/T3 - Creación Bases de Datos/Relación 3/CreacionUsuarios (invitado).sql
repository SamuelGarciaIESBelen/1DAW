show grants for invitado@localhost;

use DAW;

# drop table if exists prueba;

# No podemos ejecutar el script porque el usuario invitado no tiene permisos para eliminar tablas

create table prueba (
id int primary key
);

# APARTADO 8 --> Consulta root