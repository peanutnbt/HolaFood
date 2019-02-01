<%-- 
    Document   : newjspasdas
    Created on : Oct 16, 2018, 8:33:34 PM
    Author     : Vu
--%>
<link rel="stylesheet" href="/ProjectJavaWeb/public/css/style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dashboard</title>
    </head>
    <body style="overflow-x: hidden; margin: auto; background-color: #ededed" class="bodydashboard">
        <script>
            function myFunction(x, y) {
                console.log(x);
                console.log(y);
                document.getElementById("TestDemo1").value = y;

                if (x == 1) {
                    document.getElementById("TestDemo").value = 0;
                    document.getElementById("textModal").innerHTML = "Are you sure to BLOCK this UserID = " + y;
                } else {
                    document.getElementById("TestDemo").value = 1;
                    document.getElementById("textModal").innerHTML = "Are you sure to ACTIVE this UserID = " + y;
                }

            }
        </script>
        <%@include file="../../component/navbar.jsp" %>
        <hr>
        
        
        <hr/>
        <div class="container" style="margin-top: 100px">
            <h1 style="color: #1c931a;text-align: center">dashboard</h1>
            <div class="row" style="margin-left: 20px;">
                <div style="width: 23%;">
                    <div class="list-group" id="list-tab" role="tablist">
                        <a class="list-group-item list-group-item-action ${param.btnSubmit != null || param.btnBack != null ? "active":""} list-group-item-success" id="list-user-list" data-toggle="list" href="#list-user" role="tab" aria-controls="user" style="text-align: center">Users</a>
                        <a class="list-group-item list-group-item-action ${param.btnShopSubmit != null || param.btnShopBack != null || param.btnModal != null ? "active":""} list-group-item-success" id="list-shop-list" data-toggle="list" href="#list-shop" role="tab" aria-controls="shop" style="text-align: center">Shops</a>
                        <!--<a class="list-group-item list-group-item-action ${param.btnProductSubmit != null || param.btnProductBack != null ? "active":""} list-group-item-success" id="list-product-list" data-toggle="list" href="#list-product" role="tab" aria-controls="product" style="text-align: center">Products</a>-->
                        <a class="list-group-item list-group-item-action ${param.btnInvoiceSubmit != null || param.btnInvoiceBack != null ? "active":""} list-group-item-success" id="list-invoice-list" data-toggle="list" href="#list-invoice" role="tab" aria-controls="invoice" style="text-align: center">Invoice</a>
                    </div>
                </div>
                <div class="col-8">
                    <a href="/ProjectJavaWeb/dashboard">
                        <div style="background: url(/ProjectJavaWeb/public/images/logo.png); width: 900px; height: 200px; background-repeat: no-repeat; background-position: center center; margin: auto">

                        </div>
                    </a>
                </div>
                <hr>
                <div class="mt-3" style="width: 100%">
                    <hr>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade ${param.btnSubmit != null || param.btnBack != null  || param.btnModal != null ?  "show active" : ""}" id="list-user" role="tabpanel" aria-labelledby="list-user-list">
                            <form class="form-inline my-2 my-lg-0 mr-auto" action="dashboard" method="post">
                                <input class="form-control mr-sm-2" type="search" name="searchUser" placeholder="Search (please select type of search)" aria-label="Search" style="width: 252px; font-size: 14;" value="${param.searchUser}"/>
                                <select class="form-control mr-sm-2" name="selectUser"}>
                                    <option value="userId" ${param.selectUser == "userId" ? "selected": ""}>By UserID</option>
                                    <option value="Username" ${param.selectUser == "Username" ? "selected": ""}>By UserName</option>
                                    <option value="Name" ${param.selectUser == "Name" ? "selected": ""}>By Name</option>
                                    <option value="Email" ${param.selectUser == "Email" ? "selected": ""}>By Email</option>
                                </select>
                                <button class="btn btn-success my-2 mr-sm-2 my-sm-0" type="submit" name="btnSubmit">Search</button>
                                <button class="btn btn-success my-2 my-sm-0" type="submit" name="btnBack">Back</button>
                            </form>
                            <p style="color: red" ${param.btnSubmit != null ? "" :"hidden"} class="mt-3">${errorUser}</p>
                            <hr/>
                            <div class="tableCustom"></div>
                            <table class="table table-hover user" ${param.btnSubmit == null ? "" :"hidden"} ">
                                <thead style="text-align: center">
                                    <tr class="table-success">
                                        <th>ABC ID</th>
                                        <th>User Name</th>
                                        <th>Password</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Avatar Url</th>
                                        <th>Role</th>
                                        <th> Status </th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center">
                                    <c:forEach var="x" items="${Users}">
                                        <tr>
                                            <td>${x.userId}</td>
                                            <td>${x.username}</td>
                                            <td>${x.password}</td>
                                            <td style="text-align: center">${x.name}</td>
                                            <td style="text-align: center">${x.email}</td>
                                            <td style="text-align: center"><img src="${pageContext.request.contextPath}/image?imgname=${x.avatarUrl}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                            <td style="text-align: center">${x.role}</td>
                                            <td style="text-align: center"><button class="${x.active == 0 ? "btn btn-danger":"btn btn-success"}" name="btnStatus" value="${x.userId}" id="${x.userId}" data-toggle="modal" data-target="#exampleModal" onclick="myFunction(${x.active}, ${x.userId})">${x.active == 1 ? "Active":"Block"}</button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${empty SearchUserUserID and empty SearchUserOther or not empty back}">
                                <p style="color: red" ${param.btnSubmit != null ? "" :"hidden"}>Cannot found, please search again !!!</p>
                                <p style="color: green" ${param.btnSubmit != null ? "" :"hidden"}>All RECORD USER</p>
                                <table class="table table-hover user" ${param.btnSubmit != null ? "" :"hidden"}>
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>User ID</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Avatar Url</th>
                                            <th>Role</th>
                                            <th> Status </th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${Users}">
                                            <tr>
                                                <td>${x.userId}</td>
                                                <td>${x.name}</td>
                                                <td>${x.password}</td>
                                                <td style="text-align: center">${x.name}</td>
                                                <td style="text-align: center">${x.email}</td>
                                                <td style="text-align: center"><img src="${pageContext.request.contextPath}/image?imgname=${x.avatarUrl}" style="width: 100px;height: 100px;object-fit: cover"></td>
                                                <td style="text-align: center">${x.role}</td>
                                                <td style="text-align: center"><button class="${x.active == 0 ? "btn btn-danger":"btn btn-success"}" name="btnStatus" value="${x.userId}" id="${x.userId}" data-toggle="modal" data-target="#exampleModal" onclick="myFunction(${x.active}, ${x.userId})">${x.active == 1 ? "Active":"Block"}</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchUserUserID}">
                                <p style="color: green" ${param.btnSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover user">
                                    <thead style="text-align: center" >
                                        <tr class="table-success">
                                            <th>User ID</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Avatar Url</th>
                                            <th>Role</th>
                                            <th> Status </th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchUserUserID}">
                                            <tr>
                                                <td>${x.userId}</td>
                                                <td>${x.username}</td>
                                                <td>${x.password}</td>
                                                <td style="text-align: center">${x.name}</td>
                                                <td style="text-align: center">${x.email}</td>
                                                <td style="text-align: center"><img src="${pageContext.request.contextPath}/image?imgname=${x.avatarUrl}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                                <td style="text-align: center">${x.role}</td>
                                                <td style="text-align: center"><button class="${x.active == 0 ? "btn btn-danger":"btn btn-success"}" name="btnStatus" value="${x.userId}" id="${x.userId}" data-toggle="modal" data-target="#exampleModal"onclick="myFunction(${x.active}, ${x.userId})">${x.active == 1 ? "Active":"Block"}</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchUserOther}">
                                <p style="color: green" ${param.btnSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover user">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>User ID</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Avatar Url</th>
                                            <th>Role</th>
                                            <th> Status </th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchUserOther}">
                                            <tr>
                                                <td>${x.userId}</td>
                                                <td>${x.username}</td>
                                                <td>${x.password}</td>
                                                <td style="text-align: center">${x.name}</td>
                                                <td style="text-align: center">${x.email}</td>
                                                <td style="text-align: center"><img src="${pageContext.request.contextPath}/image?imgname=${x.avatarUrl}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                                <td style="text-align: center">${x.role}</td>
                                                <td style="text-align: center"><button class="${x.active == 0 ? "btn btn-danger":"btn btn-success"}" name="btnStatus" value="${x.userId}" id="${x.userId}" data-toggle="modal" data-target="#exampleModal" onclick="myFunction(${x.active}, ${x.userId})">${x.active == 1 ? "Active":"Block"}</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                        <div class="tab-pane fade ${param.btnShopSubmit != null || param.btnShopBack != null ? "show active":""}" id="list-shop" role="tabpanel" aria-labelledby="list-shop-list">
                            <form class="form-inline my-2 my-lg-0 mr-auto" action="dashboard" method="post">
                                <input class="form-control mr-sm-2" type="search" name="searchShop" placeholder="Search (please select type of search)" aria-label="Search" style="width: 252px; font-size: 14" value="${param.searchShop}">
                                <select class="form-control mr-sm-2" name="selectShop">
                                    <option value="shopId" ${param.selectShop == "shopId" ? "selected": ""}>By ShopID</option>
                                    <option value="Description" ${param.selectShop == "Description" ? "selected": ""}>By Description</option>
                                    <option value="OpenOrClose" ${param.selectShop == "OpenOrClose" ? "selected": ""}>By Open or Close</option>
                                </select>
                                <button class="btn btn-success my-2 mr-sm-2 my-sm-0" type="submit" name="btnShopSubmit">Search</button>
                                <button class="btn btn-success my-2 my-sm-0" type="submit" name="btnShopBack">Back</button>
                            </form>
                            <p style="color: red" ${param.btnShopSubmit != null ? "" :"hidden"}>&ensp; ${errorShop}</p>
                            <hr/>
                            <table class="table table-hover shop" ${param.btnShopSubmit == null ? "":"hidden"}>
                                <thead style="text-align: center">
                                    <tr class="table-success" >
                                        <th>Shop ID</th>
                                        <th>User ID</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Open or Close</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center">
                                    <c:forEach var="x" items="${Shops}">
                                        <c:url var="product" value="/dashboard/shopproduct">
                                            <c:param name="shopId" value="${x.shopId}"/>
                                        </c:url>
                                        <tr>
                                            <td>${x.shopId}</td>
                                            <td>${x.userId}</td>
                                            <td>${x.title}</td>
                                            <td>${x.description}</td>
                                            <td style="text-align: center"><input type="checkbox" ${x.openOrClose == false ? "" : "checked"} onclick="return false;" onkeydown="return false;"/></td>
                                            <td style="text-align: center"><a href="${product}" target="blank"><button type="button" class="btn btn-outline-success">In shop</button></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${empty SearchShopID and empty SearchShopOpenOrClose and empty SearchShopOther or not empty back1}">
                                <p style="color: red" ${param.btnShopSubmit != null ? "" :"hidden"}>Cannot found, please search again !!!</p>
                                <p style="color: green" ${param.btnShopSubmit != null ? "" :"hidden"}>All RECORD SHOP</p>
                                <table class="table table-hover shop" ${param.btnShopSubmit != null ? "" :"hidden"}>
                                    <thead style="text-align: center">
                                        <tr class="table-success" >
                                            <th>Shop ID</th>
                                            <th>User ID</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Open or Close</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${Shops}">
                                            <c:url var="product" value="/dashboard/shopproduct">
                                                <c:param name="shopId" value="${x.shopId}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.shopId}</td>
                                                <td>${x.userId}</td>
                                                <td>${x.title}</td>
                                                <td>${x.description}</td>
                                                <td style="text-align: center"><input type="checkbox" ${x.openOrClose == false ? "" : "checked"} onclick="return false;" onkeydown="return false;"/></td>
                                                <td style="text-align: center"><a href="${product}" target="blank"><button type="button" class="btn btn-outline-success">In shop</button></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchShopID}">
                                <p style="color: green" ${param.btnShopSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover shop">
                                    <thead style="text-align: center">
                                        <tr class="table-success" >
                                            <th>Shop ID</th>
                                            <th>User ID</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Open or Close</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchShopID}">
                                            <c:url var="product" value="/dashboard/shopproduct">
                                                <c:param name="shopId" value="${x.shopId}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.shopId}</td>
                                                <td>${x.userId}</td>
                                                <td>${x.title}</td>
                                                <td>${x.description}</td>
                                                <td style="text-align: center"><input type="checkbox" ${x.openOrClose == false ? "" : "checked"} onclick="return false;" onkeydown="return false;"/></td>
                                                <td style="text-align: center"><a href="${product}" target="blank"><button type="button" class="btn btn-outline-success">In shop</button></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchShopOpenOrClose}">
                                <p style="color: green" ${param.btnShopSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover shop">
                                    <thead style="text-align: center">
                                        <tr class="table-success" >
                                            <th>Shop ID</th>
                                            <th>User ID</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Open or Close</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchShopOpenOrClose}">
                                            <c:url var="product" value="/dashboard/shopproduct">
                                                <c:param name="shopId" value="${x.shopId}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.shopId}</td>
                                                <td>${x.userId}</td>
                                                <td>${x.title}</td>
                                                <td>${x.description}</td>
                                                <td style="text-align: center"><input type="checkbox" ${x.openOrClose == false ? "" : "checked"} onclick="return false;" onkeydown="return false;"/></td>
                                                <td style="text-align: center"><a href="${product}" target="blank"><button type="button" class="btn btn-outline-success">In shop</button></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchShopOther}">
                                <p style="color: green" ${param.btnShopSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover shop">
                                    <thead style="text-align: center">
                                        <tr class="table-success" >
                                            <th>Shop ID</th>
                                            <th>User ID</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Open or Close</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchShopOther}">
                                            <c:url var="product" value="/dashboard/shopproduct">
                                                <c:param name="shopId" value="${x.shopId}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.shopId}</td>
                                                <td>${x.userId}</td>
                                                <td>${x.title}</td>
                                                <td>${x.description}</td>
                                                <td style="text-align: center"><input type="checkbox" ${x.openOrClose == false ? "" : "checked"} onclick="return false;" onkeydown="return false;"/></td>
                                                <td style="text-align: center"><a href="${product}" target="blank"><button type="button" class="btn btn-outline-success">In shop</button></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
