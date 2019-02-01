/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.shop;

import dao.InvoiceShopDAO;
import dao.ProductDAO;
import dao.ShopDAO;
import entity.InvoiceShop;
import entity.Product;
import entity.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class ShopManagerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setCharacterEncoding("utf-8");
            int shopId = Integer.parseInt(request.getParameter("shopId"));
            Shop shop = null;
            try {
                shop = new ShopDAO().selectById(shopId);
                request.setAttribute("shop", shop);
                ProductDAO productDao = new ProductDAO();
                List<Product> products = productDao.selectAllByShopID(shopId);
                request.setAttribute("products", products);
                Date date=new Date(Calendar.getInstance().getTime().getTime());
//                String strDate = "2018-10-28";
//                Date date=Date.valueOf(strDate);
                System.out.println(date);
                Map<String, List<InvoiceShop>> invoicesShopMap = new InvoiceShopDAO().getInvoiceFormat(shopId, date);
                
                request.setAttribute("invoicesShop", invoicesShopMap);
                RequestDispatcher rd = request.getRequestDispatcher("/container/user/ShopManager.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }

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
