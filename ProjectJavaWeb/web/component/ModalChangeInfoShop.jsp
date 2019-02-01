<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade bd-example-modal-lg" id="collapseUpdateInfoShop" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >
            <div class="modal-header  d-flex justify-content-center ">
                <h3 class="modal-title " id="collapseUpdateInfoShopLabel">Thay đổi thông tin <span class="text-danger">CỬA HÀNG</span></h3>
            </div>
            <div class="modal-body">
                <form class="form" action="/ProjectJavaWeb/updateshop" method="Post">
                    <input type="text" name="shopId" value="${param.shopId}" hidden="true"/>
                    <div class="form-group">
                        <label for="newShopName" class="text-black">Tên cửa hàng</label><br>
                        <input type="text" name="shopName" maxlength="20" id="newShopName"  class="form-control newShopNameClass" autocomplete="off" required="required">
                    </div>
                    <div class="form-group">
                        <label for="newShopDescription" class="text-black">Miêu tả</label><br>
                        <input type="text" maxlength="200" name="shopDescription" id="newShopDescription"  class="form-control newShopDescriptionClass" autocomplete="off" required="required" placeholder="Giới thiệu về cửa hàng">
                    </div>
                    <div class="form-group">
                        <label for="customRadioInline1" class="text-black">Trạng thái</label><br>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline1" name="shopStatus" class="custom-control-input openShop" value="1">
                            <label class="custom-control-label " for="customRadioInline1">Mở cửa</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline2" name="shopStatus" class="custom-control-input closeShop" value="0">
                            <label class="custom-control-label " for="customRadioInline2">Đóng cửa</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <input style="width: 50%" type="submit" name="updateShop" class="btn btn-info btn-md" value="Lưu thay đổi">
                        <button style="width: 49%" type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
