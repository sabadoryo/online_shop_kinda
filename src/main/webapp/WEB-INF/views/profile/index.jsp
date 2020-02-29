<%@ page import="kz.bitlab.project.entities.Items" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>2GIVE | Renting AREA </title>

    <!-- Favicon  -->
    <link rel="icon" type="image/png" href="<spring:url value="/resources/profile/images/icons/favicon.ico"/>">
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/profile/css/core-style.css"/>">
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/profile/css/style.css"/>">

</head>

<header>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <div class="navbar navbar-inverse nav">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="/">CMS</a>

                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li class="divider-vertical"></li>
                        <li><a href="#"><i class="icon-home icon-white"></i> Home</a></li>
                    </ul>
                    <div class="pull-right">
                        <ul class="nav pull-right">
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, User <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/user/preferences"><i class="icon-cog"></i> Preferences</a></li>
                                    <li><a href="/help/support"><i class="icon-envelope"></i> Contact Support</a></li>
                                    <li class="divider"></li>
                                    <li><a href="/auth/logout"><i class="icon-off"></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<body>
<%
List<Items> items = (List<Items>)request.getAttribute("items");
%>
<!-- Search Wrapper Area Start -->
<div class="rounded">
    <a href="/signout">SIGN OUT</a>
    <h1> Welcome back, Mr ${user.fullName}!</h1>
    <br>
    <h2> Здесь вы можете посмотреь все товары и выбрать вас интересующие!</h2>
</div>
<div class="search-wrapper section-padding-100">
    <div class="search-close">
        <i class="fa fa-close" aria-hidden="true"></i>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="search-content">
                    <form action="#" method="get">
                        <input type="search" name="search" id="search" placeholder="Type your keyword...">
                        <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Search Wrapper Area End -->

<!-- ##### Main Content Wrapper Start ##### -->
<div class="main-content-wrapper d-flex clearfix">

    <!-- Mobile Nav (max width 767px)-->
    <div class="mobile-nav">
        <!-- Navbar Brand -->
        <div class="amado-navbar-brand">
            <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
        </div>
        <!-- Navbar Toggler -->
        <div class="amado-navbar-toggler">
            <span></span><span></span><span></span>
        </div>
    </div>

    <!-- Header Area Start -->
    <header class="header-area clearfix">
        <!-- Close Icon -->
        <div class="nav-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <!-- Logo -->
        <div class="logo">
            <a href="index.html"><img class="img" src="img/core-img/logo.png" alt=""></a>
        </div>
        <!-- Amado Nav -->
        <nav class="amado-nav">
            <ul>
                <li class="active"><a href="/profile/index">Главная</a></li>
                <li><a href="/favourites_page">Избранные</a></li>
                <li><a href="/myItems_page">Мои товары</a></li>
                <li><a href="/addItem_page">Подать заявку</a></li>
            </ul>
        </nav>
        <!-- Button Group -->
        <div class="amado-btn-group mt-30 mb-100">
            <a href="#" class="btn amado-btn mb-15">%Промо-код%</a>
        </div>
        <!-- Cart Menu -->
        <!-- Social Button -->
        <div class="social-info d-flex justify-content-between">
            <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
        </div>
    </header>
    <!-- Header Area End -->


    <div class="amado_product_area section-padding-100">
        <div class="container-fluid">

            <div class="row">
                <%
                    for(Items i:items) {
                        %>

                <!-- Single Product Area -->
                <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                    <div class="single-product-wrapper">
                        <!-- Product Image -->
                        <div class="product-img">
                            <img class="img" src="<spring:url value="<%=i.getImage()%>" />" alt="image"/>
                            <!-- Hover Thumb -->
                            <img class="hover-img" src="<%=i.getImage()%>" alt="">
                        </div>

                        <!-- Product Description -->
                        <div class="product-description d-flex align-items-center justify-content-between">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <p class="product-price"><%=i.getPrice()%>/per day</p>
                                <a href="/more/<%=i.getId()%>">
                                    <h6><%=i.getName()%></h6>
                                </a>
                            </div>
                            <!-- Ratings & Cart -->
                        </div>
                    </div>
                </div>
              <% } %>
                <!-- Single Product Area -->
            </div>
        </div>
    </div>
</div>
<!-- ##### Footer Area End ##### -->

<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<!-- ##### Footer Area End ##### -->

<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="<spring:url value="/resources/profile/js/jquery/jquery-2.2.4.min.js"/>"></script>
<!-- Popper js -->
<script src="js/popper.min.js"></script>
<script src="<spring:url value="/resources/profile/js/popper.min.js"/>"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<script src="<spring:url value="/resources/profile/js/bootstrap.min.js"/>"></script>
<!-- Plugins js -->
<script src="js/plugins.js"></script>
<script src="<spring:url value="/resources/profile/js/plugins.js"/>"></script>
<!-- Active js -->
<script src="js/active.js"></script>
<script src="<spring:url value="/resources/profile/js/active.js"/>"></script>
</body>

</html>