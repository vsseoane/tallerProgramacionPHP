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
                    <form class="form-signin" method="post" action="doPublish.php" id="formPublish">
                        <div class="container">
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
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked> Encontrado
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2"> Perdido
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <hr>

                            <!-- Description -->
                            <h3>Descripción:</h3>
                            <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                            <hr>

                            <!-- Pictures -->
                            <h3>Fotos:</h3>

                            <label class="custom-file">
                                <input type="file" id="file" class="custom-file-input" lang="es">
                                <span class="custom-file-control"></span>
                            </label>
                            <br>
                            <br>
                            <div class="container">


                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre del archivo</th>
                                            <th>Foto</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>foto.jpg</td>
                                            <td>Doe</td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-sm">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>foto2.jpg</td>
                                            <td>Moe</td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-sm">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <hr>

                            <!-- Map -->
                            <h3>Ubicacion exacta:</h3>
                            <label>(Opcional)</label>

                            <div id="map-publish"> </div>

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