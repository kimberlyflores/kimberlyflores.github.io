<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

    <!-- SAT: aquí indicamos que debe procesar todo el documento -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:teiCorpus/tei:TEI">
        <!-- SAT: ESTA ORDEN VA A CREAR DOCUMENTOS DIFERENTES -->
        <xsl:result-document href="{@xml:id}.html" method="xhtml"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            standalone="omit">
            <html>
                <head>
                    <meta charset="utf-8"/>
                    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1"/>
                    <meta name="description" content="humanidades digitales, cartas"/>
                    <meta name="author" content="Kimberly Flores Guzmán"/>
                    <title>Cartas de amor y amistad</title>
                    <!-- Bootstrap Core CSS -->
                    <link href="css/bootstrap.min.css" rel="stylesheet"/>
                    <!-- Custom CSS -->
                    <link href="css/portfolio-item.css" rel="stylesheet"/>
                </head>
                <body>
                    <!-- Navigation -->
                    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                        <div class="container">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"/>
                                    <span class="icon-bar"/>
                                    <span class="icon-bar"/>
                                </button>
                                <a class="navbar-brand" href="index.html">INICIO</a>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li>
                                        <a href="cartas.html">Las Cartas</a>
                                    </li>
                                    <li>
                                        <a href="index.html#services">La Historia</a>
                                    </li>
                                    <li>
                                        <a href="index.html#contact">Contacto</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </div>
                        <!-- /.container -->
                    </nav>
                    <!-- Page Content -->
                    <div class="container">
                        <!-- Portfolio Item Heading -->
                        <div class="row">
                            <div>Content for New div Tag Goes Here</div>
                            <div class="col-lg-12">
                                <h1 class="page-header">
                                    <xsl:value-of
                                        select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                                    <small>
                                        <xsl:value-of
                                            select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:p/tei:date"
                                        />
                                    </small>
                                </h1>
                            </div>
                        </div>
                        <!-- /.row -->
                        <!-- Portfolio Item Row -->
                        <div class="row">
                            <div class="col-md-8 col-lg-6">
                                <!-- SAT: AQUÍ VA LA IMAGEN <PB> -->
                                <xsl:for-each
                                    select="tei:text/tei:body/tei:div[@type='texto']/tei:pb">
                                    <xsl:if test="contains(@facs, 'jpg')">
                                    <xsl:element name="img">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="@facs"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="width">
                                            <xsl:value-of>550</xsl:value-of>
                                        </xsl:attribute>
                                        <xsl:attribute name="height">
                                            <xsl:value-of>731</xsl:value-of>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt"/>
                                    </xsl:element>
                                    </xsl:if>
                                </xsl:for-each>
                            </div>
                            <!-- SAT: AQUÍ PASA TODA LA TRANSFORMACIÓN -->
                            <div class="col-md-4 col-lg-6">
                                <h3>Edición Digital</h3>
                                <!--     <p>TEXTO DE LA CARTA AQUÍ</p>-->
                                <xsl:apply-templates/>

                                <h3>Metadatos</h3>
                                <ul>
                                    <li>From whom: <xsl:value-of
                                            select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"
                                        /></li>
                                    <li>From where: <xsl:value-of
                                            select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:p/tei:placeName"
                                        /></li>
                                    <li>To whom:</li>
                                    <li>To where:</li>
                                </ul>
                            </div>
                        </div>
                        <!-- SAT: HASTA AQUÍ -->
                        <!-- /.row -->
                        <!-- Related Projects Row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h3 class="page-header">Cartas Adicionales</h3>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <a href="#">
                                    <img class="img-responsive portfolio-item" src="img/02LET1a.jpg"
                                        alt="Carta 2"/>
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <a href="#">
                                    <img class="img-responsive portfolio-item" src="img/03LET1a.jpg"
                                        alt="Carta 3"/>
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <a href="#">
                                    <img class="img-responsive portfolio-item" src="img/04LET1a.jpg"
                                        alt="Carta 4"/>
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <a href="#">
                                    <img class="img-responsive portfolio-item" src="img/05LET1a.jpg"
                                        alt="Carta 5"/>
                                </a>
                            </div>
                        </div>
                        <!-- /.row -->
                        <hr/>
                        <!-- Footer -->
                        <footer>
                            <div class="row">
                                <div class="col-lg-12">
                                    <!-- SAT: Esto me da error -->
                                    <p>Copyright <!--&copy;--> Kimberly Flores Guzmán 2016</p>
                                </div>
                            </div>
                            <!-- /.row -->
                        </footer>
                    </div>
                    <!-- /.container -->
                    <!-- jQuery -->
                    <script src="js/jquery.js"/>
                    <!-- Bootstrap Core JavaScript -->
                    <script src="js/bootstrap.min.js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader"/>
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div[@type='envelope']"/>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:opener">
        <!-- SAT: aquí deberías añadir un estilo a la CSS para que quede bien, centrado a la izquierda -->
        <div class="opener">
            <b>
                <xsl:value-of select="tei:dateline"/>
                <xsl:value-of select="tei:salute"/>
            </b>
        </div>
    </xsl:template>

    <xsl:template match="tei:closer">
        <div class="closer">
            <b>
                <xsl:apply-templates/>
            </b>
        </div>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>



</xsl:stylesheet>
