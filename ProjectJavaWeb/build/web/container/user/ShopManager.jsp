<%-- 
    Document   : ShopManager
    Created on : Oct 23, 2018, 10:40:43 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">            
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="/component/Menu.jsp"/>
        <div>
            <div class="container-fluid details pb-3 pt-3">
                <div class="container detailsStatus mt-3">
                    <div class="row">
                        <div class="col-md-12">
                            <span><em>Cửa hàng của bạn:</em></span>
                        </div>
                        <div class="col-md-9">
                            <h1 class='text-info display-3 shopTitle font-weight-bold'>${shop.title}</h1>
                            <h5 class="shopDescription">${shop.description}</h5>
                            <p >Trạng thái: 
                                <c:if test="${shop.openOrClose==true}">
                                    <span class="badge badge-info shopOpenOrClose" data-name="1">Mở cửa</span>
                                </c:if>
                                <c:if test="${shop.openOrClose==false}">
                                    <span class="badge badge-danger shopOpenOrClose" data-name="0">Đóng cửa</span>
                                </c:if>
                            </p>
                        </div>
                        <div class="col-md-3 text-right" >
                            <button class="btn danger changeInfoShop" data-toggle="modal" data-target="#collapseUpdateInfoShop">Thay đổi thông tin cửa hàng</button>
                            <button class="btn info listOrderShop" data-toggle="modal" data-target="#modalInvoiceShop">Danh sách mua hàng</button>
                        </div>
                        <div class="col-md-12 d-flex justify-content-center">
                            <a href="${pageContext.request.contextPath}/shop?shopId=${shop.shopId}&userId=${shop.userId}">
                                <button class="btn success buttonShopUser">Xem với tư cách người mua hàng</button>
                            </a>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-12 mb-3">
                            <span><em>Bạn có ${fn:length(products)} sản phẩm trong cửa hàng</em></span>
                        </div>
                        <c:forEach var="x" items="${products}">
                            <c:if test="${x.show==true}">
                                <div class="col-12" class='text-center mt-3'>
                                    <div class="img-thumbnail ml-2 mr-2 row">
                                        <div  class='mt-2 mb-2 col-sm-3'>
                                            <img class='fixed img-thumbnail product${x.productId}image' data-image="${x.image}" src="${pageContext.request.contextPath}/image?imgname=${x.image}" />
                                        </div>
                                        <div  class='mt-2 col-sm-9'>
                                            <h3><strong class="product${x.productId}name">${x.name}</strong></h3>
                                            <h6>Đơn giá: <span class='text-danger product${x.productId}price' >${x.price}</span><span class='text-primary' >VNĐ</span> / 1 sản phẩm</h6>
                                            <input name="product${x.productId}" data-id="${x.productId}" class="btn btn-warning changeProductBtn" type="button" data-toggle="modal" data-target="#collapseUpdateProduct" value="Thay đổi thông tin sản phẩm"/>
                                            <input name="product${x.productId}" type="button" data-id="${x.productId}" class="btn btn-danger removeProductBtn" value="Xóa sản phẩm" data-id="${x.productId}" data-toggle="modal" data-target="#collapseRemoveProduct"  />
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>

                    </div>
                    <div class="row mt-5 d-flex justify-content-center">
                        <button class="btn btn-danger btn-outline-danger" data-toggle="modal" data-target="#collapseAddProduct">Thêm sản phẩm mới</button>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="/component/ModalInvoiceShop.jsp"/>
        <jsp:include page="/component/ModalChangeInfoShop.jsp"/>
        <jsp:include page="/component/ModalAddProduct.jsp"/>
        <jsp:include page="/component/ModalUpdateProduct.jsp"/>
        <jsp:include page="/component/ModalRemoveProduct.jsp"/>
        <div className="footer">
            <div class="ending">
                <p>Hola Food Made By <a href="https://www.holafood.com">www.holafood.com</a></p>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/public/js/index.js"></script>
        <script>
            document.getElementsByClassName("header")[0].classList.add("headerBg")
        </script>
        <script>
            window.addEventListener("scroll", function () {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementsByClassName("header")[0].classList.add("headerBg")
                } else {
                    document.getElementsByClassName("header")[0].classList.add("headerBg");
                }
            })
        </script>
        <script>
            $(".changeInfoShop").click(() => {
                $('.newShopNameClass').val($('.shopTitle').html() + "")
                $('.newShopDescriptionClass').val($('.shopDescription').html() + "")
                console.log($('.shopOpenOrClose').attr('data-name'))
                if ($('.shopOpenOrClose').attr('data-name') == "1") {
                    $('.openShop').attr('checked', "checked")
                } else {
                    $('.closeShop').attr("checked", "checked")
                }
            })
            $('.changeProductBtn').click((e) => {
                console.log(e.target)
                $("#newProductName").val($('.' + e.target.name + 'name').html())
                $("#newProductPrice").val($('.' + e.target.name + 'price').html())
                $('.productIdInputFormUpdate').val(e.target.getAttribute("data-id"));
            })
            $('.removeProductBtn').click((e) => {
                console.log(e.target)
                $("#productNameRemove").val($('.' + e.target.name + 'name').html())
                $("#productPriceRemove").val($('.' + e.target.name + 'price').html())
                console.log($('.' + e.target.name + 'image').attr("data-image"))
                $("#productImageRemove").attr("src", "${pageContext.request.contextPath}/image?imgname=" + $('.' + e.target.name + 'image').attr("data-image"))
                $('#productIdInputFormRemove').val(e.target.getAttribute("data-id"));
            })

        </script>
    </body>
</html>
