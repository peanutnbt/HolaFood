<%-- 
    Document   : invoicelines
    Created on : Oct 17, 2018, 9:00:40 PM
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
    <body style="background-color: #ededed" class="bodyInvoiceLine">
        <div>
            <div style="width: 15%; float: left;">
                 <img src="/ProjectJavaWeb/public/images/logoleft.png" style="width: 80%; height: 90%; margin-top: 50px;object-fit: contain"/>
            </div>
            <div class="pane" style="width: 70%; height: 65%; background-color: white; margin: auto; float: left">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="navbar-brand d-flex justify-content-center" href="${pageContext.request.contextPath}/Dashboard" style="width: 100%"><img src="/ProjectJavaWeb/public/images/logo.png" style="width: 100%;height: 100px;object-fit: contain" id="logo" alt="logo"></a>
                    </div>
                    <div class="modal-body">
                        <h5 class="modal-title" id="exampleModalLabel">Details Invoice Line</h5>
                        <form class="form-inline my-2 my-lg-0 mr-auto" action="searchinvoiceline" method="post">
                            <input type="hidden" value="${INVOICEID}" name="INVOICEID"/>
                            <input class="form-control mr-sm-2" type="search" name="searchInvoiceLine" placeholder="Search (please select type of search)" aria-label="Search" style="width: 252px; font-size: 14" value="${param.searchInvoiceLine}">
                            <select class="form-control mr-sm-2" name="selectInvoiceLine">
                                <option value="productID" ${param.selectInvoiceLine == "productID" ? "selected" :""}>By productID</option>
                                <option value="Quatity" ${param.selectInvoiceLine == "Quatity" ? "selected" :""}>By Quatity</option>
                                <option value="UnitPrice" ${param.selectInvoiceLine == "UnitPrice" ? "selected" :""}>By UnitPrice</option>
                                <option value="Note" ${param.selectInvoiceLine == "Note" ? "selected" :""}>By Note</option>
                            </select>
                            <button class="btn btn-success my-2 mr-sm-2 my-sm-0" type="submit" name="btnInvoiceLineSubmit">Search</button>
                        </form>
                        <p style="color: red">&ensp; ${errorInvoiceLine}</p>
                        <hr/>
                        <table class="table table-hover invoiceline" ${param.btnInvoiceLineSubmit == null ? "":"hidden"}>
                            <thead>
                                <tr class="table-success">
                                    <th scope="col">Product ID</th>
                                    <th scope="col">Quatity</th>
                                    <th scope="col">Unit Price</th>
                                    <th scope="col">Note</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="x" items="${InvoiceLines}">
                                    <tr>
                                        <td>${x.productID}</td>
                                        <td>${x.quatity}</td>
                                        <td>${x.unitprice}</td>
                                        <td>${x.note}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${empty SearchNote and empty SearchOther}">
                            <p style="color: red" ${param.btnInvoiceLineSubmit != null ? "" :"hidden"}>Cannot found, please search again !!!</p>
                            <p style="color: green;" ${param.btnInvoiceLineSubmit != null ? "" :"hidden"}>ALL RECORD INVOICELINE</p>
                            <hr/>
                            <table class="table table-hover invoiceline" ${param.btnInvoiceLineSubmit != null ? "":"hidden"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Product ID</th>
                                        <th scope="col">Quatity</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Note</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${AllProduct}">
                                        <tr>
                                            <td>${x.productID}</td>
                                            <td>${x.quatity}</td>
                                            <td>${x.unitprice}</td>
                                            <td>${x.note}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${not empty SearchNote}">
                            <p style="color: green;" ${param.btnInvoiceLineSubmit != null ? "" :"hidden"}>RESULT</p>
                            <table class="table table-hover invoiceline" ${param.btnInvoiceLineSubmit != null ? "":"hidden"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Product ID</th>
                                        <th scope="col">Quatity</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Note</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${SearchNote}">
                                        <tr>
                                            <td>${x.productID}</td>
                                            <td>${x.quatity}</td>
                                            <td>${x.unitprice}</td>
                                            <td>${x.note}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${not empty SearchOther}">
                            <p style="color: green;" ${param.btnInvoiceLineSubmit != null ? "" :"hidden"}>RESULT</p>
                            <table class="table table-hover invoiceline" ${param.btnInvoiceLineSubmit != null ? "":"hidden"}>
                                <thead>
                                    <tr class="table-success">
                                        <th scope="col">Product ID</th>
                                        <th scope="col">Quatity</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Note</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="x" items="${SearchOther}">
                                        <tr>
                                            <td>${x.productID}</td>
                                            <td>${x.quatity}</td>
                                            <td>${x.unitprice}</td>
                                            <td>${x.note}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
            <div style="width: 15%; float: left">
                <img src="/ProjectJavaWeb/public/images/logoright.png" style="width: 80%; height: 90%; margin-top: 50px;object-fit: contain"/>
            </div>
        </div>
    </body>
</html>
