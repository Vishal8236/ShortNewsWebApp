/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBcon {
    public static Connection getcon()
    {
        Connection con = null;
        String username = "root";
        String password = "python1234";
        String url = "jdbc:mysql://localhost:3306/shortnews";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
       return con;  
    }
}
