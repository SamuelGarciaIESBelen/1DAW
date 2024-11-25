USE pueblos;

# 1
INSERT INTO pueblos VALUES (29078, 'Pazalla', 23.65, 2675 + 3541, 2675, 3541, 35, 165);

# 2
CREATE OR REPLACE TABLE poblaciones
	SELECT codigo, nombre, extension, pob_hombres, pob_mujeres, vehiculos, lineas_tel
	FROM pueblos;

# 3
UPDATE poblaciones
SET lineas_tel = lineas_tel * 1.1;

# 4
UPDATE poblaciones
SET vehiculos = vehiculos * 0.9
WHERE pob_hombres + pob_mujeres > 15000;

# 5
DELETE FROM poblaciones
WHERE pob_hombres + pob_mujeres < 5000;