<%-- 
    Document   : TechWork
    Created on : 20 Mar, 2018, 10:50:18 AM
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
       <form name="frm_workdescri">
          <table  align="center">
                        
        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>               
           
    
        <%
            if(request.getParameter("aid")!=null)
            {
            
            
            String selQry="select * from tbl_workpost where workpost_id="+request.getParameter("aid");
            ResultSet rs=obj.selectData(selQry);
           
            if(rs.next())
            {
               
                
        %>

                <tr>
                    <th colspan="2" align="center"><img style="width: 300px;height: 300px" src="../Technicians/WorkImage/<%=rs.getString("work_image")%>">
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="left">
                  
                </tr>
                <tr align="left">
                  <th>Work Details:</th>  
                    <td><%=rs.getString("work_details")%></td>
                </tr>
                <tr align="left">
                    
                 <th>Budget:</th>
     
                     <td><%=rs.getString("work_budget")%></td>
                </tr>
                   <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                    
                     <tr><td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Send Proposal for Work">
                       
                    </td></tr>
                                           
                   
                  <td><a href="WorkList.jsp">Back...</a></td>
                 
         
               </tr>
               <%
               
             
                
            }
            }
        %>
        </table>
        </form>

    </body>
</html>
