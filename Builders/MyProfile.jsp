<%-- 
    Document   : MyProfile
    Created on : 22 Feb, 2018, 10:23:03 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Builder:MyProfile</title>
    </head>
    <body>
        
    <form name="frm_builderprofile">
            
                   <table class="table table-hover" align="center" border="1">
      <%
        
        String Sel="select * from tbl_builders b inner join tbl_district d on b.district_id = d.district_id inner join tbl_login l on b.login_id=l.login_id where builders_id='"+session.getAttribute("buildersid") +"'";
                    ResultSet rs=obj.selectData(Sel);
                     while(rs.next())
                     {
                     %>
                     <tr>
                     <th>Builders Name</th>
                     <td><%=rs.getString("builders_name")%></td>
                     </tr>
                     
                     <tr>
                          <th>Address</th>
                           <td><%=rs.getString("builders_address")%></td>
                     </tr>
                     
                     <tr>
                         <th>Contact</th>
                         <td><%=rs.getString("builders_contact")%></td>
                     </tr>
                     
                     <tr>
                         <th>Email</th>
                          <td><%=rs.getString("builders_emailid")%></td>
                     </tr>
                     
                   <tr>
                       <th>District</th>
                   <td><%=rs.getString("district_name")%></td>
                   </tr>
                   
                   <tr>
                       <th>logo</th>
                   <td><img src="../Builders/Logo/<%=rs.getString("builders_logo")%>"></td>
                   </tr>
                   
                   <tr>
                       <th>Proof</th>
                   <td><a href="ProofDownload.jsp?filename=<%=rs.getString("builders_proof")%>"><%=rs.getString("builders_proof")%></a></td>
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
