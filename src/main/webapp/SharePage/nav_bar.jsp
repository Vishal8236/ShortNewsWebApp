<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
      <a class="navbar-brand" href="./Dashboard_user.jsp?cat_id=0">ShortNews</a>
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
            <a href="./Logout" class="btn btn-danger">Logout</a>
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