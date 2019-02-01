/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.shop;

import dao.ProductDAO;
import dao.ShopDAO;
import entity.Product;
import entity.Shop;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author ASUS
 */
public class ShopsServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            JsonObjectBuilder job = Json.createObjectBuilder();

            int page = Integer.parseInt(request.getParameter("page").trim());
            int pageSize = Integer.parseInt(request.getParameter("pageSize").trim());
            String filter = request.getParameter("filter");
            JsonArrayBuilder builder2 = Json.createArrayBuilder();
            List<Shop> shops=null;
            if(filter.equals("oldest")){
                shops=new ShopDAO().getShopsOldest(page, pageSize);
            }
            else{
                shops=new ShopDAO().getShops(page, pageSize);
            }
            ProductDAO productDao = new ProductDAO();
            for(Shop shop:shops){
                List<Product> products = productDao.selectAllByShopID(shop.getShopId());
                JsonArrayBuilder builderProduct = Json.createArrayBuilder();
                for (int i = 0; i < products.size(); i++) {
                    builderProduct.add(Json.createObjectBuilder().add("productID", products.get(i).getProductId())
                            .add("shopID", products.get(i).getShopId())
                            .add("name", products.get(i).getName())
                            .add("image", products.get(i).getImage())
                            .add("price", products.get(i).getPrice())
                            .build());
                }
                builder2.add(Json.createObjectBuilder().add("shopid", shop.getShopId())
                        .add("userid", shop.getUserId())
                        .add("title", shop.getTitle())
                        .add("description", shop.getDescription())
                        .add("openOrClose", shop.isOpenOrClose())
                        .add("products", builderProduct)
                        .build());
            }
            
            JsonArray array2 = builder2.build();
            // add contacts array object
            job.add("shops", array2);
            JsonObject jo = job.build();
            out.write(jo.toString());
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ShopsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
