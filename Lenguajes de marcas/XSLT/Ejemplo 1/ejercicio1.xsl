<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<html>
			<head>
				<title>Filtrado con XSLT</title>
			</head>
			<body>
				<h1>Filtrado con XSLT</h1>
				<ol>
					<xsl:for-each select="catalogo/libro">
						<xsl:if test="@fechaedicion &gt; 2000">
							<li>
								<xsl:value-of select="titulo" />
							</li>
							<ol>
								<xsl:for-each select="autores/autor">
									<li>
										<xsl:value-of select="." /><!--El elemento actual es .-->
									</li>
								</xsl:for-each>
							</ol>
						</xsl:if>
					</xsl:for-each>
				</ol>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>