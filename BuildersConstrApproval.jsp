<%-- 
    Document   : BuildersConstrApproval
    Created on : 21 Mar, 2018, 10:21:01 AM
    Author     : Swetlana Xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
         if(request.getParameter("BId")!=null)
        {
          String updateApproval="update tbl_builders set builders_status=1 where builders_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApproval);
          if(b)
          {
              response.sendRedirect("NewBuildersList.jsp");
          }
          else
          {
              out.print(updateApproval);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateReject="update tbl_builders set builders_status=2 where builders_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateReject);
          if(b2)
          {
              response.sendRedirect("NewBuildersList.jsp");
          }
          else
          {
              out.print(updateReject);
          }
        }        
    %>

    <br>
    <br>
    
    <form name="frm_builderpending">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Builders Name</th>
                <th>Address</th>
                <th>Contact no</th>
                <th>Email</th>
                <th>District</th>
                <th>Logo</th>
                <th>Proof</th>
               
                       </tr>
                   
                     <% int i=1;
                    String str="select * from tbl_builders b inner join tbl_district d on b.district_id = d.district_id where builders_status=0";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                    <td><%=i%></td>
                   <td><%=rs.getString("builders_name")%></td>
                   <td><%=rs.getString("builders_address")%></td>
                   <td><%=rs.getString("builders_contact")%></td>
                   <td><%=rs.getString("builders_emailid")%></td>
                   <td><%=rs.getString("district_name")%></td>
                   <td><img src="../Builders/Logo/<%=rs.getString("builders_logo")%>"></td>
                   <td><a href="ProofDownload.jsp?filename=<%=rs.getString("builders_proof")%>"><%=rs.getString("builders_proof")%></a></td>
         
                     <td><a href="NewBuildersList.jsp?BId=<%=rs.getString("builders_id")%>">APPROVE</a></td>
                     <td><a href="NewBuildersList.jsp?Did=<%=rs.getString("builders_id")%>">REJECT</a></td></tr>

                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
      
    </body>
</html>
