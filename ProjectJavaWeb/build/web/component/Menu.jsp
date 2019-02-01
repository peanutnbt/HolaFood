<%-- 
    Document   : menu
    Created on : Oct 15, 2018, 8:37:13 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div>
    <nav class='navbar header fixed-top navber-expland-lg navbar-light' style="top:2px">
        <div class='container' >
            <div class='col-4'>
                <div class='input-group mt-3'>
                    <p style="width: 100%;color:#D41816;font-size: 15px;font-weight: 700;" >Hotline: 0123456789</p>
                    <p style="width: 100%;color:#D41816;font-size: 15px;font-weight: 700;">Địa chỉ: Thúi sáu mắng</p>
                </div> 
            </div>
            <div class='col-4 d-flex justify-content-center'>
                <div class='navbar-brand' href='#' style="margin: 0!important">
                    <a href="${pageContext.request.contextPath}/home" class="d-flex justify-content-center">
                        <span ><img src="${pageContext.request.contextPath}/public/images/logo.png" class='img-logo' alt='logo' /></span>
                    </a>
                </div> 
            </div>
            <c:if test="${ empty sessionScope.user}">
                <div class='col-4'>
                    <div class="float-right">
                        <a href="${pageContext.request.contextPath}/login" class="signinBtn">Sign in</a> 
                        or
                        <a href="${pageContext.request.contextPath}/signup" class="signupBtn">Sign up</a> 
                    </div>
                </div>   
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <div class='col-4 profile'>
                    <button type="button" class="btn btn-primary profileSum" data-toggle="collapse" data-target="#collapseExample">
                        <span class="user-avatar pull-left" style="margin-right:8px;">
                            <img src="${pageContext.request.contextPath}/image?imgname=${sessionScope.user.avatarUrl}" class="img-responsive img-circle"   width="30px" height="30px">
                        </span>
                        <span class="user-name">
                            ${sessionScope.user.name}
                        </span>
                    </button>
                    <div class="collapse" id="collapseExample">
                        <ul>
                            <li><a href="#" class="btn btn-default btn-xs" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-upload"></i> Tạo cửa hàng</a></li>
                            <li><a href="#" class="btn btn-default btn-xs"><i class="fas fa-question-circle"></i> Help!</a></li> 
                                <c:if test="${sessionScope.user.role==0}">
                                <li><a href="${pageContext.request.contextPath}/dashboard" class="btn btn-default btn-xs"><i class="fas fa-chart-line"></i> Dashboard!</a></li>  
                                </c:if>
                            <hr>
                            <c:url var="allProduct" value="/userproduct">
                                <c:param name="userId" value="${sessionScope.user.userId}"></c:param>
                            </c:url>
                            <li><a href="${allProduct}" class="btn btn-default btn-sm"><i class="fa fa-unlock-alt" aria-hidden="true"></i> Profile</a></li>    
                            <li><a href="/ProjectJavaWeb/logout" class="btn btn-default btn-sm pull-right"><i class="fa fa-power-off" aria-hidden="true"></i> Sign Out</a></li>
                        </ul>
                    </div>
                    <a href="${pageContext.request.contextPath}/container/user/checkout.jsp" class="btn btn-danger cartButton"><i class="fas fa-shopping-cart"></i></a>
                </div>
            </c:if>
        </div>
    </nav>
    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header  d-flex justify-content-center ">
                    <h3 class="modal-title " id="exampleModalLabel">Tạo cửa hàng mới</h3>
                </div>
                <div class="modal-body">
                    <form class="form" action="/ProjectJavaWeb/shop" method="Post">
                        <div class="form-group">
                            <label for="newShopName" class="text-black">Tên cửa hàng</label><br>
                            <input type="text" maxlength="20" name="newShopName" id="newShopName"  class="form-control" autocomplete="off" required="required" placeholder="Cơm sườn">
                        </div>
                        <div class="form-group">
                            <label for="newShopDescription" class="text-black">Miêu tả</label><br>
                            <input type="text" name="newShopDescription" id="newShopDescription" maxlength="200"  class="form-control" autocomplete="off" required="required" placeholder="Giới thiệu về cửa hàng">
                        </div>
                        <div class="form-group">
                            <input style="width: 50%" type="submit" name="newShop" class="btn btn-info btn-md" value="Tạo cửa hàng">
                            <button style="width: 49%" type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</div>
