<%@page import="DB.DBcon"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>
<%@page import="ShareClass.StoreBookmarkNews"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Popular News</title>
        <%@include  file="./SharePage/bootstrap_link.jsp" %>
        <link rel="stylesheet" href="./Style/user_dashboard.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <style>
            .dashboard-btn, .show-more-btn{
                width: 260px;
                padding: 10px;
                margin-bottom: 20px;
                text-align: center;
                border-radius: 5px;
                cursor: pointer;
                background-color: #002c59;
                box-shadow: 1px 7px 30px -6px #002c59;
            }
            /*twiiter like button*/ 
            .heart {
              cursor: pointer;
              height: 50px;
              width: 50px;
              background-image:url( 'https://abs.twimg.com/a/1446542199/img/t1/web_heart_animation.png');
              background-position: left;
              background-repeat:no-repeat;
              background-size:2900%;
            }

            .heart:hover {
              background-position:right;
            }

            .is_animating {
              animation: heart-burst .8s steps(28) 1;
            }

            @keyframes heart-burst {
              from {background-position:left;}
              to { background-position:right;}
            }
        </style>
        <script type="text/javascript" src="./like_post.js"></script>
    </head>
    <body>
        <main>
            <div class="row">
              <!-- side nav  -->
              <div class="col-2 bg-white">
                  <%@include file="/SharePage/side_nav.jsp"%>
              </div>
                      
                      
              <div class="col-10 ">
                   <div class="badge bg-primary mt-3">Most Views News</div>  
                   <div class="px-5">

                        <div class="row row-cols-4 mt-4">
                        <%
                        int limit = 8;    

                        if(request.getParameter("addlimitby") != null)
                        {
                            String getlimit = (String) request.getParameter("addlimitby");
                            limit += Integer.parseInt(getlimit);
                        }
                        
                        int u_id =(Integer) session.getAttribute("user_id");
                        Connection con = null;
                        try{
                            con = DBcon.getcon();
                            PreparedStatement ps;
                            ps = con.prepareStatement("SELECT news_id, img, title,likes, views as count FROM news GROUP BY news_id ORDER BY count desc LIMIT "+limit);

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
                                    <a href="/ShortNewsNew/news_page.jsp?news_id=<%=rs.getInt("news_id")%>"><%=title%></a>
                                </div>
                              <div class="px-3">
                                  <img src="data:image/jpg;base64,${requestScope['imageBt']}" class="card-img-top" alt="...">
                              </div>
                              <div class="position-absolute bottom-0 w-100">
                                <div class="card-footer text-center d-flex mt-3 align-items-center">
                                    <div class="col d-flex align-items-center" >
                                        <div 
                                            onclick="doLike(<%=rs.getInt("news_id")%>)" 
                                            id="likebtn<%=rs.getInt("news_id")%>"  
                                            class="heart">
                                        </div>
                                        <span 
                                            class="mx-2" 
                                            id="likec<%=rs.getInt("news_id")%>">
                                            <%=rs.getInt("likes")%>
                                        </span>
                                    </div>
                                    <div class="col" onclick="showLink(<%=rs.getInt("news_id")%>)">
                                        <i class="bi bi-cursor i-size"></i>  
                                    </div>
                                    <div class="col" onclick="doBookmark(<%=rs.getInt("news_id")%>)">
                                      <i class="bi bi-bookmarks i-size"></i>
                                    </div>
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
                    <div class="text-center mt-5">
                        <a class="show-more-btn text-white" href="?addlimitby=8">Show More News</a>
                    </div>
              </div>
            </div>
            <%@include  file="./SharePage/alert-message.jsp" %>        
        </main>
    </body>
</html>
