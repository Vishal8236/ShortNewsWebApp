<%@page import="DB.DBcon"%>
<%@page import="java.sql.*"%>
<%
  
    String uid =(String) request.getParameter("id");    
    String role_to =(String) request.getParameter("role_to");

%>   

<%
    try{
        Connection con = DBcon.getcon();

        PreparedStatement ps = con.prepareStatement("update user set role_id ="+role_to+" where user_id = "+uid+"");
        ps.execute();
    }
    catch(Exception e)
    {
        System.out.println(e);
    }

    response.sendRedirect("./show_user.jsp");

%>
