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
        <script src="js/functions.js" type="text/javascript"></script>
        <script src="js/functionsPublish.js" type="text/javascript"></script>

    </head>

    <body>

        {include file="nav.tpl"}

        <div class="container-fluid">

            <div class="card mb-3 searcher">
                <div class="card-header"><h4>Búsqueda</h4></div>
                <div class="card-body">

                    <div class="row justify-content-center">

                        <div class="col-2">

                            <div class="col">
                                <select class="custom-select" name="estado" id="estado">
                                    <option value='' selected>Estado</option>
                                    <option value='E'> Encontrado</option>
                                    <option value='P'> Perdido</option>

                                </select>
                            </div>
                        </div>

                        <div class="col">
                            <select class="custom-select" name="especie" id="especie">
                                <option value='' selected>Especie</option>
                                {foreach from=$especies item=especie}
                                    <option value="{$especie.id}">{$especie.nombre}</option>
                                {/foreach}

                            </select>
                        </div>
                        <div class="col">
                            <select class="custom-select" name="razas" id="razas">
                                <option value=''>Raza</option>
                            </select>
                        </div>
                        <div class="col">
                            <select class="custom-select" name="barrio"  id="barrio">
                                <option value='' selected>Barrio</option>
                                {foreach from=$barrios item=barrio}
                                    <option value="{$barrio.id}">{$barrio.nombre}</option>
                                {/foreach}

                            </select>


                        </div>


                        <div class="col-5">
                            <div class="input-group">
                                <span class="fa fa-search input-group-addon" id="basic-addon1"> </span>
                                <input type="text" class="form-control" placeholder="Ingrese texto a buscar..." aria-describedby="basic-addon1" id="palabra">
                                <button class="btn btn-success my-2 my-sm-0" id="botonBuscar">Buscar</button>
                            </div>
                            <div class="col-2 d-flex flex-row-reverse">

                            </div>

                        </div>

                    </div>

                </div>
                <div class="cantPag" name="cantPagTotal" id="cantPagTotal">
                    <select class="custom-select" name="cantPag" id="cantPag">
                        <option value='10' selected>10</option>
                        <option value='20'> 20</option>
                        <option value='50'> 50</option>
                        <option value='T'> Todos </option>

                    </select>
                </div>


            </div>

            {include file="pagination.tpl"}

            <div id="publicaciones">                
                <div class="row">
                    {foreach from=$publicaciones item=pub}
                        <div class="col">
                            <div class="card" style="width: 20rem;">
                                <div {if $pub.tipo=="Perdido"} class="not-found card-header" {/if} {if $pub.tipo=="Encontrado"} class="found card-header" {/if}>{$pub.tipo}</div>

                                <div class="card-body">
                                    <a class="card-title" href="detallePublicacion.php?id={$pub.id}" target="_blank" >{$pub.titulo}</a>
                                    <p class="card-text">{$pub.descripcion}
                                    </p>
                                    <a href="detallePublicacion.php?id={$pub.id}" class="btn btn-primary" target="_blank" >Ver Detalles</a>
                                </div>
                            </div>

                        </div>
                    {/foreach}
                </div>
            </div>
        </div>

    </body>

</html>