/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class InvoiceShop {
    private int invoiceId;
    private int shopId;
    private int userId;
    private String userName;
    private String productName;
    private int quatity;
    private double unitPrice;
    private String note;
    private String address;
    private String phoneNumber;
    private Date orderTime;
    
    public InvoiceShop() {
    }

    public InvoiceShop(int invoiceId,int shopId, int userId, String userName, String productName, int quantity, double unitPrice, String note, String address, String phoneNumber, Date orderTime) {
        this.invoiceId=invoiceId;
        this.shopId = shopId;
        this.userId = userId;
        this.userName = userName;
        this.productName = productName;
        this.quatity = quantity;
        this.unitPrice = unitPrice;
        this.note = note;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.orderTime = orderTime;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }
    
    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quantity) {
        this.quatity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String Address) {
        this.address = Address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }
    
    
    
}
