<!DOCTYPE HTML>
<html lang="en">

    <head>

        <title>Pet Finder</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!--     <link rel="stylesheet" href="css/tether.min.css" /> -->
        <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">

        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/functions.js" type="text/javascript"></script>
        <script src="js/functionsPublish.js" type="text/javascript"></script>
    </head>

    <body>


        {include file="nav.tpl"}


        <div class="container-fluid">

            <div class="card mb-4 searcher">
                <div class="card-header">
                    <h4>Publicar</h4>
                    <label>Publique un anuncio con los datos de su mascota.</label>
                </div>
                <div class="card-body">
                    <form class="form-signin" method="post" action="doPublish.php" id="formPublish" enctype="multipart/form-data">
                        <div class="container">

                            <!-- Titulo -->
                            <h3>Título:</h3>
                            <textarea class="form-control" id="titulo" rows="2" name="titulo" ></textarea>
                            <hr>

                            <!-- Descripcion -->
                            <h3>Descripción:</h3>
                            <textarea class="form-control" id="descripcion" rows="3" name="descripcion"></textarea>
                            <hr>

                            <h3>Datos: </h3>
                            <div class="row justify-content-center">
                                <div class="col-3">
                                    <select class="custom-select" name="especie" id="especie">
                                        <option value='' selected>Seleccione una Especie</option>
                                        {foreach from=$especies item=especie}
                                            <option value="{$especie.id}">{$especie.nombre}</option>
                                        {/foreach}

                                    </select>
                                </div>
                                <div class="col-3">

                                    <select class="custom-select" name="razas" id="razas">
                                        <option value=' '>Seleccione una Raza</option>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <select class="custom-select" name="barrio">
                                        <option value='' selected>Barrio</option>
                                        {foreach from=$barrios item=barrio}
                                            <option value  ="{$barrio.id}">{$barrio.nombre}</option>
                                        {/foreach}

                                    </select>


                                </div>
                                <div class="col-3">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="estado" id="gridEstado1" value="E" checked> Encontrado
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="estado" id="gridEstado2" value="P"> Perdido
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <hr>

                            <!-- Pictures -->
                            <h3>Fotos:</h3>

                            <br>
                            <div class="container">

                                <input type="file" name="archivo_1" class="ultimoFile" accept=".gif,.jpg,.jpeg,.png"/>

                                <button type="button" id="otraFoto"> Seleccionar otra foto </button>

                              <!--  <input type="hidden" name="publicacionId" value="{$publicacionId}" />-->
                                <input type="hidden" name="publicacionId" value="" />
                                <input type="hidden" name="accion" value="subir" />


                            </div>

                            <hr>

                            <!-- Map -->
                            <h3>Ubicacion exacta:</h3>
                            <label>(Opcional)</label>                      

                            <div id="map-publish"> </div>
                            <input type="hidden" id = "latitud" name="latitud" value="-34.901112" />
                            <input type="hidden" id= "longitud" name="longitud" value="-56.164532" />

                            <hr>

                            <button class="btn btn-success" type="submit"> Publicar </button>

                        </div>
                    </form>
                </div>



            </div>


        </div>

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDeDvKJ-T0fDDUugbdEjJMQ94LOITJcf_U&callback=initMap">

        </script>



    </body>

</html>