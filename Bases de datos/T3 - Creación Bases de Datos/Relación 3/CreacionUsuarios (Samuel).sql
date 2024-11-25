use DAW;

create index IN_Personal_Nombre_Apellidos on Personal (nombre, apellidos);
alter table Personal add column dni char(9) unique;
drop index IN_Personal_Nombre_Apellidos on Personal;