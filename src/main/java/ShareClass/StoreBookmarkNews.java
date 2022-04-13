/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ShareClass;

import DB.DBcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class StoreBookmarkNews extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String id = (String) request.getParameter("news_id");
        int nid = Integer.parseInt(id);
        HttpSession session=request.getSession();  
        if(session.getAttribute("user_id") != null)
        {
            int u_id =(Integer) session.getAttribute("user_id");
            System.out.println("Some error");
            try{
                Connection con = DBcon.getcon();

                String query = "insert into bookmark_news(user_id, news_id) values(?,?)";
                PreparedStatement pt = con.prepareStatement(query);

                pt.setInt(1, u_id);
                pt.setInt(2, nid);

                int res = pt.executeUpdate();
            }
            catch(Exception e)
            {
                 System.out.print(e);
            }
            String jsonStr = "success";
            response.getWriter().write(jsonStr);
        }
        else{
//            String objectToReturn = "{ error: 'Please do login before this action' }";
            String jsonStr = "error";
            response.getWriter().write(jsonStr);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
