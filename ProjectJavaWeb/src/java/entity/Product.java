/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author ASUS
 */
public class Product {
    private int productId;
    private int shopId;
    private String name;
    private String image;
    private double price;
    private boolean show;
    public Product() {
    }

    public Product(int productId, int shopId, String name, String image, double price) {
        this.productId = productId;
        this.shopId = shopId;
        this.name = name;
        this.image = image;
        this.price = price;
    }
    public Product(int productId, int shopId, String name, String image, double price,boolean  show) {
        this.productId = productId;
        this.shopId = shopId;
        this.name = name;
        this.image = image;
        this.price = price;
        this.show=show;
    }

    public boolean isShow() {
        return show;
    }

    public void setShow(boolean show) {
        this.show = show;
    }

    public Product(int shopId, String name, String image, double price) {
        this.shopId = shopId;
        this.name = name;
        this.image = image;
        this.price = price;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public int getShopId() {
        return shopId;
    }

    public String getName() {
        return name;
    }

    public String getImage() {
        return image;
    }

    public double getPrice() {
        return price;
    }
    
    
    
}
