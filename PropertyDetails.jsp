<%-- 
    Document   : PropertyDetails
    Created on : 17 Mar, 2018, 11:42:43 AM
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
 <form name="frm_propertydesc">
          <table  align="center">
                        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
           
    
        <%
            if(request.getParameter("aid")!=null)
            {
            
            
            String selQry="select * from tbl_property p inner join tbl_constructiontype c on c.constructiontype_id = p.constructiontype_id inner join tb_user u on u.user_id = p.user_id inner join tbl_district d on p.district_id=d.district_id where property_id="+request.getParameter("aid");
            ResultSet rs=obj.selectData(selQry);
           
            if(rs.next())
            {
               
                
        %>

                <tr>
                    <th colspan="2" align="center"><img style="width: 300px;height: 300px" src="../Users/PropertyImages/<%=rs.getString("property_image")%> " height="150" width="150">
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                    <td colspan="2"><h4><%=rs.getString("property_caption")%></h4></td>
  
                </tr>
                <tr align="left">
                  <th>Address:</th>  
                    <td><%=rs.getString("property_placedetails")%></td>
                </tr>
                <tr align="left">
                    
                 <th>District:</th>
     
                     <td><%=rs.getString("district_name")%></td>
                </tr>
               
                   <tr align="left"> 
                  <th>Construction type:</th>  
                    <td><%=rs.getString("constructiontype_type")%></td>
                </tr>
                <tr align="left">
                 <th>Property Rate:</th>
     
                     <td><%=rs.getString("property_rate")%></td>
                </tr>
                <tr align="left">
                 <th>Property Square Feet:</th>
     
                     <td><%=rs.getString("property_sqft")%></td>
                </tr>
                <tr align="right">
                 <th>Seller Name:</th>
     
                     <td><%=rs.getString("user_name")%></td>
                </tr>
                 <tr align="right">
                 <th>Contact:</th>
     
                     <td><%=rs.getString("user_contact")%></td>
                     <td><a href="#">Contact Seller</a>
                </tr>
                   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                    
                     
                                           
                   
                  <td><a href="ViewProperty.jsp">Back...</a></td>
                 
         
               </tr>
               <%
               
             
                
            }
            }
        %>
        </table>
        </form>
    </body>
</html>
