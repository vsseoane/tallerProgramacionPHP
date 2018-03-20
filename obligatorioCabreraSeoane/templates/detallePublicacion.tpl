<!DOCTYPE HTML>
<html lang="en">

    <head>

        <title>Pet Finder</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" type="text/css" href="css/styles.css" />

        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">

        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/functionsDetail.js" type="text/javascript"></script>

        <script type="text/javascript">

            $(document).ready(function () {
                var vExitoso;
                var vPubId;
                $("#btnCerrar").click(function () {
                    vExitoso = $('input[name=optExitoso]:checked', '#cerrarPublicacion').val();
                    vPubId = $("#pubIdCerrar").val();

                    $.ajax({
                        url: "cerrarPublicacion.php",
                        type: "POST",
                        data: "pubId=" + vPubId + "&exitoso=" + vExitoso,
                        timeout: 2000,
                        beforeSend: function () {

                        }
                    }).done(function (data) {
                        $.get("index.php");
                    });

                });
                
            });


        </script>   

    </head>

    <body>

        {if $publicacion.usuario_id == $usuarioLogueado.id}
            <!-- Modal -->
            <div class="modal fade" id="modalCerrar" tabindex="-1" role="dialog" aria-labelledby="modalCerrar" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Cerrando publicación</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body">
                            <label>Indique si la mascota se reencontro con su dueño: </label>

                            <div class="radio">
                                <label><input type="radio" name="optExitoso" value="1"> <i class="fa fa-smile-o" aria-hidden="true"> Si </i> </label>
                            </div>
                            <div class="radio">
                                <label><input type="radio" name="optExitoso" value=""> <i class="fa fa-frown-o" aria-hidden="true"> No </i> </label>
                            </div>

                            <input id = "pubIdCerrar" type="hidden" name="pubIdCerrar" value="{$publicacion.id}" />

                        </div>

                        <!-- Footer -->
                        <div class="modal-footer">
                            <button id="btnCerrar" type="button" class="btn btn-success" data-dismiss="modal">Cerrar</button>
                        </div>


                    </div>
                </div>
            </div>
        {/if}

        {include file="nav.tpl"}

        <div class="container-fluid">

            <div class="card mb-4 searcher">
                <div class="card-header">

                    <h4>Detalle de Publicación</h4>
                    <label>Información detallada de la publicación seleccionada. </label>
                    <a target="_blank" href="generarPDF.php?id={$publicacion.id}">  Descargar PDF </a>
                </div>

                <div class="card-body">

                    <div class="container">

                        {if $publicacion.usuario_id == $usuarioLogueado.id}
                            <div class="float-right">
                                <button class="btn btn-danger fa fa-close" data-toggle="modal" data-target="#modalCerrar"> Cerrar Publicación </button>
                            </div>
                        {/if}

                        <br>
                        <br>

                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

                            <ol class="carousel-indicators">

                                {foreach from=$indices item=i}
                                    {if $i == 0}
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        {else}
                                        <li data-target="#carouselExampleIndicators" data-slide-to="{$i}"></li>
                                        {/if}

                                {/foreach}
                            </ol>

                            <div class="carousel-inner">

                                {foreach from=$fotos item=src name=foo}

                                    {if $smarty.foreach.foo.first}

                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="{$src}" alt="Imagen">
                                        </div>
                                    {else}
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="{$src}" alt="Imagen">
                                        </div>
                                    {/if}

                                {/foreach}   

                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <br>
                        <hr>
                        <h3>Título:</h3>
                        <label id="lblTitulo"> {$publicacion.titulo} </label>
                        <hr>
                        <h3>Descripción:</h3>
                        <label id="lblDescripcion"> {$publicacion.descripcion}</label>
                        <hr>
                        <h3>Especie:</h3>
                        <label id="lblEspecie"> {$publicacion.nombEspecie} </label>
                        <hr>
                        <h3>Raza:</h3>
                        <label id="lblRaza"> {$publicacion.nombRaza} </label>
                        <hr>
                        <h3>Barrio:</h3>
                        <label id="lblBarrio"> {$publicacion.nombBarrio} </label>
                        <hr>
                        <h3>Tipo:</h3>
                        <label id="lblTipo"> 
                            {if $publicacion.tipo == 'E'}
                                Encontrado
                            {else}
                                Perdido
                            {/if}
                        </label>
                        <hr>

                        <input type="hidden" id="inputLatitud" name="inputLatitud" value="{$publicacion.latitud}" />
                        <input type="hidden" id="inputLongitud" name="inputLongitud" value="{$publicacion.longitud}" />
                        
                        {if $publicacion.latitud != '' && $publicacion.longitud !='' && ($publicacion.latitud != '0.00000000' && $publicacion.longitud !='0.00000000')}

                            <h3>Ubicacion exacta:</h3>
                            <label>(Opcional)</label>                      

                            <div id="map-publish"> 

                            </div>

                            <br>
                            <hr>
                        {/if}

                        <h3>Preguntas y respuestas:</h3>
                        <hr>

                        <form method="post" action="preguntar.php" id="formPreguntar">
                            <div class="form-group">
                                <textarea class="form-control" rows="3" id="txtPreguntar" name="txtPreguntar" placeholder="Pregunta..."></textarea>
                            </div>

                            <input type="hidden" name="pubIdPreguntar" value="{$publicacion.id}" />
                            {if $usuarioLogueado.id != ""}
                                <button type="submit" class="btn btn-secondary">Preguntar</button>
                            {/if}
                            {if $usuarioLogueado.id == ""}
                                <a href="login.php" >Para hacer una pregunta debe loguearse</a>
                            {/if}
                        </form>
                        <br>

                        <hr>

                        {foreach from=$preguntas item=p}
                            <br>
                            {if $p.respuesta == ''}

                                <div class="card bg-light">
                                    <div class="card-body">
                                        <i class="fa fa-comment-o" aria-hidden="true"> &nbsp; <strong> <u> {$p.email} </u>  - {$p.texto}</strong></i> 
                                        <br>
                                        <br>

                                        <form method="post" action="responder.php">


                                            {if $publicacion.usuario_id == $usuarioLogueado.id}
                                                <div class="form-group">
                                                    <textarea class="form-control" rows="3" id="txtResponder" name="txtResponder" placeholder="Respuesta..."></textarea>
                                                    <input type="hidden" name="pubIdResponder" value="{$publicacion.id}" />
                                                    <input type="hidden" name="pregIdResponder" value="{$p.id}" />
                                                    <br>
                                                    <button type="submit" class="btn btn-secondary">Responder</button>
                                                </div>


                                            {/if}

                                        </form>


                                    </div>
                                </div>

                            {else}        

                                <div class="card bg-light">
                                    <div class="card-body">
                                        <i class="fa fa-comment-o" aria-hidden="true"> &nbsp; <strong> <u> {$p.email} </u>  - {$p.texto}</strong></i> 
                                        <br>
                                        <i class="fa fa-comments-o" aria-hidden="true"> &nbsp;&nbsp;&nbsp; <label> {$p.respuesta} </label> </i> 
                                    </div>
                                </div>

                            {/if}
                        {/foreach}  

                    </div>

                </div>

            </div>

        </div>            

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDeDvKJ-T0fDDUugbdEjJMQ94LOITJcf_U&callback=initMap">
            
        </script>

    </body>



</html>