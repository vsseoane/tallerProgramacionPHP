

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <a class="animated bounce navbar-brand fa fa-paw" href="#">
            <b> PetFinder</b>
        </a>

        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.php">Inicio
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            {if (isset($usuario))}
                <li class="nav-item">
                    <a class="nav-link" href="publish.php">Publicar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Estadísticas</a>
                </li>
            {/if}
        </ul>

        <ul class="navbar-nav navbar-right">
            {if (!isset($usuario))}
                <li class="nav-item ">
                    <a class="nav-link" href="login.php">Iniciar Sesión</a>
                </li>
            {else}
                <li class="nav-item ">
                    <label class="login"> Hola, {$usuario.nombre} </label>
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
