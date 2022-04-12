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
        String username = "su1lll3w7or9wgum";
        String password = "nkcrzqh8ocjgha91";
        String url = "jdbc:mysql://x8autxobia7sgh74.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/bofj9pxjc63yulo6";
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
