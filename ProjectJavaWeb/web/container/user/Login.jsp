<%-- 
    Document   : Login
    Created on : Oct 15, 2018, 9:53:10 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">            
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
    </head>
    <body>
        <div class="loginPage">
            <div class="container" style="height: 80%">
                <div class="row d-flex justify-content-center" style="margin-top: 30px">
                    <div class='col-3 '>
                        <div class='navbar-brand ' href='#' >
                            <a href="${pageContext.request.contextPath}/home">
                                <span><img src="${pageContext.request.contextPath}/public/images/logo.png" class='img-logo' alt='logo' /></span>
                            </a>
                        </div> 
                    </div>

                </div>
                <c:if test="${not empty error}">
                    <div class="row d-flex justify-content-center" style="margin-top: 10px">
                        <div class='col-3 ' style="color:red;text-align: center">
                            ${error}
                        </div>
                    </div>
                </c:if> 

                <div class="card loginBox" style="width: 33%;margin-top: 30px;height: 60%">
                    <form class="form" action="/ProjectJavaWeb/login" method="Post">
                        <div class="form-group">
                            <label for="username" class="text-black">Username:</label><br>
                            <input type="text" name="username" id="username" class="form-control" autocomplete="off" required="required">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-black">Password:</label><br>
                            <input type="password" name="password" id="password" class="form-control" autocomplete="off" required="required">
                        </div>
                        <div class="form-group">
                            <input style="width: 100%" type="submit" name="signin" class="btn btn-info btn-md" value="Sign In">
                        </div>
                    </form>
                </div>
                <div class="card createInLogin" >
                    <span>New to HolaFood? </span><a href="${pageContext.request.contextPath}/signup">Create an account.</a>
                </div>     
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
