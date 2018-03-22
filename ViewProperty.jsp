<%-- 
    Document   : Viewproperty
    Created on : 15 Feb, 2018, 10:51:08 PM
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
         <center>Property Details</center>
        <form name="frm_viewtech">
                   <table border="0">
                       <tr>
         
        <%
          String PropertyId="";  
          String PropertyName="";
          String PropertyImage="";
          String District="";
          String Place="";
          String Rate="";
           String SQfeet="";
           String NoOfBed="";
           String NoOfBath="";
           String Description="";
            String selQry1="select * from tbl_property where property_status=1";
             int i=0;
            ResultSet rs =obj.selectData(selQry1);
            while(rs.next())
            {
                PropertyId=rs.getString("property_id");
                PropertyName=rs.getString("property_caption");
                //PropertyImage=rs.getString("property_image");
                //District=rs.getString("district_id");
                Place=rs.getString("property_placedetails");
                Rate=rs.getString("property_rate");
               // SQfeet=rs.getString("property_sqft");
                //NoOfBed=rs.getString("no_of_bedrooms");
                //NoOfBath=rs.getString("no_of_bathrooms");
               // Description=rs.getString("property_description");
                
                  %>
                 
           
       <td><img src="../Users/PropertyImages/<%=rs.getString("property_image")%>" style="width: 190px;height: 300px ">
                       <h3><%=PropertyName%></h3>
                       <h3>Contact NO:<%=Place%></h3>
                       <h3>Type of Work:<%=Rate%></h3>
                       <h3><a href="PropertyDetails.jsp?aid=<%=PropertyId%>">view more details...</a></h3>
                   </td>
                   

                   <%
                   i++;
                   %>
          <% }   
        %>
                    
                   </tr>
            
                   </table>
        </form>
    </body>
</html>
