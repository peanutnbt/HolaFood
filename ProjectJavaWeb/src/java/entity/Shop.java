package entity;

import Context.DBContext;
import dao.ProductDAO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ASUS
 */
public class Shop {

    private int shopId;
    private int userId;
    private String title;
    private String description;
    private boolean openOrClose;

    public Shop() {
    }

    public Shop(int userId, String title, String description, boolean openOrClose) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.openOrClose = openOrClose;
    }

    public Shop(int shopId, int userId, String title, String description, boolean openOrClose) {
        this.shopId = shopId;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.openOrClose = openOrClose;
    }

    public int getShopId() {
        return shopId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isOpenOrClose() {
        return openOrClose;
    }

    public void setOpenOrClose(boolean openOrClose) {
        this.openOrClose = openOrClose;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public List<Product> getProducts() throws Exception {
        List<Product> products = new ProductDAO().selectAllByShopID(shopId);
        return products;
    }

//    public List<InvoiceShop> getInvoices() throws Exception {
//        List<InvoiceShop> invoices = new ArrayList<>();
//        String store = "{call showOrderShop(?)}";
//        Connection conn = new DBContext().getConnection();
//        CallableStatement cs = conn.prepareCall(store);
//        cs.setInt(1, shopId);
//        ResultSet rs = cs.executeQuery();
//        List<Product> products = new ArrayList<>();
//        while (rs.next()) {
//            int invoiceId = rs.getInt("InvoiceID");
//            int shopId = rs.getInt("shopId");
//            int userId = rs.getInt("userId");
//            int quatity = rs.getInt("quatity");
//            String userName = rs.getString("userName");
//            String productName = rs.getString("productName");
//            String note = rs.getString("note");
//            String address = rs.getString("address");
//            String phoneNumber = rs.getString("phoneNumber");
//            Date orderTime = rs.getDate("orderTime");
//            double unitPrice = rs.getDouble("unitPrice");
//            invoices.add(new InvoiceShop(invoiceId, shopId, userId, userName, productName, quatity, unitPrice, note, address, phoneNumber, orderTime));
//        }
//        rs.close();
//        conn.close();
//        return invoices;
//    }
//
//    public Map<Integer, List<InvoiceShop>> getInvoiceFormat() throws Exception {
//        List<InvoiceShop> invoices = getInvoices();
//        List<InvoiceShop> result = new ArrayList<>();
//
//        Map<Integer, List<InvoiceShop>> m = new HashMap<>();
//        for (InvoiceShop c : invoices) {
//            if (!m.containsKey(c.getInvoiceId())) {
//                List<InvoiceShop> tempList = new ArrayList<>();
//                tempList.add(c);
//                m.put(c.getInvoiceId(), tempList);
//            } else {
//                List<InvoiceShop> tempList = m.get(c.getInvoiceId());
//                tempList.add(c);
//                m.put(c.getInvoiceId(), tempList);
//            }
//
//        }
//        return m;
//    }
}
