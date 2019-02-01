/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import entity.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin.10.12
 */
public class CartControllerServlet extends HttpServlet {

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
            int productId=Integer.valueOf(request.getParameter("productId"));
            String name=request.getParameter("name");
            int quantity=Integer.valueOf(request.getParameter("quantity"));
            double  price=Double.valueOf(request.getParameter("price"));
            String image = request.getParameter("image");
            int shopId=Integer.valueOf(request.getParameter("shopId"));
            CartItem ci=new CartItem(productId, name,quantity, price,image,shopId);
            HttpSession session=request.getSession();
            if(session.getAttribute("cart")==null)
                session.setAttribute("cart", new Cart());
            Cart c=(Cart)session.getAttribute("cart");
            c.addCartItem(ci);
//            c.addCartItem(new CartItem(1, "Com",1, 50000,"zxc.jpg",2));
//            c.addCartItem(new CartItem(2, "Bun",1, 70000,"zxc.jpg",2));
//            c.addCartItem(new CartItem(3, "Kem",1, 30000,"zxc.jpg",3));
//            c.addCartItem(new CartItem(4, "Cong",1, 700000,"zxc.jpg",3));
//            c.addCartItem(new CartItem(5, "Van",1, 30000,"zxc.jpg",4));
            session.setAttribute("cart", c);
            response.sendRedirect("/ProjectJavaWeb/container/user/checkout.jsp");//xoa het trang cu mat res,req ||con forward van nhan dc res,req
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
