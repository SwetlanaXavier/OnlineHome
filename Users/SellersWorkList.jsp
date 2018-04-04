<%-- 
    Document   : SellersWorkList
    Created on : 27 Mar, 2018, 7:08:22 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sellers Work List </title>
    </head>
    <body>
         <form name="frm_viewsellerlist">
                   <table  align="center" border="0">
                       <tr>
                           
        <%
          String PdetaailsID="";  
          String Image="";
          String Address="";
          String Details="";
          String Caption="";
         
          
            String selQry="select * from tbl_propertydetails cd inner join tbl_property c on cd.property_id = c.property_id inner join tb_user b on b.user_id = c.user_id  where propertydetails_status=1";
            ResultSet rs =obj.selectData(selQry);
            int i=0;
            while(rs.next())
            {
                PdetaailsID=rs.getString("propertydetails_id");
                Image=rs.getString("property_image");
                Details=rs.getString("property_details");
                Address=rs.getString("property_address");
                Caption=rs.getString("property_caption");
                  %>
                  
                      <td><img style="width: 200px;height: 300px" src="../Users/PropertyImages/<%=rs.getString("property_image")%> ">
                       <h5><%=Caption%></h5>
                          <h5><%=Address%></h5>
                       <h5><%=Details%></h5>
                       <h3><a href="SellersWorkList.jsp?aid=<%=PdetaailsID%>">View Details</a></h3>
                   </td>
                   <%
                   i++;
                   %>
          <% } 
            
            if(request.getParameter("aid")!=null)
            {
                 session.setAttribute("pdetails", request.getParameter("aid"));
                 response.sendRedirect("SellersWorkDetails.jsp");
            }
        %>
                    
                   </tr>
                   
                   </table>
        
        </form>
       
    </body>
</html>
