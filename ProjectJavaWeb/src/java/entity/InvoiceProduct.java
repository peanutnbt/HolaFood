/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin.10.12
 */
public class InvoiceProduct {
    private int productID;
    private int shopID;
    private String name;
    private String image;
    private double price;
    private int quantity;
    private String note;
    public InvoiceProduct() {
    }

    public InvoiceProduct(int productID, int shopID, String name, String image, double price, int quantity, String note) {
        this.productID = productID;
        this.shopID = shopID;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.note = note;
    }

    

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
}
