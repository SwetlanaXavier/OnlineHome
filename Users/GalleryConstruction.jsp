<%-- 
    Document   : GalleryConstruction
    Created on : 14 Mar, 2018, 2:39:27 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
          String CDetailsId="";  
          String BuildersId="";
          String Image="", CNumber="";
          String Address="";
         
          
            String selQry="select * from tbl_constructiondetails cd inner join tbl_construction c on cd.construction_id = c.construction_id inner join tbl_builders b on c.builders_id = b.builders_id  inner join tbl_companysite s on s.site_id= c.site_id where cd_status=1 ";
            ResultSet rs =obj.selectData(selQry);
                 int i=0;
            while(rs.next())
            {
                BuildersId=rs.getString("builders_name");
                CNumber=rs.getString("construction_number");
                Image=rs.getString("construction_image");
                 Address=rs.getString("site_address");
                
                  %>
                  
                      <img style="width: 100px;height: 100px" src="../Builders/Construction/<%=rs.getString("construction_image")%> ">
                       <h3><%=BuildersId%></h3>
                       <h3>Contact NO:<%=CNumber%></h3>
                       <h3>District:<%=Address%></h3>
                       <h3><a href="GalleryDetails.jsp?aid=<%=CDetailsId%>">View More Details...</a></h3>
                   
                   <%
                   i++;
                   %>
          <% }   
        %>
                    
      
    </body>
</html>
