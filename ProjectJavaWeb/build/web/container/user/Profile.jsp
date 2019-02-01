<%-- 
    Document   : Profile
    Created on : Oct 18, 2018, 3:16:08 PM
    Author     : Admin.10.12
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    </head>
    <script>
        function changeValue1(event) {
            document.getElementById("email").readOnly = false;
        }
        function changeValue2(event) {
            document.getElementById("name").readOnly = false;
        }
    </script>

    <body>    
        <%
            request.setCharacterEncoding("UTF-8");
        %>
        <jsp:include page="/component/Menu.jsp"/>

        <div class="container" style="margin-top: 200px">
            <div class="row">
                <!--                User Information-->
                <div class="col-4 hovereffect3 text-center">
                    <!--Image-->
                    <div class="hovereffect">
                        <img src="${pageContext.request.contextPath}/image?imgname=${user.avatarUrl}" alt="${user.name}" class="img-thumbnail rounded-circle" style=" height: 330px" />
                        <div class="overlay">
                            <h2>${user.name}</h2>

                        </div>
                    </div>                                
                </div>


                <div class="col-md-8">
                    <form action="updateuser" method="POST" enctype="multipart/form-data">
                        <!--Particular user's information-->
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                            </div>
                            <input type="text" class="form-control " name='email' id='email' readOnly value="${user.email}"   aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                        <c:if test="${user.userId == sessionScope.user.userId}">
                            <i class="fas fa-edit" onClick="changeValue1()"></i>
                        </c:if>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                            </div>
                            <input type="text"  class="form-control" name='name' id="name" readOnly value="${user.name}"   aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                        <c:if test="${user.userId == sessionScope.user.userId}">
                            <i class="fas fa-edit" onClick="changeValue2()"></i>

                            <div class="form-group">
                                <label for="file-upload" class="custom-file-upload">
                                    <i class="fas fa-cloud-upload-alt"></i> Avatar
                                </label>
                                <input id="file-upload" name="avatarUrl" type="file" size="50" />
                            </div>
                        </c:if>
                        <c:if test="${user.userId == sessionScope.user.userId}">
                            <div className="text-right">
                                <input type="submit" class="btn btn-outline-success" value="Update"/>
                            </div>
                        </c:if>
                    </form>
                </div>
                <hr/>
                <c:if test="${empty products2}">
                    <div class="row" style="width: 100%;margin-top: 100px">
                        <div class="col-4">
                            <div class="list-group" id="myList" role="tablist">
                                <a class="list-group-item list-group-item-action active" data-toggle="list" href="#shop" role="tab">My Shops</a>
                                <a class="list-group-item list-group-item-action" data-toggle="list" href="#invoice" role="tab">My Invoices</a>
                            </div>
                        </div>
                        <div class="tab-content col-md-8">
                            <div class="tab-pane active" id="shop" role="tabpanel">
                                <c:if test="${user.userId == sessionScope.user.userId}">
                                    <c:if test="${not empty shops}">
                                        <h3>All Shops</h3>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ShopID</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Description</th>
                                                    <th scope="col">OpenOrClose</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var='shop' items='${shops}'> 
                                                    <tr>
                                                        <!--<<<<<<< HEAD-->
                                                        <c:url var="shopdetail" value="shopmanager">
                                                            <!--=======
                                                            <%-- <c:url var="shopdetail" value="/ShopManagerServlet">--%>
         >>>>>>> 57f8854f1efdd2ee9ebd2b441cdaf6d61bbd4e56-->
                                                            <c:param name="shopId" value="${shop.shopId}"></c:param>
                                                        </c:url>
                                                        <td><a href="${shopdetail}">${shop.shopId}</a></td>
                                                        <td>${shop.title}</td>
                                                        <td>${shop.description}</td>
                                                        <td>${shop.openOrClose}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table> 
                                    </c:if>
                                </c:if>
                                <c:if test="${user.userId != sessionScope.user.userId}">
                                    <c:if test="${not empty shops}">
                                        <h3>All Shops</h3>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ShopID</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Description</th>
                                                    <th scope="col">OpenOrClose</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var='shop' items='${shops}'> 
                                                    <tr>
                                                        <!--<<<<<<< HEAD-->
                                                        <td><a href="${pageContext.request.contextPath}/shop?shopId=${shop.shopId}&userId=${user.userId}">${shop.shopId}</a></td>
                                                        <td>${shop.title}</td>
                                                        <td>${shop.description}</td>
                                                        <td>${shop.openOrClose}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table> 
                                    </c:if>
                                </c:if>
                            </div>
                            <div class="tab-pane" id="invoice" role="tabpanel">
                                <c:if test="${not empty invoices}">
                                    <h3>All Invoices</h3>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col">InvoiceID</th>
                                                <th scope="col">OrderTime</th>
                                                <th scope="col">Address</th>
                                                <th scope="col">Phone</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var='invoice' items='${invoices}'> 
                                                <tr>
                                                    <c:url var="list" value="/userproduct">                            
                                                        <c:param name="invoiceID" value="${invoice.invoiceID}"></c:param>
                                                        <c:param name="userId" value="${user.userId}"></c:param>
                                                    </c:url>
                                                    <td><a href="${list}">${invoice.invoiceID}</a></td>
                                                    <td>${invoice.orderTime}</td>
                                                    <td>${invoice.address}</td>
                                                    <td>${invoice.phone}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table> 
                                </c:if>
                            </div>

                        </div>           
                    </c:if>
                    <c:if test="${not empty products2}">
                        <h2 style="margin-top: 100px">Invoice: No ${param.invoiceID}</h2>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">ProductID</th>
                                    <th scope="col">ShopID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Note</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0" scope="request"/>
                                <c:forEach var='product2' items='${products2}'> 
                                    <tr>
                                        <c:url var="shopdetail" value="/shop">
                                            <c:param name="shopId" value="${product2.shopID}"></c:param>
                                        </c:url>
                                        <td>${product2.productID}</td>
                                        <td><a href="${shopdetail}">${product2.shopID}</a></td>
                                        <td>${product2.name}</td>
                                        <td><img src="${pageContext.request.contextPath}/image?imgname=${product2.image}" alt="" height=100 width=100></img></td>
                                        <td>${product2.price}</td>
                                        <td>${product2.quantity}</td>
                                        <td>${product2.note}</td>
                                        <c:set var = "total" scope="request" value = "${total + product2.price*product2.quantity}"/>                
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table> 
                        <h3>Your total price:   <c:out value="${total}"/> Đ</h3>
                    </c:if>

                </div>
            </div>
        </div> 


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
