<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<title>Current Inventory</title>
<style type="text/css">
body{background: black}
.heading {
    background-color: black;
}
.product {
    background-color: white;
}
.data {
    background-color: black;
}
	.heading
		{
			color: red;
			font-family: "Arial";
			font-weight: bold;
			font-size: 200%;
		    text-shadow: 2px 2px 4px blue;
		}
        .product
        {
            color: #CC0000;
            font-family: "Book Antiqua";
            font-weight: bold;
            font-size: 110%;
        }        
        .data
        {	color: red;
            font-family: Calibri;
            font-size: large;
        }        
</style>

</head>
<body>
<div class="heading">Current Inventory</div>
<hr/>
<xsl:for-each select="list/inventory">
<div class="product">Name:  
     <xsl:value-of select="name"/></div><a/>
<div class="data"><b>Description:  </b>
     <xsl:value-of select="description"/></div><a/>
<div class="data"><b>Price:  </b>
     <xsl:value-of select="maxPrice"/></div><br/>

</xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
