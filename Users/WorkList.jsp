<%-- 
    Document   : WorkList
    Created on : 15 Mar, 2018, 1:50:27 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Work List</title>
    </head>
    <body>
        <form name="frm_viewlist">
                   <table class="table table-hover" align="center" border="0">
                       <tr>
                           
        <%
          String CdetaailsID="";  
          String Image="";
          String Address="";
          String Details="";
          String Caption="";
         
          
            String selQry="select * from tbl_constructiondetails cd inner join tbl_construction c on cd.construction_id = c.construction_id inner join tbl_builders b on b.builders_id = c.builders_id  where cd_status=1 and b.builders_id='"+session.getAttribute("bid")+"'";
            ResultSet rs =obj.selectData(selQry);
                 int i=0;
            while(rs.next())
            {
                CdetaailsID=rs.getString("constructiondetails_id");
                Image=rs.getString("construction_image");
                Details=rs.getString("construction_detail");
                Address=rs.getString("construction_address");
                Caption=rs.getString("construction_caption");
                  %>
                  
                      <td><img style="width: 200px;height: 300px" src="../Builders/Construction/<%=rs.getString("construction_image")%> ">
                       <h5><%=Caption%></h5>
                          <h5><%=Address%></h5>
                       <h5><%=Details%></h5>
                       <h3><a href="WorkList.jsp?aid=<%=CdetaailsID%>">View Details</a></h3>
                   </td>
                   <%
                   i++;
                   %>
          <% } 
            
            if(request.getParameter("aid")!=null)
            {
                 session.setAttribute("cdetails", request.getParameter("aid"));
                 response.sendRedirect("WorkDetails.jsp");
            }
        %>
                    
                   </tr>
                   
                   </table>
        
        </form>
       
    </body>
</html>
