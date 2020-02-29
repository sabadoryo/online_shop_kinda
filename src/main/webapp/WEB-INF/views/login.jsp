<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>FINAL</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="<spring:url value="/resources/images/icons/favicon.ico"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
    <!--===============================================================================================-->
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/vendor/animate/animate.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/vendor/css-hamburgers/hamburgers.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/vendor/animsition/css/animsition.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/vendor/select2/select2.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/vendor/daterangepicker/daterangepicker.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/css/util.css"/>">
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/css/main.css"/>">
    <!--===============================================================================================-->
    <%--    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <link rel="stylesheet" type="text/css" href="<spring:url value="fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>">
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <link rel="stylesheet" type="text/css" href="<spring:url value="vendor/css-hamburgers/hamburgers.min.css"/>">
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">--%>
    <%--    <!--===============================================================================================-->--%>
    <%--    <link rel="stylesheet" type="text/css" href="css/util.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="css/main.css">--%>
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
        <div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					2GIVE ONLINE TRADING SYSTEM, WELCOME!
				</span>
            <form class="login100-form validate-form p-b-33 p-t-5" action="/signin" method="post">

                <div class="wrap-input100 validate-input" data-validate = "Enter username">
                    <input class="input100" type="email" name="user_email" placeholder="User email">
                    <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="user_password" placeholder="Password">
                    <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                </div>

                <div class="container-login100-form-btn m-t-32">
                    <button class="login100-form-btn">
                        Login
                    </button>
                </div>
                <div class="wrap-input100 validate-input">
                    Don't have ane account? Register: <a href="/registration">Sign up</a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
<script src="<spring:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<spring:url value="/resources/js/main.js"/>"></script>
</html>
<%--<h1>WELCOME TO SPRING SECURITY APP</h1>--%>
<%--<a href="/profile/index">PROFILE PAGE</a>--%>
<%--<a href="/admin/index">ADMIN PAGE</a>--%>
<%--<a href="/login">LOGIN PAGE</a>--%>
<%--<a href="/registration">Registration page</a>--%>
