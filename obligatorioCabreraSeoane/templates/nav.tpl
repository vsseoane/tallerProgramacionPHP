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


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <a class="animated bounce navbar-brand fa fa-paw" href="#">
                <b> PetFinder</b>
            </a>
              
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Inicio
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                {if (isset($usuario))}
                <li class="nav-item">
                    <a class="nav-link" href="publish.php">Publicar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Mis Publicaciones</a>
                </li>
                {/if}
            </ul>

            <ul class="navbar-nav navbar-right">
                 {if (!isset($usuario))}
                <li class="nav-item ">
                    <a class="nav-link" href="login.php">Iniciar Sesión</a>
                </li>
                 {else}
                <li>Hola 
                        {$usuario.nombre}
                        <a href="doLogout.php">Salir</a>
                    </li>
                    {/if}
            </ul>

        </div>


        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    </nav>
            
</body>
</html>