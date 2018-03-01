<%-- 
    Document   : ViewPropertyDetails
    Created on : 1 Mar, 2018, 10:42:48 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Property Status</title>
    </head>
    <body>
     <table  align="center">
                
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
          
        <%
        
                    String Sel="select * from tbl_property p inner join tbl_district d on p.district_id = d.district_id inner join tbl_constructiontype t on p.constructiontype_id = t.constructiontype_id where property_id="+request.getParameter("aid");
                    ResultSet rs=obj.selectData(Sel);
                     while(rs.next())
                     {
                     %>
        
           
                <tr >
                    <th colspan="2" align="center"><img style="width: 100px;height: 100px" src="../Users/PropertyImages/<%=rs.getString("property_image")%> " height="150" width="150">
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                  <th> Type of Property:</th><td><%=rs.getString("constructiontype_type")%></td>
  
                </tr>
                <th>District:</th>
     
                     <td><%=rs.getString("district_name")%></td>
                </tr>
                
                <tr align="left">
                  <th>Place:</th>  
                    <td><%=rs.getString("property_placedetails")%></td>
                </tr>
                <tr align="left">
                     <th>Rate:</th>
                    <td><%=rs.getString("property_rate")%></td>
                </tr>
                <tr align="left">
                    
                 <th>Square Feet:</th>   
                    
                    <td><%=rs.getString("property_sqft")%></td>
                </tr>
                <tr align="left">
                     <th>Proof:</th>
                  <td><%=rs.getString("property_proof")%></td>  
                    
                </tr>
                <tr align="left">
                     <th>Description:</th>
                  <td><%=rs.getString("property_description")%></td>  
                    
                </tr>
                
                  <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                    
                                                     
  
                  
                 
         
               </tr>
               <%
               
             
                
            }
                    %>
        </table>
 
    </body>
</html>
