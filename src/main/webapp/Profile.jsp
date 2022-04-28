<%@page import="DB.DBcon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <%@include  file="./SharePage/bootstrap_link.jsp" %>
    </head>
    <body style="height: 900px;" class="">
        <header>
            <%@include file="./SharePage/nav_bar.jsp" %>
        </header>
        <main class=" container d-flex justify-content-center align-items-center" style="margin-top: 12rem;">
            <div class="shadow col-6 py-3">
                  <%
                    int u_id =(Integer) session.getAttribute("user_id");
                    try{
                        Connection con = DBcon.getcon();

                        Statement stmt = con.createStatement();
                        String query = "select * from user where user_id="+u_id;
                        ResultSet rs = stmt.executeQuery(query);
                        rs.next();
                        
                    
                %>
                <div class="cover-bg"></div>
                <div class="user-info text-center">
                    <div class="">
                        <img class="img p-2 bg-white rounded-circle" height="150px" width="150px" src="https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png" alt="">
                    </div>
                </div>
                <div class="text-center">
                    <div class="mt-3">
                        <span class="h3"><%=rs.getString("name")%></span>
                    </div>
                    <div>
                        <span class="text-muted">
                            <%=rs.getString("email")%>
                        </span>
                    </div>
                </div>
                <div class="text-white my-3">
                    <div class="d-flex justify-content-center">
                        <div>
                            <button class="btn btn-primary shadow">Update Profile</button>
                        </div>

                        <%
                            }
                            catch(Exception e)
                            {
                                System.out.print(e);
                            }
                        %>
                    </div>
                </div>

            </div>
        </main>
    </body>
</html>