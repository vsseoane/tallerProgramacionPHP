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

    </head>

    <body>


        {include file="nav.tpl"}

        <div class="container-fluid">

            <div class="card mb-3 searcher">
                <div class="card-header"><h4>Búsqueda</h4></div>
                <div class="card-body">



                    <div class="row justify-content-start">

                        <div class="col-2">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked> Encontrado
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2"> No encontrado
                                </label>
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
                            <select class="custom-select" name="razas">
                                <option value='' selected>Raza</option>
                                {foreach from=$razas item=raza}
                                    <option value="{$raza.id}">{$raza.nombre}</option>
                                {/foreach}

                            </select>
                        </div>
                        <div class="col">
                            <select class="custom-select" name="barrio">
                                <option value='' selected>Barrio</option>
                                {foreach from=$barrios item=barrio}
                                    <option value="{$barrio.id}">{$barrio.nombre}</option>
                                {/foreach}

                            </select>


                        </div>


                        <div class="col-5">
                            <div class="input-group">
                                <span class="fa fa-search input-group-addon" id="basic-addon1"> </span>
                                <input type="text" class="form-control" placeholder="Ingrese texto a buscar..." aria-describedby="basic-addon1">
                                <button class="btn btn-success my-2 my-sm-0" type="submit">Buscar</button>
                            </div>
                            <div class="col-2 d-flex flex-row-reverse">

                            </div>

                        </div>



                    </div>
                </div>
            </div>




            <div class="pagination d-flex justify-content-center sticky-top">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div id="publicaciones">
                {foreach from=$publicaciones item=pub}
                    <div class="row">
                        <div class="col">
                            <div class="card" style="width: 20rem;">
                                <div class="not-found card-header">{$pub.tipo}</div>
                                <img class="card-img-top" src="https://html.com/wp-content/uploads/very-large-flamingo.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">{$pub.titulo}</h5>
                                    <p class="card-text">{$pub.descripcion}
                                    </p>
                                    <a href="#" class="btn btn-primary">Ver Detalles</a>
                                </div>
                            </div>

                        </div>
                    {/foreach}
                </div>
            </div>

    </body>

</html>