<%--                        <div class="tab-pane fade ${param.btnProductSubmit != null || param.btnProductBack != null ? "show active":""}" id="list-product" role="tabpanel" aria-labelledby="list-product-list">
                            <form class="form-inline my-2 my-lg-0 mr-auto" action="dashboard" method="post">
                                <input class="form-control mr-sm-2" type="search" name="searchProduct" placeholder="Search (please select type of search)" aria-label="Search" style="width: 252px; font-size: 14" value="${param.searchProduct}">
                                <select class="form-control mr-sm-2" name="selectProduct">
                                    <option value="productId" ${param.selectProduct == "productId" ? "selected" :""}>By ProductID</option>
                                    <option value="Name" ${param.selectProduct == "Name" ? "selected" :""}>By Name</option>
                                    <option value="Image" ${param.selectProduct == "Image" ? "selected" :""}>By Image</option>
                                    <option value="Price" ${param.selectProduct == "Price" ? "selected" :""}>By Price</option>
                                </select>
                                <button class="btn btn-success my-2 mr-sm-2 my-sm-0" type="submit" name="btnProductSubmit">Search</button>
                                <button class="btn btn-success my-2 my-sm-0" type="submit" name="btnProductBack">Back</button>
                            </form>
                            <p style="color: red"  ${param.btnProductSubmit != null ? "" :"hidden"}>&ensp; ${errorProduct}</p>
                            <hr/>
                            <table class="table table-hover product" ${param.btnProductSubmit == null ? "":"hidden"}>
                                <thead style="text-align: center">
                                    <tr class="table-success">
                                        <th>Prodcut ID</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center">
                                    <c:forEach var="x" items="${Products}">
                                        <tr>
                                            <td>${x.productId}</td>
                                            <td>${x.name}</td>
                                            <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                            <td>${x.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${empty SearchProductID and empty SearchProductPrice and empty SearchProductOther or not empty back2}">
                                <p style="color: red" ${param.btnProductSubmit != null ? "" :"hidden"}>Cannot found, please search again !!!</p>
                                <p style="color: green" ${param.btnProductSubmit != null ? "" :"hidden"}>ALL RECORD PRODUCT</p>
                                <table class="table table-hover product" ${param.btnProductSubmit != null ? "":"hidden"}>
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Prodcut ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${Products}">
                                            <tr>
                                                <td>${x.productId}</td>
                                                <td>${x.name}</td>
                                                <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                                <td>${x.price}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchProductID}">
                                <p style="color: green" ${param.btnProductSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover product">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Prodcut ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchProductID}">
                                            <tr>
                                                <td>${x.productId}</td>
                                                <td>${x.name}</td>
                                                <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                                <td>${x.price}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchProductPrice}">
                                <p style="color: green" ${param.btnProductSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover product">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Prodcut ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchProductPrice}">
                                            <tr>
                                                <td>${x.productId}</td>
                                                <td>${x.name}</td>
                                                <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                                <td>${x.price}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>    
                            <c:if test="${not empty SearchProductOther}">
                                <p style="color: green" ${param.btnProductSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover product">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Prodcut ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchProductOther}">
                                            <tr>
                                                <td>${x.productId}</td>
                                                <td>${x.name}</td>
                                                <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"></td>
                                                <td>${x.price}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if> 
                        </div>--%>
                        <div class="tab-pane fade ${param.btnInvoiceSubmit != null || param.btnInvoiceBack != null ? "show active":""}" id="list-invoice" role="tabpanel" aria-labelledby="list-invoice-list">
                            <form class="form-inline my-2 my-lg-0 mr-auto" action="dashboard" method="post">
                                <input class="form-control mr-sm-2" type="search" name="searchInvoice" placeholder="Search (please select type of search)" aria-label="Search" style="width: 252px; font-size: 14" value="${param.searchInvoice}">
                                <select class="form-control mr-sm-2" name="selectInvoice">
                                    <option value="invoiceID" ${param.selectInvoice == "invoiceID"?"selected":""}>By InvoiceID</option>
                                    <option value="OrderTime" ${param.selectInvoice == "OrderTime"?"selected":""}>By Order Time</option>
                                    <option value="UserID" ${param.selectInvoice == "UserID"?"selected":""}>By UserID</option>
                                    <option value="Address" ${param.selectInvoice == "Address"?"selected":""}>By Address</option>
                                    <option value="PhoneNumber" ${param.selectInvoice == "PhoneNumber"?"selected":""}>By Phone Number</option>
                                </select>
                                <button class="btn btn-success my-2 mr-sm-2 my-sm-0" type="submit" name="btnInvoiceSubmit">Search</button>
                                <button class="btn btn-success my-2 my-sm-0" type="submit" name="btnInvoiceBack">Back</button>
                            </form>
                            <p style="color: red" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>&ensp; ${errorInvoice}</p>
                            <hr/>
                            <table class="table table-hover invoice" ${param.btnInvoiceSubmit == null ? "":"hidden"}>
                                <thead style="text-align: center">
                                    <tr class="table-success">
                                        <th>Invoice ID</th>
                                        <th>Order Time</th>
                                        <th>User ID</th>
                                        <th>Address</th>
                                        <th>Phone Number</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center">
                                    <c:forEach var="x" items="${Invoices}" >
                                        <c:url var="invoiceline" value="/dashboard/invoiceline">
                                            <c:param name="invoiceID" value="${x.invoiceID}"/>
                                        </c:url>
                                        <tr>
                                            <td>${x.invoiceID}</td>
                                            <td>${x.orderTime}</td>
                                            <td style="text-align: center">${x.userID}</td>
                                            <td style="text-align: center">${x.address}</td>
                                            <td style="text-align: center">${x.phone}</td>
                                            <td style="text-align: center">
                                                <a href="${invoiceline}" target="blank" ><button type="button" class="btn btn-outline-success">More details</button></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${empty SearchInvoiceID and empty SearchInvoiceUserID and empty SearchInvoiceOrderTime and empty SearchInvoiceOther or not empty back3}">
                                <p style="color: red" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>Cannot found, please search again !!!</p>
                                <p style="color: green" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>ALL RECORD INVOICE</p>
                                <table class="table table-hover invoice" ${param.btnInvoiceSubmit != null ? "":"hidden"}>
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Invoice ID</th>
                                            <th>Order Time</th>
                                            <th>User ID</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${Invoices}">
                                            <c:url var="invoiceline" value="/dashboard/invoiceline">
                                                <c:param name="invoiceID" value="${x.invoiceID}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.invoiceID}</td>
                                                <td>${x.orderTime}</td>
                                                <td style="text-align: center">${x.userID}</td>
                                                <td style="text-align: center">${x.address}</td>
                                                <td style="text-align: center">${x.phone}</td>
                                                <td style="text-align: center">
                                                    <a href="${invoiceline}" target="blank" ><button type="button" class="btn btn-outline-success">More details</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchInvoiceID}">
                                <p style="color: green" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover invoice">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Invoice ID</th>
                                            <th>Order Time</th>
                                            <th>User ID</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchInvoiceID}">
                                            <c:url var="invoiceline" value="/dashboard/invoiceline">
                                                <c:param name="invoiceID" value="${x.invoiceID}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.invoiceID}</td>
                                                <td>${x.orderTime}</td>
                                                <td style="text-align: center">${x.userID}</td>
                                                <td style="text-align: center">${x.address}</td>
                                                <td style="text-align: center">${x.phone}</td>
                                                <td style="text-align: center">
                                                    <a href="${invoiceline}" target="blank" ><button type="button" class="btn btn-outline-success">More details</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchInvoiceUserID}">
                                <p style="color: green" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover invoice">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Invoice ID</th>
                                            <th>Order Time</th>
                                            <th>User ID</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchInvoiceUserID}">
                                            <c:url var="invoiceline" value="/dashboard/invoiceline">
                                                <c:param name="invoiceID" value="${x.invoiceID}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.invoiceID}</td>
                                                <td>${x.orderTime}</td>
                                                <td style="text-align: center">${x.userID}</td>
                                                <td style="text-align: center">${x.address}</td>
                                                <td style="text-align: center">${x.phone}</td>
                                                <td style="text-align: center">
                                                    <a href="${invoiceline}" target="blank" ><button type="button" class="btn btn-outline-success">More details</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchInvoiceOrderTime}">
                                <p style="color: green" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover invoice">
                                    <thead style="text-align: center">
                                        <tr class="table-success">
                                            <th>Invoice ID</th>
                                            <th>Order Time</th>
                                            <th>User ID</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchInvoiceOrderTime}">
                                            <c:url var="invoiceline" value="/dashboard/invoiceline">
                                                <c:param name="invoiceID" value="${x.invoiceID}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.invoiceID}</td>
                                                <td>${x.orderTime}</td>
                                                <td style="text-align: center">${x.userID}</td>
                                                <td style="text-align: center">${x.address}</td>
                                                <td style="text-align: center">${x.phone}</td>
                                                <td style="text-align: center">
                                                    <a href="${invoiceline}" target="blank" ><button type="button" class="btn btn-outline-success">More details</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${not empty SearchInvoiceOther}">
                                <p style="color: green" ${param.btnInvoiceSubmit != null ? "" :"hidden"}>RESULT</p>
                                <table class="table table-hover invoice">
                                    <thead style="text-align: center"> 
                                        <tr class="table-success">
                                            <th>Invoice ID</th>
                                            <th>Order Time</th>
                                            <th>User ID</th>
                                            <th>Address</th>
                                            <th>Phone Number</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                        <c:forEach var="x" items="${SearchInvoiceOther}">
                                            <c:url var="invoiceline" value="/dashboard/invoiceline">
                                                <c:param name="invoiceID" value="${x.invoiceID}"/>
                                            </c:url>
                                            <tr>
                                                <td>${x.invoiceID}</td>
                                                <td>${x.orderTime}</td>
                                                <td style="text-align: center">${x.userID}</td>
                                                <td style="text-align: center">${x.address}</td>
                                                <td style="text-align: center">${x.phone}</td>
                                                <td style="text-align: center">
                                                    <a href="${invoiceline}" target="blank" ><button type="button" class="btn btn-outline-success">More details</button></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="container">
            <form action="Test3" method="get">
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirm action</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="Active" id="TestDemo"/>
                                <input type="hidden" name="UserID" id="TestDemo1"/>
                                <h4 id="textModal" style="color: red"></h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success" name="btnModal" value="OK">OK</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <hr>
        <br/>
        <div class="container text-center">
            <h2 style="color: #1c931a;">HOLA FOOD</h2>
            <h3>We love food!</h3>
            <h3>We have created a food hola website.</h3>
            <br/>
            <p>Được xây dựng từ giữa năm 2018 tại Hòa Lạc, Hà Nội, Food Hola là cộng đồng tin cậy cho sinh viên có thể tìm kiếm,
                đánh giá, bình luận các địa điểm ăn uống: nhà hàng, quán ăn, cafe, bar, karaoke, tiệm bánh, khu du lịch... tại
                Việt Nam - từ website. Tất cả thành viên từ Bắc đến Nam, Food Hola kết nối mọi sinh viên đến với các địa điểm
                ăn uống lớn nhỏ cả đất nước. Đến thời điểm hiện tại, Food Hola với hàng chục địa điểm và hàng trăm ngàn bình
                luận, hình ảnh tại Việt Nam, ở hầu hết miền Bắc. Food Hola là cách dễ nhất để bạn có thể tìm kiếm và lựa chọn
                địa điểm và những món ăn tốt nhất cho mình và bạn bè.</p>  
        </div>
        <hr>
        <footer class="page-footer">
            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="https://mdbootstrap.com/bootstrap-tutorial/"> HolaFood.com</a>
            </div>
        </footer>
    </body>
</html>
