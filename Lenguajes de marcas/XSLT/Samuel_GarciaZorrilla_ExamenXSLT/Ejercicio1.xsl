<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<html>
			<head>
				<title>Ejercicio 1 - Premios</title>
			</head>
			<body>
				<h2>APARTADO 1</h2>
					<xsl:for-each select="premios/Nobel">
						<ul>
							<li>Premio Nobel de <xsl:value-of select="@año"/>
								<ul>
									<li>Especialidad: <xsl:value-of select="especialidad"/></li>
									<xsl:for-each select="ganadores/ganador">
										<li><xsl:value-of select="."/> de <xsl:value-of select="@pais"/></li>
									</xsl:for-each>
								</ul>
							</li>
						</ul>
					</xsl:for-each>

				<h2>APARTADO 2</h2>
					<ol>
						<xsl:for-each select="premios/Nobel">
							<xsl:if test="ganadores/ganador/@pais = 'España'">
								<li><xsl:value-of select="especialidad"/></li>
							</xsl:if>
						</xsl:for-each>
					</ol>

				<h2>APARTADO 3</h2>
					<ol>
						<xsl:for-each select="premios/Nobel/ganadores/ganador">
							<xsl:sort select="." order="descending"></xsl:sort>
							<li><xsl:value-of select="."/></li>
						</xsl:for-each>
					</ol>

				<h2>APARTADO 4</h2>
					<table border="1">
						<th>PREMIOS NOBEL DE FÍSICA</th>
						<tr>
							<th>Año</th>
							<th>Ganador</th>
							<th>Nacionalidad</th>
						</tr>
						<xsl:for-each select="premios/Nobel/ganadores/ganador">
							<xsl:if test="../../especialidad = 'Física'">
								<tr>
									<td><xsl:value-of select="../../@año"/></td>
									<td><xsl:value-of select="."/></td>
									<td><xsl:value-of select="@pais"/></td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>