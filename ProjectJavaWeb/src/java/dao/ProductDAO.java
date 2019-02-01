/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import entity.InvoiceProduct;
import entity.Product;
import entity.Shop;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Vu
 */
public class ProductDAO {
    public List<Product> selectAll() throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product]";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            int shopID = rs.getInt("ShopID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            int price = rs.getInt("Price");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
    
    public List<Product> selectAllByShopID(int shopID) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where ShopID = "+shopID;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            String name = rs.getString("Name");
            String image = rs.getString("Image").trim();
            double price = rs.getDouble("Price");
            boolean  show = rs.getBoolean("show");
            products.add(new Product(productID, shopID, name, image, price,show));
        }
        rs.close();
        con.close();
        return products;
    }
    
    public List<Product> searchByProductID(int productID) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where ProductID = "+productID;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            int price = rs.getInt("Price");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
    
    public List<Product> searchByPrice(int price) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where Price = "+price;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            int shopID = rs.getInt("ShopID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
    
    public List<Product> searchByOther(String value, String coloum) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where "+coloum+" like N'%"+value+"%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            int shopID = rs.getInt("ShopID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            int price = rs.getInt("Price");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
    public List<Product> select(int shopidInput) throws Exception {
        List<Product> product = new ArrayList<>();
        String query = "select * from [Product] where shopid=?";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, shopidInput);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int productId = rs.getInt("productId");
            int shopid = rs.getInt("shopid");
            String name = rs.getString("name").trim();
            String image = rs.getString("image").trim();
            double  price = rs.getDouble("price");
            product.add(new Product(productId, shopid, name, image, price));
        }
        rs.close();
        con.close();
        return product;
    }
//<<<<<<< HEAD
    public int insert(Product product) {
        try (Connection con = new DBContext().getConnection()) {
            String sql = "INSERT INTO [Product](shopId,name,image,price) values(?,?,?,?)";
            String[] gererates = {"productId"};
            PreparedStatement psmt = con.prepareStatement(sql, gererates);
//            psmt.setInt(1, c.getId());
            psmt.setInt(1, product.getShopId());
            psmt.setString(2, product.getName());
            psmt.setString(3, product.getImage());
            psmt.setDouble(4, product.getPrice());
            psmt.executeUpdate();
            
            ResultSet rs = psmt.getGeneratedKeys();
            if (rs.next()) {
                product.setShopId(rs.getInt(1));
            }
            return 1;
        } catch (SQLException ex) {
            return -1;
        } catch (Exception e) {
            return -1;
        }
    }
    public int update(Product product) throws Exception {
        int k = 0;
        try (Connection con = new DBContext().getConnection();) {
            String sql = "UPDATE [Product] SET name=?, image=?,"
                    + "price=? WHERE productid=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, product.getName());
            psmt.setString(2, product.getImage());
            psmt.setDouble(3, product.getPrice());
            psmt.setInt(4, product.getProductId());
            psmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return k;
    }
    public int updateProductShow(boolean show,int productId) throws Exception {
        int k = 0;
        try (Connection con = new DBContext().getConnection();) {
            String sql = "UPDATE [Product] SET show=? WHERE productid=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setBoolean(1, show);
            psmt.setInt(2, productId);
            psmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return k;
    }
     public int remove(int productId) throws Exception {
        int k = 0;
        try(Connection con = new DBContext().getConnection()) {
            String sql = "DELETE FROM [Product] WHERE productId=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setInt(1, productId);
            k = psmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
            return -1;
        } catch (Exception ex) {
            System.out.println(ex);
            return -1;
        }
        return k;
     }
     
     public List<Product> searchByShopIDAndProductID(int sopID, int proID) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where ShopID = "+sopID+" and ProductID like N'%"+proID+"%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            int productID = rs.getInt("ProductID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            float price = rs.getFloat("Price");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
     public List<Product> searchByShopIDAndNameImage(int sopID, String names,String coloum) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where ShopID = "+sopID+" and "+coloum+" like N'%"+names+"%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            int productID = rs.getInt("ProductID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            float price = rs.getFloat("Price");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
    
    public List<Product> searchByShopIDAndPrice(int sopID, float prices) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "select * from [Product] where ShopID = "+sopID+" and Price = "+prices+"";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            int productID = rs.getInt("ProductID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            float price = rs.getFloat("Price");
            products.add(new Product(productID, shopID, name, image, price));
        }
        rs.close();
        con.close();
        return products;
    }
}
