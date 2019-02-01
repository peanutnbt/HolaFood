package dao;

import Context.DBContext;
import entity.Invoice;
import entity.UserInvoice;
import entity.InvoiceProduct;
import entity.Users;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UsersDAO {

    //select
    public Users selectByUsername(String usernameInput) throws Exception {
        String query = "select * from [User] WHERE Username=?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, usernameInput);
        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            return null;//ko co
        }
        int userId = rs.getInt("UserID");
        String username = rs.getString("username").trim();
        String password = rs.getString("password").trim();
        String email = rs.getString("email").trim();
        String avatarUrl = rs.getString("avatarUrl").trim();
        int role = rs.getInt("role");
        int active = rs.getInt("active");
        String name = rs.getString("name").trim();
        Users user = new Users(userId,username, password, email, name, avatarUrl, role,active);
        
        rs.close();
        conn.close();
        return user;
    }
    public Users selectByShopId(String usernameInput) throws Exception {
        String query = "select * from [User] WHERE Username=?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, usernameInput);
        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            return null;//ko co
        }
        int userId = rs.getInt("UserID");
        String username = rs.getString("username").trim();
        String password = rs.getString("password").trim();
        String email = rs.getString("email").trim();
        String avatarUrl = rs.getString("avatarUrl").trim();
        int role = rs.getInt("role");
        int active = rs.getInt("active");
        String name = rs.getString("name").trim();
        Users user = new Users(userId,username, password, email, name, avatarUrl, role,active);
        
        rs.close();
        conn.close();
        return user;
    }

    public List<Users> select() throws Exception {
        List<Users> user = new ArrayList<>();
        String query = "select * from [User]";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int userId = rs.getInt("UserID");
            String username = rs.getString("username").trim();
            String password = rs.getString("password").trim();
            String email = rs.getString("email").trim();
            String avatarUrl = rs.getString("avatarUrl").trim();
            int role = rs.getInt("role");
            String name = rs.getString("name").trim();
            user.add(new Users(userId,username, password, email, name, avatarUrl, role));
        }
        rs.close();
        con.close();
        return user;
    }

    //insert
    public int insert(Users user) {
        try(Connection con = new DBContext().getConnection()) {
            String sql = "INSERT INTO [User](username, password,name,email,avatarurl,role ) values(?,?,?,?,?,?)";
             String[] gererates = {"userId"};
            PreparedStatement psmt = con.prepareStatement(sql,gererates);
//            psmt.setInt(1, c.getId());
            psmt.setString(1, user.getUsername());
            psmt.setString(2, user.getPassword());
            psmt.setString(3, user.getName());
            psmt.setString(4, user.getEmail());
            psmt.setString(5, user.getAvatarUrl());
            psmt.setInt(6, user.getRole());
            psmt.executeUpdate();
            
            ResultSet rs = psmt.getGeneratedKeys();
            
            if (rs.next()) {
                
                System.out.println(rs.getInt(1));
                user.setUserId(rs.getInt(1));
            }
            
            return 1;
        } catch (SQLException ex) {
            System.out.println("Hello");
            ex.printStackTrace();
            return -1;
        } catch (Exception e) {
            System.out.println("Hello1");
            e.printStackTrace();
            return -1;
        }
        
    }
    
    //History Shopping
    public List<UserInvoice> getAllProducts(int userId) throws Exception {  
        
       
       String storeProcedure = "{call viewInvoice(?)}";
       Connection con = new DBContext().getConnection();
       CallableStatement cs = con.prepareCall(storeProcedure);
       cs.setInt(1,userId);       
       ResultSet rs = cs.executeQuery();
        List<UserInvoice> list = new ArrayList<>();
       while(rs.next()){
            Date orderTime = rs.getDate("OrderTime");
            int quantity = rs.getInt("Quatity");
            int price = rs.getInt("UnitPrice");
            String name = rs.getString("Name");
            String img = rs.getString("Image");
            list.add(new UserInvoice(orderTime,quantity,price,name,img));
       }
       rs.close();
       con.close();
       return list;
    }
    
    //List User's Shops
    public List<Invoice> getInvoices(int userId) throws Exception {  
       String storeProcedure = "{call listInvoice(?)}";
       Connection con = new DBContext().getConnection();
       CallableStatement cs = con.prepareCall(storeProcedure);
       cs.setInt(1,userId);       
       ResultSet rs = cs.executeQuery();
        List<Invoice> list = new ArrayList<>();
       while(rs.next()){
            int invoiceID = rs.getInt("InvoiceID");
            int userid = rs.getInt("UserID");
            Date orderTime = rs.getDate("OrderTime");
            String address = rs.getString("Address");
            String phone = rs.getString("PhoneNumber");            
            list.add(new Invoice(invoiceID,userid,orderTime,address,phone));
       }
       rs.close();
       con.close();
       return list;
    }
    
    //List Invoice's product
    public List<InvoiceProduct> getProducts(int invoiceID) throws Exception {  
       String storeProcedure = "{call invoiceProduct(?)}";
       Connection con = new DBContext().getConnection();
       CallableStatement cs = con.prepareCall(storeProcedure);
       cs.setInt(1,invoiceID);       
       ResultSet rs = cs.executeQuery();
        List<InvoiceProduct> list = new ArrayList<>();
       while(rs.next()){
            int productID = rs.getInt("ProductID");
            int shopID = rs.getInt("ShopID");
            String name = rs.getString("Name");
            String image = rs.getString("Image");
            double price = rs.getDouble("Price");            
            int quantity = rs.getInt("Quatity");  
            String note = rs.getString("Note");  
            list.add(new InvoiceProduct(productID,shopID,name,image,price,quantity,note));
       }
       rs.close();
       con.close();
       return list;
    }
    //delete
    //update
    //ThangVD
    public List<Users> selectAll() throws Exception {
        List<Users> users = new ArrayList<>();
        String query = "select * from [User]";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int userId = rs.getInt("UserID");
            String userName = rs.getString("Username");
            String password = rs.getString("Password");
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            String avatarUrl = rs.getString("AvatarUrl");
            int role = rs.getInt("Role");
            int active = rs.getInt("active");
            users.add(new Users(userId, userName, password, email,name, avatarUrl, role,active));
        }
        rs.close();
        con.close();
        return users;
    }
    
    public List<Users> searchByID(int userId) throws Exception {
        List<Users> users = new ArrayList<>();
        String query = "select * from [User] where UserID = "+userId;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            String userName = rs.getString("Username");
            String password = rs.getString("Password");
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            String avatarUrl = rs.getString("AvatarUrl");
            int role = rs.getInt("Role");
            int active = rs.getInt("active");
            users.add(new Users(userId, userName, password, email, name, avatarUrl, role,active));
        }
        rs.close();
        con.close();
        return users;
    }
    public Users selectById(int useridInput) throws Exception {
        String query = "select * from [User] WHERE userid=?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, useridInput);
        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            return null;//ko co
        }
        int userid=rs.getInt("userid");
        String username = rs.getString("username").trim();
        String password = rs.getString("password").trim();
        String email = rs.getString("email").trim();
        String avatarUrl = rs.getString("avatarUrl").trim();
        int role = rs.getInt("role");
        String name = rs.getString("name").trim();
        Users user = new Users(userid,username, password, email, name, avatarUrl, role);

        rs.close();
        conn.close();
        return user;
    }
    
    public List<Users> searchByOther(String value, String coloum) throws Exception {
        List<Users> users = new ArrayList<>();
        String query = "select * from [User] where "+coloum+" like N'%"+value+"%'";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            int userId = rs.getInt("UserID");
            String userName = rs.getString("Username");
            String password = rs.getString("Password");
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            String avatarUrl = rs.getString("AvatarUrl");
            int role = rs.getInt("Role");
            int active = rs.getInt("active");
            users.add(new Users(userId, userName, password, email, name, avatarUrl, role,active));
        }
        rs.close();
        con.close();
        return users;
    }
    
    //Update User Informaiton
    public int update(Users user) throws Exception{
        int k = 0;
        try(Connection con = new DBContext().getConnection();) {
            String sql = "UPDATE [User] SET email=?, name=?,"
                    + "avatarUrl=? WHERE username=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, user.getEmail());
            psmt.setString(2, user.getName());
            psmt.setString(3, user.getAvatarUrl());
            psmt.setString(4, user.getUsername());
            k = psmt.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return k;
    }
    
    public void setStatus(int value1, int value2) throws  Exception{
        String query = "UPDATE [User] set Active = "+value1+" where UserID = "+value2;
        Connection con = new DBContext().getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate(query);
        stmt.close();
        con.close();
    }
}
