<?php
require_once('protected/DB.php');
require_once('protected/functions.inc.php');
session_start();
$database = new DB;
if ($_GET == NULL) {
    $discs = $database->getContent();
} else {
    $discs = $database->getFilteredContent($_GET['type'], $_GET['brand'], $_GET['stability']);
}

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
    <?php include_once('navbar.php'); ?>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <?= outputDiscs($discs); ?>

            </div>
        </div>
    </section>
    <!-- Footer-->








    <footer class="py-5 bg-dark">
        <div class="container text-center">
        <p class="m-0 text-white">Copyright &copy; England Discs 2022</p>
            <?php if (!isset($_SESSION['loggedin'])): ?>
                <a class="m-0 text-white" href="loginPage.php">Admin Login</a>
            <?php else: ?>
                <a class="m-0 text-white" href="inventory.php">Inventory Management</a>
            <?php endif; ?>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

</html>