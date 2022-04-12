 <%@page import="DB.DBcon"%>
<%@page import="ShareClass.AddNewsViews"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Page</title>
        <%@include file="/SharePage/bootstrap_link.jsp"%>
    </head>
    <body class="bg-light" style="overflow: hidden">
        <header class="bg-white shadow-sm">
            <%@include file="./SharePage/nav_bar.jsp" %>
        </header>
        <div class="row mt-4">
            <div class="col-sm-2">
                
            </div>
            <%
                String id = (String) request.getParameter("news_id");
                int nid = Integer.parseInt(id);
                
                AddNewsViews av = new AddNewsViews();
                av.addNewsViewsCount(nid);
                
                List<String> list = new ArrayList<>();
                list.add("badge-primary");                
                list.add("badge-secondary");
                list.add("badge-success");                
                list.add("badge-success");
                list.add("bg-dark");
                list.add("bg-warning text-dark");
                Random rand = new Random();
                Connection con = null;
                try{
                    con = DBcon.getcon();
                    PreparedStatement ps = con.prepareStatement("select title, description, img, tag from news where news_id="+nid+"");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        Blob blob = rs.getBlob("img");
                        byte byteArray[] = blob.getBytes(1, (int)blob.length());
                         String base64Image = new String(Base64.encodeBase64(byteArray)); 
                         request.setAttribute("imageBt", base64Image);
                         String title = rs.getString("title");
                         String description = rs.getString("description");                         
                         String tags = rs.getString("tag");

                         List<String> taglist = Arrays.asList(tags.split(","));
             %>
            <div class="col-sm-6 container">
                <div class="flex">
                    <% for(int i = 0; i < taglist.size(); i++){%>
                        <span class="badge <%=list.get(rand.nextInt(list.size()))%>">#<%=taglist.get(i)%></span>
                    <%}%>
                </div>
                <div class="card shadow mt-3" style="width: 53rem;">
                    <img src="data:image/jpg;base64,${requestScope['imageBt']}  " class="card-img-top" alt="...">
                    <div class="card-body">
                      <h4 class="card-title"><%=title%></h4>
                      <p class="card-text text-muted bg-white">
                          <%=description%>.
                      </p>
                    </div>
                </div>
            </div>
             <%
                    }
                }
                catch(Exception e){
                    e.printStackTrace();
                }   
            %>

            <div class="col-sm-4">
                <span class="h5">Recommended For You</span>
                <div class="flex flex-column">
                    <%@include file="./GetSuggestionNews.jsp"%>  
                </div>
            </div>
        </div>
        
    </body>
</html>
