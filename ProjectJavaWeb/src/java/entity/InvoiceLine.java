/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Vu
 */
public class InvoiceLine {
    private int invoiceID;
    private int productID;
    private int quatity;
    private int unitprice;
    private String note;

    public InvoiceLine() {
    }

    public InvoiceLine(int invoiceID, int productID, int quatity, int unitprice, String note) {
        this.invoiceID = invoiceID;
        this.productID = productID;
        this.quatity = quatity;
        this.unitprice = unitprice;
        this.note = note;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public int getProductID() {
        return productID;
    }

    public int getQuatity() {
        return quatity;
    }

    public int getUnitprice() {
        return unitprice;
    }

    public String getNote() {
        return note;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    public void setUnitprice(int unitprice) {
        this.unitprice = unitprice;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}
