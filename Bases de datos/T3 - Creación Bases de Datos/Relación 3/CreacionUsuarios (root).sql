# APARTADO 1
drop database if exists DAW;
create database if not exists DAW character set utf8mb4 collate utf8mb4_spanish_ci;

drop user if exists alumno@localhost;
create user alumno@localhost identified by 'patata';

grant create, alter, drop on DAW.* to alumno@localhost;

# APARTADO 2 --> Consulta alumno

# Hemos intentado crear las tablas pero no teníamos permiso para usar el comando references

grant references on DAW.* to alumno@localhost;

# APARTADO 4 --> Consulta alumno

# No podemos crear usuarios con alumno porque no le hemos dado permisos todavía

grant create user on *.* to alumno@localhost with grant option;

# APARTADO 6 --> Consulta alumno

REVOKE CREATE USER on *.* FROM alumno@localhost;
REVOKE DROP ON DAW.* FROM alumno@localhost;
SET PASSWORD FOR alumno@localhost = PASSWORD('patata');
RENAME user alumno@localhost TO dawuser@localhost;
DROP USER invitado@localhost;
GRANT ALL ON DAW.* TO dawuser@localhost WITH GRANT OPTION;
drop user Samuel;
CREATE USER Samuel identified by 'patata';
GRANT ALL ON DAW.* TO Samuel;