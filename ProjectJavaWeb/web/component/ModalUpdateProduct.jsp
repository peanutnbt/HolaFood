<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade bd-example-modal-lg" id="collapseUpdateProduct" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="padding: 20px">
            <div class="modal-header  d-flex justify-content-center ">
                <h3 class="modal-title " id="collapseUpdateProduct">Thay đổi thông tin <span class="text-warning">SẢN PHẨM</span> </h3>
            </div>
            <div class="modal-body">
                <form class="form" action="updateproduct" method="Post" enctype="multipart/form-data">
                    <input class="productIdInputFormUpdate" type="text" name="productId" hidden="true"/>
                    <input type="text" name="shopId" value="${shop.shopId}" hidden="true"/>
                    <div class="form-group">
                        <label for="newShopName" class="text-black">Tên sản phẩm</label><br>
                        <input type="text" maxlength="50" name="productName" id="newProductName"  class="form-control" autocomplete="off" required="required">
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="newShopDescription" class="text-black">Đơn giá</label><br>
                                <input type="number"  step="0.001" name="productPrice" id="newProductPrice"  class="form-control" autocomplete="off" required="required">
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
                        <input style="width: 50%"  type="submit" name="newShop" class="btn btn-info btn-md" value="Lưu thay đổi">
                        <button style="width: 49%" type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
