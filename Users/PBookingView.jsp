<%-- 
    Document   : PBookingView
    Created on : 28 Mar, 2018, 10:55:43 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User Booked Property Details</title>
    </head>
    <body>
        <form name="frm_pbookingview">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Image</th>
                <th>Address</th>
                <th>Rate</th>
                <th>Booking Date</th>
                <th>Sellers Name</th>
                <th>Status</th>
                       </tr>
                   
                     <% int i=1;
                    String str="select * from tbl_propertybooking u inner join tbl_propertydetails cd on u.propertydetails_id = cd.propertydetails_id inner join tbl_property c on c.property_id = cd.property_id inner join tb_user b on c.user_id = b.user_id  where u.user_id='"+session.getAttribute("userid")+"'";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                         
                       
                     %>
                     <tr>
                    <td><%=i%></td>
                    <td><img style="width: 250px;height: 200px" src="../Users/PropertyImages/<%=rs.getString("property_image")%>"></td>
                   <td><%=rs.getString("property_address")%></td>
                   <td><%=rs.getString("property_amount")%></td>
                   <td><%=rs.getString("pbooking_date")%></td>
                   <td><%=rs.getString("user_name")%></td>
                   <%
                   if ((rs.getString("pbooking_status").equals("0")))
                       {  %>
                       <td>Pending</td>
                    <%   }
                   else if ((rs.getString("pbooking_status").equals("1")))
                       {  %>
                           <td>Accepted</td>
                      <% }
                   else if((rs.getString("pbooking_status").equals("2")))
                       {  %>
                           <td>Rejected</td>
                       <%}
                   %>
                   
                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
    
    </body>
</html>
