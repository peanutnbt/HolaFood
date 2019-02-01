<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade bd-example-modal-lg" id="collapseRemoveProduct" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="padding: 20px">
            <div class="modal-header  d-flex justify-content-center ">
                <h3 class="modal-title " >Xóa <span class="text-danger">SẢN PHẨM</span> </h3>
            </div>
            <div class="modal-body">
                <form class="form" action="RemoveProductController" method="Post">
                    <input id="productIdInputFormRemove" type="text" name="productId" hidden="true"/>
                    <input type="text" name="shopId" value="${shop.shopId}" hidden="true"/>
                    <input type="text" name="abc" value="dm" hidden="true"/>
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="newShopName" class="text-black">Tên sản phẩm</label><br>
                                <input type="text" readonly name="productName" id="productNameRemove"  class="form-control" autocomplete="off" required="required">
                            </div>
                            <div class="form-group">
                                <label for="newShopDescription" class="text-black">Đơn giá</label><br>
                                <input type="number" readonly  step="0.001" name="productPrice" id="productPriceRemove"  class="form-control" autocomplete="off" required="required">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <img class='fixed img-thumbnail' id="productImageRemove" style="height: 100%"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <input style="width: 50%" type="submit" name="removeProduct" class="btn btn-info btn-md" value="Xác nhận xóa">
                        <button style="width: 49%" type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
