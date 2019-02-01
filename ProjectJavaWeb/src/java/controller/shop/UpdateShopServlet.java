/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.shop;

import dao.ShopDAO;
import entity.Shop;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class UpdateShopServlet extends HttpServlet {

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
            request.setCharacterEncoding("utf-8");
            HttpSession session=request.getSession();
            Users user=(Users)session.getAttribute("user");
            int userId=user.getUserId();
            String shopName = request.getParameter("shopName");
            String shopDescription = request.getParameter("shopDescription");
            String shopStatus = request.getParameter("shopStatus");
            System.out.println(shopName);
            System.out.println(shopDescription);
            System.out.println(shopStatus);
            boolean openOrClose = false;
            if (shopStatus.equals("1")) {
                openOrClose = true;
            }
            int shopId = Integer.parseInt(request.getParameter("shopId"));
            ShopDAO shopDao = new ShopDAO();
            Shop shop = new Shop(shopId,userId,shopName, shopDescription, openOrClose);
            try {
                System.out.println(shopDao.update(shop));

            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
            System.out.println("Shop ID = "+shop.getShopId());
            response.sendRedirect("/ProjectJavaWeb/shopmanager?shopId=" + shop.getShopId());
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
