/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import dao.UsersDAO;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.StringUtils;
import utils.UploadImages;

/**
 *
 * @author Admin.10.12
 */
@MultipartConfig()
public class UpdateUserInfoServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            
            String email = request.getParameter("email");
            System.out.println(email);
            String name = request.getParameter("name");
            String avatar = request.getParameter("avatar");            
            UsersDAO dao = new UsersDAO();
            Users oldUser = (Users) session.getAttribute("user");
//            String avatarUrl=UploadImages.getNewNameAndStore(request, request.getServletContext().getInitParameter("IMAGE_STORAGE_LOCATION"), oldUser.getUsername());
            String avatarUrl=UploadImages.getNewNameAndStore(request, request.getServletContext().getInitParameter("IMAGE_STORAGE_LOCATION"),StringUtils.appliesSHA256(new Date().getTime()+""),"avatarUrl");
            Users newUser;
            if(avatarUrl!=null){
                newUser = new Users(oldUser.getUserId(),oldUser.getUsername(),oldUser.getPassword(),email,name,avatarUrl,1);
            }else{
                newUser = new Users(oldUser.getUserId(),oldUser.getUsername(),oldUser.getPassword(),email,name,oldUser.getAvatarUrl(),1);
            }
            int k = dao.update(newUser);
            session.setAttribute("user", newUser);
            response.sendRedirect("userproduct?userId="+newUser.getUserId());
         
        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
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
