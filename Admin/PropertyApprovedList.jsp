<%-- 
    Document   : PropertyApprovedList
    Created on : 1 Mar, 2018, 2:26:56 PM
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
         <form name="frm_approval">
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                 <tr>
                <th>sl.no</th>
                <th>Property Image</th>
                <th>Type of Property</th>
                <th>District</th>
                <th>Place</th>
                <th>Rate</th>
                <th>Square Feet</th>
                <th>Proof</th>
                <th>Description</th>
               
                       </tr>
                     <% int i=1;
                    String str="select * from tbl_property p inner join tbl_district d on p.district_id = d.district_id inner join tbl_constructiontype t on p.constructiontype_id = t.constructiontype_id where property_status=1";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                     <td><%=i%></td>
                  <td><%=rs.getString("property_image")%></td>
                  <td><%=rs.getString("constructiontype_type")%></td>
                   <td><%=rs.getString("district_name")%></td>
                   <td><%=rs.getString("property_placedetails")%></td>
                   <td><%=rs.getString("property_rate")%></td>
                   <td><%=rs.getString("property_sqft")%></td>
                     <td><%=rs.getString("property_proof")%></td>
                   <td><%=rs.getString("property_description")%></td>
                     
                     </tr>
                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
       <a href="adminhomepage.jsp">Back to Homepage</a>
   
    </body>
</html>
