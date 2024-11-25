--
-- BD: Pueblos
--
CREATE OR REPLACE DATABASE pueblos CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE pueblos;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla pueblos
--

CREATE OR REPLACE TABLE pueblos (
  codigo 		CHAR(5) 		NOT NULL,
  nombre 		VARCHAR(28) 	NOT NULL,
  extension 	DECIMAL(4,1) 	NOT NULL,
  pob_total 	INT(6) 			NOT NULL,
  pob_hombres 	INT(6) 			NOT NULL,
  pob_mujeres 	INT(6) 			NOT NULL,
  vehiculos 	INT(11) 		NOT NULL,
  lineas_tel 	INT(11) 		NOT NULL,
  CONSTRAINT PRIMARY KEY (codigo)
);

--
-- Volcado de datos para la tabla pueblos
--

INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29001', 'Alameda ', '65.1', 5403, 2731, 2672, 48, 475);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29002', 'Alcaucín ', '45.1', 2375, 1193, 1182, 49, 642);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29003', 'Alfarnate ', '34.0', 1159, 590, 569, 10, 382);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29004', 'Alfarnatejo ', '20.4', 463, 237, 226, 2, 112);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29005', 'Algarrobo ', '9.7', 6013, 3035, 2978, 115, 2382);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29006', 'Algatocín ', '19.7', 834, 432, 402, 11, 144);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29007', 'Alhaurín de la Torre ', '82.7', 38523, 19162, 19361, 728, 12009);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29008', 'Alhaurín el Grande ', '73.1', 24338, 12167, 12171, 354, 4782);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29009', 'Almáchar ', '14.4', 1867, 962, 905, 19, 417);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29010', 'Almargen ', '34.4', 2081, 1070, 1011, 36, 813);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29011', 'Almogía ', '162.9', 3826, 1968, 1858, 42, 1095);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29012', 'Álora ', '169.6', 13003, 6540, 6463, 123, 3567);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29013', 'Alozaina ', '33.9', 2082, 1051, 1031, 17, 611);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29014', 'Alpandeire ', '31.2', 257, 132, 125, 4, 104);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29015', 'Antequera ', '749.3', 41141, 20224, 20917, 690, 12877);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29016', 'Árchez ', '4.8', 436, 226, 210, 4, 110);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29017', 'Archidona ', '185.6', 8490, 4278, 4212, 82, 2872);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29018', 'Ardales ', '106.5', 2527, 1276, 1251, 20, 846);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29019', 'Arenas ', '26.3', 1219, 640, 579, 23, 352);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29020', 'Arriate ', '8.3', 4157, 2049, 2108, 38, 1032);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29021', 'Atajate ', '10.9', 158, 83, 75, 2, 48);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29022', 'Benadalid ', '20.7', 253, 124, 129, 3, 62);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29023', 'Benahavís ', '145.5', 7105, 3555, 3550, 328, 5986);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29024', 'Benalauría ', '19.8', 470, 255, 215, 1, 103);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29025', 'Benalmádena ', '26.9', 66598, 32976, 33622, 1375, 27014);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29026', 'Benamargosa ', '12.1', 1568, 808, 760, 31, 450);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29027', 'Benamocarra ', '5.7', 3047, 1541, 1506, 36, 212);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29028', 'Benaoján ', '32.0', 1513, 787, 726, 18, 482);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29029', 'Benarrabá ', '24.9', 521, 258, 263, 4, 153);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29030', 'Borge (El) ', '24.4', 963, 499, 464, 6, 119);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29031', 'Burgo (El) ', '118.4', 1929, 973, 956, 9, 507);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29032', 'Campillos ', '187.8', 8524, 4265, 4259, 106, 3073);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29033', 'Canillas de Aceituno ', '42.0', 1737, 911, 826, 13, 399);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29034', 'Canillas de Albaida ', '33.2', 842, 426, 416, 11, 302);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29035', 'Cañete la Real ', '165.2', 1738, 885, 853, 24, 668);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29036', 'Carratraca ', '22.4', 775, 395, 380, 10, 264);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29037', 'Cartajima ', '21.5', 247, 129, 118, 3, 77);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29038', 'Cártama ', '105.1', 24592, 12497, 12095, 261, 5391);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29039', 'Casabermeja ', '67.3', 3418, 1815, 1603, 45, 1113);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29040', 'Casarabonela ', '113.7', 2599, 1363, 1236, 27, 794);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29041', 'Casares ', '162.4', 5954, 3069, 2885, 102, 3129);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29042', 'Coín ', '127.4', 21561, 10868, 10693, 338, 5053);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29043', 'Colmenar ', '66.0', 3444, 1765, 1679, 41, 1099);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29044', 'Comares ', '25.5', 1385, 751, 634, 19, 261);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29045', 'Cómpeta ', '54.2', 3503, 1759, 1744, 62, 1286);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29046', 'Cortes de la Frontera ', '175.9', 3304, 1694, 1610, 20, 899);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29047', 'Cuevas Bajas ', '16.5', 1431, 699, 732, 12, 461);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29049', 'Cuevas de San Marcos ', '37.0', 3884, 1951, 1933, 32, 1035);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29048', 'Cuevas del Becerro ', '16.0', 1643, 816, 827, 9, 494);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29050', 'Cútar ', '19.4', 605, 308, 297, 11, 167);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29051', 'Estepona ', '137.5', 67080, 33234, 33846, 1360, 25749);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29052', 'Faraján ', '20.4', 265, 130, 135, 1, 88);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29053', 'Frigiliana ', '40.5', 3065, 1557, 1508, 96, 1530);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29054', 'Fuengirola ', '10.4', 77525, 37983, 39542, 1564, 24058);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29055', 'Fuente de Piedra ', '90.6', 2613, 1345, 1268, 32, 796);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29056', 'Gaucín ', '98.2', 1670, 884, 786, 22, 704);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29057', 'Genalguacil ', '31.9', 456, 233, 223, 3, 135);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29058', 'Guaro ', '22.4', 2060, 1044, 1016, 18, 549);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29059', 'Humilladero ', '34.7', 3364, 1697, 1667, 41, 503);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29060', 'Igualeja ', '43.9', 816, 415, 401, 12, 275);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29061', 'Istán ', '99.3', 1388, 696, 692, 40, 696);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29062', 'Iznate ', '7.5', 899, 461, 438, 17, 54);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29063', 'Jimera de Líbar ', '27.2', 415, 216, 199, 4, 153);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29064', 'Jubrique ', '39.3', 638, 319, 319, 4, 136);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29065', 'Júzcar ', '33.7', 238, 138, 100, 2, 91);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29066', 'Macharaviaya ', '7.2', 477, 257, 220, 765, 129);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29067', 'Málaga ', '395.1', 569130, 273817, 295313, 11003, 153142);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29068', 'Manilva ', '35.6', 14587, 7524, 7063, 263, 8121);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29069', 'Marbella ', '116.8', 139537, 67535, 72002, 4061, 75583);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29070', 'Mijas ', '148.8', 79483, 39913, 39570, 1973, 30661);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29071', 'Moclinejo ', '14.3', 1255, 653, 602, 15, 123);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29072', 'Mollina ', '74.6', 4901, 2461, 2440, 87, 1136);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29073', 'Monda ', '57.7', 2382, 1208, 1174, 31, 873);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29903', 'Montecorto', '54.5', 636, 330, 306, 0, 0);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29074', 'Montejaque ', '45.5', 984, 485, 499, 1524, 337);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29075', 'Nerja ', '85.1', 21185, 10446, 10739, 502, 8349);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29076', 'Ojén ', '85.9', 3353, 1712, 1641, 77, 2116);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29077', 'Parauta ', '44.5', 249, 116, 133, 0, 117);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29079', 'Periana ', '58.8', 3231, 1690, 1541, 33, 1033);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29080', 'Pizarra ', '63.6', 9148, 4626, 4522, 68, 2586);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29081', 'Pujerra ', '24.4', 294, 155, 139, 1, 95);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29082', 'Rincón de la Victoria ', '28.5', 43135, 21192, 21943, 757, 17946);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29083', 'Riogordo ', '40.0', 2936, 1539, 1397, 838, 817);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29084', 'Ronda ', '397.6', 34535, 16836, 17699, 448, 10252);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29085', 'Salares ', '10.3', 207, 105, 102, 8, 85);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29086', 'Sayalonga ', '18.3', 1505, 770, 735, 42, 416);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29087', 'Sedella ', '31.6', 692, 389, 303, 15, 161);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29904', 'Serrato', '29.2', 505, 255, 250, 0, 0);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29088', 'Sierra de Yeguas ', '85.6', 3398, 1713, 1685, 44, 939);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29089', 'Teba ', '143.0', 3973, 2002, 1971, 30, 808);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29090', 'Tolox ', '94.4', 2186, 1108, 1078, 25, 639);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29901', 'Torremolinos ', '19.9', 67492, 33717, 33775, 1219, 24042);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29091', 'Torrox ', '50.1', 15117, 7684, 7433, 292, 6133);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29092', 'Totalán ', '9.2', 710, 373, 337, 10, 245);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29093', 'Valle de Abdalajís ', '21.2', 2615, 1323, 1292, 17, 779);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29094', 'Vélez-Málaga ', '157.9', 78166, 38769, 39397, 1165, 20483);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29095', 'Villanueva de Algaidas ', '70.4', 4337, 2219, 2118, 25, 1511);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29902', 'Villanueva de la Concepción ', '67.4', 3341, 1631, 1710, 11, 1094);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29098', 'Villanueva de Tapia ', '22.1', 1544, 779, 765, 17, 161);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29096', 'Villanueva del Rosario ', '44.0', 3508, 1715, 1793, 36, 879);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29097', 'Villanueva del Trabuco ', '59.2', 5246, 2615, 2631, 38, 1112);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29099', 'Viñuela ', '27.2', 2013, 1046, 967, 61, 474);
INSERT INTO pueblos (codigo, nombre, extension, pob_total, pob_hombres, pob_mujeres, vehiculos, lineas_tel) VALUES('29100', 'Yunquera ', '55.2', 2983, 1519, 1464, 19, 994);

