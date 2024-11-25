<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<datos>
			<cuentas>
				<xsl:for-each select="listado/cuenta">
					<cuenta>
						<xsl:attribute name="dnititular">
							<xsl:value-of select="titular/@dni" />
						</xsl:attribute>
						<creacion><xsl:value-of select="fechacreacion"/></creacion>
						<titular><xsl:value-of select="titular"/></titular>
						<saldoactual>
							<xsl:value-of select="saldoactual"/>
							<xsl:value-of select="saldoactual/@moneda"/>
						</saldoactual>
					</cuenta>
				</xsl:for-each>
			</cuentas>
			<fondos>
				<xsl:for-each select="listado/fondo">
					<fondo>
						<xsl:attribute name="cuentaasociada">
							<xsl:value-of select="cuentaasociada"/>
						</xsl:attribute>
						<cantidaddepositada><xsl:value-of select="datos/cantidaddepositada"/></cantidaddepositada>
						<moneda><xsl:value-of select="datos/moneda"/></moneda>
					</fondo>
				</xsl:for-each>
			</fondos>
		</datos>
	</xsl:template>
</xsl:stylesheet>