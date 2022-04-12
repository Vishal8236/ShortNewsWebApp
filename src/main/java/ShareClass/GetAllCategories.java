/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ShareClass;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;


public class GetAllCategories {
    public Map<Integer, String> returnCategory(){
        Map<Integer, String> map=new HashMap<Integer,String>();  
        
        String connectionURL = "jdbc:mysql://localhost:3306/shortnews";
        String user = "root";
        String pass = "python1234";

        Connection con = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(connectionURL, user, pass);

            PreparedStatement ps = con.prepareStatement("select * from news_category");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                map.put(rs.getInt("cat_id"), rs.getString("cat_name"));
            }
         }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return map;
    }
}
