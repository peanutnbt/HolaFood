package controller.authenticate;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import dao.UsersDAO;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class LoginServlet extends HttpServlet {

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
        request.getRequestDispatcher("/container/user/Login.jsp").forward(request, response);
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
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            Date lastAccessed = new Date();
            HttpSession session = request.getSession();
            UsersDAO userdao = new UsersDAO();
            Users user = userdao.selectByUsername(username);

            RequestDispatcher rd = request.getRequestDispatcher("/container/user/Login.jsp");
            if (user == null) {
                request.setAttribute("error", "Username or email is existed");
                rd.forward(request, response);
            } else {
                if (user.getPassword().equals(password)) {
                    System.out.println(user.getActive());
                    if (user.getActive() == 0) {
                        request.setAttribute("error", "Your account is blocked");
                        rd.forward(request, response);
                        return;
                    } else {
                        session.setAttribute("user", user);
                        session.setMaxInactiveInterval(86400);
                    }
                    if (user.getRole() == 0) {
                        response.sendRedirect(request.getServletContext().getContextPath() + "/dashboard");
                        return;
                    } else {
                        response.sendRedirect(request.getServletContext().getContextPath()+"/home");
                        return;
                    }

                } else {
                    request.setAttribute("error", "Username or email is existed");
                    rd.forward(request, response);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
