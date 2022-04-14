<% if (session.getAttribute("email") != null && session.getAttribute("user_id") != null) {
        session.getAttribute("email");
    } else {
        response.sendRedirect("./UserSession/login-signup.jsp");
    }
%>
<%@page import="DB.DBcon"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>
<%@page import="ShareClass.StoreBookmarkNews"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News</title>
        <%@include  file="./SharePage/bootstrap_link.jsp" %>
        <link rel="stylesheet" href="./Style/user_dashboard.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <style>
            .dashboard-btn{
                width: 260px;
                padding: 10px;
                margin-bottom: 20px;
                text-align: center;
                border-radius: 5px;
                cursor: pointer;
                background-color: #002c59;
                box-shadow: 1px 7px 30px -6px #002c59;
            }
        </style>
        <script src="./like_post.js"></script>
    </head>
    <body>
        <main>
            <div class="row">
              <!-- side nav  -->
              <div class="col-2 bg-white">
                  <%@include file="/SharePage/side_nav.jsp"%>
              </div>
                      
                      
              <div class="col-10 ">
                   <div class="badge bg-primary mt-3">My Bookmark News   </div>  
                   <div class="px-5">

                        <div class="row row-cols-4 mt-4">
                        <%
                        int u_id = 0;
                        if (session.getAttribute("user_id") != null){
                            u_id =(Integer) session.getAttribute("user_id");
                        }
                        Connection con = null;
                        try{
                            con = DBcon.getcon();
                            PreparedStatement ps;
                            ps = con.prepareStatement("select news.news_id, news.img, news.title from news,bookmark_news where news.news_id = bookmark_news.news_id and  bookmark_news.user_id="+u_id+"");

                            ResultSet rs = ps.executeQuery();
                            while(rs.next()){
                                Blob blob = rs.getBlob("img");
                                byte byteArray[] = blob.getBytes(1, (int)blob.length());
                                 String base64Image = new String(Base64.encodeBase64(byteArray)); 
                                 request.setAttribute("imageBt", base64Image);
                                 String title = rs.getString("title");
                        %>
                        <div class="col my-3 position-relative" id="<%=rs.getInt("news_id")%>">
                            <div class="card shadow-cu" style="max-width: 22rem; height: 21rem;" >
                                <div class="card-body fw-bold" style="max-height: 90px; overflow-y: hidden;">
                                    <a href="./news_page.jsp?news_id=<%=rs.getInt("news_id")%>"><%=title%></a>
                                </div>
                                <div class="px-3">
                                    <img src="data:image/jpg;base64,${requestScope['imageBt']}" class="card-img-top" alt="...">
                                </div>
                                <div class="position-absolute bottom-0 w-100">
                                    <div class="card-footer text-center mt-3 w-100">
                                        <div class="btn btn-danger btn-sm" onclick="removeBookmark(<%=rs.getInt("news_id")%>)">Remove</div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                    </div>
                </div>

              </div>    
            </div>
        </main>
    </body>
</html>
