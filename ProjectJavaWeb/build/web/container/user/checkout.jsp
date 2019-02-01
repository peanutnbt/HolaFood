<%--
   Document   : cart
   Created on : Oct 1, 2018, 10:44:39 AM
   Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>

    </head>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">            
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <body>
        <jsp:include page="/component/Menu.jsp"/>
        <div>
            <div class="container cartContent" style="margin-top:200px">
                <div class="alert alert-danger" style="display:none" role="alert" id="alert">
                    Your information is not enough!!
                </div>
                <c:if test="${empty sessionScope.cart.shopIds}">
                    <div class="text-center">
                        <div class="alert alert-warning" style="display:block" role="alert" id="alert">
                            <h2>You have no Invoice</h2>
                        </div>

                        <a href="${pageContext.request.contextPath}/home"><button class="btn btn-info">Click here to shopping!</button></a>
                    </div>
                </c:if>
                <div class="row">
                    <c:forEach var='shop' items="${sessionScope.cart.shopIds}">   
                        <div class="foodRay col-md-12 mt-3">
                            <div class="row">
                                <div class="oneFoodInCart">
                                    <div class="oneFood food1" style="font-family:cursive">
                                        <h2>Shop ${shop}</h2>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="x" items="${sessionScope.cart.items}">
                            <c:if test = "${x.shopId == shop}">
                                <div class="col-md-8 foodPay">
                                    <div class="row">

                                        <div class="oneFoodInCart w-100 m-3">
                                            <div class="oneFood food">

                                                <div class="foodImg">
                                                    <img src="${pageContext.request.contextPath}/image?imgname=${x.image}" />
                                                    <div style="opacity: 0" id="image${x.id}">${x.image}</div>
                                                    <div style="opacity: 0" id="shop${x.id}">${shop}</div>
                                                </div>
                                                <div class="foodName" id="name${x.id}" data="${x.name}">${x.name}</div>
                                                <input type="number" name="${x.id}" onChange="
                                                        pushProductSession()" value="${x.quantity}" class="slsp pushProduct" id="${x.id}"/>
                                                <div class="foodPrice mt-5" id="price${x.id}">${x.price}</div>
                                            </div>
                                            <form class="formRemoveProduct" method="POST">
                                                <button type="submit" class="btn btn-danger mt-3 removeItem"   data-id="${x.id}"><i class="fas fa-trash-alt"></i> Remove</button>
                                            </form>

                                            <hr />
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test = "${not empty shop}">
                            <div class="col-md-4 payment">
                                <div class="card text-center ">
                                    <div class="card-body">
                                        <h4 class="card-title">Thông tin đơn hàng</h4>
                                        <p class="card-text">Tạm tính</p>
                                        <div class="totalPrice" >
                                            <c:set var = "total" scope = "session" value = "0"/>
                                            <c:forEach var="x" items="${sessionScope.cart.items}">
                                                <c:if test = "${x.shopId == shop}">
                                                    <c:set var = "total" scope = "session" value = "${total + x.price*x.quantity}"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:out value = "${total}"/> Đ
                                        </div>
                                        <div class="row" >
                                            <label class="col-4">Nhập địa chỉ:</label>
                                            <input required  maxlength="20" class="inputAddress col-8" type="text" placeholder="Địa chỉ" id="address${shop}"/>
                                        </div>
                                        <div class="row" >
                                            <label class="col-4" >Số điện thoại:</label>
                                            <input required maxlength="20" class="inputPhone col-8" type="number" placeholder="SĐT" id="phone${shop}" />
                                        </div>
                                        <input class="btn btn-warning datHang" data-id="${shop}" value="Đặt Hàng" type="submit"/>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
                                                    var orderList = [{}];
                                                    var n = 0;
            <c:forEach var="x" items="${sessionScope.cart.items}">
                                                    orderList[n] = {id: "${x.id}", name: "${x.name}", quantity:${x.quantity}, price:${x.price}, image: "${x.image}", shopId:${x.shopId}};
                                                    n++;
            </c:forEach>
                                                    for (let i = 0; i < n; i++) {
                                                        console.log(orderList[i].id, orderList[i].name, orderList[i].quantity, orderList[i].price);

                                                    }

                                                    $(".removeItem").click((e) => {
                                                        var id = e.target.getAttribute("data-id");
                                                        console.log(id);
                                                        $(".formRemoveProduct").submit(() => {
                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}' + '/removeproduct',
                                                                type: 'POST',
                                                                data: {
                                                                    productId: id
                                                                },
                                                                success: function (data) {
                                                                    console.log("DeleteProduct successfully");
                                                                },
                                                                error: function (err) {
                                                                    console.log(err);
                                                                }
                                                            });
                                                        });
                                                    });
                                                    var pushProductSession = function () {
                                                        $(".pushProduct").click((e) => {
                                                            var id = e.target.getAttribute("id");
                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}' + '/PushProductSessionServlet',
                                                                type: 'POST',
                                                                data: {
                                                                    productId: id,
                                                                    name: $("#name" + id).text(),
                                                                    quantity: document.getElementById(id).value,
                                                                    price: $("#price" + id).text(),
                                                                    image: $("#image" + id).text(),
                                                                    shopId: $("#shop" + id).text()
                                                                },
                                                                success: function (data) {
                                                                    console.log("update successfully");
                                                                    window.location.href = "${pageContext.request.contextPath}/container/user/checkout.jsp";
                                                                },
                                                                error: function (err) {
                                                                    console.log(err);
                                                                }
                                                            });
                                                        });
                                                    };


                                                    $(".datHang").click((e) => {
                                                    e.preventDefault();
                                                        var id = e.target.getAttribute("data-id");
                                                        var orderShop = []; //Order cua Shop
                                                        var n = 0;
                                                        for (let i = 0; i < orderList.length; i++) {
                                                            if (orderList[i].shopId == id) {
                                                                orderShop[n] = orderList[i];
                                                                n++;
                                                            }
                                                        }
                                                        if (document.getElementById("address" + id).value != "" && document.getElementById("phone" + id).value != "") {
                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}' + '/ThanhToanServlet',
                                                                type: 'POST',
                                                                dataType: 'json',
                                                                data: {
                                                                    array: JSON.stringify(orderShop),
                                                                    userId: ${sessionScope.user.userId},
                                                                    address: document.getElementById("address" + id).value,
                                                                    phone: document.getElementById("phone" + id).value
                                                                }, //stringify is important
                                                                success: function () {
                                                                    console.log("send array successfully");
                                                                    window.location.href = "${pageContext.request.contextPath}/container/user/Reconfirm.jsp";
                                                                },
                                                                error: function (err) {
                                                                    console.log(err);
                                                                    window.location.href = "${pageContext.request.contextPath}/container/user/Reconfirm.jsp";
                                                                }
                                                            });
                                                        } else {
                                                            $("#alert").css("display", "block");
                                                            setTimeout(function () {
                                                                $("#alert").css("display", "none");
                                                            }, 3000);
                                                        }
                                                    });


        </script>

    </body>
</html>
