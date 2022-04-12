<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="ShareClass.GetAllCategories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../Style/Newswriterform.css">
        <title>Newswriter Form</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="./Newswriter.js"></script>
        <%@include file="../SharePage/bootstrap_link.jsp" %>
    </head>

    <body class="bg-light ">
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
        <div class="container mt-5">
            <div class="row">
                <div class="col-8">
                    <div>
                        <ul class="nav align-items-lg-center">
                            <div class="me-auto">
                                <li class="nav-item">
                                    <strong class="h5">Create News</strong>
                                </li>
                            </div>
                            <div class='d-flex'>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Edit</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Preview</a>
                                </li>
                            </div>

                        </ul>
                    </div>
                   <form action="../AddNews"  method="POST" enctype="multipart/form-data" >
                        <div class="bg-white border rounded">
                            <div class=" px-4 py-3">
                                <div>
                                    <div>
                                        <input type="file" name="news_img" class="form-control" required />
                                    </div>
                                    <div class="mt-5  ">
                                        <textarea   required style="width: 100%;" name="title" placeholder="Enter News Title here..." id="n-title"  rows="2" class="n-title"></textarea>
                                    </div>
                                    <div class="mt-5">
                                        <textarea required style="width: 100%;" name="desc" placeholder="Write your news content here..." id="n-desc"  rows="12" class="n-content"></textarea>
                                    </div>
                                    <div class="mt-5 ">
                                        <input required class="form-control" type="text" value="" id="n-tag" name="tags"  placeholder="Add tags like - Politics, Covid-19 and should saperate by comma" />
                                    </div>
                                    <div class="mt-5 ">
                                        <jsp:useBean id="category" class="ShareClass.GetAllCategories" />
                                        <%
                                            GetAllCategories cat = new GetAllCategories();
                                        %>
                                        <select required class="form-select" name="category" aria-label="Default select example">
                                            <%
                                            Set set=cat.returnCategory().entrySet();//Converting to Set so that we can traverse  
                                            Iterator itr=set.iterator();  
                                            while(itr.hasNext()){  
                                                //Converting to Map.Entry so that we can get key and value separately  
                                                Map.Entry entry=(Map.Entry)itr.next();  
                                            %>    
                                                <option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
                                            <%
                                                } 
                                            %>
                                            
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="d-flex mt-3 mb-3">
                            <input type="submit" class="btn btn-primary" value="Publish" />
                            <button type="submit" class="btn btn-light mx-3 shadow-sm">Save Draft</button>
                        </div>
                    </form>
                </div>
                <div class="col-4 ">
                    <div class="d-flex align-items-top h-100" id="show-content">
                        <div id="show-title" style="margin-top: 40px; background-color: #002c59; box-shadow: 1px 7px 41px -6px #002c59; height: max-content;"  class="text-white p-2 rounded">
                            <strong>
                                Writing a Great Post Title 
                            </strong>
                            <ul class="mt-4">
                                <li>
                                    Think of your post title as a super short (but compelling!) description — like an overview of the actual post in one short sentence.
                                </li>
                                <LI>
                                    Use keywords where appropriate to help ensure people can find your post by search.
                                </LI>
                            </ul>
                        </div>
                        <div id="show-desc" class="text-white p-2 rounded" style="background-color: #0073e6; box-shadow: 1px 7px 41px -6px #0073e6; height: max-content;">
                            <strong>
                                Writing a Great Content 
                            </strong>
                            <ul class="mt-4">
                                <li>
                                    Think of your post title as a super short (but compelling!) description — like an overview of the actual post in one short sentence.
                                </li>
                                <LI>
                                    Use keywords where appropriate to help ensure people can find your post by search.
                                </LI>
                            </ul>
                        </div>
                        <div id="show-tag" class="text-white p-2 rounded" style="margin-bottom: 53px; background-color: #09cbcb; box-shadow: 1px 7px 41px -6px #09cbcb; height: max-content;">
                            <strong>
                                Add important tags 
                            </strong>
                            <ul class="mt-4">
                                <li>
                                    Think of your post title as a super short (but compelling!) description — like an overview of the actual post in one short sentence.
                                </li>
                                <LI>
                                    Use keywords where appropriate to help ensure people can find your post by search.
                                </LI>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>

</html>
