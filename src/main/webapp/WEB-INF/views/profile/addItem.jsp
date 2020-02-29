<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.project.entities.Items" %><%--
  Created by IntelliJ IDEA.
  User: oraza
  Date: 06.11.2019
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</head>
<body>
<form action="/addItem" method="post">

    Desc: <input type="text" class="form-control" id="exampleInputPass3" aria-describedby="emailHelp" name="desc">
    <br>
    <%--    Upload image: <input type="text" class="form-control" aria-describedby="emailHelp" value="<%=note.getImage()%>" name="image">--%>
    Upload photo here:  <input type="file">
    <br>
    Name: <input type="text" class="form-control" aria-describedby="emailHelp" name="name">
    <br>
    Price: <input type="number" class="form-control" aria-describedby="emailHelp" name="price">

    <button type="submit" class="btn btn-primary" style="width:100px;height:40px">ADD application</button>
</form>
</body>
</html>
