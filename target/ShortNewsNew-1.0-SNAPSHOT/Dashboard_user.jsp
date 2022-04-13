<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>
<%@page import="ShareClass.StoreBookmarkNews"%>
<%@page import="DB.DBcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News</title>
        <%@include  file="./SharePage/bootstrap_link.jsp" %>
        <link type="text/css" rel="stylesheet" href="./Style/user_dashboard.css">
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
            .login-btn{
                background-color: #0d6efd;
                width: 260px;
                padding: 10px;
                margin-bottom: 10px;
                text-align: center;
                border-radius: 5px;
                cursor: pointer;
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
                      
                      
              <div class="col-10 px-5">
<!--                 <div class="bg-light py-2">
                  <div class="d-flex justify-content-center ">
                    <div class="search-box-parent">
                      <i class="bi bi-search h4"></i>
                      <input class="search-box" type="text" placeholder="">
                    </div>
                  </div>
                </div> -->

                <!-- show topics links -->
                <div class="shadow bg-white mt-3 p-4">
                  <div class="parent text-center">
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/india.png" class="img" height="130px" width="180px" alt="">
                      </div>
                        <a class="fw-bold mt-2" href="?cat_id=1">India</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/politics.png" class="img" height="130px" width="170px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=2">Politics</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/covid.png" class="img" height="130px" width="170px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=3">Covid-19</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/entertainment.png" class="img" height="130px" width="170px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=4">Entertainment</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/technology.png" class="img" height="130px" width="170px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=5">Technology</a>
                    </div>

                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/automobile.png" class="img" height="130px" width="150px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=6">Automobile</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/business.png" class="img" height="130px" width="170px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=7">Business</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/education.png" class="img" height="130px" width="130px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=8">Education</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/politics.png" class="img" height="130px" width="170px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=2">Politics</a>
                    </div>
                    <div class="topic-op border p-2 topic-shadow">
                      <div>
                        <img src="./Images/dashboard/sport.png" class="img" height="130px" width="130px" alt="">
                      </div>
                      <a class="fw-bold mt-2" href="?cat_id=9">Sport</a>
                    </div>
                  </div>
                </div>
                <%@include  file="./news_collection.jsp" %>
              </div>
            </div>
            <%@include  file="./SharePage/alert-message.jsp" %>
        </main>
    </body>
</html>
