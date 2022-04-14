
 <div class="side-nav shadow">
    <div class="px-3 py-sm-0 d-none d-sm-block">
      <div class="d-flex align-content-center mt-3">
        <div>
          <i class="bi-github h3" role="img" aria-label="GitHub"></i>
        </div>
        <div class="ml-2 h3">
          <span>ShortNews</span>
        </div>
      </div>

      <!-- show user name -->
    <%
        if(session.getAttribute("email") != null)
        {
            String email =(String) session.getAttribute("email");
    %>
      <div class="py-2 d-flex mt-2 rounded">
        <div class="pt-1">
            <a class="h5 " href="#"><%=email%></a>
        </div>
      </div>
    <%}%>
      <!-- some more link  -->
      <div class="mt-3">
        <span class="text-muted">Discover</span>
        <div class="mt-3 d-flex align-items-center">
          <div class="col-2 h5"><i class="bi bi-diagram-2-fill nav-icon-color"></i></div>
          <a class="col-10 text-left h6 nav-text-color" href="./Dashboard_user.jsp?cat_id=0">My Feeds</a>
        </div>
        <div class="mt-4 d-flex align-items-center">
          <div class="col-2 h5"><i class="bi bi-grid-fill nav-icon-color"></i></div>
          <a class="col-10 text-left h6 nav-text-color" href="./popular_news.jsp">Popular</a>
        </div>
        <div class="mt-4 d-flex align-items-center">
          <div class="col-2 h5"><i class="bi bi-pin-angle-fill nav-icon-color"></i></div>
          <a class="col-10 text-left h6 nav-text-color" href="./most_upvoted.jsp">Most Upvoted</a>
        </div>
        <div>
          <hr>
        </div>
        <span class="text-muted">Manage</span>
        <div class="mt-3 d-flex align-items-center">
          <div class="col-2 h5"><i class="bi bi-bookmark-fill nav-icon-color"></i></div>
          <a class="col-10 text-left h6 nav-text-color" href="./show_bookmark.jsp">Bookmark</a>
        </div>
      </div>

      <div class="position-absolute bottom-0 ">
          <%
            if(session.getAttribute("email") != null)
            {   
                String email = (String) session.getAttribute("email");
                if(email.compareTo("admin@gmail.com") == 0)
                {
           %>
            <div class="dashboard-btn">
                <a class="text-white" href="./AdminPage/show_user.jsp">Dashboard</a>
            </div>
          <%}}%>

          <%
            if(session.getAttribute("role") != null)
            {   
                String role = (String) session.getAttribute("role");
                if(role.compareTo("news writer") == 0)
                {
           %>
            <div class="dashboard-btn">
                <a class="text-white" href="./NewsWriter/Dashboard.jsp">News Dashboard</a>
            </div>
          <%}}%>
          
          <%
            if(session.getAttribute("email") != null)
            {
          %>      
            <div class="logout-btn">
              <a class="text-black" href="./Logout">Logout</a>
            </div>
          <%}else{%>  
            <div class="login-btn">
              <a class="text-white" href="./UserSession/login-signup.jsp">Login/Signup</a>
            </div>
          <%}%>
          
      </div>
    </div>
</div>