<%@page import="DB.DBcon"%>
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
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../Dashboard_user.jsp?cat_id=0">ShortNews</a>
                  <div class="d-flex align-items-center ">
                      <%
                          if(session.getAttribute("email") != null)
                          {
                              String email =(String) session.getAttribute("email");
                      %>
                      <div class="mx-4">
                          <strong><%=email%></strong>
                      </div>
                      <div>
                          <a href="../Logout" class="btn btn-danger">Logout</a>
                      </div>
                      <%
                          }else{
                      %>
                      <div>
                          <a href="../UserSession/login-signup.jsp" class="btn btn-primary">Signup / Login</a>
                      </div>
                      <%
                          }
                      %>
                  </div>
                </div>
              </nav>
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
                Connection con = null;
                try{
                    con = DBcon.getcon();

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
                                    <a href="./change_role.jsp?id=<%=rs.getInt("user_id")%>&role_to=3">Change Role to News Writer</a>
                                </div>
                                <%}else if (rs.getInt("role_id") == 3){%>
                                <div>
                                    <a href="./change_role.jsp?id=<%=rs.getInt("user_id")%>&role_to=1">Change Role to User</a>
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
