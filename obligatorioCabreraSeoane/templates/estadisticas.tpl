<!DOCTYPE HTML>
<html lang="en">

    <head>

        <title>Pet Finder</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!--     <link rel="stylesheet" href="css/tether.min.css" /> -->
        <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">

        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>    

        <script type="text/javascript">

        </script>

    </head>

    <body>

        {include file="nav.tpl"}

        <div class="container-fluid">

            <div class="card mb-4 searcher">
                <div class="card-header">

                    <h4>Estadísticas</h4>
                    <label>Información y estadísticas sobre las publicaciones. </label>

                </div>             

                <div class="card-body">
                    <h3>Total de publicaciones por especie: </h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Especie</th>
                                <th>Cantidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            {if !empty($datosEspecies)}
                                {foreach from=$datosEspecies item=dE}

                                    <tr>
                                        <td>{$dE.nombre}</td>
                                        <td>{$dE.cant}</td>
                                    </tr>

                                {/foreach}
                            {else}
                                <tr>No hay registros.</tr>
                            {/if}
                        </tbody>
                    </table>

                    <br>
                    <br>

                    <h3>Total de publicaciones cerradas por especie: </h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Especie</th>
                                <th>Cantidad cerradas</th>
                            </tr>
                        </thead>
                        <tbody>
                            {if !empty($datosCerrado)}
                                {foreach from=$datosCerrado item=dC}

                                    <tr>
                                        <td>{$dC.nombre}</td>
                                        <td>{$dC.cant}</td>
                                    </tr>

                                {/foreach}
                            {else}
                                <tr>No hay registros.</tr>
                            {/if}
                        </tbody>
                    </table>

                    <br>
                    <br>

                    <h3>Total de publicaciones abiertas por especie: </h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Especie</th>
                                <th>Cantidad abiertas</th>
                            </tr>
                        </thead>
                        <tbody>
                            {if !empty($datosAbierto)}
                                {foreach from=$datosAbierto item=dA}

                                    <tr>
                                        <td>{$dA.nombre}</td>
                                        <td>{$dA.cant}</td>
                                    </tr>

                                {/foreach}
                            {else}
                                <tr>No hay registros.</tr>
                            {/if}
                        </tbody>
                    </table>

                    <br>
                    <br>

                    <h3>Total de publicaciones cerradas y no exitosas por especie: </h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Especie</th>
                                <th>Cantidad no exitosas</th>
                            </tr>
                        </thead>
                        <tbody>
                            {if !empty($datosNoExitoso)}
                                {foreach from=$datosNoExitoso item=dN}

                                    <tr>
                                        <td>{$dN.nombre}</td>
                                        <td>{$dN.cant}</td>
                                    </tr>

                                {/foreach}
                            {else}
                                <tr>No hay registros.</tr>
                            {/if}
                        </tbody>
                    </table>
                    <br>
                    <br>
                    <h3>Total de publicaciones exitosas por especie: </h3>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Especie</th>
                                <th>Cantidad exitosas</th>
                            </tr>
                        </thead>
                        <tbody>
                            {if !empty($datosExitoso)}
                                {foreach from=$datosExitoso item=dE}

                                    <tr>
                                        <td>{$dE.nombre}</td>
                                        <td>{$dE.cant}</td>
                                    </tr>

                                {/foreach}
                            {else}
                                <tr>No hay registros.</tr>
                            {/if}
                        </tbody>
                    </table>

                    <br>
                    <br>

                </div>

            </div>
        </div>

    </body>

</html>