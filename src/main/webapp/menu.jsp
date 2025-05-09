<div class="classynav">
    <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="albums-store.php">Albums</a></li>
        <li><a href="event.php">Events</a></li>
        <li><a href="blog.php">News</a></li>
        <li><a href="search.php">Search</a></li>
        <li><a href="contact.php">Contact</a></li>
        <?php
        if (isset($_SESSION['user_type']) && $_SESSION['user_type'] == 'admin') {
            echo '<li><a href="upload-music.php">Upload</a></li>';
            echo '<li><a href="admin.php">Admin</a></li>';
        }
        ?>
    </ul>

    <!-- Login/Register -->
    <div class="login-register-cart-button d-flex align-items-center">
        <!-- Login/Register -->
        <div class="login-register-btn mr-50">
            <?php
             if(isset($_SESSION) || !empty($_SESSION['email'])){
            ?>
                 <span><?php echo $_SESSION['email']; ?></span>
                 <a href="logout.php" class="btn">Logout</a>
            <?php
             } else {
                echo '<a href="login.php" id="loginBtn">Login / Register</a>';
             }
            ?>


        </div>
    </div>
</div>