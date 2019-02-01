/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin.10.12
 */
public class UserInvoice {
    private Date orderTime;
    private int quantity;
    private int unitPrice;
    private String name;
    private String image;

    public UserInvoice() {
    }

    public UserInvoice(Date orderTime, int quantity, int unitPrice, String name, String image) {
        this.orderTime = orderTime;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.name = name;
        this.image = image;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
