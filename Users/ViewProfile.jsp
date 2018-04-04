<%-- 
    Document   : ViewProfile
    Created on : 15 Mar, 2018, 11:11:18 AM
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
       <form name="frm_builderprofile">
            
                   <table class="table table-hover" align="center" border="1">
      <%
        
        String Sel="select * from tb_user u inner join tbl_district d on u.district_id = d.district_id inner join tbl_login l on u.login_id=l.login_id where user_id='"+session.getAttribute("userid") +"'";
                    ResultSet rs=obj.selectData(Sel);
                     while(rs.next())
                     {
                     %>
                     <tr>
                       
                   <td colspan="2" align="center"><img style="width: 200px; height: 300px" src="../Users/Photo/<%=rs.getString("user_photo")%>"></td>
                   </tr>
                   
                     <tr>
                     <th>Builders Name</th>
                     <td><%=rs.getString("user_name")%></td>
                     </tr>
                     
                     <tr>
                          <th>Address</th>
                           <td><%=rs.getString("user_address")%></td>
                     </tr>
                     
                     <tr>
                         <th>Contact</th>
                         <td><%=rs.getString("user_contact")%></td>
                     </tr>
                     
                     <tr>
                         <th>Email</th>
                          <td><%=rs.getString("user_emailid")%></td>
                     </tr>
                      <tr>
                       <th>Gender</th>
                   <td><%=rs.getString("user_gender")%></td>
                   </tr>
                   
                   <tr>
                       <th>Date of Birth</th>
                   <td><%=rs.getString("user_dob")%></td>
                   </tr>
                   
                    <tr>
                       <th>District</th>
                   <td><%=rs.getString("district_name")%></td>
                   </tr>
                   
                   <tr>
                       <th>Username</th>
                   <td><%=rs.getString("login_username")%></td>
                   </tr>
                   
                   <tr>
                       <th>Password</th>
                   <td><%=rs.getString("login_password")%></td>
                   </tr>
                   
                  <%
                              
                                  }
                  %>
       
                   </table>
    </form>
       
   
    </body>
</html>
