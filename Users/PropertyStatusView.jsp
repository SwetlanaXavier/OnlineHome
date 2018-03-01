<%-- 
    Document   : PropertyStatusView
    Created on : 1 Mar, 2018, 3:20:46 PM
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
                String PropertyImage="";
                String TypeofProperty="";
                String District="";
                String Place="";
                String Rate="";
                String SquareFeet="";
                String Proof="";
                String Description="";
                String uploadimage="";
                int status=0;
                String label="",color="";
             // String book=request.getParameter("bookingid");
               String dees="select * from tbl_property where user_id='"+session.getAttribute("userid")+"'";
               
               ResultSet rs= obj.selectData(dees);
             while(rs.next())
                {
                     
                    PropertyImage=rs.getString("property_image");
            
                   status= rs.getInt("property_staus");
                   if(status==0)
                   {
                       label="Pending";color="red";
                   }
                   if(status==1)
                   {
                       label="Approved";color="green";
                   }
                   if(status==2)
                   {
                       label="Rejected";color="blue";
                   }
                }
                   
              %>
        
        
                  
             <table align="center">
                 
                 <tr>
                    <th colspan="2" align="center"><img style="width: 100px;height: 100px" src="../Users/PropertyImages/<%=rs.getString("property_image")%> " height="150" width="150">
                </tr>
                
               
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
                <tr>
                <th>Current Status</th>
                <td><div style="color: <%=color%>"><%=label%></div></td>
                </tr>

             </table>
        
    </body>
</html>
