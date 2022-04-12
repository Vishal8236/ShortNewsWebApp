/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ShareClass;

import java.sql.*;

public class CountPost {
    public static int returnPost(int user_id)
    {
        int count = 0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortnews","root","python1234");

            Statement stmt = con.createStatement();
            String query = "select count(*) from news where user_id="+user_id;
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            count = rs.getInt(1);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return count;
    }
}
