<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<ayudas>
			<animales>
				<xsl:for-each select="animales/libertad">
					<ejemplar>
						<xsl:attribute name="familia">
							<xsl:value-of select="nombre/@familia"/>
						</xsl:attribute>
						<ingreso><xsl:value-of select="fechaingreso"/></ingreso>
						<nombre><xsl:value-of select="nombre"/></nombre>
						<inversion>
							<xsl:value-of select="inversion"/> &#160;
							<xsl:value-of select="inversion/@moneda"/>
						</inversion>
					</ejemplar>
				</xsl:for-each>
			</animales>
			<espacios>
				<xsl:for-each select="animales/cautividad">
					<cautividad>
						<xsl:attribute name="zooasociado">
							<xsl:value-of select="zooasociado"/>
						</xsl:attribute>
						<cantidad><xsl:value-of select="datos/cantidad"/></cantidad>
						<moneda><xsl:value-of select="datos/moneda"/></moneda>
					</cautividad>
				</xsl:for-each>
			</espacios>
		</ayudas>
	</xsl:template>
</xsl:stylesheet>