/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import entity.Shop;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ShopDAO {
    public List<Shop> select() throws Exception {
        List<Shop> shop = new ArrayList<>();
        String query = "select * from [Shop]";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int shopid = rs.getInt("shopid");
            int userId = rs.getInt("userid");
            String title = rs.getString("title").trim();
            String description = rs.getString("description").trim();
            boolean openOrClose = rs.getBoolean("openOrClose");
            shop.add(new Shop(shopid,userId, title, description, openOrClose));
        }
        rs.close();
        con.close();
        return shop;
    }
    
    public List<Shop> getUserShop(int userID) throws Exception {
        List<Shop> shop = new ArrayList<>();
        String query = "select * from [Shop] where userid = ?";
        Connection con = new DBContext().getConnection();        
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, userID );
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int shopid = rs.getInt("shopid");
            int userId = rs.getInt("userid");
            String title = rs.getString("title").trim();
            String description = rs.getString("description").trim();
            boolean openOrClose = rs.getBoolean("openOrClose");
            shop.add(new Shop(shopid,userId, title, description, openOrClose));
        }
        rs.close();
        con.close();
        return shop;
    }
    //ThangVD
    public List<Shop> selectAll() throws Exception {
        List<Shop> shops = new ArrayList<>();
        String query = "select * from [Shop]";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            int userID = rs.getInt("UserID");
            String title = rs.getString("Title");
            String description = rs.getString("Description");
            boolean openOrClose = rs.getBoolean("OpenOrClose");
            shops.add(new Shop(shopID, userID, title, description, openOrClose));
        }
        rs.close();
        con.close();
        return shops;
    }
    
    public List<Shop> searchByID(int shopID) throws Exception {
        List<Shop> shops = new ArrayList<>();
        String query = "select * from [Shop] where ShopID = "+shopID;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int userID = rs.getInt("UserID");
            String title = rs.getString("Title");
            String description = rs.getString("Description");
            boolean openOrClose = rs.getBoolean("OpenOrClose");
            shops.add(new Shop(shopID, userID, title, description, openOrClose));
        }
        rs.close();
        con.close();
        return shops;
    }
    
    public List<Shop> searchByOpenOrClose(boolean openOrClose) throws Exception {
        List<Shop> shops = new ArrayList<>();
        int i = 0;
        if(openOrClose == true){
            i = 1;
        }else{
            i = 0;
        }
        String query = "select * from [Shop] where OpenOrClose = "+i;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            int userID = rs.getInt("UserID");
            String title = rs.getString("Title");
            String description = rs.getString("Description");
            shops.add(new Shop(shopID, userID, title, description, openOrClose));
        }
        rs.close();
        con.close();
        return shops;
    }
    
    public List<Shop> searchByOther(String value, String coloum) throws Exception {
        List<Shop> shops = new ArrayList<>();
        String query = "select * from [Shop] where "+coloum+" like N'%"+value+"%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int shopID = rs.getInt("ShopID");
            int userID = rs.getInt("UserID");
            String title = rs.getString("Title");
            String description = rs.getString("Description");
            boolean openOrClose = rs.getBoolean("OpenOrClose");
            shops.add(new Shop(shopID, userID, title, description, openOrClose));
        }
        rs.close();
        con.close();
        return shops;
    }
    public Shop selectById(int shopidInput) throws Exception {
        String query = "select * from [Shop] WHERE shopid=?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, shopidInput);
        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            return null;//ko co
        }
        int shopid = rs.getInt("shopid");
        int userId = rs.getInt("userid");
        String title = rs.getString("title").trim();
        String description = rs.getString("description").trim();
        boolean openOrClose = rs.getBoolean("openOrClose");
        Shop shop = new Shop(shopid, userId, title, description, openOrClose);

        rs.close();
        conn.close();
        return shop;
    }

    public int insert(Shop shop) {
        try (Connection con = new DBContext().getConnection()) {
            String sql = "INSERT INTO [Shop](userId,title,description,openOrClose) values(?,?,?,?)";
            String[] gererates = {"shopId"};
            PreparedStatement psmt = con.prepareStatement(sql, gererates);
//            psmt.setInt(1, c.getId());
            psmt.setInt(1, shop.getUserId());
            psmt.setString(2, shop.getTitle());
            psmt.setString(3, shop.getDescription());
            psmt.setBoolean(4, shop.isOpenOrClose());
            psmt.executeUpdate();
            
            ResultSet rs = psmt.getGeneratedKeys();
            System.out.println("fick");
            if (rs.next()) {
                
                System.out.println(rs.getInt(1));
                shop.setShopId(rs.getInt(1));
            }
            return 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int update(Shop shop) throws Exception {
        int k = 0;
        try (Connection con = new DBContext().getConnection();) {
            String sql = "UPDATE [Shop] SET title=?, description=?,"
                    + "openOrClose=? WHERE shopid=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, shop.getTitle());
            psmt.setString(2, shop.getDescription());
            psmt.setBoolean(3, shop.isOpenOrClose());
            psmt.setInt(4, shop.getShopId());
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
    public int updateCloseShopByUserId(int  userId) throws Exception {
        int k = 0;
        try (Connection con = new DBContext().getConnection();) {
            String sql = "UPDATE [Shop] SET "
                    + "openOrClose=? WHERE userId=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setInt(1, 0);
            psmt.setInt(2, userId);
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
    
    
    public List<Shop> getShops(int page,int pageSize) throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        String store = "{call GetShops(?,?)}";
        Connection conn = new DBContext().getConnection();
        CallableStatement cs = conn.prepareCall(store);
        cs.setInt(1, from);
        cs.setInt(2, to);
        ResultSet rs = cs.executeQuery();
        List<Shop> shops = new ArrayList<>();
        while (rs.next()) {
            int shopid = rs.getInt("shopid");
            int userid = rs.getInt("userid");
            String title = rs.getString("title");
            String description = rs.getString("description");
            boolean openOrClose = rs.getBoolean("openOrClose");
            shops.add(new Shop(shopid, userid, title, description, openOrClose));
        }
        rs.close();
        conn.close();
        return shops;
    }
    public List<Shop> getShopsOldest(int page,int pageSize) throws Exception {
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        String store = "{call GetShopsOldest(?,?)}";
        Connection conn = new DBContext().getConnection();
        CallableStatement cs = conn.prepareCall(store);
        cs.setInt(1, from);
        cs.setInt(2, to);
        ResultSet rs = cs.executeQuery();
        List<Shop> shops = new ArrayList<>();
        while (rs.next()) {
            int shopid = rs.getInt("shopid");
            int userid = rs.getInt("userid");
            String title = rs.getString("title");
            String description = rs.getString("description");
            boolean openOrClose = rs.getBoolean("openOrClose");
            shops.add(new Shop(shopid, userid, title, description, openOrClose));
        }
        rs.close();
        conn.close();
        return shops;
    }
    public int getPages(int pageSize) throws Exception {
        int n = new ShopDAO().select().size();
        return (int) Math.ceil((double) n / pageSize);
//        int m=n/pageSize;
//        return (m==0?1:m);
    }
}
