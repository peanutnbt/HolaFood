/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import entity.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author Vu
 */
public class InvoiceDAO {

    public List<Invoice> selectAll() throws Exception {
        List<Invoice> invoices = new ArrayList<>();
        String query = "select * from [Invoice]";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int invoiceID = rs.getInt("InvoiceID");
            Date orderTime = rs.getDate("OrderTime");
            int userID = rs.getInt("UserID");
            String address = rs.getString("Address");
            String phoneNumber = rs.getString("PhoneNumber");
            invoices.add(new Invoice(invoiceID, userID, orderTime, address, phoneNumber));
        }
        rs.close();
        con.close();
        return invoices;
    }

    public List<Invoice> searchByInvoiceID(int invoiceID) throws Exception {
        List<Invoice> invoices = new ArrayList<>();
        String query = "select * from [Invoice] where InvoiceID = " + invoiceID;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            Date orderTime = rs.getDate("OrderTime");
            int userID = rs.getInt("UserID");
            String address = rs.getString("Address");
            String phoneNumber = rs.getString("PhoneNumber");
            invoices.add(new Invoice(invoiceID, userID, orderTime, address, phoneNumber));
        }
        rs.close();
        con.close();
        return invoices;
    }

    public List<Invoice> searchByUserID(int userID) throws Exception {
        List<Invoice> invoices = new ArrayList<>();
        String query = "select * from [Invoice] where UserID like N'%" + userID + "%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int invoiceID = rs.getInt("InvoiceID");
            Date orderTime = rs.getDate("OrderTime");
            String address = rs.getString("Address");
            String phoneNumber = rs.getString("PhoneNumber");
            invoices.add(new Invoice(invoiceID, userID, orderTime, address, phoneNumber));
        }
        rs.close();
        con.close();
        return invoices;
    }

    public List<Invoice> searchByOrderTime(Date orderTime) throws Exception {
        List<Invoice> invoices = new ArrayList<>();
        String query = "select * from [Invoice] where OrderTime like N'%" + orderTime + "%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int invoiceID = rs.getInt("InvoiceID");
            String address = rs.getString("Address");
            int userID = rs.getInt("UserID");
            String phoneNumber = rs.getString("PhoneNumber");
            invoices.add(new Invoice(invoiceID, userID, orderTime, address, phoneNumber));
        }
        rs.close();
        con.close();
        return invoices;
    }

    public List<Invoice> searchByOther(String value, String coloum) throws Exception {
        List<Invoice> invoices = new ArrayList<>();
        String query = "select * from [Invoice] where " + coloum + " like N'%" + value + "%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int invoiceID = rs.getInt("InvoiceID");
            String address = rs.getString("Address");
            int userID = rs.getInt("UserID");
            Date orderTime = rs.getDate("OrderTime");
            String phoneNumber = rs.getString("PhoneNumber");
            invoices.add(new Invoice(invoiceID, userID, orderTime, address, phoneNumber));
        }
        rs.close();
        con.close();
        return invoices;
    }

    public int Insert(Invoice invoice) {
        try (Connection con = new DBContext().getConnection()) {
            String sql = "INSERT INTO [Invoice]( OrderTime,UserID,Address,PhoneNumber ) values(?,?,?,?)";
            PreparedStatement psmt = con.prepareStatement(sql);
//            psmt.setInt(1, c.getId());
//            LocalDate todayLocalDate = LocalDate.now(ZoneId.of("America/Montreal"));
            Date date = new Date(Calendar.getInstance().getTime().getTime());
            psmt.setObject(1, date);
            psmt.setInt(2, invoice.getUserID());
            psmt.setString(3, invoice.getAddress());
            psmt.setString(4, invoice.getPhone());
            psmt.executeUpdate();
            //Find Invoice has just been updated
            String query = "SELECT MAX(InvoiceID) AS InvoiceID FROM [Invoice]";
            PreparedStatement psmt2 = con.prepareStatement(query);
            ResultSet rs = psmt2.executeQuery();

            int indexInvoice = -1;
            while (rs.next()) {
                indexInvoice = rs.getInt("InvoiceID");
            }
            return indexInvoice;
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
}
