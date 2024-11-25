CREATE TABLE alumno (
	id_alum	INTEGER		NOT NULL	PRIMARY KEY,
	nom_alum	VARCHAR(30)	NOT NULL,
	tlf_alum	INTEGER(9)	NOT NULL
);

CREATE TABLE profesor (
	id_prof	INTEGER		NOT NULL PRIMARY KEY,
	nom_prof	VARCHAR(30)	NOT NULL
);

CREATE TABLE tener(
	id_alum	INTEGER,
	id_prof	INTEGER,
	fecha		DATE 			NOT NULL,
	CONSTRAINT PRIMARY KEY (id_alum, id_prof),
	CONSTRAINT fk_tener_alumno_id_alum FOREIGN KEY (id_alum) REFERENCES alumno(id_alum),
	CONSTRAINT fk_tener_profesor_id_prof FOREIGN KEY (id_prof) REFERENCES profesor(id_prof)
);
/*
DROP TABLE alumno;
DROP TABLE profesor;
DROP TABLE tener;
*/