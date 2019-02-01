/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import entity.Invoice;
import entity.InvoiceLine;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Vu
 */
public class InvoiceLineDAO {

    public List<InvoiceLine> selectAll(int invoiceID) throws Exception {
        List<InvoiceLine> invoicelines = new ArrayList<>();
        String query = "select * from [InvoiceLine] where InvoiceID = " + invoiceID;
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int productID = rs.getInt("ProductID");
            int quatity = rs.getInt("Quatity");
            int unitprice = rs.getInt("UnitPrice");
            String note = rs.getString("Note");
            invoicelines.add(new InvoiceLine(invoiceID, productID, quatity, unitprice, note));
        }
        rs.close();
        con.close();
        return invoicelines;
    }
    public List<InvoiceLine> selectByInvoiceId(int invoiceId) throws Exception {
        List<InvoiceLine> invoicelines = new ArrayList<>();
        String query = "select * from [InvoiceLine] where InvoiceID = ?";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps= con.prepareStatement(query);
        ps.setInt(1, invoiceId);
        
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            int quatity = rs.getInt("Quatity");
            int unitprice = rs.getInt("UnitPrice");
            String note = rs.getString("Note");
            invoicelines.add(new InvoiceLine(invoiceId, productID, quatity, unitprice, note));
        }
        rs.close();
        con.close();
        return invoicelines;
    }
    public int Insert(InvoiceLine invoiceLine) {
        try (Connection con = new DBContext().getConnection()) {
            String sql = "INSERT INTO dbo.InvoiceLine ( InvoiceID ,ProductID , Quatity ,UnitPrice , Note)VALUES  (? ,? ,?,? ,?)";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setInt(1, invoiceLine.getInvoiceID());
            psmt.setInt(2, invoiceLine.getProductID());
            psmt.setInt(3, invoiceLine.getQuatity());
            psmt.setInt(4, invoiceLine.getUnitprice());
            psmt.setString(5, invoiceLine.getNote());
            psmt.executeUpdate();
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
    public List<InvoiceLine> selectByProductQuatityPrice(int invoiceID, int value, String coloum) throws Exception {
        List<InvoiceLine> invoicelines = new ArrayList<>();
        String query = "select * from [InvoiceLine] where InvoiceID = "+invoiceID+" and "+coloum+" like N'%"+value+"%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            int quatity = rs.getInt("Quatity");
            int unitprice = rs.getInt("UnitPrice");
            String note = rs.getString("Note");
            invoicelines.add(new InvoiceLine(invoiceID, productID, quatity, unitprice, note));
        }
        rs.close();
        con.close();
        return invoicelines;
    }
    
    public List<InvoiceLine> selectByNote(int invoiceID, String notes) throws Exception {
        List<InvoiceLine> invoicelines = new ArrayList<>();
        String query = "select * from [InvoiceLine] where InvoiceID = "+invoiceID+" and Note like N'%"+notes+"%'";
        Connection con = new DBContext().getConnection();
        ResultSet rs = con.prepareStatement(query).executeQuery();
        while(rs.next()){
            int productID = rs.getInt("ProductID");
            int quatity = rs.getInt("Quatity");
            int unitprice = rs.getInt("UnitPrice");
            String note = rs.getString("Note");
            invoicelines.add(new InvoiceLine(invoiceID, productID, quatity, unitprice, note));
        }
        rs.close();
        con.close();
        return invoicelines;
    }
}
