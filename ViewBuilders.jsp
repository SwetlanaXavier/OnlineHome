<%-- 
    Document   : ViewBuilders
    Created on : 16 Feb, 2018, 11:47:37 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Builders</title>
    </head>
    <body>
        
        
        <form name="frm_viewbuilder">
                   <table class="table table-hover" align="center" border="0">
                       <tr>
                           
        <%
          String BuildersId="";  
          String BuildersName="";
          String logo="";
          String District="";
          String Email="";
          String Contact="";
          String Address="";
          
            String selQry="select * from tbl_builders b inner join tbl_district d on b.district_id = d.district_id  where builders_status=1 ";
            ResultSet rs =obj.selectData(selQry);
                 int i=0;
            while(rs.next())
            {
                BuildersId=rs.getString("builders_id");
                BuildersName=rs.getString("builders_name");
                District=rs.getString("district_name");
                logo=rs.getString("builders_logo");
                Email=rs.getString("builders_emailid");
                Address=rs.getString("builders_address");
                Contact=rs.getString("builders_contact");
                
                  %>
                  
                      <td><img style="width: 100px;height: 100px" src="../Builders/Logo/<%=rs.getString("builders_logo")%> ">
                       <h3><%=BuildersName%></h3>
                       <h3>Contact NO:<%=Contact%></h3>
                       <h3>District:<%=District%></h3>
                       <h3><a href="BuildersDetails.jsp?aid=<%=BuildersId%>">view more details...</a></h3>
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
