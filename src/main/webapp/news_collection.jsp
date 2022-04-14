<div class="row row-cols-4 mt-4">
    <%
    String catid = "";
    if(request.getParameter("cat_id") != null)
    {
        catid = request.getParameter("cat_id");
    }
    
    int cid = 0;
    cid = Integer.parseInt(catid);
    Connection con = null;
    try{
         con = DBcon.getcon();
         PreparedStatement ps;
        if(cid == 0)
        {
             ps = con.prepareStatement("select title, img , news_id ,likes from news");
        }
        else{
             ps = con.prepareStatement("select title, img , news_id ,likes from news where cat_id="+cid);
        }
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
                    <i class="bi bi-cursor i-size" ></i>  
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
