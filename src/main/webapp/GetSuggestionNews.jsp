<%
    try{
        PreparedStatement ps1 = con.prepareStatement("select news_id, title, img from news order by news_id desc limit 7");
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next()){
            Blob blob = rs1.getBlob("img");
            byte byteArray[] = blob.getBytes(1, (int)blob.length());
             String base64Image = new String(Base64.encodeBase64(byteArray)); 
             request.setAttribute("imageBt", base64Image);
             String title = rs1.getString("title");
%>
            <div class="d-flex shadow-sm mt-5 p-2 rounded bg-white">
                <div class="pl-2">
                    <a class="h6" href="?news_id=<%=rs1.getInt("news_id")%>"><%=title%></a>
                </div>
            </div> 

<%
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }   
%>