/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Newswriter;

import DB.DBcon;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;  
import java.util.Calendar;
import javax.servlet.http.HttpSession;

@MultipartConfig(maxFileSize = 16177216)
public class AddNews extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String title = request.getParameter("title");        
        String desc = request.getParameter("desc");
        String tags = request.getParameter("tags");
        Part part = request.getPart("news_img");
        String category = request.getParameter("category");
        int cat_id = Integer.parseInt(category);
        
        HttpSession session=request.getSession();  
        int u_id =(Integer) session.getAttribute("user_id");
        
        try
        {
            Connection con = DBcon.getcon();
            String query = "insert into news (title, description, tag, img, created_date, user_id, cat_id) values (?,?,?,?,?,?,?)";
            PreparedStatement pt = con.prepareStatement(query);

            pt.setString(1, title);
            pt.setString(2, desc);
            pt.setString(3, tags);

            InputStream is = part.getInputStream();
            pt.setBlob(4, is);
   
            pt.setString(5, new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime()));
            
            pt.setInt(6, u_id);
            pt.setInt(7, cat_id);
            pt.executeUpdate();

            response.sendRedirect("./NewsWriter/Dashboard.jsp");
        }    
        catch(Exception e)
        {
            out.println("<h1>sql exception</h1>");
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
