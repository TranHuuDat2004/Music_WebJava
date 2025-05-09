<?jsp
    session_start(); // Khởi động phiên session

    if (isset($_SESSION['user_type']) && $_SESSION['user_type'] == 'admin') {
        include "db.jsp";

        if (isset($_POST['submit'])) {
            $file_name = $_FILES['file']['name'];
            $pattern = '/.+\.mp3$/i';

            if (preg_match($pattern, $file_name)) {
                $file_type = true;
            } else {
                $file_type = false;
            }

            if ($file_type) {
                $source = $_FILES['file']['tmp_name'];
                $content = file_get_contents($source);
                $query = "INSERT INTO music (name , content ) VALUES (?, ?)";
                // Use prepared statement to prevent SQL injection
                $stmt = $conn->prepare($query);
                $stmt->bind_param("ss", $file_name, $content);
                $stmt->execute();
                $result = $stmt->get_result();
            } else {
                echo "File không hợp lệ";
            }
        }

        $conn->close(); // Đóng kết nối
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

    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>UPLOAD SONG</h2>
        </div>
    </div>

    <!-- ##### Header Area End ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <form action="upload-music.jsp" method="POST" enctype="multipart/form-data" class="upload-form">
                    <label for="upload" class="upload-label">SELECT MUSIC FILE (MP3):</label><br>
                    <input type="file" id="upload" name="file" accept=".mp3" class="upload-input"><br><br>

                    <input type="submit" name="submit" value="Upload" class="upload-submit">
                </form>
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>LIST OF SONGS</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Name</th>
                                    <th>Play</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?jsp
                                // Your jsp logic to fetch and display songs data here
                                // For example:
                                $songs = array(
                                    array("Name A", "song_A.mp3"),
                                    array("Name B", "song_B.mp3"),
                                    array("Name C", "song_C.mp3")
                                );

                                // Loop through each song and display in the table
                                foreach ($songs as $index => $song) {
                                    $stt = $index + 1;
                                    $name = $song[0];
                                    $filename = $song[1];
                                    echo "<tr>";
                                    echo "<td>$stt</td>";
                                    echo "<td>$name</td>";
                                    echo "<td><audio controls><source src='music/$filename' type='audio/mpeg'>Your browser does not support the audio element.</audio></td>";
                                    echo "</tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </section>

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