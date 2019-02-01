/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import entity.CartItem;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Cart {
    //List of cartItem

    private List<CartItem> items;
    private List<Integer> shopIds;

    public Cart() {
        items = new ArrayList<>();
        shopIds = new ArrayList<>();
    }

    //addnew
    public void addCartItem(CartItem ci) {
        boolean kt = false;
        for (Integer x : shopIds) {
            if (x == ci.getShopId()) {
                kt = true;
            }
        }
        if (!kt) {
            shopIds.add(ci.getShopId());
        }
        for (CartItem c : items) {
            if (c.getId() == ci.getId()
                    && c.getQuantity() == ci.getQuantity()) {
                return;
            }
            if (c.getId() == ci.getId()
                    && c.getQuantity() != ci.getQuantity()) {
                c.setQuantity(ci.getQuantity());
                return;
            }
        }
        items.add(ci);
    }

    public List<CartItem> getItems() {
        return items;
    }

    //total amount of a cart
    public double getTotal() {
        double total = 0;
        for (CartItem c : items) {
                total += c.getPrice() * c.getQuantity();
        }
        return total;
    }

    //remove
    public void removeCartItem(int id) {
        boolean check = false;
        int shopId = 0;
        //xoa bo san pham productId
        for (CartItem c : items) {
            if (c.getId() == id) {
                //lay shopId cua san pham productId
                shopId = c.getShopId();
                items.remove(c);
                break;
            }
        }
        //kiem tra neu con san pham cua ShopId, neu khong con san pham nao thi xoa bo shop trong session
        if (items.size() == 0) {
            shopIds.remove(0);
        } else {
            for (CartItem c : items) {
                if (c.getShopId() == shopId) {
                    check = true;
                }
            }
            if (!check) {
                shopIds.remove((Integer)shopId);
            }
        }
        

    }

    //update quantity
    public List<Integer> getShopIds() {
        return shopIds;
    }

    public void setShopIds(List<Integer> shopIds) {
        this.shopIds = shopIds;
    }

}
