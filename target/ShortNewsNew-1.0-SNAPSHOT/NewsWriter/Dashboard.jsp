<% if (session.getAttribute("email") != null && session.getAttribute("user_id") != null) {
        session.getAttribute("email");
    } else {
        response.sendRedirect("../UserSession/login-signup.jsp");
    }
%>
<%@page import="DB.DBcon"%>
<%@page import="ShareClass.GetTotalViewsNumber"%>
<%@page import="ShareClass.CountLikes"%>
<%@page import="ShareClass.CountPost"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>News Writer Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="../Style/dashboard-news-writer.css">
        <link rel="stylesheet" href="./Style/sidenav-home.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    </head>
    <body class="dash-body">
        <header class="bg-white shadow-sm">
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
                          <a href="./UserSession/login-signup.jsp" class="btn btn-primary">Signup / Login</a>
                      </div>
                      <%
                          }
                      %>
                  </div>
                </div>
              </nav>
        </header>
        <div class="d-flex container">
            <%
                int uid = 0;
                if (session.getAttribute("user_id") != null){
                    uid = (Integer) session.getAttribute("user_id");
                }
            %>
            
            <div class="col-lg-12 col-sm-12">
                <div class="dash-head px-4 py-4">
                    <div class="d-flex justify-content-between">
                        <div class="dashboard-head h1">Dashboard</div>
                        <div>
                            <a href="../NewsWriter/Newswriter_form.jsp" class="btn btn-primary">Create New</a>
                        </div>
                    </div>
                    <div>
                        <span class="text-gray">Check your progress from here</span>
                    </div>
                </div>
                <div class="px-lg-4 px-sm-2" style="margin-top: -3%">
                    <div class="dash-title-nav d-flex justify-content-around">
                            <div class="">
                                <jsp:useBean id="views" class="ShareClass.GetTotalViewsNumber" />    
                                <div class="h1 text-center"><lottie-player src="https://assets4.lottiefiles.com/temp/lf20_kkhPlx.json"  background="transparent"  speed="1"  style="max-width: 100px; max-height: 100px; text-align: center;"  loop  autoplay></lottie-player></div>
                                <div class="text-uppercase h5 mt-3">Totle views</div>
                                <div class="text-muted h4 fw-bold mt-2">
                                    <%
                                            GetTotalViewsNumber vc = new GetTotalViewsNumber();  
                                    %>
                                    <span>+<%=vc.returnViewsCount(uid)%></span>
                                </div>
                            </div>
                            <div class="dash-nav-item"></div>
                            <div class="">
                                    <jsp:useBean id="test" class="ShareClass.CountPost" />
                                    <div class="h1 text-center"><lottie-player src="https://assets2.lottiefiles.com/packages/lf20_eaawoubu.json"  background="transparent"  speed="1"  style="max-width: 100px; max-height: 100px; text-align: center;"  loop  autoplay></lottie-player></div>
                                    <div class="text-uppercase h5 mt-3">Totle Articles</div>
                                    <div class="text-muted h4 fw-bold mt-2">
                                        <%
                                            CountPost tc = new CountPost();  
                                        %>
                                        <span>+<%=tc.returnPost(uid)%></span>
                                    </div>
                            </div>
                            <div class="dash-nav-item"></div>
                            <div class="">
                                <jsp:useBean id="likes" class="ShareClass.CountLikes" />
                                    <div class="h1 text-center"><lottie-player src="https://assets1.lottiefiles.com/packages/lf20_sF7uci.json"  background="transparent"  speed="0.5"  style="max-width: 100px; max-height: 100px; text-align: center;"  loop autoplay></lottie-player></div>
                                    <div class="text-uppercase h5 mt-3">Totle Likes</div>
                                    <div class="text-muted h4 fw-bold mt-2">
                                        <%
                                            CountLikes cl = new CountLikes();
                                        %>
                                        <span>+<%=cl.returnLikeCount(uid)%></span>
                                    </div>
                            </div>
                    </div>

                    <!-- my created articles  -->
                    <div class="show-article ">
                            <div class="table-responsive">
                                    <table class="table table-fixed">
                                        <!--Table head-->
                                        <thead>
                                          <tr>
                                                <th class="col-1">#</th>
                                                <th class="col-5">News Title</th>
                                                <th class="col-2">Views</th>
                                                <th class="col-2">Action</th>
                                                <th class="col-2">Created</th>
                                          </tr>
                                        </thead>
                                        <!--Table head-->

                                        <!--Table body-->
                                        <tbody>
                                        <%
                                        Connection con = null;
                                        try{
                                            con = DBcon.getcon();

                                            PreparedStatement ps = con.prepareStatement("select news_id ,title, created_date, views from news where user_id="+uid+" ");
                                            ResultSet rs = ps.executeQuery();

                                            while(rs.next()){
                                        %>
                                          <tr style="LINE-HEIGHT:50px">
                                                <th scope="row"><%=rs.getInt("news_id")%></th>
                                                <td ><a href="./news_page.jsp?news_id=<%=rs.getInt("news_id")%>"><%=rs.getString("title")%></a></td>
                                                <td><%=rs.getInt("views")%></td>
                                                <td>
                                                    <div>
                                                        <a href="./NewsWriter/DeletePost?news_id=<%=rs.getInt("news_id")%>" class="btn btn-outline-danger">Delete</a>
                                                        <a href="./NewsWriter/EditNewsForm.jsp?news_id=<%=rs.getInt("news_id")%>" class="btn btn-outline-success">Edit</a>
                                                    </div>
                                                </td>
                                                <td class=""><%=rs.getString("created_date")%></td>
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
                                        <!--Table body-->
                                    </table>
                            </div>
                    </div>
            </div>
            </div>
          </div>
    </body>
</html>


