<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<html>
			<head>
				<title>Biblioteca</title>
			</head>
			<body>
				<h3>1. Mostrar en un HTML con lista numerada los títulos de los libros
					con algún autor nacido después de 1900</h3>
				<ol>
					<xsl:for-each select="biblioteca/libro">
						<xsl:if test="autores/autor/@nacimiento > 1900">
							<li>
								<xsl:value-of select="titulo"/>
							</li>
						</xsl:if>
					</xsl:for-each>
				</ol>

				<h3>2. Mostrar en un HTML la lista de los autores ordenada por orden alfabético inverso</h3>
				<ul>
					<xsl:for-each select="biblioteca/libro/autores/autor">
						<xsl:sort order="descending"/>
						<li>
							<xsl:value-of select="."/>
						</li>
					</xsl:for-each>
				</ul>

				<h3>3. Mostrar el nombre de los autores nacidos después del año 1900</h3>
				<xsl:for-each select="biblioteca/libro/autores/autor">
					<xsl:if test="@nacimiento > 1900">
						<p>&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="."/></p>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>