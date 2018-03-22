<%-- 
    Document   : NewComBuildingList
    Created on : 21 Mar, 2018, 9:40:30 PM
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
        <%
         if(request.getParameter("BId")!=null)
        {
          String updateApproval="update tbl_constructiondetails set cd_status=1 where constructiondetails_id='"+request.getParameter("BId")+"'";
          boolean b=obj.ExecuteCommand(updateApproval);
          if(b)
          {
              response.sendRedirect("NewComBuildingList.jsp");
          }
          else
          {
              out.print(updateApproval);
          }
        }
         if(request.getParameter("Did")!=null)
        {
          String updateReject="update tbl_constructiondetails set cd_status=2 where constructiondetails_id='"+request.getParameter("Did")+"'";
          boolean b2=obj.ExecuteCommand(updateReject);
          if(b2)
          {
              response.sendRedirect("NewComBuildingList.jsp");
          }
          else
          {
              out.print(updateReject);
          }
        }        
    %>

    <br>
    <br>
    
    <form name="frm_buildingpending">
            
                   <table class="table table-hover" align="center" border="1">
                       <tr>
                <th>sl.no</th>
                <th>Logo</th>
                 <th>Builders Name</th>
                 <th>Contact address</th>
                 <th>Contact Number</th>
                <th>Email Id</th>
                <th>Image</th>
                <th>Construction Caption</th>
                <th>Construction type</th>
                <th>Address</th>
                <th>Description</th>
                 <th>Rate</th>
                  <th>Rent Rate</th>
                  <th>Lease Rate</th>
                </tr>
                



                   
                     <% int i=1;
                    String str="select * from tbl_constructiondetails cd inner join tbl_construction c on c.construction_id =cd.construction_id inner join tbl_constructiontype ctype on ctype.constructiontype_id = c.constructiontype_id inner join tbl_builders b on b.builders_id = c.builders_id where cd_status=0";
                    ResultSet rs=obj.selectData(str);
                    while(rs.next())
                     {
                     %>
                     <tr>
                    <td><%=i%></td>
                   <td><img style="width:100px; height:100px" src="../Builders/Logo/<%=rs.getString("builders_logo")%>"></td>
                    <td><%=rs.getString("builders_name")%></td>
                    <td><%=rs.getString("builders_address")%></td>
                   <td><%=rs.getString("builders_contact")%></td>
                    <td><%=rs.getString("builders_emailid")%></td>
                    
                    <td><img style="width:100px; height:100px" src="../Builders/Construction/<%=rs.getString("construction_image")%>"></td>
                   <td><%=rs.getString("construction_caption")%></td>
                     <td><%=rs.getString("constructiontype_type")%></td>
                   <td><%=rs.getString("construction_address")%></td>
                   <td><%=rs.getString("Description")%></td>
                   <td><%=rs.getString("construction_amount")%></td>
                   <td><%=rs.getString("rent_amount")%></td>
                   <td><%=rs.getString("lease_amount")%></td>
                   
                   
                   
                     <td><a href="NewComBuildingList.jsp?BId=<%=rs.getString("constructiondetails_id")%>">APPROVE</a></td>
                     <td><a href="NewComBuildingList.jsp?Did=<%=rs.getString("constructiondetails_id")%>">REJECT</a></td></tr>

                  <%
                               i++;
                                  }
                  %>
      </table>
        </form>
       
    </body>
</html>
