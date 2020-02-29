<%@ page import="kz.bitlab.project.entities.FavItem" %>
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

    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/profile/css/core-style.css"/>">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/profile/css/style.css"/>">

</head>
<%
    List<FavItem> favs = (List<FavItem>)request.getAttribute("favs");
    double total = (double)request.getAttribute("total");
%>

<body>
<!-- Search Wrapper Area Start -->
<div class="text-area">

    <a href="/signout">SIGN OUT</a>
    <h2><b>Тут отоброжаются ваши избранные товары!</b></h2>
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
            <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
        </div>
        <!-- Amado Nav -->
        <nav class="amado-nav">
            <ul>
                <li><a href="/profile/index">Главная</a></li>
                <li class="active"><a href="/favourites_page">Избранные</a></li>
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




    <div class="cart-table-area section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="cart-title mt-50">
                        <h2>Избранное</h2>
                    </div>
                    <%
                        for(FavItem f: favs){
                    %>
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Price</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="cart_product_img">
                                    <a href="#"><img src="<%=f.getItem().getImage()%>" alt="Product"></a>
                                </td>
                                <td class="cart_product_desc">
                                    <h5><%=f.getItem().getName()%></h5>
                                </td>
                                <td class="price">
                                    <span><%=f.getItem().getPrice()%> тенге/день</span>
                                </td>
                                <td class="button">
                                    <form action="/deleteItemFromFav" method="post">
                                        <input type="hidden" name ="id" value="<%=f.getItem().getId()%>">
                                        <button class="alert-danger">DELETE</button>
                                    </form>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="cart-summary">
                        <h5>Сумма ваших избранных товаров</h5>
                        <ul class="summary-table">
                            <li><span>Полная сумма:<%=total%> </span> <span></span></li>
                        </ul>
                    </div>
                </div>
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