<?jsp
    include "db.jsp";
    if( isset($_GET['id']) && !empty($_GET['id'])) {
        $id = $_GET['id'];
        $sql = "SELECT * FROM music WHERE id = ? ";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            $path = 'audio/audio.mp3';
            file_put_contents($path, $row['content']);
        }
    } else {
        header("Location: search.jsp");
    }
?>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Modern Music</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/style.css">

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    
    <!-- ##### Header Area Start ##### -->
    <%@ include file="header.jsp" %>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Search</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Elements Area Start ##### -->
    <section class="elements-area mt-30 section-padding-100-0">
        <div class="container">
            <div class="row">
                <!-- ========== Buttons ========== -->
                <div class="col-12">
                    <div class="elements-title mb-70">
                        <h2>Find a song</h2>
                    </div>
                    <!-- Buttons -->
                    <div class="oneMusic-buttons-area mb-100" >
                        <!--  Search box  -->
                        <form action="search.jsp" method="POST" class="search-bar">
                            <label>
                                <input type="text" placeholder="Search anything" name="data">
                            </label>
                            <button type="submit" name= "btnSearch"><img src="img/core-img/search.png"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Result Area -->
        <div class="ctn">
            <?jsp
            if (isset($row) && isset($path)) {
            ?>
            <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                <div class="song-play-area">
                        <div class="song-name">
                            <p><?jsp echo $row['name']; ?></p>
                        </div>
                        <audio preload="auto" controls>
                                <source src="<?jsp echo $path; ?>"/>
                        </audio>
                </div>
                <div class="download-button">
                    <a href="<?jsp echo $path; ?>" download>
                        <i class="fa fa-download"></i>
                    </a>
                </div>
            </div>
            <?jsp
            }
            ?>
        </div>
    </section>
    <!-- ***** Elements Area End ***** -->

        <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">

        <div style="text-align: center; background-color: #000;">
            <img src="icons/icon-pay-01.png" alt="Payment Methods" style="margin-top: 10px;">
            <img src="icons/icon-pay-02.png" alt="Payment Methods" style="margin-top: 10px;">
            <img src="icons/icon-pay-03.png" alt="Payment Methods" style="margin-top: 10px;">
            <img src="icons/icon-pay-04.png" alt="Payment Methods" style="margin-top: 10px;">
            <img src="icons/icon-pay-05.png" alt="Payment Methods" style="margin-top: 10px;">
            <p>&copy; 2024 All rights reserved by Phong - Dat - Nam</p>
        </div>

    </footer>

    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>