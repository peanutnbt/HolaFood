<%-- 
    Document   : productinshop
    Created on : Oct 17, 2018, 10:34:05 PM
    Author     : Vu
--%>
<link rel="stylesheet" href="/ProjectPRJ/public/css/style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #ededed" class="bodyProductInShop">
        <div>
            <div style="width: 15%; float: left;" class="d-flex justify-content-center">
                <img src="/ProjectJavaWeb/public/images/logoleft.png" style="width: 80%; height: 90%; margin-top: 50px;object-fit: contain"/>
            </div>
            <div class="xx" style="width: 70%; height: 65%; background-color: white; margin: auto; float: left">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="navbar-brand d-flex justify-content-center" href="${pageContext.request.contextPath}/Dashboard" style="width: 100%"><img src="/ProjectJavaWeb/public/images/logo.png" style="width: 100%;height: 100px;object-fit: contain" id="logo" alt="logo"></a>
                    </div>
                    <div class="modal-body">
                        <h5 class="modal-title mb-3" id="exampleModalLabel">Product In Shop</h5>
                        <form class="form-inline my-2 my-lg-0 mr-auto" action="searchproductinshop" method="post">
                            <input type="hidden" value="${SHOPID}" name="SHOPID"/>
                            <input class="form-control mr-sm-2" type="search" name="searchProduct" placeholder="Search (please select type of search)" aria-label="Search" style="width: 252px; font-size: 14" value="${param.searchProduct}">
                            <select class="form-control mr-sm-2" name="selectProduct">
                                <option value="productId" ${param.selectProduct == "productId" ? "selected" :""}>By ProductID</option>
                                <option value="Name" ${param.selectProduct == "Name" ? "selected" :""}>By Name</option>
                                <!--<option value="Image" ${param.selectProduct == "Image" ? "selected" :""}>By Image</option>-->
                                <option value="Price" ${param.selectProduct == "Price" ? "selected" :""}>By Price</option>
                            </select>
                            <button class="btn btn-success my-2 mr-sm-2 my-sm-0" type="submit" name="btnProductSubmit">Search</button>
                        </form>
                        <p style="color: red">&ensp; ${errorProduct}</p>
                        <hr/>
                        <!--<div style="overflow: scroll; height: 100%">-->
                        <table class="table table-hover productinshop" ${param.btnProductSubmit == null ? "":"hidden"}>
                            <thead>
                                <tr class="table-success">
                                    <th scope="col">Prodcut ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="x" items="${Products}">
                                    <tr>
                                        <td>${x.productId}</td>
                                        <td>${x.name}</td>
                                        <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"/></td>
                                        <td>${x.price}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${empty SearchProID and empty SearchPrice and empty SearchOther}">
                            <p style="color: red" ${param.btnProductSubmit != null ? "" :"hidden"}>Cannot found, please search again !!!</p>
                            <p style="color: green;" ${param.btnProductSubmit != null ? "" :"hidden"}>ALL RECORD PRODUCT IN SHOP</p>
                            <hr/>
                            <table class="table table-hover productinshop" ${param.btnProductSubmit != null ? "":"hidden"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Prodcut ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${AllProduct}">
                                        <tr>
                                            <td>${x.productId}</td>
                                            <td>${x.name}</td>
                                            <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"/></td>
                                            <td>${x.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${not empty SearchProID}">
                            <p style="color: green;" ${param.btnProductSubmit != null ? "" :"hidden"}>RESULT</p>
                            <table class="table table-hover productinshop"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Prodcut ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${SearchProID}">
                                        <tr>
                                            <td>${x.productId}</td>
                                            <td>${x.name}</td>
                                            <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"/></td>
                                            <td>${x.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${not empty SearchPrice}">
                            <p style="color: green;" ${param.btnProductSubmit != null ? "" :"hidden"}>RESULT</p>
                            <table class="table table-hover productinshop"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Prodcut ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${SearchPrice}">
                                        <tr>
                                            <td>${x.productId}</td>
                                            <td>${x.name}</td>
                                            <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"/></td>
                                            <td>${x.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${not empty SearchOther}">
                            <p style="color: green;" ${param.btnProductSubmit != null ? "" :"hidden"}>RESULT</p>
                            <table class="table table-hover productinshop"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Prodcut ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${SearchOther}">
                                        <tr>
                                            <td>${x.productId}</td>
                                            <td>${x.name}</td>
                                            <td><img src="${pageContext.request.contextPath}/image?imgname=${x.image}" style="width: 100px;height: 100px;object-fit:cover;"/></td>
                                            <td>${x.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <!--</div>-->
                    </div>
                </div>
            </div>
            <div style="width: 15%; float: left" class="d-flex justify-content-center">
                <img src="/ProjectJavaWeb/public/images/logoright.png" style="width: 80%; height: 90%; margin-top: 50px;object-fit: contain"/>
            </div>
        </div>
    </body>
</html>
