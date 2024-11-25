use DAW;

drop table if exists personal;
drop table if exists juego;

create table personal (
idPersonal 		int 			auto_increment PRIMARY KEY,
nombre 			varchar(20) 	NOT NULL,
apellidos 		varchar(30) 	NOT NULL,
fecNacimiento 	date
);

create table juego (
idJuego 		int 			primary key,
nombre 			varchar(20) 	NOT NULL,
descripcion 	varchar(40),
fecCompra 		date,
idComprador 	int,
FOREIGN KEY (idComprador) REFERENCES personal(idPersonal)
);

# APARTADO 3 --> Consulta root

drop user if exists invitado@localhost;
create user invitado@localhost;

# APARTADO 5 --> Consulta root

grant create on DAW.* to invitado@localhost;

# APARTADO 7 --> Consulta invitado