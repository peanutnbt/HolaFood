/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.InvoiceLineDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vu
 */
public class Test2 extends HttpServlet {

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
            String invoiceID = request.getParameter("INVOICEID");
            String selectInvoiceLine = request.getParameter("selectInvoiceLine");
            String searchInvoiceLine = request.getParameter("searchInvoiceLine");
            String submit = request.getParameter("btnInvoiceLineSubmit");
            InvoiceLineDAO dao = new InvoiceLineDAO();
            
            int invoiceid = Integer.valueOf(invoiceID);
            request.setAttribute("INVOICEID", invoiceid);
            request.setAttribute("AllProduct", dao.selectAll(invoiceid));
            
            if(searchInvoiceLine != null && selectInvoiceLine != null && submit != null){
                if(selectInvoiceLine.equals("Note")){
                    request.setAttribute("SearchNote", dao.selectByNote(invoiceid, searchInvoiceLine));
                }else{
                    int value = Integer.valueOf(searchInvoiceLine);
                    request.setAttribute("SearchOther", dao.selectByProductQuatityPrice(invoiceid, value, selectInvoiceLine));
                }
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/container/admin/invoicelines.jsp");
            rd.forward(request, response);
        
        }catch(Exception ex){
            request.setAttribute("errorInvoiceLine", "ProductID and UnitPrice and Quatity must be Integer");
            RequestDispatcher rd = request.getRequestDispatcher("/container/admin/invoicelines.jsp");
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
