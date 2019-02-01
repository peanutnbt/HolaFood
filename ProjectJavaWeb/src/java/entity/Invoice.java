/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin.10.12
 */
public class Invoice {
    private int invoiceID;
    private int userID;
    private Date orderTime;
    private  String address;
    private String phone;

    public Invoice() {
    }

    public Invoice(int userID, Date orderTime, String address, String phone) {
        this.userID = userID;
        this.orderTime = orderTime;
        this.address = address;
        this.phone = phone;
    }
    
    
    
    public Invoice(int invoiceID, int userID, Date orderTime, String address, String phone) {
        this.invoiceID = invoiceID;
        this.userID = userID;
        this.orderTime = orderTime;
        this.address = address;
        this.phone = phone;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    
}
