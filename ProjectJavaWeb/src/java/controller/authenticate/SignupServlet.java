/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.authenticate;

import dao.UsersDAO;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.StringUtils;
import utils.UploadImages;

/**
 *
 * @author ASUS
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2)
public class SignupServlet extends HttpServlet {

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
//        processRequest(request, response);
        request.getRequestDispatcher("container/user/SignUp.jsp").forward(request, response);
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
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String username = request.getParameter("username").trim();
        UsersDAO userdao = new UsersDAO();
        
        //check loi up anh
//<<<<<<< HEAD
        String avatarUrl=UploadImages.getNewNameAndStore(request, request.getServletContext().getInitParameter("IMAGE_STORAGE_LOCATION"), StringUtils.appliesSHA256(new Date().getTime()+""),"avatarUrl");
        
        System.out.println("/"+avatarUrl+"/");
//=======
//        String avatarUrl=UploadImages.getNewNameAndStore(request, request.getServletContext().getInitParameter("IMAGE_STORAGE_LOCATION"), username);
//
//>>>>>>> 57f8854f1efdd2ee9ebd2b441cdaf6d61bbd4e56
        String password = request.getParameter("password").trim();
        String email = request.getParameter("email").trim();
        String name = request.getParameter("name").trim();
        System.out.println(name);
        int role = 1;
        try {
            role = Integer.parseInt(request.getParameter("role").trim());
        } catch (Exception e) {
            System.out.println("ko la admin");
        }
        Users user = new Users(username, password, email, name, avatarUrl, role);
        
        //check loi trung username
        RequestDispatcher rd=request.getRequestDispatcher("/container/user/SignUp.jsp");
//        System.out.println(userdao.insert(user));
        if (userdao.insert(user) == -1) {
            System.out.println("dm");
            request.setAttribute("error", "Username or email is existed");
            rd.forward(request, response);
            return;
        } else {
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(86400);
            System.out.println(session.getAttribute("user"));
            response.sendRedirect("home");
        }

        //
    }
     private String extractFileName(Part part) {
       // form-data; name="file"; filename="C:\file1.zip"
       // form-data; name="file"; filename="C:\Note\file2.zip"
       String contentDisp = part.getHeader("content-disposition");
       String[] items = contentDisp.split(";");
       for (String s : items) {
           if (s.trim().startsWith("filename")) {
               // C:\file1.zip
               // C:\Note\file2.zip
               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
//               clientFileName = clientFileName.replace("\\", "/");
               int i = clientFileName.lastIndexOf('.');
               // file1.zip
               // file2.zip
               return clientFileName.substring(i + 1);
           }
       }
       return null;
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
