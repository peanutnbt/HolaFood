<%-- 
    Document   : Home
    Created on : Oct 15, 2018, 8:34:34 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HolaFood</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">            
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="/component/Menu.jsp"/>
        <jsp:include page="/component/Banner.jsp"/>

        <div class="container " style="margin-top: 20px">
            <div class="menuFilter">
                <ul>
                    <li class="active menuFilterBtn" id="newestShopsBtn" data-btn="newest" onclick="menuFilter(this)">Ngày tạo (Cũ nhất)</li>
                    <li class="menuFilterBtn" id="oldestShopsBtn" data-btn="oldest" onclick="menuFilter(this)">Ngày tạo (Gần nhất)</li>
                </ul>
            </div>
            <div class="row mb-3" id="shops">
                <c:forEach var="x" items="${shops}">
                    <c:if test="${x.openOrClose==true}">
                        <div class="col-lg-3 portfolio-item mb-3 oneShop">
                            <c:url var="shopdetail" value="/shop">
                                <c:param name="shopId" value="${x.shopId}"></c:param>
                                <c:param name="userId" value="${x.userId}"></c:param>
                            </c:url>
                            <div class="card h-100 cardShop" onclick="window.location.href = '${shopdetail}';" style="cursor: pointer">
                                <div class="card-body">
                                    <c:if test="${not empty x.products}">
                                        <div  class="carousel slide" id="productsShop${x.shopId}" style="height: auto">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img src="${pageContext.request.contextPath}/image?imgname=${x.products.get(0).image}" alt="Los Angeles" class="object-fit">      
                                                </div>
                                                <c:forEach var="xy" items="${x.products}" begin="1">
                                                    <div class="carousel-item ">
                                                        <img src="${pageContext.request.contextPath}/image?imgname=${xy.image}" alt="Los Angeles" class="object-fit">
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                    <h4 class="card-title">
                                        <div>${x.title}</div>
                                    </h4>
                                    <p class="card-text">${x.description}</p>
                                </div>
                            </div>
                            <a class="carousel-control-prev" onC href="#productsShop${x.shopId}" data-slide="prev" style="position: absolute;top: 27%; left: 10%;">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#productsShop${x.shopId}" data-slide="next" style="position: absolute;top: 27%; right: 10%;">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="row d-flex justify-content-center">
                <div id="loadMore" page="1" pageSize="4">XEM THÊM</div>
            </div>
        </div>
        <jsp:include page="/component/Footer.jsp"/>


        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function menuFilter(e){
                $('#shops').css("opacity",0);
                $('#shops').css("transition","0s");
                $('#shops').css("height","428px");
                $("#loadMore").attr("page",1);
                $("#loadMore").show();
                $('#shops').html("");
                if(e.getAttribute("data-btn")=="oldest"){
                    $('#oldestShopsBtn').addClass("active");
                    $('#newestShopsBtn').removeClass("active");
                }
                else{
                    $('#newestShopsBtn').addClass("active");
                    $('#oldestShopsBtn').removeClass("active");
                }
                $.ajax({
                    url: '${pageContext.request.contextPath}' + '/shops',
                    type: 'get',
                    data: {
                        page: parseInt($("#loadMore").attr("page")),
                        pageSize: parseInt($("#loadMore").attr("pageSize")),
                        filter:e.getAttribute("data-btn")
                    },
                    success: function (data) {
                        dataFinal = JSON.parse(data)
                        for (var i = 0; i < dataFinal.shops.length; i++) {
                            if (dataFinal.shops[i].openOrClose == true) {
                                $('#shops').append(function () {
                                    var html = `
                                        <div class="col-lg-3 portfolio-item mb-3 ">
                                                <div class="card h-100 cardShop" onclick="window.location.href = '/ProjectJavaWeb/shop?shopId=` + dataFinal.shops[i].shopid + "&userId=" + dataFinal.shops[i].userid + `';" >
                                                    <div class="card-body">`;

                                    if (dataFinal.shops[i].products.length > 0) {
                                        html += `
                                        <div  class="carousel slide" id="productsShop`+dataFinal.shops[i].shopid+`" style="height: auto">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img src="${pageContext.request.contextPath}/image?imgname=` + dataFinal.shops[i].products[0].image + `" alt="Los Angeles" class="object-fit">      
                                                </div>
                                        `;
                                        for (var j = 1; j < dataFinal.shops[i].products.length; j++) {
                                            html += `
                                             <div class="carousel-item ">
                                                        <img src="${pageContext.request.contextPath}/image?imgname=` + dataFinal.shops[i].products[j].image + `" alt="Los Angeles" class="object-fit">
                                            </div>
                                            `;
                                        }
                                        html += `
                                            </div>
                                        </div>
                                        `;
                                    }
                                    html += `
                                                        <h4 class="card-title">
                                                            <div>` + dataFinal.shops[i].title + `</div>
                                                        </h4>
                                                        <p class="card-text">` + dataFinal.shops[i].description + `</p>
                                                    </div>
                                                </div>
                                                <a class="carousel-control-prev" onC href="#productsShop`+dataFinal.shops[i].shopid+`" data-slide="prev" style="position: absolute;top: 27%; left: 10%;">
                                                    <span class="carousel-control-prev-icon"></span>
                                                </a>
                                                <a class="carousel-control-next" href="#productsShop`+dataFinal.shops[i].shopid+`" data-slide="next" style="position: absolute;top: 27%; right: 10%;">
                                                    <span class="carousel-control-next-icon"></span>
                                                </a>
                                        </div>
                                    `;

                                    return html;
                                });
                            }
                        }
                        setTimeout(function(){ 
                            $('#shops').css("transition",".2s");
                            $('#shops').css("opacity",1);
                            $('#shops').css("height","auto");
                        },200);
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        </script>
        
        <script>
            $('#loadMore').click(() => {
//                alert(parseInt($("#loadMore").attr("data"))+1)
                $.ajax({
                    url: '${pageContext.request.contextPath}' + '/shops',
                    type: 'get',
                    data: {
                        page: parseInt($("#loadMore").attr("page")) + 1,
                        pageSize: parseInt($("#loadMore").attr("pageSize")),
                        filter:$( "#oldestShopsBtn" ).hasClass( "active" )?"oldest":"newest"
                    },
                    success: function (data) {
                        dataFinal = JSON.parse(data)
                        for (var i = 0; i < dataFinal.shops.length; i++) {
                            if (dataFinal.shops[i].openOrClose == true) {
                                $('#shops').append(function () {
                                    var html = `
                                        <div class="col-lg-3 portfolio-item mb-3 ">
                                                <div class="card h-100 cardShop" onclick="window.location.href = '/ProjectJavaWeb/shop?shopId=` + dataFinal.shops[i].shopid + "&userId=" + dataFinal.shops[i].userid + `';" >
                                                    <div class="card-body">`;

                                    if (dataFinal.shops[i].products.length > 0) {
                                        html += `
                                        <div  class="carousel slide" id="productsShop`+dataFinal.shops[i].shopid+`" style="height: auto">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img src="${pageContext.request.contextPath}/image?imgname=` + dataFinal.shops[i].products[0].image + `" alt="Los Angeles" class="object-fit">      
                                                </div>
                                        `;
                                        for (var j = 1; j < dataFinal.shops[i].products.length; j++) {
                                            html += `
                                             <div class="carousel-item ">
                                                        <img src="${pageContext.request.contextPath}/image?imgname=` + dataFinal.shops[i].products[j].image + `" alt="Los Angeles" class="object-fit">
                                            </div>
                                            `;
                                        }
                                        html += `
                                            </div>
                                        </div>
                                        `;
                                    }
                                    html += `
                                                        <h4 class="card-title">
                                                            <div>` + dataFinal.shops[i].title + `</div>
                                                        </h4>
                                                        <p class="card-text">` + dataFinal.shops[i].description + `</p>
                                                    </div>
                                                </div>
                                                <a class="carousel-control-prev" onC href="#productsShop`+dataFinal.shops[i].shopid+`" data-slide="prev" style="position: absolute;top: 27%; left: 10%;">
                                                    <span class="carousel-control-prev-icon"></span>
                                                </a>
                                                <a class="carousel-control-next" href="#productsShop`+dataFinal.shops[i].shopid+`" data-slide="next" style="position: absolute;top: 27%; right: 10%;">
                                                    <span class="carousel-control-next-icon"></span>
                                                </a>
                                        </div>
                                    `;

                                    return html;
                                });
                            }
                        }
                        $("#loadMore").attr("page", parseInt($("#loadMore").attr("page")) + 1);
                        if (dataFinal.shops.length < parseInt($("#loadMore").attr("pageSize"))) {
                            $("#loadMore").hide();
                        }
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            })
        </script>
    </body>
</html>
