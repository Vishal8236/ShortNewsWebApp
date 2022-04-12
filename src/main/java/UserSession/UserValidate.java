
package UserSession;

import DB.DBcon;
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
            Connection con = DBcon.getcon();
            
            String query = "select email and password from user where email=? and password=?";
            PreparedStatement pt = con.prepareStatement(query);
           
            pt.setString(1, email);
            pt.setString(2, password);
             
            ResultSet rs=pt.executeQuery();  
            status = rs.next();
         }
         catch(SQLException e)
         {
              System.out.println("sql exception");
         }   
        return status;   
    }    
}
