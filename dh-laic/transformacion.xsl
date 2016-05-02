<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all" version="2.0">

    <xsl:output encoding="UTF-8" method="xhtml"/>

    <!-- SAT: Selecciona las <div> de tipo texto: -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:teiCorpus/tei:TEI">
        <!-- SAT: esta variable sirve para agarrar el valor del @xml:id y utilizarlo, por ejemplo,
        para nombrar los ficheros.-->
        <xsl:variable name="sect_id" select="@xml:id"/>

        <!-- SAT: creación de diversos ficheros: -->
        <xsl:result-document method="html" encoding="utf-8" 
            href="{$sect_id}.html"
            omit-xml-declaration="yes"/>
        <!-- SAT: Ahora se especifica cómo debe ser el fichero html -->


        <html lang="en">

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
                            <h1 class="page-header">Carta # <small>[fecha]</small>
                            </h1>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Portfolio Item Row -->
                    <div class="row">

                        <div class="col-md-8 col-lg-6">
                            <img src="img/01LET1b.jpg" width="550" height="731" alt=""/>
                        </div>

                        <div class="col-md-4 col-lg-6">
                            <h3>Edición Digital</h3>
                            
                            <p>TEXTO DE LA CARTA AQUÍ</p>
                            <xsl:value-of select="tei:div[@type='texto']"/>
                            
                            <xsl:apply-templates/>
                            
                            <h3>Metadatos</h3>
                            <ul>
                                <li>From whom: </li>
                                <li>From where: </li>
                                <li>To whom:</li>
                                <li>To where:</li>
                            </ul>
                        </div>

                    </div>
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

    </xsl:template>

<xsl:template match="tei:p">
    <p>
        <xsl:apply-templates></xsl:apply-templates>
    </p>
</xsl:template>
    
    <xsl:template match="tei:opener">
        <p>
            <xsl:apply-templates></xsl:apply-templates>
        </p>
    </xsl:template>
    <xsl:template match="tei:closer">
        <p>
            <xsl:apply-templates></xsl:apply-templates>
        </p>
    </xsl:template>

</xsl:stylesheet>
