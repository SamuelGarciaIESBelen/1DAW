<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<html>
			<head>
				<title>Inventario</title>
			</head>
			<body>
				<h1>Inventario del tío</h1>
				<xsl:for-each select="inventario/producto">
					<xsl:sort select="marca" order="ascending"/>
					<xsl:choose>
						<xsl:when test="localizacion/@edificio = 'A'">
							<ul style="color:red">
								<li>Producto <xsl:value-of select="@codigo"/></li>
								<ul>
									<li>Peso: <xsl:value-of select="peso"/>&#160;<xsl:value-of select="peso/@unidad"/></li>
									<li>Marca: <xsl:value-of select="marca"/>&#160;<xsl:value-of select="marca/@modelo"/></li>
									<li>Localización: Edificio <xsl:value-of select="localizacion/@edificio"/>
										Almacén <xsl:value-of select="localizacion/almacen" /></li>
									<li>Precio: <xsl:value-of select="precio"/>&#160;
										<xsl:if test="precio/@moneda = 'euro'">€</xsl:if>
										<xsl:if test="precio/@moneda = 'dollar'">$</xsl:if>
									</li>
								</ul>
							</ul>
						</xsl:when>
						<xsl:when test="localizacion/@edificio = 'B'">
							<ul style="color:blue">
								<li>Producto <xsl:value-of select="@codigo"/></li>
								<ul>
									<li>Peso: <xsl:value-of select="peso"/>&#160;<xsl:value-of select="peso/@unidad"/></li>
									<li>Marca: <xsl:value-of select="marca"/>&#160;<xsl:value-of select="marca/@modelo"/></li>
									<li>Localización: Edificio <xsl:value-of select="localizacion/@edificio"/>
										Almacén <xsl:value-of select="localizacion/almacen"/></li>
									<li>Precio: <xsl:value-of select="precio"/>&#160;
										<xsl:if test="precio/@moneda = 'euro'">€</xsl:if>
										<xsl:if test="precio/@moneda = 'dollar'">$</xsl:if>
									</li>
								</ul>
							</ul>
						</xsl:when>
						<xsl:otherwise>
							<ul style="color:green">
								<li>Producto <xsl:value-of select="@codigo"/></li>
								<ul>
									<li>Peso: <xsl:value-of select="peso"/>&#160;<xsl:value-of select="peso/@unidad"/></li>
									<li>Marca: <xsl:value-of select="marca"/>&#160;<xsl:value-of select="marca/@modelo"/></li>
									<li>Localización: Edificio <xsl:value-of select="localizacion/@edificio"/>
										Almacén <xsl:value-of select="localizacion/almacen" /></li>
									<li>Precio: <xsl:value-of select="precio"/>&#160;
										<xsl:if test="precio/@moneda = 'euro'">€</xsl:if>
										<xsl:if test="precio/@moneda = 'dollar'">$</xsl:if>
									</li>
								</ul>
							</ul>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<h1>Vehículos con peso superior a 1T</h1>
				<table border="1">
					<tr>
					  <th>Marca</th>
					  <th>Peso (T)</th>
					  <th>Precio</th>
					</tr>
					<xsl:for-each select="inventario/producto">
					<xsl:choose>
						<xsl:when test="peso > 1000 and peso/@unidad = 'kg'">
							<tr>
								<td>
									<xsl:value-of select="marca"/>&#160;
									<xsl:value-of select="marca/@modelo"/>
								</td>
								<td>
									<xsl:value-of select="peso div 1000"/>
								</td>
								<td>
									<xsl:value-of select="precio"/>&#160;
									<xsl:if test="precio/@moneda = 'euro'">€</xsl:if>
									<xsl:if test="precio/@moneda = 'dollar'">$</xsl:if>
								</td>
							  </tr>
						</xsl:when>
						<xsl:when test="peso > 1 and peso/@unidad = 'T'">
							<tr>
								<td>
									<xsl:value-of select="marca"/>&#160;
									<xsl:value-of select="marca/@modelo"/>
								</td>
								<td>
									<xsl:value-of select="peso"/>
								</td>
								<td>
									<xsl:value-of select="precio"/>&#160;
									<xsl:if test="precio/@moneda = 'euro'">€</xsl:if>
									<xsl:if test="precio/@moneda = 'dollar'">$</xsl:if>
								</td>
							  </tr>
						</xsl:when>
					</xsl:choose>
					</xsl:for-each>
				  </table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>