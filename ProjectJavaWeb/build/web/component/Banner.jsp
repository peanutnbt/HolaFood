<%-- 
    Document   : Banner
    Created on : Oct 15, 2018, 9:04:53 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="demo" class="carousel slide" data-ride="carousel" data-interval="4000">

    <!-- Indicators -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- The slideshow -->
    <div class="carousel-inner">
        <div class="carousel-item active bannerImgContainer">
            <img src="${pageContext.request.contextPath}/public/images/banner1.jpg" alt="Los Angeles" width="1100" height="500">
            <div class="carousel-caption d-none d-md-block">
                <h1 style="text-transform: uppercase">We love food!</h1>
                <h3 style="text-transform: uppercase">We have created a food hola website.</h3>
            </div>
        </div>
        <div class="carousel-item bannerImgContainer">
            <img src="${pageContext.request.contextPath}/public/images/banner2.jpg" alt="Chicago" width="1100" height="500">
            <div class="carousel-caption d-none d-md-block">
                <h1 style="text-transform: uppercase">We love food!</h1>
                <h3 style="text-transform: uppercase">We have created a food hola website.</h3>
            </div>
        </div>
        <div class="carousel-item bannerImgContainer">
            <img src="${pageContext.request.contextPath}/public/images/banner3.jpg" alt="New York" width="1100" height="500">
            <div class="carousel-caption d-none d-md-block">
                <h1 style="text-transform: uppercase">We love food!</h1>
                <h3 style="text-transform: uppercase">We have created a food hola website.</h3>
            </div>
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
