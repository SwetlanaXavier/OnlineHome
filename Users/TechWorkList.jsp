<%-- 
    Document   : TechWorkList
    Created on : 20 Mar, 2018, 10:53:40 AM
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
        <form name="frm_viewlist">
                   <table class="table table-hover" align="center" border="0">
                       <tr>
                           
        <%
          String WPid="";  
          String Image="";
         String Bud="";
         
         
          
            String selQry="select * from tbl_workpost where technician_id='"+session.getAttribute("tid")+"'";
            ResultSet rs =obj.selectData(selQry);
                 int i=0;
            while(rs.next())
            {
                WPid=rs.getString("workpost_id");
                Image=rs.getString("work_image");
                Bud=rs.getString("work_budget");
                  %>
                  
                      <td><img style="width: 200px;height: 300px" src="../Technicians/WorkImage/<%=rs.getString("work_image")%> ">
                       <h5><%=Bud%></h5>
                         <h3><a href="TechWorkDetails.jsp?aid=<%=WPid%>">View Details</a></h3>
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
