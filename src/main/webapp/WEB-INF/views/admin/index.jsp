<%@ page import="kz.bitlab.project.entities.Items" %>
<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.project.entities.Users" %>
<%@ page import="kz.bitlab.project.entities.ItemsInQueue" %>
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

<body>
<%
    List<Items> items = (List<Items>) request.getAttribute("items");
    List<ItemsInQueue> itemsQ = (List<ItemsInQueue>) request.getAttribute("itemsQ");
    List<Users> users = (List<Users>) request.getAttribute("users");
    int total_items = (int) request.getAttribute("total_items");
    int total_itemsQ = (int) request.getAttribute("total_itemsQ");
    int total_users = (int) request.getAttribute("total_users");
%>
<!-- Search Wrapper Area Start -->
<div class="rounded">
    <a href="/signout">SIGN OUT</a>
    <h1> Welcome back, Mr ${user.fullName}!, moderator</h1>
    <br>
    <h2>Здесь представлена статистика на текущее время!</h2>
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

    <!-- Header Area End -->

                      <h4>  <i class="fa fa-users" aria-hidden="true">Всего пользователей: <%=total_users%>         </i> </h4>
                      <h4>  <i class="fa fa-book"  aria-hidden="true">Всего товаров активно: <%=total_items%>       </i></h4>
                      <h4>  <i class="fa fa-times"  aria-hidden="true">Всего товаров в очереди: <%=total_itemsQ%>   </i></h4>

        <!-- Close Icon -->

        <!-- Logo -->

        <!-- Amado Nav -->


        <!-- Cart Menu -->
        <!-- Social Button -->



    <div class="amado_product_area section-padding-100">
        <div class="container-fluid">

            <div class="row">
                <nav class="amado-nav">
                    <ul>
                        <li class="active"><a class="active" href="/admin/usersList_page"><h2>Список пользователей</h2></a></li>
                        <li class="active"><a class="active" href="/admin/itemsList_page"><h2>Список товаров</h2></a></li>
                        <li class="active"><a class="active" href="/admin/itemsQList_page"><h2>Список товаров в очереди</h2></a></li>
                    </ul>
                </nav>
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