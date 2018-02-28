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
        <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
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
            String selQry1="select * from tbl_property";
            ResultSet rs =obj.selectData(selQry1);
            while(rs.next())
            {
                PropertyId=rs.getString("property_id");
                PropertyName=rs.getString("property_name");
                //PropertyImage=rs.getString("property_image");
                District=rs.getString("district_id");
                Place=rs.getString("property_placedetails");
                Rate=rs.getString("property_rate");
                SQfeet=rs.getString("property_sqft");
                NoOfBed=rs.getString("no_of_bedrooms");
                NoOfBath=rs.getString("no_of_bathrooms");
                Description=rs.getString("property_description");
                
                  %>
                  <a href="AddProperty.jsp?PId=<%=PropertyId%>">
                  <div class="col-sm-3" style="border: 0px #269abc solid;padding:10px;margin:10px ">
                      <div style="image"><img src="../Users/PropertyImages/<%=rs.getString("property_image")%>" style="width: 190px;height: 300px"></div>
                      <div style="text-align: center;color: brown"><%=PropertyName%></div>
                   
                      <div style="text-align: center;color: brown"><%=District%></div>
                   <div style="text-align: center;color: brown"><%=Place%></div>
                    <div style="text-align: center;color: brown"><%=Rate%></div>
                   <div style="text-align: center;color: brown"><%=SQfeet%></div>
                   <div style="text-align: center;color: brown"><%=NoOfBed%></div>
                   <div style="text-align: center;color: brown"><%=NoOfBath%></div>
                   <div style="text-align: center;color: brown"><%=Description%></div>
                  </div>
                  </a>
          <% }   
        %>
            </div>
         <div class="col-sm-2"></div>
        </div>
      
    </body>
</html>
