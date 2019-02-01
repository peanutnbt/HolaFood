/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ShopDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vu
 */
public class Test3 extends HttpServlet {

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
        try {
            String USERID = request.getParameter("UserID");
            String ACTIVE = request.getParameter("Active");
            String submodal = request.getParameter("btnModal");
            response.sendRedirect("/ProjectJavaWeb/dashboard"); 
            UsersDAO daoUser = new UsersDAO();
            if (submodal != null) {
                System.out.println(submodal);
                int value1 = Integer.valueOf(ACTIVE);
                int value2 = Integer.valueOf(USERID);
                System.out.println("value1: "+value1 + "value2: " + value2);
                try {
                    daoUser.setStatus(value1, value2);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                
                System.out.println("value1: "+value1);
                if(value1==0){
                    System.out.println("here value1=0");
                    ShopDAO shopDao=new ShopDAO();
                    shopDao.updateCloseShopByUserId(value2);
                }
                
                response.sendRedirect("/ProjectJavaWeb/dashboard");
                return;
            }

        } catch (Exception ex) {

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
