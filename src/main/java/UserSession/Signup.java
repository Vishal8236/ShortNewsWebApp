/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserSession;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.HttpSession;


@WebServlet("/UserSession/Signup")

public class Signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String c_password = request.getParameter("c_password");
            int default_role = 1;
            PrintWriter out = response.getWriter();

            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortnews","root","python1234");
                
                String query = "insert into user(name, email, password, role_id) values(?,?,?,?)";
                PreparedStatement pt = con.prepareStatement(query);
                
                pt.setString(1, name);
                pt.setString(2, email);
                pt.setString(3, password);
                pt.setInt(4, default_role);
                
                int res = pt.executeUpdate();
                
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("role", default_role);
                response.sendRedirect("/ShortNewsNew/");
            }
            catch(Exception e)
            {
                 out.print(e);
            }
        }
    }

