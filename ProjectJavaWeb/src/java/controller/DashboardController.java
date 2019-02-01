/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.InvoiceDAO;
import dao.InvoiceLineDAO;
import dao.ProductDAO;
import dao.ShopDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vu
 */
public class DashboardController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            

            //For USER
            String txt = request.getParameter("searchUser");
            String valueSelect = request.getParameter("selectUser");
            String submit = request.getParameter("btnSubmit");
            String back = request.getParameter("btnBack");

            //For SHOP
            String txt1 = request.getParameter("searchShop");
            String valueSelect1 = request.getParameter("selectShop");
            String submit1 = request.getParameter("btnShopSubmit");
            String back1 = request.getParameter("btnShopBack");

            //DAO
            UsersDAO daoUser = new UsersDAO();
            ShopDAO daoShop = new ShopDAO();
            ProductDAO daoProduct = new ProductDAO();
            InvoiceDAO daoInvoice = new InvoiceDAO();

            request.setAttribute("Shops", daoShop.selectAll());
            request.setAttribute("Users", daoUser.selectAll());
            request.setAttribute("Products", daoProduct.selectAll());
            request.setAttribute("Invoices", daoInvoice.selectAll());

            

            //FOR SEARCH USER
            if (txt != null && valueSelect != null && submit != null) {
                if (valueSelect.equalsIgnoreCase("userID")) {
                    int userID = Integer.valueOf(txt);
                    request.setAttribute("SearchUserUserID", daoUser.searchByID(userID));
                } else {
                    request.setAttribute("SearchUserOther", daoUser.searchByOther(txt, valueSelect));
                }
            }
            if (back != null) {
                request.setAttribute("back", "true");
            }

            //FOR SEARCH SHOP
            if (txt1 != null && valueSelect1 != null && submit1 != null) {
                if (valueSelect1.equalsIgnoreCase("shopID")) {
                    int shopID = Integer.valueOf(txt1);
                    request.setAttribute("SearchShopID", daoShop.searchByID(shopID));
                } else if (valueSelect1.equals("OpenOrClose")) {
                    boolean openOrClose = Boolean.valueOf(txt1);
                    request.setAttribute("SearchShopOpenOrClose", daoShop.searchByOpenOrClose(openOrClose));
                } else {
                    request.setAttribute("SearchShopOther", daoShop.searchByOther(txt1, valueSelect1));
                }
            }
            if (back1 != null) {
                request.setAttribute("back1", "true");
            }

            //For SEARCH PRODUCT
            String txt2 = request.getParameter("searchProduct");
            String valueSelect2 = request.getParameter("selectProduct");
            String submit2 = request.getParameter("btnProductSubmit");
            String back2 = request.getParameter("btnProductBack");

            if (txt2 != null && valueSelect2 != null && submit2 != null) {
                if (valueSelect2.equalsIgnoreCase("productID")) {
                    int productID = Integer.valueOf(txt2);
                    request.setAttribute("SearchProductID", daoProduct.searchByProductID(productID));
                } else if (valueSelect2.equals("Price")) {
                    int price = Integer.valueOf(txt2);
                    request.setAttribute("SearchProductPrice", daoProduct.searchByPrice(price));
                } else {
                    request.setAttribute("SearchProductOther", daoProduct.searchByOther(txt2, valueSelect2));
                }
            }
            if (back2 != null) {
                request.setAttribute("back2", "true");
            }

            //FOR SEARCH INVOICE
            String txt3 = request.getParameter("searchInvoice");
            String valueSelect3 = request.getParameter("selectInvoice");
            String submit3 = request.getParameter("btnInvoiceSubmit");
            String back3 = request.getParameter("btnInvoiceBack");
            if (txt3 != null && valueSelect3 != null && submit3 != null) {
                if (valueSelect3.equalsIgnoreCase("invoiceID")) {
                    int invoiceID = Integer.valueOf(txt3);
                    request.setAttribute("SearchInvoiceID", daoInvoice.searchByInvoiceID(invoiceID));
                } else if (valueSelect3.equals("UserID")) {
                    int userID = Integer.valueOf(txt3);
                    request.setAttribute("SearchInvoiceUserID", daoInvoice.searchByUserID(userID));
                } else if (valueSelect3.equals("OrderTime")) {
                    Date orderTime = Date.valueOf(txt3);
                    request.setAttribute("SearchInvoiceOrderTime", daoInvoice.searchByOrderTime(orderTime));
                } else {
                    request.setAttribute("SearchInvoiceOther", daoInvoice.searchByOther(txt3, valueSelect3));
                }
            }
            if (back3 != null) {
                request.setAttribute("back3", "true");
            }

            //FOR MODAL
            String invoiceID = request.getParameter("Test");
            InvoiceLineDAO dao = new InvoiceLineDAO();
            if (invoiceID != null) {
                int id = Integer.valueOf(invoiceID);
                request.setAttribute("InvoiceLines", dao.selectAll(id));
            }

            ////////////////////////////////////////////////////////////////////////////////////
            RequestDispatcher rd = request.getRequestDispatcher("/container/admin/dashboard.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorUser", "UserID must be Integer");
            request.setAttribute("errorShop", "ShopID must be Integer  Or Open or Close must be boolean");
            request.setAttribute("errorProduct", "ProductID and Price must be Integer");
            request.setAttribute("errorInvoice", "InvoiceID and UserID must be Integer and OrderTime must be Date");
            RequestDispatcher rd = request.getRequestDispatcher("/container/admin/dashboard.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
