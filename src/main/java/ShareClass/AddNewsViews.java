/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ShareClass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class AddNewsViews {
    public void addNewsViewsCount(int newsid)
    {
        String jdbcUrl = "jdbc:mysql://localhost:3306/shortnews";
        String username = "root";
        String password = "python1234";
        String sql = "update news set views=views+1 where news_id="+newsid;

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password); 
            Statement stmt = conn.createStatement();) {

            stmt.executeUpdate(sql);

        } catch (Exception e) {
          e.printStackTrace();
        }

    }
}
