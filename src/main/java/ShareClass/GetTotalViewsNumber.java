/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ShareClass;

import DB.DBcon;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetTotalViewsNumber {
    public int returnViewsCount(int user_id)
    {
        int count = 0;
        try{
            Connection con = DBcon.getcon();

            Statement stmt = con.createStatement();
            String query = "select sum(views) from news where user_id="+user_id;
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
