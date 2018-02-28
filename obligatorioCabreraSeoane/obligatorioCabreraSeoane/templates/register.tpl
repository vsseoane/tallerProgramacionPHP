<html lang="en">

<head>
    <title>Pet Finder</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/login-styles.css" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="css/animate.css">
    <link href="css/message.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/popper.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <script src="js/functions.js" type="text/javascript"></script>


</head>

<body>
    <form class="form-signin" method="post" action="doRegister.php" id="formRegister">
        <div class="text-center mb-4">
            <i class="animated bounce infinite fa fa-paw fa-5x mb-4"></i>
            <h1 class="h3 mb-3 font-weight-normal">Registrarse en
                <b>PetFinder</b>
            </h1>
        </div>

        <div class="form-label-group">
            <input type="text" name="name" id="inputName" class="form-control" placeholder="Nombre" required="" autofocus="">
            <label for="inputName">Nombre</label>
        </div>

        <div class="form-label-group">
            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
            <label for="inputEmail">Email address</label>
        </div>

        <div class="form-label-group">
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="">
            <label for="inputPassword">Password</label>
        </div>

        <button class="btn btn-lg btn-success btn-block" type="submit">Registrar</button>
        <br>
            <div class="message">{$mensaje}</div>
        <br>
        <a href="login.php">‹‹Volver</a>
        <p class="mt-5 mb-3 text-muted text-center">© 2018</p>
    </form>


</body>

</html>