<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show user and news writer</title>
        <%@include  file="../SharePage/bootstrap_link.jsp" %>
        <style>
            .dashboard-btn{
                text-align: center;
                border-radius: 5px;
                cursor: pointer;
                background-color: #002c59;
                box-shadow: 1px 5px 20px -6px #002c59;
            }
        </style>
    </head>
    <body>
        <header class="shadow">
            <%@include file="../SharePage/nav_bar.jsp" %>
        </header>
        <div class="container mt-5">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">User Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Role</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                <%
                
                String connectionURL = "jdbc:mysql://localhost:3306/shortnews";
                String user = "root";
                String pass = "python1234";

                Connection con = null;

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(connectionURL, user, pass);

                    PreparedStatement ps = con.prepareStatement("select user_id ,name, email , role_id from user ");
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()){
                        %>
                        <tr class="">
                            <th scope="row"><%=rs.getInt("user_id")%></td>            
                            <td><%=rs.getString("name")%></td>            
                            <td><%=rs.getString("email")%></td>                            
                            <td>
                                <% if(rs.getInt("role_id") == 2){ %>
                                <div class="btn-primary btn ">
                                    Admin
                                </div>
                                <%} else if (rs.getInt("role_id") == 3){%>
                                    News Writer
                                <% }else{%>
                                    User
                                <%}%>
                            </td>            
                            <td class="">
                                <% if(rs.getInt("role_id") == 1){%>
                                <div>
                                    <a href="/ShortNewsNew/AdminPage/change_role.jsp?id=<%=rs.getInt("user_id")%>&role_to=3">Change Role to News Writer</a>
                                </div>
                                <%}else if (rs.getInt("role_id") == 3){%>
                                <div>
                                    <a href="/ShortNewsNew/AdminPage/change_role.jsp?id=<%=rs.getInt("user_id")%>&role_to=1">Change Role to User</a>
                                </div>
                                <%}%>
                            </td>
                        </tr>
                    <%
                    }
                }
                catch(Exception e){
                    e.printStackTrace();
                }   
                finally{
                    if(con != null){
                        try{
                            con.close();
                        }
                        catch(Exception e){
                            e.printStackTrace();
                        }
                    }
                }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
