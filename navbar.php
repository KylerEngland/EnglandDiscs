<?php
require_once('protected/DB.php');
require_once('protected/functions.inc.php');

$database = new DB;
$types = $database->getTypes();
$brands = $database->getBrands();
$stabilities = $database->getStabilities();
$inCartQuantity = $database->getInCartQuantity();

$quantity = $inCartQuantity->fetch();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>England Discs</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
                <img src="assets/img/logo2.png" alt="">
                <a class="navbar-brand" href="index.php">England Discs</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.php">Home</a></li>
            
                        <form action="index.php" method="get">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="index.php">All Products</a>
                                    <li><hr class="dropdown-divider" /></li>

                                    <select class="dropdown-item form-select" name="type" onchange="this.form.submit()">
                                        <li><option value="" class="dropdown-item" href="#!">Types</option></li>
                                        <?php
                                        while($type = $types->fetch()){
                                            ?>
                                            <option value="<?=$type['typecode']?>"><?=$type['typename']?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                    <li><hr class="dropdown-divider" /></li>
                                    <select class="form-select dropdown-item" name="brand" onchange="this.form.submit()">
                                        <li class="dropdown-item"><option value="" href="#!">Brands</option></li>
                                        <?php
                                        while($brand = $brands->fetch()){
                                            ?>
                                            <option value="<?=$brand['brandcode']?>"><?=$brand['brandname']?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>

                                    <li><hr class="dropdown-divider" /></li>
                                    <select class="form-select dropdown-item" name="stability" onchange="this.form.submit()">
                                        <li class="dropdown-item"><option value="" href="#!">Stability</option></li>
                                        <?php
                                        while($stability = $stabilities->fetch()){
                                            ?>
                                            <option value="<?=$stability['stabilitycode']?>"><?=$stability['stabilityname']?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </ul>
                            </li>
                        </form>

                    </ul>
                    <div class="d-flex">
                        <a class="btn btn-outline-dark" href="cart.php">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><?=$quantity['quantity']?></span>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="card text-center text-white">
            <img src="assets/img/background.jpg" class="card-img" alt="">
            <div class="card-img-overlay my-5">
                <h1 class="display-4 fw-bolder">Only the best discs</h1>
                <p class="lead fw-normal text-white-50 mb-0">For all your disc golf needs</p>
            </div>
        </header>
</body>
</html>