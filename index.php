<?php 

    include "config/controller.php";
    session_start();
    $lg = new lsp();
    
    if($lg->sessionCheck() == "true"){
        if($_SESSION['level'] == "Admin"){
            header("location:pageAdmin.php");
        }else if($_SESSION['level'] == "Manager"){
            header("location:pageManager.php");
        }else if($_SESSION['level'] == "Kasir"){
            header("location:pageKasir.php");
        }elseif ($_SESSION['level'] == "p") {
            header("location:pagepunya.php");
        }
    }

    if (isset($_POST['btnLogin'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        if ($response = $lg->login($username, $password)) {
            if ($response['response'] == "positive") {
                $_SESSION['username'] = $_POST['username'];
                $_SESSION['level'] = $response['level'];
                if ($response['level'] == "Admin") {
                    $response = $lg->redirect("pageAdmin.php");
                }else if($response['level'] == "Manager"){
                    $response = $lg->redirect("pageManager.php");
                }else if ($response['level'] == "Kasir") {
                    $response = $lg->redirect("pageKasir.php");
                }elseif ($response['level'] == "p") {
                    $response = $lg->redirect("pagepunya.php");
                }
            }
        }
    }

 ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Login</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="manifest/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="manifest/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="manifest/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="manifest/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- manifest CSS-->
    <link href="manifest/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="manifest/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="manifest/wow/animate.css" rel="stylesheet" media="all">
    <link href="manifest/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="manifest/slick/slick.css" rel="stylesheet" media="all">
    <link href="manifest/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="manifest/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="css/sweet-alert.css">

</head>

<body style="background: url(images/bg.png) no-repeat; background-size: cover;">
    <div class="page-wrapper">
        <div class="">
            <div class="container">
                <br><br>
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="images/icon/logo.png" alt="CoolAdmin">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="" method="post">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input required class="au-input au-input--full" type="text" name="username" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input required class="au-input au-input--full" type="password" name="password" placeholder="Password">
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="remember">Remember Me
                                    </label>
                                    <label>
                                        <a href="#">Forgotten Password?</a>
                                    </label>
                                </div>
                                <br>
                                <button name="btnLogin" class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="manifest/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="manifest/bootstrap-4.1/popper.min.js"></script>
    <script src="manifest/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- manifest JS       -->
    <script src="manifest/slick/slick.min.js">
    </script>
    <script src="manifest/wow/wow.min.js"></script>
    <script src="manifest/animsition/animsition.min.js"></script>
    <script src="manifest/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="manifest/counter-up/jquery.waypoints.min.js"></script>
    <script src="manifest/counter-up/jquery.counterup.min.js">
    </script>
    <script src="manifest/circle-progress/circle-progress.min.js"></script>
    <script src="manifest/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="manifest/chartjs/Chart.bundle.min.js"></script>
    <script src="manifest/select2/select2.min.js">
    </script>
    <script src="js/sweetalert.min.js"></script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
    <?php include "config/alert.php"; ?>
</body>

</html>
<!-- end document-->