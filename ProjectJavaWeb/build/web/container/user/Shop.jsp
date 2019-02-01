<%-- 
    Document   : Shop
    Created on : Oct 18, 2018, 1:10:16 AM
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="/component/Menu.jsp"/>
        <div>
            <div class="container-fluid details pb-3 pt-3">
                <!--<<<<<<< HEAD-->
                <div class="container detailsStatus mt-3 ">
                    <div class="alert alert-success addCartSuccess"  role="alert" id="alert">
                        Adding Successfully!!
                    </div>
                    <c:if test="${user.userId==sessionScope.user.userId}">
                        <div class="row mb-3 d-flex justify-content-center">
                            <a href="${pageContext.request.contextPath}/shopmanager?shopId=${shop.shopId}">
                                <button class="btn success buttonShopUser" style="text-transform: uppercase">Quản lý shop</button>
                            </a>
                        </div>
                    </c:if>
                    <div class="row">
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="avatarHost ">
                                        <c:url var="allProduct" value="/userproduct">
                                            <c:param name="userId" value="${user.userId}"></c:param>
                                        </c:url>
                                        <a href="${allProduct}"><img src="${pageContext.request.contextPath}/image?imgname=${user.avatarUrl}"/></a>
                                    </div>
                                </div>
                                <div class="mainStatus col-md-10">
                                    <a href="${allProduct}"><h4>
                                            ${user.name}
                                        </h4>
                                    </a>
                                    <h5>${shop.title}</h5>
                                    <p>${shop.description}</p>
                                    <div class="foodShop">
                                        <c:forEach var="x" items="${shop.products}">
                                            <c:if test="${x.show==true}">
                                                <div  class="oneFood food mb-3">
                                                    <div class="foodImg">
                                                        <img src="${pageContext.request.contextPath}/image?imgname=${x.image}" />
                                                    </div>
                                                    <div class="foodName">${x.name}</div>
                                                    <input type="number" name=""  value="1" min=0 max=100 class="slsp" id="value${x.productId}"/>
                                                    <div class="foodPrice">${x.price}</div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <c:if test="${empty sessionScope.user}">
                                        <input readonly class="btn btn-danger addProductSession" style=" width: 100%" value="Thêm vào giỏ hàng"/>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.user}">
                                        <c:if test="${user.userId==sessionScope.user.userId}">
                                            <a  class="col-md-3" style= "padding: 0;pointer-events: none;cursor: default;">
                                                <div class="btn btn-danger" style=" width: 100%" >Thêm vào giỏ hàng</div>
                                            </a>
                                        </c:if>
                                        <c:if test="${user.userId!=sessionScope.user.userId}">
                                            <input readonly class="btn btn-danger addProductSession" style=" width: 100%" value="Thêm vào giỏ hàng"/>
                                        </c:if>
                                    </c:if>
                                    <div class="expressBar mt-3">
                                        <i class="far fa-heart"></i>
                                        <i class="far fa-comment"></i>
                                    </div>     
                                    <div id="demo" class="carousel slide" data-ride="carousel" data-interval="2000" style="height: auto">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <c:if test="${not empty shop.products}">
                                                    <img src="${pageContext.request.contextPath}/image?imgname=${shop.products.get(0).image}" alt="Los Angeles" class="object-fit" style="height: 300px!important">      
                                                </c:if>
                                            </div>
                                            <c:forEach var="x" items="${shop.products}" begin="1">
                                                <div class="carousel-item ">
                                                    <img src="${pageContext.request.contextPath}/image?imgname=${x.image}" alt="Los Angeles" class="object-fit" style="height: 300px!important">
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                            <span class="carousel-control-prev-icon"></span>
                                        </a>
                                        <a class="carousel-control-next" href="#demo" data-slide="next">
                                            <span class="carousel-control-next-icon"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 Comment">
                            <div class="CommentShow">
                                <c:forEach var="x" items="${comments}">
                                    <c:url var="profile" value="/userproduct">
                                        <c:param name="userId" value="${x.user.userId}"></c:param>
                                    </c:url>
                                    <div  class="oneComment row">
                                        <div class="col-md-1">
                                            <div class="avatarUserComment">
                                                <a href="${profile}"><img src="${pageContext.request.contextPath}/image?imgname=${x.user.avatarUrl}"/></a>
                                            </div>
                                        </div>
                                        <div class="col-md-11">

                                            <a class="userNameComment" href="${profile}">${x.user.name}</a>
                                            <div class="userComment">${x.content}</div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="oneComment  presentUserCM row">
                                <div class="col-md-1 avatarUserCol">
                                    <div class="avatarUserComment avatarUser">
                                        <c:if test="${not empty sessionScope.user.avatarUrl}">
                                            <img src="${pageContext.request.contextPath}/image?imgname=${sessionScope.user.avatarUrl}" />
                                        </c:if>
                                        <c:if test="${empty sessionScope.user.avatarUrl}">
                                            <img src="${pageContext.request.contextPath}/public/images/AnonymousAvatar.png" />
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-md-11">
                                    <form class="formComment">
                                        <input type="text" cols=30 rows=6 class="userInputCM" maxlength="50"  placeholder="Thêm bình luận"  />
                                        <div class="comment-arrow"></div>
                                        <input style=" margin-top:  20px " type="submit" class="addComment" value="Bình luận" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container related mb-3">
                <div class="container">
                    <h5>BÀI VIẾT KHÁC</h5>
                    <div class="row">
                        <c:forEach var="x" items="${shops}" end="3">
                            <c:if test="${x.openOrClose==true}">
                                <div class="col-lg-3 portfolio-item mb-3 ">
                                    <c:url var="shopdetail" value="/shop" >
                                        <c:param name="shopId" value="${x.shopId}"></c:param>
                                        <c:param name="userId" value="${x.userId}"></c:param>
                                    </c:url>
                                    <div class="card h-100 cardShop" onclick="window.location.href = '${shopdetail}';" style="cursor: pointer">
                                        <div class="card-body">
                                            <c:if test="${not empty x.products}">
                                                <div  class="carousel slide" id="productsShop${x.shopId}" style="height: auto">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <img src="${pageContext.request.contextPath}/image?imgname=${x.products.get(0).image}" alt="Los Angeles" class="object-fit" style="height :150px!important" >      
                                                        </div>
                                                        <c:forEach var="xy" items="${x.products}" begin="1">
                                                            <div class="carousel-item ">
                                                                <img src="${pageContext.request.contextPath}/image?imgname=${xy.image}" alt="Los Angeles" class="object-fit" style="height :150px!important">
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <h4 class="card-title">
                                                <div>${x.title}</div>
                                            </h4>
                                            <p class="card-text" style="font-size: 12px;">${x.description}</p>
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#productsShop${x.shopId}" data-slide="prev" style="left: 10%;z-index: 3000;top:22%">
                                        <span class="carousel-control-prev-icon"></span>
                                    </a>
                                    <a class="carousel-control-next" href="#productsShop${x.shopId}" data-slide="next"  style="right: 10%;z-index: 3000;top:22%">
                                        <span class="carousel-control-next-icon"></span>
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div >
        <div id="myModalLogin" class="modalLogin">

            <!-- Modal content -->
            <div class="modalLogin-content">
                <div class="modalLogin-header">
                    <h4>Chào mừng bạn! Hãy đăng nhập để tiếp tục</h4>
                </div>
                <hr/>
                <div class="modalLogin-body">
                    <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    <a href="${pageContext.request.contextPath}/signup">Đăng Ký</a>
                    <p class="skipShopping close">Tiếp tục xem</p>
                </div>
            </div>

        </div>
        <div className="footer">
            <div class="ending">
                <p>Hola Food Made By <a href="https://www.holafood.com">www.holafood.com</a></p>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
                                        document.querySelector(".userInputCM").onfocus = function () {
                                            document.querySelector(".addComment").classList.add("show")
                                        }
                                        document.querySelector(".userInputCM").onblur = function () {
                                            document.querySelector(".addComment").classList.remove("show")
                                        }
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
            var modal = document.getElementById('myModalLogin');
            var span = document.getElementsByClassName("close")[0];
            span.onclick = function () {
                modal.style.display = "none";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
            $('.addToCart').click((e) => {
                e.preventDefault();
                modal.style.display = "block";
            })
            $(".formComment").submit(function (e) {
                e.preventDefault();
                user = "${sessionScope.user}";
                if (user == "") {
                    modal.style.display = "block";
                } else {
                    $.ajax({
                        url: '${pageContext.request.contextPath}' + '/comment',
                        type: 'POST',
                        data: {
                            shopId: "${param.shopId}",
                            userId: "${sessionScope.user.userId}",
                            content: $(".userInputCM").val()
                        },
                        success: function (data) {
//                        console.log(dataFinal)
                            $(".CommentShow").append(`
                            <div  class="oneComment row">
                                <div class="col-md-1">
                                    <div class="avatarUserComment">
                                        <a href="${pageContext.request.contextPath}/userproduct?userId=${sessionScope.user.userId}"><img src="/ProjectJavaWeb/image?imgname=` + data.avatarUrl + `"/></a>
                                    </div>
                                </div>
                                <div class="col-md-11">
                                    <a href="${pageContext.request.contextPath}/userproduct?userId=${sessionScope.user.userId}" class="userNameComment">` + data.name + `</a>
                                    <span class="timeStamp"><Moment format="YYYY/MM/DD HH:mm" date={comment.createAt} /></span>
                                    <div class="userComment">` + data.content + `</div>
                                </div>
                            </div>
                        `)
                            $('.userInputCM').val("")
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                }
            });
//          setup loi login filter
            function requestUnauthorized(xhr) {
                window.location.href = xhr.getResponseHeader("Location");
            }

            (function ($) {
                $.ajaxSetup({
                    statusCode: {
                        401: requestUnauthorized,
                    }
                });
            })(window.jQuery);
//          setup loi login filter
            $(".addProductSession").click((e) => {
                console.log("Hello");
                var orderList = [{}];
                var n = 0;
                //List product
            <c:forEach var="x" items="${shop.products}">
                if (${x.show == true}) {
                    orderList[n] = {id: "${x.productId}", name: "${x.name}", quantity: document.getElementById("value" +${x.productId}).value, price: "${x.price}", image: "${x.image}", shopId: "${x.shopId}"};
                    n++;
                }
            </c:forEach>
                console.log(orderList);
                $.ajax({
                    url: '${pageContext.request.contextPath}' + '/AddProductSessionServlet',
                    type: 'POST',
//                    dataType: 'json',
                    data: {
                        array: JSON.stringify(orderList)
                    },
                    success: function (data) {
                        console.log("adding successfully");
                        $("#alert").css("display", "block");
                        $("#alert").css("opacity", "1");
                        setTimeout(function () {
                            $("#alert").css("display", "none");
                        }, 3000);

                    },
                    error: function (a, jqXHR, err) {
                        console.log(a);
                        console.log(jqXHR);
                        console.log(err);
//                        $("#alert").css("display", "block");
//                        setTimeout(function () {
//                            $("#alert").css("display", "none");
//                        }, 3000);
                    }
                })
            });



        </script>
    </body>
</html>
