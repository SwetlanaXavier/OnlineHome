<%-- 
    Document   : TechniciansApprovals
    Created on : 16 Feb, 2018, 11:39:11 AM
    Author     : Swetlana Xavier
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="mydb.dbconnection" id="obj"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technicians Approval(ADMIN)</title>
    </head>
    <body>
        <%
         if(request.getParameter("BId")!=null)
        {
          String updateApp="update tbl_technicians set technician_status=1 where technician_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApp);
          if(b)
          {
              response.sendRedirect("NewTechniciansList.jsp");
          }
          else
          {
              out.print(updateApp);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateRej="update tbl_technicians set technician_status=2 where technician_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateRej);
          if(b2)
          {
              response.sendRedirect("NewTechniciansList.jsp");
          }
          else
          {
              out.print(updateRej);
          }
        }        
    %>

    <br>
    <br>
    <form name="frm_technicianpending">
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                 <tr>
                <th>sl.no</th>
                <th>Technicians Name</th>
                <th>Address</th>
                <th>Contact number</th>
                <th>Email</th>
                <th>Photo</th>
                <th>Type of Work</th>
                <th>Experience</th>
                <th>Proof</th>
                <th>District</th>
               
                       </tr>
                     <% int i=1;
                    String str="select * from tbl_technicians b inner join tbl_district d on b.district_id = d.district_id inner join tbl_techniciantype t on t.techniciantype_id = b.techniciantype_id where technician_status=0";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                     <td><%=i%></td>
                   <td><%=rs.getString("technician_name")%></td>
                   <td><%=rs.getString("technician_address")%></td>
                   <td><%=rs.getString("technician_contact")%></td>
                   <td><%=rs.getString("technician_email")%></td>
                   <td><img src="../Technicians/Photo/<%=rs.getString("technician_photo")%>"></td>
                    <td><%=rs.getString("techniciantype_type")%></td>
                   <td><%=rs.getString("technician_experience")%></td>
                   
                   <td>
                       <img src="../Technicians/Proof/<%=rs.getString("technician_proof")%>">
                       <a href="ProofDownload.jsp?filename=<%=rs.getString("technician_proof")%>"><%=rs.getString("technician_proof")%></a>
                   </td>
                   
                   <td><%=rs.getString("district_name")%></td>
                  
                     <td><a href="NewTechniciansList.jsp?BId=<%=rs.getString("technician_id")%>">APPROVE</a></td>
                     <td><a href="NewTechniciansList.jsp?Did=<%=rs.getString("technician_id")%>">REJECT</a></td>
                     </tr>
                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
   </body>
</html>
