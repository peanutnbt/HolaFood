/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.shop;

import Context.DBContext;
import dao.CommentDAO;
import dao.ProductDAO;
import dao.ShopDAO;
import dao.UsersDAO;
import entity.Comment;
import entity.Product;
import entity.Shop;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class ShopServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
        
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
        try {
            response.setCharacterEncoding("utf-8");
//            int userId = Integer.parseInt(request.getParameter("userId"));
//            int productId = Integer.parseInt(request.getParameter("productId"));
            int shopId = Integer.parseInt(request.getParameter("shopId"));
            
            
//            List<Product> products = new ProductDAO().searchByProductID(productId);
            List<Comment> comments = new CommentDAO().select(shopId);
            Shop shop=new ShopDAO().selectById(shopId);
            int userId = shop.getUserId();      //get shopOWnerId
            List<Shop> shops = new ShopDAO().select();
            
            Users user = new UsersDAO().selectById(userId);
            request.setAttribute("user", user);
            System.out.println(user.getName());
            request.setAttribute("comments", comments);
            request.setAttribute("shop", shop);
            System.out.println(shop.getTitle());
            request.setAttribute("shops", shops);
            request.getRequestDispatcher("/container/user/Shop.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
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
       response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("utf-8");
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            int userId = user.getUserId();
            String newShopName = request.getParameter("newShopName");
            String newShopDescription = request.getParameter("newShopDescription");
            boolean openOrClose = false;
            ShopDAO shopDao = new ShopDAO();
            System.out.println("userid: "+userId);
            Shop shop = new Shop(userId, newShopName, newShopDescription, openOrClose);
            System.out.println(userId);
            if (shopDao.insert(shop) == -1) {
                return;
            } else {
                System.out.println("shopID " + shop.getShopId());
                response.sendRedirect("/ProjectJavaWeb/shopmanager?shopId=" + shop.getShopId());
            }

        }
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
