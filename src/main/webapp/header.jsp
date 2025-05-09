<header class="header-area">
    <!-- Navbar Area -->
    <div class="oneMusic-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                    <!-- Nav brand -->
                    <a href="index.jsp" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="singer.jsp">Singer</a></li>
                                <li><a href="song.jsp">Song</a></li>
                                <li><a href="event.jsp">Events</a></li>
                                <li><a href="blog.jsp">News</a></li>
                                <li><a href="search.jsp">Search</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>

                            <!-- Login/Register & Cart Button -->
                            <div class="login-register-btn dropdown">
                                <%
                                    String username = (String) session.getAttribute("username");
                                    if (username != null) {
                                %>
                                    <!-- Hiển thị biểu tượng và menu dropdown -->
                                    <a href="#" class="dropdown-toggle d-flex align-items-center" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span style="color:white; padding-left:15px;">Welcome back, <%= username %>!</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                        <!-- <a class="dropdown-item d-flex align-items-center" href="#">
                                            <img src="img/core-img/english.png" alt="English Icon" style="width: 20px; height: 20px; margin-right: 8px;">
                                            English
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <img src="img/core-img/vietnam.png" alt="Vietnamese Icon" style="width: 20px; height: 20px; margin-right: 8px;">
                                            Tiếng Việt
                                        </a> -->
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logout.jsp">Logout</a>
                                    </div>
                                <%
                                    } else {
                                %>
                                    <a style="color:white; padding-left:15px;" href="login.jsp">Welcome, guest! Please login</a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <!-- Nav End -->

                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->