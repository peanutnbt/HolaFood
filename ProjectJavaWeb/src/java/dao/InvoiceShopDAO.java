/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import entity.InvoiceShop;
import entity.Product;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class InvoiceShopDAO {
    public List<InvoiceShop> getInvoices(int inputShopId,Date date) throws Exception {
        List<InvoiceShop> invoices = new ArrayList<>();
        String store = "{call showOrderShop(?,?)}";
        Connection conn = new DBContext().getConnection();
        CallableStatement cs = conn.prepareCall(store);
        cs.setInt(1, inputShopId);
        cs.setDate(2,  date);
        ResultSet rs = cs.executeQuery();
        List<Product> products = new ArrayList<>();
        while (rs.next()) {
            int invoiceId = rs.getInt("InvoiceID");
            int shopId = rs.getInt("shopId");
            int userId = rs.getInt("userId");
            int quatity = rs.getInt("quatity");
            String userName = rs.getString("userName");
            String productName = rs.getString("productName");
            String note = rs.getString("note");
            String address = rs.getString("address");
            String phoneNumber = rs.getString("phoneNumber");
            Date orderTime = rs.getDate("orderTime");
            double unitPrice = rs.getDouble("unitPrice");
            invoices.add(new InvoiceShop(invoiceId, shopId, userId, userName, productName, quatity, unitPrice, note, address, phoneNumber, orderTime));
        }
        rs.close();
        conn.close();
        return invoices;
    }
        public Map<String, List<InvoiceShop>> getInvoiceFormat(int inputShopId,Date date) throws Exception {
        List<InvoiceShop> invoices = getInvoices( inputShopId, date);
        List<InvoiceShop> result = new ArrayList<>();

        Map<String, List<InvoiceShop>> m = new HashMap<>();
        for (InvoiceShop c : invoices) {
            if (!m.containsKey("invoice"+c.getInvoiceId())) {
                List<InvoiceShop> tempList = new ArrayList<>();
                tempList.add(c);
                m.put("invoice"+c.getInvoiceId(), tempList);
            } else {
                List<InvoiceShop> tempList = m.get("invoice"+c.getInvoiceId());
                tempList.add(c);
                m.put("invoice"+c.getInvoiceId(), tempList);
            }

        }
        return m;
    }
}
