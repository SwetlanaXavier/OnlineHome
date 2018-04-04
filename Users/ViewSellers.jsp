<%-- 
    Document   : ViewSellers
    Created on : 27 Mar, 2018, 7:06:36 PM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Sellers</title>
    </head>
    <body>
      
        <form name="frm_viewsellers">
                   <table class="table table-hover" align="center" border="0">
                       <tr>
                           
        <%
          String UserID="";  
          String Name="";
          String photo="";
          String District="";
          String Email="";
          String Contact="";
          String Address="";
          
           String selQry="select * from tb_user u inner join tbl_property p on u.user_id = p.user_id inner join tbl_district d on u.district_id = d.district_id";
            ResultSet rs =obj.selectData(selQry);
                 int i=0;
            while(rs.next())
            {
                UserID=rs.getString("user_id");
                Name=rs.getString("user_name");
                District=rs.getString("district_name");
                photo=rs.getString("user_photo");
                Email=rs.getString("user_emailid");
                Address=rs.getString("user_address");
                Contact=rs.getString("user_contact");
                
                  %>
                  
                      <td><img style="width: 100px;height: 100px" src="../Users/Photo/<%=rs.getString("user_photo")%> ">
                       <h3>Name:<%=Name%></h3>
                       <h3>Address:<%=Address%></h3>
                       <h3>Contact:<%=Contact%></h3>
                       <h3>Email Id:<%=Email%></h3>
                       <h3><%=District%> District</h3>
                       <h3></h3>
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
