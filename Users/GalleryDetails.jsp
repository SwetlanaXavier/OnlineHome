<%-- 
    Document   : GalleryDetails
    Created on : 14 Mar, 2018, 2:46:56 PM
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
         <table  align="center">
       <%
            if(request.getParameter("aid")!=null)
            {
            String selQry1="select * from  tbl_construction c inner join tbl_constructiondetails cd on cd.construction_id = c.construction_id inner join tbl_builders b on c.builders_id = b.builders_id  inner join tbl_companysite s on s.site_id= c.site_id where constructiondetails_id="+request.getParameter("aid");
            ResultSet rs=obj.selectData(selQry1);
            if(rs.next())
            {
                
        %>
        
        <tr>
                    <th colspan="2" align="center"><img style="width: 100px;height: 100px" src="../Builders/Construction/<%=rs.getString("construction_image")%> " >
                </tr>
                <tr><td align="left"><%=rs.getString("construction_number")%></td>
                </tr>
                <tr><td align="left"><%=rs.getString("Description")%></td></tr>
                <tr><td align="left"><%=rs.getString("site_address")%></td></tr>
                <tr align="right">
                  <td><%=rs.getString("builders_name")%></td>
  
                </tr>
                <tr align="right">
                  <th>Address:</th>  
                    <td><%=rs.getString("builders_address")%></td>
                </tr>
                <tr align="right">
                    <tr align="left">
                  <th>Contact  Number:</th>  
                    <td><%=rs.getString("builders_contact")%></td>
                </tr>
                     <th>E-mail:</th>
                    <td><%=rs.getString("builders_emailid")%></td>
                </tr>
                <tr align="right">
                    
                 <th>District:</th>
     
                     <td><%=rs.getString("district_name")%></td>
                </tr>
                
                   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                    
                                                     
  
                  <td>Send proposal</td>
                     
               </tr>
               <%
               
             
                
            }
            }
        %>
        </table>
 
    </body>
</html>
