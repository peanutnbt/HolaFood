<%-- 
    Document   : Footer
    Created on : Oct 15, 2018, 9:34:59 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div className="footer">
    <div class="footerImg"></div>
    <div class="container text-center">
        <div class="row m-3">
            <div class="col-md-7">
                <h2>HOLA FOOD</h2>
                <h3>We love food!</h3>
                <h3>We have created a food hola website.</h3>
                <br />
                <p>Được xây dựng từ giữa năm 2018 tại Hòa Lạc, Hà Nội, Food Hola là cộng đồng tin cậy cho sinh viên có thể tìm kiếm,
                    đánh giá, bình luận các địa điểm ăn uống: nhà hàng, quán ăn, cafe, bar, karaoke, tiệm bánh, khu du lịch... tại
                    Việt Nam - từ website. Tất cả thành viên từ Bắc đến Nam, Food Hola kết nối mọi sinh viên đến với các địa điểm
                    ăn uống lớn nhỏ cả đất nước. Đến thời điểm hiện tại, Food Hola với hàng chục địa điểm và hàng trăm ngàn bình
                    luận, hình ảnh tại Việt Nam, ở hầu hết miền Bắc. Food Hola là cách dễ nhất để bạn có thể tìm kiếm và lựa chọn
                    địa điểm và những món ăn tốt nhất cho mình và bạn bè.</p>

            </div>
            <div class="col-md-5 img-fluid img-thumbnail rounded float-right">
                <div>
                    <jsp:include page="mapGoogle.jsp" />
                </div>
            </div>

        </div>

        <br />
        <br />
        <h3>Thành Viên Sáng Lập</h3>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-4">
                <p class="text-center"><strong>Nguyễn Thế Công</strong></p><br />
                <img src="${pageContext.request.contextPath}/public/images/Hoang.jpg" id="Hoang" alt="" />
                <div>
                    <h4>CHIEF FINANCIAL OFFICER</h4>
                    <p>Sinh năm: 1998</p>
                    <p>Đại học FPT</p>
                </div>
            </div>
            <div class="col-sm-4">
                <p class="text-center"><strong>Nguyễn Bảo Tân</strong></p><br />
                <img src="${pageContext.request.contextPath}/public/images/Tan.jpg" id="Tan" alt="" />
                <div>
                    <h4>CHIEF PRODUCTION OFFICER</h4>
                    <p>Sinh năm: 1998</p>
                    <p>Đại học FPT</p>
                </div>
            </div>
            <div class="col-sm-4">
                <p class="text-center"><strong>Vũ Đức Thắng</strong></p><br />
                <img src="${pageContext.request.contextPath}/public/images/Thang.JPG" id="Thang" alt="" />
                <div>
                    <h4>CHIEF EXECUTIVE OFFICER</h4>
                    <p>Sinh năm: 1998</p>
                    <p>Đại học FPT</p>
                </div>
            </div>
        </div>
    </div>
    <div class="ending">
        <p>Hola Food Made By <a href="https://www.holafood.com">www.holafood.com</a></p>
    </div>
</div>
