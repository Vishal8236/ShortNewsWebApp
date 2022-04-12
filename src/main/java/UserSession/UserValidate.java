
package UserSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

public class UserValidate {
    public static boolean validateUser(String email , String password)
    {
      
        boolean status = false;
        
        try
         {
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortnews","root","python1234");
            
            String query = "select email and password from user where email=? and password=?";
            PreparedStatement pt = con.prepareStatement(query);
           
            pt.setString(1, email);
            pt.setString(2, password);
             
            ResultSet rs=pt.executeQuery();  
            status = rs.next();
         }
              catch( ClassNotFoundException e)
         {
             System.out.println("class not found exception");
         }
         catch(SQLException e)
         {
              System.out.println("sql exception");
         }   
        return status;   
    }    
}
