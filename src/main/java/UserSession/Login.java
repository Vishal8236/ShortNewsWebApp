/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserSession;

import DB.DBcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/UserSession/Login")
public class Login extends HttpServlet {
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
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        PrintWriter out = response.getWriter();
        
        if(UserValidate.validateUser(email, password))
        {
            HttpSession session = request.getSession();
            session.setAttribute("email",email);
            try{
                Connection con = DBcon.getcon();
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select role_id, user_id from user where email='"+email+"'"); 
                
                while(rs.next())
                {
                    session.setAttribute("user_id", rs.getInt("user_id"));
                    int role = rs.getInt("role_id");
                    if(role == 1)
                    {
                        session.setAttribute("role","user");
                        
                    }else if(role == 3)
                    {
                        session.setAttribute("role","news writer");
                    }
                }
                
            }
            catch(Exception e)
            {
                out.print(e);
            }
            
            response.sendRedirect("../Dashboard_user.jsp?cat_id=0");
         }
         else
         {
            response.sendRedirect("../login-signup.jsp?error='invalid'");
            
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
