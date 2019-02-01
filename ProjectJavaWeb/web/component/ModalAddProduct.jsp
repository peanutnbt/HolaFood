<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade bd-example-modal-lg" id="collapseAddProduct" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="padding: 20px">
            <div class="modal-header  d-flex justify-content-center ">
                <h3 class="modal-title " id="collapseAddProductLabel">Thêm <span class="text-info">SẢN PHẨM</span> </h3>
            </div>
            <div class="modal-body">
                <form class="form" action="/ProjectJavaWeb/newproduct" method="Post" enctype="multipart/form-data">
                    <input type="text" name="shopId" value="${shop.shopId}" hidden="true"/>
                    <div class="form-group">
                        <label for="newShopName" class="text-black">Tên sản phẩm</label><br>
                        <input type="text" maxlength="50" name="productName" id="newShopName"  class="form-control" autocomplete="off" required="required" placeholder="Món ăn">
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="newShopDescription" class="text-black">Đơn giá</label><br>
                                <input type="number" step="0.001" name="productPrice"  id="newShopDescription"  class="form-control" autocomplete="off" required="required" placeholder="VNĐ">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="inputImgProduct">Ảnh</label>
                                <input type="file" class="form-control-file" name="productImg" id="inputImgProduct" required="required">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input style="width: 50%" type="submit" name="newProduct" class="btn btn-info btn-md" value="Thêm sản phẩm" >
                        <button style="width: 49%" type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
