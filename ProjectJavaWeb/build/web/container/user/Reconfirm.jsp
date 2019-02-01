<%-- 
    Document   : Reconfirm
    Created on : Oct 28, 2018, 10:26:18 AM
    Author     : Admin.10.12
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">            
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <body>
        <jsp:include page="/component/Menu.jsp"/>
        <div class="row" style="margin-top:200px">
            <div class="col-4 hovereffect3 text-center">
                <!--Image-->
                <div class="hovereffect">
                    <img src="${pageContext.request.contextPath}/image?imgname=${sessionScope.user.avatarUrl}" alt="${sessionScope.user.name}" class="img-thumbnail rounded-circle" style=" height: 330px" />
                    <div class="overlay">
                        <h2>${sessionScope.user.name}</h2>

                    </div>
                </div>                                
            </div>
            <div class="col-md-8">
                <h1>Hello, ${sessionScope.user.name}</h1>
                <h3>Address: ${sessionScope.address}</h3>
                <h3>Phone: ${sessionScope.phone}</h3>
                <div class="alert alert-success" style="display:block" role="alert" id="alert">
                    <h5>You has ordered successfully!!</h5>
                    <p>Your products are coming!!!</p>
                </div>
                <div>
                    <c:set var = "total" scope = "session" value = "0"/>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ProductID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Image</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="x" items="${sessionScope.payment.items}">
                                <tr>
                                    <td>${x.id}</td>
                                    <td>${x.name}</td>
                                    <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" alt="" height=100 width=100></img></td>
                                    <td>${x.price}</td>
                                    <td>${x.quantity}</td>

                                </tr>
                                <c:set var = "total" scope = "session" value = "${total + x.price*x.quantity}"/>                
                            </c:forEach>
                        </tbody>
                    </table> 

                    <h3>Your total price:   <c:out value="${total}"/> Đ</h3>
                    <a href="${pageContext.request.contextPath}/container/user/checkout.jsp"><input class="btn btn-success m-3 float-right" value="Confirm"/></a>
                </div>
            </div>
        </div>
    </body>
</html>
